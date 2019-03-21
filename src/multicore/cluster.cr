module Multicore::Cluster
  extend self

  IO_INHERIT = Process::Redirect::Inherit

  def fork(env : Hash)
    env["FORKED"] = "1"
    Process.fork {
      Process.exec(
        command: PROGRAM_NAME,
        args: ARGV,
        env: env,
        input: IO_INHERIT,
        output: IO_INHERIT,
        error: IO_INHERIT
      )
    }
  end

  def master?
    (ENV["FORKED"]? || "0") == "0"
  end

  def worker?
    (ENV["FORKED"]? || "0") == "1"
  end
end

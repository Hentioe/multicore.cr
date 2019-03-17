module Multicore::Cluster
  extend self

  IOInherit = Process::Redirect::Inherit

  def fork(env : Hash)
    env["FORKED"] = "1"
    Process.fork {
      Process.exec(
        command = PROGRAM_NAME,
        args = ARGV,
        env: env,
        input: IOInherit,
        output: IOInherit,
        error: IOInherit
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

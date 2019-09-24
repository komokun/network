{application,opus,
             [{applications,[kernel,stdlib,elixir,logger,retry]},
              {description,"Framework for creating pluggable business logic components"},
              {modules,['Elixir.Opus','Elixir.Opus.Instrumentation',
                        'Elixir.Opus.Pipeline',
                        'Elixir.Opus.Pipeline.Registration',
                        'Elixir.Opus.Pipeline.Stage',
                        'Elixir.Opus.Pipeline.Stage.Check',
                        'Elixir.Opus.Pipeline.Stage.Link',
                        'Elixir.Opus.Pipeline.Stage.Skip',
                        'Elixir.Opus.Pipeline.Stage.Step',
                        'Elixir.Opus.Pipeline.Stage.Tee',
                        'Elixir.Opus.Pipeline.StageFilter',
                        'Elixir.Opus.PipelineError','Elixir.Opus.Safe']},
              {registered,[]},
              {vsn,"0.6.0"}]}.
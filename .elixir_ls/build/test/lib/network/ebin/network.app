{application,network,
             [{applications,[kernel,stdlib,elixir,logger,ranch,poolboy,opus,
                             poison,websockex]},
              {description,"network"},
              {modules,['Elixir.Network.Application','Elixir.Network.Chain',
                        'Elixir.Network.Chain.Client',
                        'Elixir.Network.Chain.Pipeline.BroadcastChainResponse',
                        'Elixir.Network.Chain.Pipeline.CheckinChainServerWorker',
                        'Elixir.Network.Chain.Pipeline.CheckoutChainServerWorker',
                        'Elixir.Network.Chain.Pipeline.Request',
                        'Elixir.Network.Chain.Pipeline.Response',
                        'Elixir.Network.Chain.Pipeline.SendCommandToChain',
                        'Elixir.Network.Chain.Pipeline.Stage',
                        'Elixir.Network.Chain.Pipeline.TransformChainErrorResponse',
                        'Elixir.Network.Chain.Pipeline.TransformChainSuccessResponse',
                        'Elixir.Network.Chain.Pipeline.ValidateRequestPayload',
                        'Elixir.Network.Chain.Process.Task.Request',
                        'Elixir.Network.Chain.Process.Task.Response',
                        'Elixir.Network.Chain.Server',
                        'Elixir.Network.Handler','Elixir.Network.Server']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Network.Application',[]}}]}.
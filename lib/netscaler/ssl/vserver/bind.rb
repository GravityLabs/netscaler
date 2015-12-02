module Netscaler
  class Ssl
    class Vserver
      class Bind < NetscalerService
        def initialize(netscaler)
          @netscaler=netscaler
        end

        def sslcertkey(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:vservername, :certkeyname])
          return @netscaler.adapter.post("config/sslvserver_sslcertkey_binding/#{payload[:vservername]}", {'params' => {'action' => 'bind'}, 'sslvserver_sslcertkey_binding' => payload})
        end

        def sslpolicy(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:vservername, :policyname, :priority])
          return @netscaler.adapter.post("config/sslvserver_sslpolicy_binding/#{payload[:vservername]}", {'params' => {'action' => 'bind'}, 'sslvserver_sslpolicy_binding' => payload})
        end

        def ecccurve(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:vservername, :ecccurvename])
          return @netscaler.adapter.post("config/sslvserver_sslecccurve_binding/#{payload[:vservername]}", {'params' => {'action' => 'bind'}, 'sslvserver_ecccurve_binding' => payload})
        end
      end
    end
  end
end




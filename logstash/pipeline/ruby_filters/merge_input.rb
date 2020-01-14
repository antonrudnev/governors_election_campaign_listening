require 'csv' 

def register(params)
    file = File.read("/usr/share/logstash/pipeline/ruby/candidates.csv")
    @candidates = CSV.parse(file, :headers => false)
end

def filter(event)
    match = false
    user = event.get("user")
    state = event.get("state")
    name = event.get("name")
    party = event.get("party")
    position = event.get("position")
    for c in @candidates
        if c[0] == user
            state = c[1]
            name = c[2]
            party = c[3]
            position = c[4]
            match = true
            break
        end
        break if match
    end
    event.set("state", state)
    event.set("name", name)
    event.set("party", party)
    event.set("position", position)
    return [event]
end

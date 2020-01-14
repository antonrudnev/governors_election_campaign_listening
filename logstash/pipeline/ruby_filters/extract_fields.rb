def filter(event)
    event.set("state", "Not Defined")
    event.set("name", "Not Defined")
    event.set("party", "Not Defined")
    event.set("position", "Not Defined")
    return [event]
end

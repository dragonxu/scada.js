require! 'prelude-ls': {group-by, sort-by}
require! components
require! 'aea': {sleep}

ractive = new Ractive do
    el: '#main-output'
    template: RACTIVE_PREPARSE('showcase.pug')
    data:
        button:
            show: yes
            send-value: ''
            bound-val: ''
        combobox:
            show: yes
            list1:
                * id: \1
                  name: \hello
                * id: \2
                  name: \world
                * id: \3
                  name: \heyy!
                * id: \4
                  name: "çalış öğün"
                * id: \5
                  name: "ÇALIŞ ÖĞÜN"
            boundSelected: null
        date-picker:
            show: yes

ractive.on do
    test-ack-button1: (ev, value) ->
        ev.component.fire \state, \doing
        <- sleep 3000ms
        ractive.set \button.sendValue, value
        ev.component.fire \state, \done...

    test-ack-button2: (ev, value) ->
        ev.component.fire \state, \doing
        <- sleep 3000ms
        ev.component.fire \state, \error, "handler 2 got message: #{value}"
        <- sleep 3000ms
        ev.component.fire \state, \done
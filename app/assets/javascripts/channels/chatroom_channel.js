// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatRoomChannel", room: "Room" }, {
    received(data) {
        this.appendLine(data)
    },

    appendLine(data) {
        const html = this.createLine(data)
        const element = document.querySelector("[data-chat-room='Room']")
        element.insertAdjacentHTML("beforeend", html)
    },

    createLine(data) {
        return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `
    }
})
// app/javascript/channels/appearance_channel.js
import consumer from "./consumer"

// consumer.subscriptions.create({ channel: "AppearanceChannel" })
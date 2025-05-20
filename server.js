const http = require("http");
const app = require("./index");

const server = http.createServer(app);
server.listen(3001, () => {
    console.log("API iniciada na porta 3000");
});

module.exports = app;
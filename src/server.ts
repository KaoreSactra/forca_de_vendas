import config from "./config"

class Server {
  private port: number

  constructor(port: number) {
    this.port = port
  }

  public start(): void {
    config.listen(this.port, () => {
      console.log(`API rodando...\nhttp://localhost:${this.port}/api`)
    })
  }
}

const server = new Server(3000)
server.start()

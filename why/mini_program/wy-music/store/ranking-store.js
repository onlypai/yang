import { HYEventStore } from "hy-event-store"
import { getRankings } from "../service/api_music"

const rankingMap = {
  0: "newRanking",
  1: "hotRanking",
  2: "originRanking",
  3: "upRanking",
}

const rankingStore = new HYEventStore({
  state: {
    newRanking: {}, // 0: 新歌
    hotRanking: {}, // 1: 热门
    originRanking: {}, // 2: 原创
    upRanking: {}, // 3: 飙升
  },
  actions: {
    getRankingDataAction(ctx) {
      // 0: 新歌榜 1: 热门榜 2: 原创榜 3: 飙升榜
      for (let i = 0; i < 4; i++) {
        getRankings(i).then((res) => {
          const rankingName = rankingMap[i]
          ctx[rankingName] = res.playlist
          // switch(i) {
          //   case 0:
          //     ctx.newRanking = res.playlist
          //     break;
          //   case 1:
          //     ctx.hotRanking = res.playlist
          //     break;
          //   case 2:
          //     ctx.originRanking = res.playlist
          //     break;
          //   case 3:
          //     ctx.upRanking = res.playlist
          //     break;
          // }
        })
      }
    },
  },
})

export { rankingStore, rankingMap }

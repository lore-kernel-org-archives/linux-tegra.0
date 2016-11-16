From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mailbox: Add Tegra HSP driver
Date: Wed, 16 Nov 2016 10:58:07 +0530
Message-ID: <CABb+yY2NNn2nfSVbYN0Tt4iKTw8TCUJc07kC0=-==W642uGSqQ@mail.gmail.com>
References: <20161115154845.24803-1-thierry.reding@gmail.com> <20161115154845.24803-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115154845.24803-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 15, 2016 at 9:18 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

....
> +
> +struct tegra_hsp_channel;
> +struct tegra_hsp;
> +
> +struct tegra_hsp_channel_ops {
> +       int (*send_data)(struct tegra_hsp_channel *channel, void *data);
> +       int (*startup)(struct tegra_hsp_channel *channel);
> +       void (*shutdown)(struct tegra_hsp_channel *channel);
> +       bool (*last_tx_done)(struct tegra_hsp_channel *channel);
> +};
> +
> +struct tegra_hsp_channel {
> +       struct tegra_hsp *hsp;
> +       const struct tegra_hsp_channel_ops *ops;
> +       struct mbox_chan *chan;
> +       void __iomem *regs;
> +};
> +
> +static struct tegra_hsp_channel *to_tegra_hsp_channel(struct mbox_chan *chan)
> +{
> +       return chan->con_priv;
> +}
> +
It seems
       channel = to_tegra_hsp_channel(chan);
is no simpler ritual than
       channel = chan->con_priv;   ?

> +struct tegra_hsp_doorbell {
> +       struct tegra_hsp_channel channel;
> +       struct list_head list;
> +       const char *name;
> +       unsigned int master;
> +       unsigned int index;
> +};
> +
> +static struct tegra_hsp_doorbell *
> +to_tegra_hsp_doorbell(struct tegra_hsp_channel *channel)
> +{
> +       if (!channel)
> +               return NULL;
> +
> +       return container_of(channel, struct tegra_hsp_doorbell, channel);
> +}
> +
But you don't check for NULL returned, before dereferencing the pointer 'db'

> +struct tegra_hsp_db_map {
> +       const char *name;
> +       unsigned int master;
> +       unsigned int index;
> +};
> +
> +struct tegra_hsp_soc {
> +       const struct tegra_hsp_db_map *map;
> +};
> +
> +struct tegra_hsp {
> +       const struct tegra_hsp_soc *soc;
> +       struct mbox_controller mbox;
> +       void __iomem *regs;
> +       unsigned int irq;
> +       unsigned int num_sm;
> +       unsigned int num_as;
> +       unsigned int num_ss;
> +       unsigned int num_db;
> +       unsigned int num_si;
> +       spinlock_t lock;
> +
> +       struct list_head doorbells;
> +};
> +
> +static inline struct tegra_hsp *
> +to_tegra_hsp(struct mbox_controller *mbox)
> +{
> +       return container_of(mbox, struct tegra_hsp, mbox);
> +}
> +
> +static inline u32 tegra_hsp_readl(struct tegra_hsp *hsp, unsigned int offset)
> +{
> +       return readl(hsp->regs + offset);
> +}
> +
> +static inline void tegra_hsp_writel(struct tegra_hsp *hsp, u32 value,
> +                                   unsigned int offset)
> +{
> +       writel(value, hsp->regs + offset);
> +}
> +
> +static inline u32 tegra_hsp_channel_readl(struct tegra_hsp_channel *channel,
> +                                         unsigned int offset)
> +{
> +       return readl(channel->regs + offset);
> +}
> +
> +static inline void tegra_hsp_channel_writel(struct tegra_hsp_channel *channel,
> +                                           u32 value, unsigned int offset)
> +{
> +       writel(value, channel->regs + offset);
> +}
> +
> +static bool tegra_hsp_doorbell_can_ring(struct tegra_hsp_doorbell *db)
> +{
> +       u32 value;
> +
> +       value = tegra_hsp_channel_readl(&db->channel, HSP_DB_ENABLE);
> +
> +       return (value & BIT(TEGRA_HSP_DB_MASTER_CCPLEX)) != 0;
> +}
> +
> +static struct tegra_hsp_doorbell *
> +__tegra_hsp_doorbell_get(struct tegra_hsp *hsp, unsigned int master)
> +{
> +       struct tegra_hsp_doorbell *entry;
> +
> +       list_for_each_entry(entry, &hsp->doorbells, list)
> +               if (entry->master == master)
> +                       return entry;
> +
> +       return NULL;
> +}
> +
> +static struct tegra_hsp_doorbell *
> +tegra_hsp_doorbell_get(struct tegra_hsp *hsp, unsigned int master)
> +{
> +       struct tegra_hsp_doorbell *db;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&hsp->lock, flags);
> +       db = __tegra_hsp_doorbell_get(hsp, master);
> +       spin_unlock_irqrestore(&hsp->lock, flags);
> +
> +       return db;
> +}
> +
.....

> +
> +static int tegra_hsp_doorbell_send_data(struct tegra_hsp_channel *channel,
> +                                       void *data)
> +{
> +       tegra_hsp_channel_writel(channel, 1, HSP_DB_TRIGGER);
> +
> +       return 0;
> +}
> +
> +static int tegra_hsp_doorbell_startup(struct tegra_hsp_channel *channel)
> +{
> +       struct tegra_hsp_doorbell *db = to_tegra_hsp_doorbell(channel);
> +       struct tegra_hsp *hsp = channel->hsp;
> +       struct tegra_hsp_doorbell *ccplex;
> +       unsigned long flags;
> +       u32 value;
> +
> +       if (db->master >= hsp->mbox.num_chans) {
> +               dev_err(hsp->mbox.dev,
> +                       "invalid master ID %u for HSP channel\n",
> +                       db->master);
> +               return -EINVAL;
> +       }
> +
> +       ccplex = tegra_hsp_doorbell_get(hsp, TEGRA_HSP_DB_MASTER_CCPLEX);
> +       if (!ccplex)
> +               return -ENODEV;
> +
> +       if (!tegra_hsp_doorbell_can_ring(db))
> +               return -ENODEV;
> +
> +       spin_lock_irqsave(&hsp->lock, flags);
> +
> +       value = tegra_hsp_channel_readl(&ccplex->channel, HSP_DB_ENABLE);
> +       value |= BIT(db->master);
> +       tegra_hsp_channel_writel(&ccplex->channel, value, HSP_DB_ENABLE);
> +
> +       spin_unlock_irqrestore(&hsp->lock, flags);
> +
> +       return 0;
> +}
> +
> +static void tegra_hsp_doorbell_shutdown(struct tegra_hsp_channel *channel)
> +{
> +       struct tegra_hsp_doorbell *db = to_tegra_hsp_doorbell(channel);
> +       struct tegra_hsp *hsp = channel->hsp;
> +       struct tegra_hsp_doorbell *ccplex;
> +       unsigned long flags;
> +       u32 value;
> +
> +       ccplex = tegra_hsp_doorbell_get(hsp, TEGRA_HSP_DB_MASTER_CCPLEX);
> +       if (!ccplex)
> +               return;
> +
> +       spin_lock_irqsave(&hsp->lock, flags);
> +
> +       value = tegra_hsp_channel_readl(&ccplex->channel, HSP_DB_ENABLE);
> +       value &= ~BIT(db->master);
> +       tegra_hsp_channel_writel(&ccplex->channel, value, HSP_DB_ENABLE);
> +
> +       spin_unlock_irqrestore(&hsp->lock, flags);
> +}
> +
> +static bool tegra_hsp_doorbell_last_tx_done(struct tegra_hsp_channel *channel)
> +{
> +       return true;
> +}
Just curious, is the IPC done instantly after writing HSP_DB_TRIGGER
bit? Usually there is at least some bit that stays (un)set as a 'busy
flag'.

> +
> +static const struct tegra_hsp_channel_ops tegra_hsp_doorbell_ops = {
> +       .send_data = tegra_hsp_doorbell_send_data,
> +       .startup = tegra_hsp_doorbell_startup,
> +       .shutdown = tegra_hsp_doorbell_shutdown,
> +       .last_tx_done = tegra_hsp_doorbell_last_tx_done,
> +};
> +
....

> +static int tegra_hsp_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> +
> +       return channel->ops->send_data(channel, data);
> +}
> +
> +static int tegra_hsp_startup(struct mbox_chan *chan)
> +{
> +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> +
> +       return channel->ops->startup(channel);
> +}
> +
> +static void tegra_hsp_shutdown(struct mbox_chan *chan)
> +{
> +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> +
> +       return channel->ops->shutdown(channel);
> +}
> +
> +static bool tegra_hsp_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> +
> +       return channel->ops->last_tx_done(channel);
> +}
> +
> +static const struct mbox_chan_ops tegra_hsp_ops = {
> +       .send_data = tegra_hsp_send_data,
> +       .startup = tegra_hsp_startup,
> +       .shutdown = tegra_hsp_shutdown,
> +       .last_tx_done = tegra_hsp_last_tx_done,
> +};
> +
These 4 above seem overkill. Why not directly use tegra_hsp_doorbell_xxx() ?

Cheers!

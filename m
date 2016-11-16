From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mailbox: Add Tegra HSP driver
Date: Wed, 16 Nov 2016 21:00:19 +0530
Message-ID: <CABb+yY0md=mjqvNfLbWW+Yk1m+Kv7NsZ5Eu917EuVFA=zHXxcw@mail.gmail.com>
References: <20161115154845.24803-1-thierry.reding@gmail.com>
 <20161115154845.24803-3-thierry.reding@gmail.com> <CABb+yY2NNn2nfSVbYN0Tt4iKTw8TCUJc07kC0=-==W642uGSqQ@mail.gmail.com>
 <20161116150806.GA7365@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161116150806.GA7365-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 16, 2016 at 8:38 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Nov 16, 2016 at 10:58:07AM +0530, Jassi Brar wrote:
>> On Tue, Nov 15, 2016 at 9:18 PM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> ....
>> > +
>> > +struct tegra_hsp_channel;
>> > +struct tegra_hsp;
>> > +
>> > +struct tegra_hsp_channel_ops {
>> > +       int (*send_data)(struct tegra_hsp_channel *channel, void *data);
>> > +       int (*startup)(struct tegra_hsp_channel *channel);
>> > +       void (*shutdown)(struct tegra_hsp_channel *channel);
>> > +       bool (*last_tx_done)(struct tegra_hsp_channel *channel);
>> > +};
>> > +
>> > +struct tegra_hsp_channel {
>> > +       struct tegra_hsp *hsp;
>> > +       const struct tegra_hsp_channel_ops *ops;
>> > +       struct mbox_chan *chan;
>> > +       void __iomem *regs;
>> > +};
>> > +
>> > +static struct tegra_hsp_channel *to_tegra_hsp_channel(struct mbox_chan *chan)
>> > +{
>> > +       return chan->con_priv;
>> > +}
>> > +
>> It seems
>>        channel = to_tegra_hsp_channel(chan);
>> is no simpler ritual than
>>        channel = chan->con_priv;   ?
>
> Yes, that's true. I've dropped the to_tegra_hsp_channel() inline in
> favour of using the chan->con_priv directly.
>
>> > +struct tegra_hsp_doorbell {
>> > +       struct tegra_hsp_channel channel;
>> > +       struct list_head list;
>> > +       const char *name;
>> > +       unsigned int master;
>> > +       unsigned int index;
>> > +};
>> > +
>> > +static struct tegra_hsp_doorbell *
>> > +to_tegra_hsp_doorbell(struct tegra_hsp_channel *channel)
>> > +{
>> > +       if (!channel)
>> > +               return NULL;
>> > +
>> > +       return container_of(channel, struct tegra_hsp_doorbell, channel);
>> > +}
>> > +
>> But you don't check for NULL returned, before dereferencing the pointer 'db'
>
> In all the call sites where this is used the channel is guaranteed not
> to be NULL, hence no checking is necessary. However the function here
> could potentially be used in other cases where no such guarantees can
> be given and checking the !channel above is merely there to avoid
> casting to a non-NULL pointer from a NULL pointer.
>
> I've run occasionally into this issue because container_of() will simply
> perform arithmetic on the pointer given, so passing channel as NULL
> would convert to some very large pointer that can no longer be easily
> discerned from an invalid pointer.
>
> So this is primarily a safety feature, and one that I'd prefer to keep
> just to avoid running into issues down the road when the function gets
> used under different circumstances.
>
>> > +static bool tegra_hsp_doorbell_last_tx_done(struct tegra_hsp_channel *channel)
>> > +{
>> > +       return true;
>> > +}
>> Just curious, is the IPC done instantly after writing HSP_DB_TRIGGER
>> bit? Usually there is at least some bit that stays (un)set as a 'busy
>> flag'.
>
> I don't think there's a bit like that for doorbells. The way that these
> doorbells are used is in combination with a shared memory IPC protocol.
> Two processors will communicate by writing to and reading from what is
> essentially a ring buffer in shared memory. The doorbells are merely a
> means of communicating their peer that a new entry is available in the
> shared memory.
>
For such protocols, we have the TXDONE_BY_ACK. I assume your client
drivers will drive the state-machine. Otherwise, you risk overrunning
the ring-buffer in SHM, but not caring if the first filled buffer was
actually consumed by the remote (just like ALSA ring buffer).

>> > +static const struct tegra_hsp_channel_ops tegra_hsp_doorbell_ops = {
>> > +       .send_data = tegra_hsp_doorbell_send_data,
>> > +       .startup = tegra_hsp_doorbell_startup,
>> > +       .shutdown = tegra_hsp_doorbell_shutdown,
>> > +       .last_tx_done = tegra_hsp_doorbell_last_tx_done,
>> > +};
>> > +
>> ....
>>
>> > +static int tegra_hsp_send_data(struct mbox_chan *chan, void *data)
>> > +{
>> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
>> > +
>> > +       return channel->ops->send_data(channel, data);
>> > +}
>> > +
>> > +static int tegra_hsp_startup(struct mbox_chan *chan)
>> > +{
>> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
>> > +
>> > +       return channel->ops->startup(channel);
>> > +}
>> > +
>> > +static void tegra_hsp_shutdown(struct mbox_chan *chan)
>> > +{
>> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
>> > +
>> > +       return channel->ops->shutdown(channel);
>> > +}
>> > +
>> > +static bool tegra_hsp_last_tx_done(struct mbox_chan *chan)
>> > +{
>> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
>> > +
>> > +       return channel->ops->last_tx_done(channel);
>> > +}
>> > +
>> > +static const struct mbox_chan_ops tegra_hsp_ops = {
>> > +       .send_data = tegra_hsp_send_data,
>> > +       .startup = tegra_hsp_startup,
>> > +       .shutdown = tegra_hsp_shutdown,
>> > +       .last_tx_done = tegra_hsp_last_tx_done,
>> > +};
>> > +
>> These 4 above seem overkill. Why not directly use tegra_hsp_doorbell_xxx() ?
>
> This is in preparation for supporting the other synchronization
> primitives that the HSP IP block exposes. Some of them use different
> programming and semantics, hence why we want to have this second level
> of abstraction. It will allow us to share some of the code between the
> different primitives once their implementations are added.
>
OK, but until then this, and the above NULL check, will look silly.
Usually we add only necessary code at any time.

Thanks.

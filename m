From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/2] mailbox: Add Tegra HSP driver
Date: Wed, 16 Nov 2016 18:46:29 +0100
Message-ID: <20161116174629.GA32010@ulmo.ba.sec>
References: <20161115154845.24803-1-thierry.reding@gmail.com>
 <20161115154845.24803-3-thierry.reding@gmail.com>
 <CABb+yY2NNn2nfSVbYN0Tt4iKTw8TCUJc07kC0=-==W642uGSqQ@mail.gmail.com>
 <20161116150806.GA7365@ulmo.ba.sec>
 <CABb+yY0md=mjqvNfLbWW+Yk1m+Kv7NsZ5Eu917EuVFA=zHXxcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY0md=mjqvNfLbWW+Yk1m+Kv7NsZ5Eu917EuVFA=zHXxcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2016 at 09:00:19PM +0530, Jassi Brar wrote:
> On Wed, Nov 16, 2016 at 8:38 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Nov 16, 2016 at 10:58:07AM +0530, Jassi Brar wrote:
> >> On Tue, Nov 15, 2016 at 9:18 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >>
> >> ....
> >> > +
> >> > +struct tegra_hsp_channel;
> >> > +struct tegra_hsp;
> >> > +
> >> > +struct tegra_hsp_channel_ops {
> >> > +       int (*send_data)(struct tegra_hsp_channel *channel, void *data);
> >> > +       int (*startup)(struct tegra_hsp_channel *channel);
> >> > +       void (*shutdown)(struct tegra_hsp_channel *channel);
> >> > +       bool (*last_tx_done)(struct tegra_hsp_channel *channel);
> >> > +};
> >> > +
> >> > +struct tegra_hsp_channel {
> >> > +       struct tegra_hsp *hsp;
> >> > +       const struct tegra_hsp_channel_ops *ops;
> >> > +       struct mbox_chan *chan;
> >> > +       void __iomem *regs;
> >> > +};
> >> > +
> >> > +static struct tegra_hsp_channel *to_tegra_hsp_channel(struct mbox_chan *chan)
> >> > +{
> >> > +       return chan->con_priv;
> >> > +}
> >> > +
> >> It seems
> >>        channel = to_tegra_hsp_channel(chan);
> >> is no simpler ritual than
> >>        channel = chan->con_priv;   ?
> >
> > Yes, that's true. I've dropped the to_tegra_hsp_channel() inline in
> > favour of using the chan->con_priv directly.
> >
> >> > +struct tegra_hsp_doorbell {
> >> > +       struct tegra_hsp_channel channel;
> >> > +       struct list_head list;
> >> > +       const char *name;
> >> > +       unsigned int master;
> >> > +       unsigned int index;
> >> > +};
> >> > +
> >> > +static struct tegra_hsp_doorbell *
> >> > +to_tegra_hsp_doorbell(struct tegra_hsp_channel *channel)
> >> > +{
> >> > +       if (!channel)
> >> > +               return NULL;
> >> > +
> >> > +       return container_of(channel, struct tegra_hsp_doorbell, channel);
> >> > +}
> >> > +
> >> But you don't check for NULL returned, before dereferencing the pointer 'db'
> >
> > In all the call sites where this is used the channel is guaranteed not
> > to be NULL, hence no checking is necessary. However the function here
> > could potentially be used in other cases where no such guarantees can
> > be given and checking the !channel above is merely there to avoid
> > casting to a non-NULL pointer from a NULL pointer.
> >
> > I've run occasionally into this issue because container_of() will simply
> > perform arithmetic on the pointer given, so passing channel as NULL
> > would convert to some very large pointer that can no longer be easily
> > discerned from an invalid pointer.
> >
> > So this is primarily a safety feature, and one that I'd prefer to keep
> > just to avoid running into issues down the road when the function gets
> > used under different circumstances.
> >
> >> > +static bool tegra_hsp_doorbell_last_tx_done(struct tegra_hsp_channel *channel)
> >> > +{
> >> > +       return true;
> >> > +}
> >> Just curious, is the IPC done instantly after writing HSP_DB_TRIGGER
> >> bit? Usually there is at least some bit that stays (un)set as a 'busy
> >> flag'.
> >
> > I don't think there's a bit like that for doorbells. The way that these
> > doorbells are used is in combination with a shared memory IPC protocol.
> > Two processors will communicate by writing to and reading from what is
> > essentially a ring buffer in shared memory. The doorbells are merely a
> > means of communicating their peer that a new entry is available in the
> > shared memory.
> >
> For such protocols, we have the TXDONE_BY_ACK. I assume your client
> drivers will drive the state-machine. Otherwise, you risk overrunning
> the ring-buffer in SHM, but not caring if the first filled buffer was
> actually consumed by the remote (just like ALSA ring buffer).

I did some digging and it turns out that the driver is already using
TXDONE_BY_ACK (it sets .txdone_irq = false and .txdone_poll = false)
and indeed users are driving the TX state machine by calling the
mbox_client_txdone() function where appropriate.

Given the above the .last_tx_done() callback is completely unused so
I've just dropped it.

> >> > +static const struct tegra_hsp_channel_ops tegra_hsp_doorbell_ops = {
> >> > +       .send_data = tegra_hsp_doorbell_send_data,
> >> > +       .startup = tegra_hsp_doorbell_startup,
> >> > +       .shutdown = tegra_hsp_doorbell_shutdown,
> >> > +       .last_tx_done = tegra_hsp_doorbell_last_tx_done,
> >> > +};
> >> > +
> >> ....
> >>
> >> > +static int tegra_hsp_send_data(struct mbox_chan *chan, void *data)
> >> > +{
> >> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> >> > +
> >> > +       return channel->ops->send_data(channel, data);
> >> > +}
> >> > +
> >> > +static int tegra_hsp_startup(struct mbox_chan *chan)
> >> > +{
> >> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> >> > +
> >> > +       return channel->ops->startup(channel);
> >> > +}
> >> > +
> >> > +static void tegra_hsp_shutdown(struct mbox_chan *chan)
> >> > +{
> >> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> >> > +
> >> > +       return channel->ops->shutdown(channel);
> >> > +}
> >> > +
> >> > +static bool tegra_hsp_last_tx_done(struct mbox_chan *chan)
> >> > +{
> >> > +       struct tegra_hsp_channel *channel = to_tegra_hsp_channel(chan);
> >> > +
> >> > +       return channel->ops->last_tx_done(channel);
> >> > +}
> >> > +
> >> > +static const struct mbox_chan_ops tegra_hsp_ops = {
> >> > +       .send_data = tegra_hsp_send_data,
> >> > +       .startup = tegra_hsp_startup,
> >> > +       .shutdown = tegra_hsp_shutdown,
> >> > +       .last_tx_done = tegra_hsp_last_tx_done,
> >> > +};
> >> > +
> >> These 4 above seem overkill. Why not directly use tegra_hsp_doorbell_xxx() ?
> >
> > This is in preparation for supporting the other synchronization
> > primitives that the HSP IP block exposes. Some of them use different
> > programming and semantics, hence why we want to have this second level
> > of abstraction. It will allow us to share some of the code between the
> > different primitives once their implementations are added.
> >
> OK, but until then this, and the above NULL check, will look silly.
> Usually we add only necessary code at any time.

I've removed the additional level of indirection, we can always add this
back when/if required. As a side-effect the to_tegra_hsp_doorbell() goes
away because it is unused, thereby removing your last concern as well.

I just sent out a v5 that should address all of your comments.

Thanks,
Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLJtzAAoJEN0jrNd/PrOhsSUP/0E6W18vlc+9ieOzU9MoHJV/
Cd88IZNOVqnAT9m99iH87KZ4uV8PzJ//ku3AVM96eG5jSlWRNouwkDiLgF1PW7pg
NicmabCQ80II2N5FzZXTafL8/hQwSyhNvl8O3mFw+vNzJtA2MxWYBBEn3FFIu95U
i4A5+mzdkLWLmTWa5W9BguefH3i4OUXKqYcua6MXjy539TL2o+GIlWbukQHAr9Xz
noJdMaXGD7ZVFDS9Q5pMHkZQtyVQFjvQ20vD60sAhOlXPpndf/J9DK8PQNXl5O9E
1V/Cuca40QHTNSiBMxTgTUsR7B0lia5QYX2rw5+47E7SSBNLwCYIiYsmHbQEifca
whDbSCwkMj2+0sTN1F0Unrj+MspZpnqWiVTwKrfNn7nngsV8nJHLQP8qitrfzq6m
eQS5Ii/2JV5xtZ0khunPZUb17I74uFM3v6Bj0N2PlicExBD1DaYsHd5qJbZxu3Ri
Mri5ynON75eHq6ARCXHsYLz2P3RJQMiBp+PXZJbHFGEFP5WxfYNUrqWybllKd7wq
yYYU+MMXOo0f6p43pfof1EJXKVSzRGWzUs6yhQCgj/ccLs2TUlwah+fXkKIrN8dk
xtfA6E8fCtDbDYOStw/xxnoCFbTa71ReiIlWWiUWmAsa6Iu728h0UMTVfJcfKWjr
78TSXbLuCnbN8pbN6fXL
=349F
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

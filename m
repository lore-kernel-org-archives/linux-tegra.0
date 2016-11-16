From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mailbox: Add Tegra HSP driver
Date: Wed, 16 Nov 2016 16:08:06 +0100
Message-ID: <20161116150806.GA7365@ulmo.ba.sec>
References: <20161115154845.24803-1-thierry.reding@gmail.com>
 <20161115154845.24803-3-thierry.reding@gmail.com>
 <CABb+yY2NNn2nfSVbYN0Tt4iKTw8TCUJc07kC0=-==W642uGSqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2NNn2nfSVbYN0Tt4iKTw8TCUJc07kC0=-==W642uGSqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 10:58:07AM +0530, Jassi Brar wrote:
> On Tue, Nov 15, 2016 at 9:18 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> ....
> > +
> > +struct tegra_hsp_channel;
> > +struct tegra_hsp;
> > +
> > +struct tegra_hsp_channel_ops {
> > +       int (*send_data)(struct tegra_hsp_channel *channel, void *data);
> > +       int (*startup)(struct tegra_hsp_channel *channel);
> > +       void (*shutdown)(struct tegra_hsp_channel *channel);
> > +       bool (*last_tx_done)(struct tegra_hsp_channel *channel);
> > +};
> > +
> > +struct tegra_hsp_channel {
> > +       struct tegra_hsp *hsp;
> > +       const struct tegra_hsp_channel_ops *ops;
> > +       struct mbox_chan *chan;
> > +       void __iomem *regs;
> > +};
> > +
> > +static struct tegra_hsp_channel *to_tegra_hsp_channel(struct mbox_chan=
 *chan)
> > +{
> > +       return chan->con_priv;
> > +}
> > +
> It seems
>        channel =3D to_tegra_hsp_channel(chan);
> is no simpler ritual than
>        channel =3D chan->con_priv;   ?

Yes, that's true. I've dropped the to_tegra_hsp_channel() inline in
favour of using the chan->con_priv directly.

> > +struct tegra_hsp_doorbell {
> > +       struct tegra_hsp_channel channel;
> > +       struct list_head list;
> > +       const char *name;
> > +       unsigned int master;
> > +       unsigned int index;
> > +};
> > +
> > +static struct tegra_hsp_doorbell *
> > +to_tegra_hsp_doorbell(struct tegra_hsp_channel *channel)
> > +{
> > +       if (!channel)
> > +               return NULL;
> > +
> > +       return container_of(channel, struct tegra_hsp_doorbell, channel=
);
> > +}
> > +
> But you don't check for NULL returned, before dereferencing the pointer '=
db'

In all the call sites where this is used the channel is guaranteed not
to be NULL, hence no checking is necessary. However the function here
could potentially be used in other cases where no such guarantees can
be given and checking the !channel above is merely there to avoid
casting to a non-NULL pointer from a NULL pointer.

I've run occasionally into this issue because container_of() will simply
perform arithmetic on the pointer given, so passing channel as NULL
would convert to some very large pointer that can no longer be easily
discerned from an invalid pointer.

So this is primarily a safety feature, and one that I'd prefer to keep
just to avoid running into issues down the road when the function gets
used under different circumstances.

> > +static bool tegra_hsp_doorbell_last_tx_done(struct tegra_hsp_channel *=
channel)
> > +{
> > +       return true;
> > +}
> Just curious, is the IPC done instantly after writing HSP_DB_TRIGGER
> bit? Usually there is at least some bit that stays (un)set as a 'busy
> flag'.

I don't think there's a bit like that for doorbells. The way that these
doorbells are used is in combination with a shared memory IPC protocol.
Two processors will communicate by writing to and reading from what is
essentially a ring buffer in shared memory. The doorbells are merely a
means of communicating their peer that a new entry is available in the
shared memory.

> > +static const struct tegra_hsp_channel_ops tegra_hsp_doorbell_ops =3D {
> > +       .send_data =3D tegra_hsp_doorbell_send_data,
> > +       .startup =3D tegra_hsp_doorbell_startup,
> > +       .shutdown =3D tegra_hsp_doorbell_shutdown,
> > +       .last_tx_done =3D tegra_hsp_doorbell_last_tx_done,
> > +};
> > +
> ....
>=20
> > +static int tegra_hsp_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct tegra_hsp_channel *channel =3D to_tegra_hsp_channel(chan=
);
> > +
> > +       return channel->ops->send_data(channel, data);
> > +}
> > +
> > +static int tegra_hsp_startup(struct mbox_chan *chan)
> > +{
> > +       struct tegra_hsp_channel *channel =3D to_tegra_hsp_channel(chan=
);
> > +
> > +       return channel->ops->startup(channel);
> > +}
> > +
> > +static void tegra_hsp_shutdown(struct mbox_chan *chan)
> > +{
> > +       struct tegra_hsp_channel *channel =3D to_tegra_hsp_channel(chan=
);
> > +
> > +       return channel->ops->shutdown(channel);
> > +}
> > +
> > +static bool tegra_hsp_last_tx_done(struct mbox_chan *chan)
> > +{
> > +       struct tegra_hsp_channel *channel =3D to_tegra_hsp_channel(chan=
);
> > +
> > +       return channel->ops->last_tx_done(channel);
> > +}
> > +
> > +static const struct mbox_chan_ops tegra_hsp_ops =3D {
> > +       .send_data =3D tegra_hsp_send_data,
> > +       .startup =3D tegra_hsp_startup,
> > +       .shutdown =3D tegra_hsp_shutdown,
> > +       .last_tx_done =3D tegra_hsp_last_tx_done,
> > +};
> > +
> These 4 above seem overkill. Why not directly use tegra_hsp_doorbell_xxx(=
) ?

This is in preparation for supporting the other synchronization
primitives that the HSP IP block exposes. Some of them use different
programming and semantics, hence why we want to have this second level
of abstraction. It will allow us to share some of the code between the
different primitives once their implementations are added.

If you feel really strongly about it, I suppose I could eliminate it,
but I suspect that we'd want to add them back in after support for the
other primitives is added.

Thanks,
Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLHZTAAoJEN0jrNd/PrOhlRkP/0QqsEQoF4DJrNQOFPi6DIQn
tlkYjakz28rAMaC0MhbPfjOSPrrPKNQ/jlkPHwLmfrMwNVdYBSub+21bxVw8HrAb
aiFIrpOGm2ROMysi2edVmdRbWXOaPq0Ila6tekavOy5u/enSiUz0gn3WKKJWxzcg
2vGkiQgmHA9rfSi6CrVjSByI7W+7qzHAcCLcdA6AlQIG3LnD1m+08P9o9ef3A40M
Q88GV/tx6o/PJ8gJirMcN6ZWqDA9FxWFuQ9kJf+tPZVm1X+xDEpKCi/xjs3YDHYN
Z7AkyAUhSmlQKRpMrBg/8tATXu/Kqh05vZ98TPZiDV6MI71/xpQb+esmwqB7I15D
e0apmWwDvXZbJzUpo0DiQNRAiI/OvjOcqwV3USlRDAlB/P+KOp1ecCs1/7zK4iCZ
BfZ94tJ/V6IO3jWz/iPxrfA4jRkI+mwVgR+em8ZhRsiyN7o6o8Sdwn/Bs/k9FCXp
Z2Z/OcWaDKT+ymOSIp5Aqt8jtPOZPniH6d3cuOrCkbqG2jgEcIatrrdcPddsqaU9
FLQwn3LPVAPocbPOOYpNFzp8jFhs5Ggnmf93XB6dqu/6gfg3Tvfh15ok5xhMwi3k
l9NWbqZgrbgVsCDMNOsK7OIhQ/YZlnHYTUX8Bqgd6muqUBJ00iCdAg+R4aymLitB
uoMKq/KkuABS3yzlJZr2
=VxU0
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

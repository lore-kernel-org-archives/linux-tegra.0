From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 04/12] firmware: tegra: Add IVC library
Date: Mon, 22 Aug 2016 14:40:34 +0200
Message-ID: <20160822124034.GA17367@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-5-thierry.reding@gmail.com>
 <90222c3a-7c69-6fa3-d161-4ed0c5759f34@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <90222c3a-7c69-6fa3-d161-4ed0c5759f34-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 11:46:49AM +0100, Jon Hunter wrote:
>=20
> On 19/08/16 18:32, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The Inter-VM communication (IVC) is a communication protocol which is
> > designed for interprocessor communication (IPC) or the communication
> > between the hypervisor and the virtual machine with a guest OS.
> >=20
> > Message channels are used to communicate between processors. They are
> > backed by DRAM or SRAM, so care must be taken to maintain coherence of
> > data.
> >=20
> > The IVC library maintains memory-based descriptors for the transmission
> > and reception channels as well as the data coherence of the counter and
> > payload. Clients, such as the driver for the BPMP firmware, can use the
> > library to exchange messages with remote processors.
> >=20
> > Based on work by Peter Newman <pnewman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> and Joseph Lo
> > <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v3:
> > - use a more object oriented design
> >=20
> >  drivers/firmware/Kconfig        |   1 +
> >  drivers/firmware/Makefile       |   1 +
> >  drivers/firmware/tegra/Kconfig  |  13 +
> >  drivers/firmware/tegra/Makefile |   1 +
> >  drivers/firmware/tegra/ivc.c    | 683 ++++++++++++++++++++++++++++++++=
++++++++
> >  include/soc/tegra/ivc.h         | 109 +++++++
> >  6 files changed, 808 insertions(+)
> >  create mode 100644 drivers/firmware/tegra/Kconfig
> >  create mode 100644 drivers/firmware/tegra/Makefile
> >  create mode 100644 drivers/firmware/tegra/ivc.c
> >  create mode 100644 include/soc/tegra/ivc.h
>=20
> [snip]
>=20
> > +static void *tegra_ivc_frame_virt(struct tegra_ivc *ivc,
> > +				  struct tegra_ivc_header *header,
> > +				  unsigned int frame)
> > +{
> > +	BUG_ON(frame >=3D ivc->num_frames);
>=20
> WARN_ON and return an error pointer?

I think I'll actually drop these. Or move them one layer up. The only
parameters passed into as frame are ivc->{rx,tx}.position, and all the
code that modifies these will properly wrap them at ivc->num_frames. I
think the only way that this condition could become true is if someone
were to directly access the structure and modify the position. That's
technically possible, so I guess the checks could stay in for extra
paranoia.

> > +
> > +	return (void *)(header + 1) + ivc->frame_size * frame;
> > +}
> > +
> > +static inline dma_addr_t tegra_ivc_frame_phys(struct tegra_ivc *ivc,
> > +					      dma_addr_t phys,
> > +					      unsigned int frame)
> > +{
> > +	unsigned long offset;
> > +
> > +	BUG_ON(!ivc->peer);
> > +	BUG_ON(frame >=3D ivc->num_frames);
>=20
> WARN_ON?

I've moved this up one layer since it's a little cumbersome to return an
error via dma_addr_t and the !ivc->peer check is present in all callers
of this function anyway.

> > +	offset =3D sizeof(struct tegra_ivc_header) + ivc->frame_size * frame;
> > +
> > +	return phys + offset;
> > +}
>=20
> [snip]
>=20
> > +static int check_ivc_params(unsigned long base1, unsigned long base2,
> > +			    unsigned int num_frames, size_t frame_size)
> > +{
> > +	BUG_ON(offsetof(struct tegra_ivc_header, tx.count) & (TEGRA_IVC_ALIGN=
 - 1));
> > +	BUG_ON(offsetof(struct tegra_ivc_header, rx.count) & (TEGRA_IVC_ALIGN=
 - 1));
> > +	BUG_ON(sizeof(struct tegra_ivc_header) & (TEGRA_IVC_ALIGN - 1));
>=20
> WARN_ON?

I've turned all of these into BUILD_BUG_ON() because the parameters are
all statically known at build time. I've also switched to the IS_ALIGNED
macro here and the checks below because it's easier to read.

> > +int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer,
> > +		   void __iomem *rx_virt, dma_addr_t rx_phys,
> > +		   void __iomem *tx_virt, dma_addr_t tx_phys,
> > +		   unsigned int num_frames, size_t frame_size,
> > +		   void (*notify)(struct tegra_ivc *ivc, void *data),
> > +		   void *data)
> > +{
> > +	size_t queue_size;
> > +	int err;
> > +
> > +	err =3D check_ivc_params((unsigned long)rx_virt, (unsigned long)tx_vi=
rt,
> > +			       num_frames, frame_size);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	BUG_ON(!ivc);
> > +	BUG_ON(!notify);
>=20
> We should check this first and just return -EINVAL.

Yes, done. I've wrapped these in a single WARN_ON() with a -EINVAL
return.

> > +/**
> > + * tegra_ivc_read_get_next_frame - Peek at the next frame to receive
> > + * @ivc		pointer of the IVC channel
> > + *
> > + * Peek at the next frame to be received, without removing it from
> > + * the queue.
> > + *
> > + * Returns a pointer to the frame, or an error encoded pointer.
> > + */
> > +void *tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc);
>=20
> Is it odd to return a void * pointer here and not a pointer to a
> specific structure type?

I think that's by design. IVC is a generic library to implement an IPC
mechanism on top. There is no specific structure to return a pointer to
here. The caller determines what type it wants to put into frames.

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuvK/AAoJEN0jrNd/PrOh5V4QAIyNBewPF0CHdhPCmkBrtYXD
FUFT5tShR0aFhneEGZKnmtHU4yjOn/w66yBewsvIpod9Sq3WupnDzN1jEFkc83LT
E1v/pXAJcqt7KXU3MN6YVaqnzzkcGbZQUTGW2XhBP65vbCyQSb1E+/TZESfxWzyp
GFSz1PppGvtqRtm79B6i9N0hqbSSdEJQsmnEB15aeUM3n+Ywxl1p+e55o9+HyxeG
c+P9SjZRbBKbAzWsM+Yyk7EG1Y+Qm9pwOhtAPI0gLkvmerVw1z2ZE6hPI4FrJWjr
wdm6xVnGY+6VhtT+7r/Lp1eQToh661+2nfauowqz5U2bqNjrNhtWJ8UtLpRzS7vz
zgYfMz9QUyelG9KZeSv8Ao0IXV2w25C+P0hI7rtj2HyScksC5TZC//0htXONDYrX
yrVQm5DWDe4mJTBXdR+YLkHLiQ0SNnLMFplTCoW1BipYRVzW3BprKG4WQBz594Ck
btCld/lNOaD1xqsQ41rsowSukOwBhyvwYsbucL74iWBGGnDv1BaQ1dMoSHhUk5pB
cX5nkKTWvxhjKGmn9vMC9gW+cCS2jaLENAgjEwV2vMAf1AaPM2FiviFco3pkrPQG
Yt02daZ4Y5lUBiT+xjpTkRE4LDhayBlzyD7vjTscpRIjDm44qq+At1cTi9Xxiia6
JJ7omltVaCCcDYTP0BiP
=H/xa
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

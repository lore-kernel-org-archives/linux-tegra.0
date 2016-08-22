From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/12] firmware: tegra: Add BPMP support
Date: Mon, 22 Aug 2016 14:54:58 +0200
Message-ID: <20160822125458.GC17367@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-6-thierry.reding@gmail.com>
 <94227d94-1d60-fda7-731b-26656633d585@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <94227d94-1d60-fda7-731b-26656633d585-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 10:26:50AM +0100, Jon Hunter wrote:
>=20
> On 19/08/16 18:32, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The Boot and Power Management Processor (BPMP) is a co-processor found
> > on Tegra SoCs. It is designed to handle the early stages of the boot
> > process and offload power management tasks (such as clocks, resets,
> > powergates, ...) as well as system control services.
> >=20
> > Compared to the ARM SCPI, the services provided by BPMP are message-
> > based rather than method-based. The BPMP firmware driver provides the
> > services to transmit data to and receive data from the BPMP. Users can
> > also register an MRQ, for which a service routine will be run when a
> > corresponding event is received from the firmware.
>=20
> MRQ?

I think that means "Message ReQuest", which is sort of like an IRQ but
the user will receive a message (with potentially payload) instead. Do
you want me to spell that out in the commit message, or what would you
suggest?

> > diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/M=
akefile
> > index 92e2153e8173..e34a2f79e1ad 100644
> > --- a/drivers/firmware/tegra/Makefile
> > +++ b/drivers/firmware/tegra/Makefile
> > @@ -1 +1,2 @@
> > +obj-$(CONFIG_TEGRA_BPMP)	+=3D bpmp.o
> >  obj-$(CONFIG_TEGRA_IVC)		+=3D ivc.o
> > diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpm=
p.c
> > new file mode 100644
> > index 000000000000..a09043b1be05
> > --- /dev/null
> > +++ b/drivers/firmware/tegra/bpmp.c
> > @@ -0,0 +1,880 @@
> > +/*
> > + * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITH=
OUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
> > + * more details.
> > + */
> > +
> > +#define DEBUG
>=20
> I don't think we want DEBUG by default, right?

Yes, that's left-over from debugging.

> > +static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
> > +{
> > +	struct mrq_ping_response response;
> > +	struct mrq_ping_request request;
> > +	struct tegra_bpmp_message msg;
> > +	ktime_t start, delta;
> > +	unsigned long flags;
> > +	int err;
> > +
> > +	memset(&request, 0, sizeof(request));
> > +	request.challenge =3D 1;
> > +
> > +	memset(&response, 0, sizeof(response));
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.mrq =3D MRQ_PING;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	start =3D ktime_get();
> > +
> > +	local_irq_save(flags);
> > +	err =3D tegra_bpmp_transfer_atomic(bpmp, &msg);
> > +	local_irq_restore(flags);
> > +
> > +	delta =3D ktime_sub(ktime_get(), start);
> > +
> > +	if (!err)
> > +		dev_info(bpmp->dev,
> > +			 "ping ok: challenge: %u, response: %u, time: %lld\n",
> > +			 request.challenge, response.reply,
> > +			 ktime_to_us(delta));
>=20
> Should this be a dev_dbg? I guess this only happens on probe.

I suppose you could use this anywhere else, too, just to check that the
BPMP is still responding. But yes, I think making this DEBUG level will
be enough.

>=20
> > +	return err;
> > +}
>=20
> [snip]
>=20
> > +static int tegra_bpmp_probe(struct platform_device *pdev)
> > +{
> > +	struct tegra_bpmp_channel *channel;
> > +	struct tegra_bpmp *bpmp;
> > +	struct device_node *np;
> > +	struct resource res;
> > +	unsigned int i;
> > +	char tag[32];
> > +	size_t size;
> > +	int err;
> > +
> > +	bpmp =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
> > +	if (!bpmp)
> > +		return -ENOMEM;
> > +
> > +	bpmp->soc =3D of_device_get_match_data(&pdev->dev);
> > +	bpmp->dev =3D &pdev->dev;
> > +
> > +	np =3D of_parse_phandle(pdev->dev.of_node, "shmem", 0);
> > +	if (!np)
> > +		return -ENOENT;
> > +
> > +	of_address_to_resource(np, 0, &res);
> > +	of_node_put(np);
> > +
> > +	bpmp->tx_base =3D devm_ioremap_resource(&pdev->dev, &res);
> > +	if (IS_ERR(bpmp->tx_base))
> > +		return PTR_ERR(bpmp->tx_base);
> > +
> > +	np =3D of_parse_phandle(pdev->dev.of_node, "shmem", 1);
> > +	if (!np)
> > +		return -ENOENT;
> > +
> > +	of_address_to_resource(np, 0, &res);
> > +	of_node_put(np);
> > +
> > +	bpmp->rx_base =3D devm_ioremap_resource(&pdev->dev, &res);
> > +	if (IS_ERR(bpmp->rx_base))
> > +		return PTR_ERR(bpmp->rx_base);
> > +
> > +	bpmp->num_channels =3D bpmp->soc->channels.cpu_tx.count +
> > +			     bpmp->soc->channels.thread.count +
> > +			     bpmp->soc->channels.cpu_rx.count;
> > +
> > +	bpmp->channels =3D devm_kcalloc(&pdev->dev, bpmp->num_channels,
> > +				      sizeof(*channel), GFP_KERNEL);
> > +	if (!bpmp->channels)
> > +		return -ENOMEM;
> > +
> > +	/* mbox registration */
> > +	bpmp->mbox.client.dev =3D &pdev->dev;
> > +	bpmp->mbox.client.rx_callback =3D tegra_bpmp_handle_rx;
> > +	bpmp->mbox.client.tx_block =3D false;
> > +	bpmp->mbox.client.knows_txdone =3D false;
> > +
> > +	bpmp->mbox.channel =3D mbox_request_channel(&bpmp->mbox.client, 0);
> > +	if (IS_ERR(bpmp->mbox.channel)) {
> > +		err =3D PTR_ERR(bpmp->mbox.channel);
> > +		dev_err(&pdev->dev, "failed to get HSP mailbox: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	/* message channel initialization */
> > +	for (i =3D 0; i < bpmp->num_channels; i++) {
> > +		struct tegra_bpmp_channel *channel =3D &bpmp->channels[i];
> > +
> > +		err =3D tegra_bpmp_channel_init(channel, bpmp, i);
> > +		if (err)
> > +			return err;
> > +	}
>=20
> We should make sure we free the mbox if we fail after requesting it.

Yes, will do.

Thanks,
Thierry

>=20
> Cheers
> Jon
>=20
> --=20
> nvpublic

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuvYfAAoJEN0jrNd/PrOhojEQAIB8Pz+1Tuy5WLFKTISlbsRH
zyjOtT5NQ7j4nrLtX2aSziDThYBUD4RvD0QHyWB1d1D/75f7HtRbgsxgxgXrrkll
+Tjt6H7BWtvcYsFgrRq0z4msrOVril8YNEi2uqCo6wSAoPGmFzFchwV1zMfCBi6P
Me0hVXT0+DFCKTL3HP504bWDT1lI/lF1r+LxXSXUUAfanHy4cs/Z6QKG21wQ2KHn
trauxucZzpNvfogJ8kGVHuaVjB5Kx233vWcwnWfe9ytGZ0hJ36BcoRglqal5M66b
Wml32C5gpxk2ALjx8v08ilUXCRJjZgDo9QJ7Tgmf3Rs64wUfO0gFJ7IJxMeh6evt
g31ihBzVWMvvZga+1I8P0thZXEK1FM8yC6yGo5z9bQYV8YmzJz+4NbfzYXZtKYb0
kVUMAHYSgZCGD9ts3LysPCuod0eaiVViyar9N8WVJ63hLUt+uPBwiKXpAuQzxqBS
9OqjTdDYrZUhI24ZQ/0Xrch4SNAOs7Y7rmOAOb4w8y7Mwz5tdaVx8aa/2VktBmz6
mcQw0DQ641wuai/8RgO+vm5ovueHdrmt5OqWuKRgL6ibWS8tRe11s6L8N5ocHwX8
2KXbUab+l8/4OVkLZuxrhjvUhpmeNqb/vLJyVVo7+3G3vSSa3xvHwg5NUS0H7gXV
M4SU/UnTXc9Cfy4nskhM
=ADO9
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

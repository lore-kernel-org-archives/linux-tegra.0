From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 22:15:41 +0200
Message-ID: <20200403201541.GC282587@ulmo>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
 <a982d831-fc59-f705-8f8a-9370b897adb8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a982d831-fc59-f705-8f8a-9370b897adb8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 07:33:24PM +0300, Dmitry Osipenko wrote:
> 01.04.2020 01:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra186_timer_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct tegra186_timer *tegra;
> > +	int err;
> > +
> > +	tegra =3D devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
> > +	if (!tegra)
> > +		return -ENOMEM;
> > +
> > +	tegra->soc =3D of_device_get_match_data(dev);
> > +	dev_set_drvdata(dev, tegra);
> > +	tegra->dev =3D dev;
> > +
> > +	tegra->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(tegra->regs))
> > +		return PTR_ERR(tegra->regs);
> > +
> > +	err =3D platform_get_irq(pdev, 0);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get interrupt #0: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	tegra->irq =3D err;
> > +
> > +	err =3D devm_request_irq(dev, tegra->irq, tegra186_timer_irq,
> > +			       IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > +			       "tegra186-timer", tegra);
>=20
> Looks like there is no need to store tegra->irq in the struct
> tegra186_timer.

After moving devm_request_irq() to a later point in ->probe() we now
have to store it somewhere because err is being reused. But I can store
it in a local variable instead.

Thierry

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6HmW0ACgkQ3SOs138+
s6Go3Q/+OPtu0XdhKbM8c43FPsGnTxNWpedF00lGCxN2A+W+ngo9DIZtSVwS+jVI
lIAUzXH/ZNvfziaNfnQZSFeBnKigiY9/PSGliXT502ysfc8zk5wZ93ESYEbwwrd7
l38dIDqzx3A7Y7eJpAyacC7RvBRHEh9e6bXw+qJ5+MKgZYwdqQQv4dTjqNqaYq+u
7cyD3MpIqKgurGxhzhOImsEZK/i3YLNn95tNTTdsiaqtckrK+cDSNVk414ecreoW
JsrXGYmPc3vE5YkuVeeB1wCxLArnv80/u4PYrhzhNom7eENl7zMhVs2US1B1pivF
iPEp5Z/7DKUUiGCcZppSuK5FyIoL5JEdUIbNOAxZAsEA6yG+9GACwV/5qEv4RRbG
ydZLh2pdN3rEzrxfOdYYuqq/EfUypcCUg4BhxMpF3WQtqR/B4z5Yc2dpuMkEEaNq
9iwQ+e/fp3g1oxsQy03fZ9HVDaq89lQzH5szH44n0qgDDg/D17OzL73NeU2JxnrK
QtORluwWHwbSgY+oxQs5VYotlvsaRoXXotHGg9ZNlQdHPvMwpXNSW5ejhFErAjHM
2ZDZqOYK2mxAVR6RJ9Mmulaqg2sTJS1J6ae8ujHuQP9MzE4qUDAdT+y3VCNbCcH1
WUl6WmuFxEGQrVWC5IRocmXhpzLuct9RGh45cqrSSqYhvx163TE=
=mTDH
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--

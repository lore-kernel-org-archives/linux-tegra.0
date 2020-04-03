From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 22:14:35 +0200
Message-ID: <20200403201435.GB282587@ulmo>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
 <edf08b18-ad19-7191-020d-a06d57747c45@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <edf08b18-ad19-7191-020d-a06d57747c45-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 07:24:55PM +0300, Dmitry Osipenko wrote:
> 01.04.2020 01:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
> > +				    unsigned int timeout)
> > +{
> > +	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
> > +
> > +	tegra186_wdt_disable(wdt);
> > +	wdt->base.timeout =3D timeout;
> > +	tegra186_wdt_enable(wdt);
>=20
> Why changing timeout enables the watchdog?

We have to disable and enable to make it accept the new settings and to
restart the counter. But you're right, we should only do that when the
WDT is actually active, so I've conditionalized the disable/enable calls
on watchdog_active().

>=20
> > +	return 0;
> > +}
> > +
> > +static const struct watchdog_ops tegra186_wdt_ops =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.start =3D tegra186_wdt_start,
> > +	.stop =3D tegra186_wdt_stop,
> > +	.ping =3D tegra186_wdt_ping,
> > +	.set_timeout =3D tegra186_wdt_set_timeout,
> > +};
>=20
> ...
> > +static int __maybe_unused tegra186_timer_suspend(struct device *dev)
> > +{
> > +	struct tegra186_timer *tegra =3D dev_get_drvdata(dev);
> > +
> > +	if (tegra->wdt)
> > +		tegra186_wdt_disable(tegra->wdt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused tegra186_timer_resume(struct device *dev)
> > +{
> > +	struct tegra186_timer *tegra =3D dev_get_drvdata(dev);
> > +
> > +	if (tegra->wdt)
> > +		tegra186_wdt_enable(tegra->wdt);
>=20
> What if watchdog is in a stopped state? Why it's enabled unconditionally?

Same as above.

Thierry

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6HmSoACgkQ3SOs138+
s6FW4RAAivFPt4wmSN/9pbmq+eZfLIcpD3oZlXbL4yI4SqecIYtiMjv406AYhe7r
yFWTJLJHguzw721iKzgMLjC8wKocFxXv5o98PIW/+TQbNHTtYdOyI9ecHgVU009s
M9u/5nIgdDvHr1eotPo3ROJB+rkud4x4ocXpdbMiJOGemaBZcvkeg1OXX5L5tLoM
8HTkYDPxe1nTnyQZkrlIESN+Eo2HxUge/7lCs99fmoERJmyziqpc2Z3wuKMJ6ZLz
s6/AniQ4Bz5qHsLH7/H2Hwgvyqnx8uBQT2lwEajqDORaBr4LY4NXo2Gvu+mUmCGn
BkLssHrRI5+eSBF7vAJVqbd+xDZUIlFp1CYl7Sm0ujBPdy8JdJMtfyIwhtgPlSqW
PfDade0gHQVHIkDJm6DO9SC/4ox1hE9Q0T+XcFetXnLMa5Rvu2RPFgdp74P62dLF
kOEVQWh537QPMq0RHe8IIwo82WrXjasaOeg0Mp6mJ57AAYLSfRmVuGYvKecL9yyk
OMDLxevX8oMKVcoEOZTBVE+g3Z5JdSnmQAcC48H44TDYYdrVnM4sCZGD93PPtsZS
R6rOBDdfDq9GAEUPSN1i1dE7pROecd31g/DgTUiU8UGo4kO/NKEeCrQ0w82f5U7R
cqO7VJVCj0pX0VQ4vV59/vR6pj9TUt4IMZ+uQD5DT3FuU+zmH+c=
=2meF
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

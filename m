From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 17:39:49 +0200
Message-ID: <20200414153846.GN3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <14cfd13a-5fde-f167-64cb-a61cba119a97@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0fZkDq/H4AmqaB8D"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <14cfd13a-5fde-f167-64cb-a61cba119a97-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0fZkDq/H4AmqaB8D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:26:23PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int tegra210_emc_table_device_init(struct reserved_mem *rmem,
> > +					  struct device *dev)
> > +{
> > +	struct tegra210_emc *emc =3D dev_get_drvdata(dev);
> > +	unsigned int i;
> > +	void *table;
> > +
> > +	table =3D memremap(rmem->base, rmem->size, MEMREMAP_WB);
> > +	if (!table) {
> > +		dev_err(dev, "failed to map EMC table\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	emc->timings =3D (struct tegra210_emc_timing *)table;
>=20
> No need to cast the void.

Indeed, looks like I can get rid of that table variable altogether.

Thierry

--0fZkDq/H4AmqaB8D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2UUACgkQ3SOs138+
s6GmYg//WAKvtCE2533jvRwm9viWE7gIwO4+5Qc+gBHrtYeZc/s1jQZHipianYQu
9kbwBh6XO6UgeyzaaK7f3qQQrgjyy3zqy8dyINW6FgQBBJndPDTzN45cZ3rjVpoZ
FMnnJotiX/1tl+YBkMbr84hh1ZYDucuH/BktLynsv/nowYs/0gAMExQs/wShOWz6
E7+D4uddL567mbQLN/ssHJb5HysMLNwAIMg2IeFa+kUXq9gC/x3PbstpRCeY9L7r
/gCwTnWGRscH9JT6Cyw1qoSr00CX5jZSXP2A4dY81YsGyfmNqJsrkd+X+oemqV27
oBTJFFZvTY2ShEP8AXKyP91BUzSsECpY7iPYM0ji7a1l4avpFBJCrKOHkhHZukUZ
+VAWpr2XnQgeJtHMz6dAfFJQyPw+KPEhdRFMgqcZYUzYFiVe0b3W4D1WIkl50oJL
rFLUGhnjgpGhnNezkWwHN1NYbgf+GsCe2gkk99IKLHAnfj/ds2sUNOZD7qIVrTAm
6Otq32sdI3T2T0BeRkY/ysF5ChkASMGjmD6xkDGFrk9Ddz94WNPa+wwrCiUnrr4e
Ceu/4HxF8ncU63g+f7N35dpfdZZpb/qWwrfFkDtEZ48tVf4fkKBs8YKyzuPliGIM
dAt7FZL3/mTm3l263IjkJuYarBBB+Ggs/hR4NB/ulB0oleeCD1A=
=MoN0
-----END PGP SIGNATURE-----

--0fZkDq/H4AmqaB8D--

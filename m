From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Fri, 29 Aug 2014 09:29:36 +0200
Message-ID: <20140829072935.GF13106@ulmo>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
 <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
 <53FFF335.1020402@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FFF335.1020402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 08:57:49AM +0530, Varka Bhadram wrote:
> On 08/28/2014 09:01 PM, Thierry Reding wrote:
> >From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >Obtains the register ranges for the legacy interrupt controller from DT
> >and provide hard-coded values as fallback.
> >
> (...)
>=20
> >+static const struct tegra_ictlr_soc tegra30_ictlr_soc =3D {
> >+	.num_ictlrs =3D 5,
> >+};
> >+
> >+static const struct of_device_id ictlr_matches[] =3D {
> >+	{ .compatible =3D "nvidia,tegra30-ictlr", .data =3D &tegra30_ictlr_soc=
 },
> >+	{ .compatible =3D "nvidia,tegra20-ictlr", .data =3D &tegra20_ictlr_soc=
 },
> >+	{ }
> >+};
> >+
> >+static const struct of_device_id gic_matches[] =3D {
> >+	{ .compatible =3D "arm,cortex-a15-gic", },
> >+	{ .compatible =3D "arm,cortex-a9-gic", },
> >+	{ }
> >+};
> >+
> >
> Missed MODULE_DEVICE_TABLE(of, ...)....?

The driver isn't useful as a module, so I don't think that's necessary.
I'm not even sure it could be loaded that late in the process. Without
it peripheral interrupts don't work properly, so loading this from the
filesystem doesn't work (unless it's in an initrd), but perhaps even
that won't work. I'm not aware of anyone actually ever trying to build
it as a module.

Thierry

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUACvfAAoJEN0jrNd/PrOhQ2YQAJS92dmZeyI8DKn5XWLB+L1p
psTihgMMRfDIdqIU7j4dM1BoqmpS28FUGAHtkfxTKwBgH/4S2KiwZlXSUPnoirVG
RL3cLZp77AjW4mm74Qcu0HUVaNgXiU+dL+M/aQ5K3+IOVqM6MB3GJZGJuqDS7AOo
nWqTgT5n6gluW5aIOt3M+29ZBnT/bkNmEx65MaPwd8x84C2tPrnE3kELfzrvTRk8
vuSO4GMP8/t+atzCbnuRMKR8pbC1GYL2ody9Y+wLY2z0XrFZVECITED9b1MiU8rk
iP4/tTTEQoVwaRGuFhEUwDz31i9pbU4bdMMCYAXiLUl0fpqJaY6jHeK+mYtJeLY3
0vAY0qT0tC/toT8ZkWIpyUEz3/nkIx+tg6O535R/kaq+AM4TUH4FMS4EuerSPTUe
UGfcrNLNLrf+ekpXppjYsfiLwpuZS6AwJewgUyEfOUK5Lc2dTurI4DRUQhcWaHsQ
vSBJe896W2MpYJFswjtIZG1PT6RaofRkhYNvoUHzwpr9x9qlCLOruoCq8DPptcgx
fmhImyYE0xcgYU8BbYVs7sB+EbSzkGgYh4efqjn3VnEr5vtLZeZfl4yEikEJWOvz
DCixJZXgCbSgcdASYdt+w2aLV2qI2y9d7XPlupck5NVL1EVHq4BAuAYBb5GRuTch
r2Iy6RstYg0+mVGdWGds
=hPpE
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

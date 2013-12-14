From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 PWM support
Date: Sat, 14 Dec 2013 13:26:28 +0100
Message-ID: <20131214122628.GC17467@mithrandir>
References: <1384790435-30269-1-git-send-email-treding@nvidia.com>
 <52AA143C.8010508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52AA143C.8010508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2013 at 12:53:32PM -0700, Stephen Warren wrote:
> On 11/18/2013 09:00 AM, Thierry Reding wrote:
> > The PWM controller on Tegra124 is the same as the one on earlier SoC
> > generations.
>=20
> I've applied this series to Tegra's for-3.14/dt branch. Given the recent
> conversion to the common reset framework and DT bindings, I needed to
> insert a couple extra lines in this patch:
>=20
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
>=20
> > +	pwm@7000a000 {
> > +		compatible =3D "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";
> > +		reg =3D <0x7000a000 0x100>;
> > +		#pwm-cells =3D <2>;
> > +		clocks =3D <&tegra_car TEGRA124_CLK_PWM>;
>=20
> Here, I inserted:
>=20
> +               resets =3D <&tegra_car 17>;
> +               reset-names =3D "pwm";
>=20
> ... which matches the same node in at least tegra114.dtsi.

Looks good. I've also successfully tested this using next-20131213 with
working backlight on Venice2.

Thierry

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSrE50AAoJEN0jrNd/PrOh5GoQAJjUjuL6A4932cyb9ly/6Vpu
wrGt7uy9mzlzbDMu9cBy2neNzizptM/YVquRrW2MXRuOu48hORwERxPS1CDVs1h2
HYRU5gTpYHvaBXkxZwxp3lu9iO3cP+kkhvh1DndjSgtnUf5A+Cba4sNourPsJztq
18q+oaUU3h3R84TJ+nj6BpJnYytPpHQrA0RmimHjb56/4vjzFfekFrw6NlDUWeHM
ldzivgOJjXbJM3wrQF68gCjsPDu9oC3wPg5lyZzea4077Idax+2ZHcFGrYswZ7kj
tQnAGH6H7f4nLNX8aPo18u2bk8premavu8KhLOF2MDr0nvA+9VJVALtyKS4zKdGE
kfAaTHL/H7DatBAO/vgG3QLwrRDwQDFbvPginYqnF+b+TO+yM2NNeeKzb1K8k0jx
b9z9yhGrm6osC7oLI0b3fa3WmUDg9DAVse/2ON/wLYEUr8c4aDksRsf7cZk8jU5H
UIOLYxZ58m3yxc9Hmq/Cm8QUR3ZBKtGJd37CYq/Zldk9po6QHNASYy2JbkEBXk7o
13rIEzTWyEchlazalFOH8OZANcm0qZAqjWSd/AAdXtP1XnuUeaIkJT4/AL8Ln6Vo
skENv0efiYx5nqkIBYJBsqG+U2WmIDPjJ6S57sawPac62IfYGmKDUC4S44Gbn2hb
qtyXg3FfS22SOYnDEfwd
=DXSL
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--

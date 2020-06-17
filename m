From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/73] ARM: tegra: Remove simple clocks bus
Date: Wed, 17 Jun 2020 16:21:05 +0200
Message-ID: <20200617142105.GD3536291@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-3-thierry.reding@gmail.com>
 <74f8be81-216b-b69b-4517-c90d5f7d578a@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74f8be81-216b-b69b-4517-c90d5f7d578a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 08:06:56PM +0100, Jon Hunter wrote:
>=20
>=20
> On 16/06/2020 14:51, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The standard way to do this is to list out the clocks at the top-level.
> > Adopt the standard way to fix validation.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra114-dalmore.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra114-roth.dts       | 15 ++++-----------
> >  arch/arm/boot/dts/tegra114-tn7.dts        | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-nyan.dtsi      | 15 ++++-----------
> >  arch/arm/boot/dts/tegra124-venice2.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-harmony.dts     | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-paz00.dts       | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-seaboard.dts    | 15 ++++-----------
> >  arch/arm/boot/dts/tegra20-trimslice.dts   | 19 ++++++-------------
> >  arch/arm/boot/dts/tegra20-ventana.dts     | 15 ++++-----------
> >  arch/arm/boot/dts/tegra30-beaver.dts      | 15 ++++-----------
> >  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 15 ++++-----------
> >  13 files changed, 54 insertions(+), 145 deletions(-)
>=20
> ...
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dt=
s/tegra20-trimslice.dts
> > index 8debd3d3c20d..5b26482a55b7 100644
> > --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> > +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> > @@ -366,30 +366,23 @@ usb-phy@c5008000 {
> >  		status =3D "okay";
> >  	};
> > =20
> > -	sdhci@c8000000 {
> > +	mmc@c8000000 {
> >  		status =3D "okay";
> >  		broken-cd;
> >  		bus-width =3D <4>;
> >  	};
> > =20
> > -	sdhci@c8000600 {
> > +	mmc@c8000600 {
> >  		status =3D "okay";
> >  		cd-gpios =3D <&gpio TEGRA_GPIO(P, 1) GPIO_ACTIVE_LOW>;
> >  		wp-gpios =3D <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
> >  		bus-width =3D <4>;
> >  	};
>=20
> I think that the above belongs in patch 13/73.

Good catch!

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJtEACgkQ3SOs138+
s6HcrxAAicsQoBWmck3fLH4YsCVXI4UjmKyIslIPaDhNvYpcReFd1VVFxJAD5JSJ
7M028pMWqTYgpFRbgLUKGiDSeWjyu3lD55fIGCOqkEPS1X6hMxMjt0uF2St4RJX6
blvW0Y7AgM8ScVyLGvTYiPU+ILofcRP7YKFAATLMfqeXuEPgx+eT0aPcayUnGxi0
1DEOsjWRmCx9NELuSDLPpIImApVPR8TMNeV0BwhuITZbRbqtBzP0UBi+P4P+M84I
sqJp94fa4wzFRjITjyPYUFxaNL/VeBz+aVVetvjN4bICANNm24vxGBsMZ/Y3+iXI
u0AMcJCGH5XXKuM1uV3NE5ear/oFzpUCoOz6DyzeuyK3NZpiDfRMZhSOtEL3EGFP
rqlWcldeqaN4pik0nUbOVIcXTUKqhW9jL1ulPJl4V9jQhQiKMcM+bRXz4BvwO4ur
bt3WxFqhJyru3eBxl6Cf4RkeKGVB417k4bXStYvBKbAJWHI1RIptE8ovK+tJ1Lxr
iFK4UqdXIUJRQdv4AHzRTIhcwcaJwjmfBshfoNvNL2W3YYP+9bDXOuEnpcADkWIc
kxZAF/SxU4DG6Lae0/uDEYAg/kSObYSQdydNoq/vrpV9DmhKjRN+0DmYNLkZfHVS
o9Mq9b4RWP+k6VznumN+an5Qd5fWN9GW+JLdl+2tO0Tw57zzxYk=
=ME3C
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--

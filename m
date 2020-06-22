From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
Date: Mon, 22 Jun 2020 17:22:09 +0200
Message-ID: <20200622152209.GA4008275@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-10-thierry.reding@gmail.com>
 <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9f56be9a-1a79-07cc-371f-f3abcd20701e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 07:21:30PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 16:51, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The instantiation of gr2d in Tegra114 is not backwards-compatible with
> > the version found on earlier chips. Remove the misleading compatible
> > string.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index a0ac9ea9ec9d..d583dfba688f 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -35,7 +35,7 @@ host1x@50000000 {
> >  		ranges =3D <0x54000000 0x54000000 0x01000000>;
> > =20
> >  		gr2d@54140000 {
> > -			compatible =3D "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
> > +			compatible =3D "nvidia,tegra114-gr2d";
> >  			reg =3D <0x54140000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks =3D <&tegra_car TEGRA114_CLK_GR2D>;
> >=20
>=20
> Could you please explain what's the difference? AFAIK, the 2D HW is
> identical on T20/30/114.

My understanding is that the IP core itself is identical. However, the
compatible string really describes the integration of the IP, which in
case of Tegra114 is slightly different in that it's part of the HEG
power partition, whereas it wasn't previously.

That means that without knowledge of the power partition we won't be
able to access the gr2d IP on Tegra114 at all and hence it isn't
backwards compatible with Tegra20.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7wzJ4ACgkQ3SOs138+
s6G7gQ/8DA0LKvoArm/z8bzEwzWzRS2C4E4lRfioD6TQSQ/+J/J4YpPm3YGMLgH9
/F6xR9x5DGsru53Idf6wyvIf0hs+1jFszKlAnMxffJUxh5V08MicRDXbnc1N7a7h
yLcyp4hWZBPtXSXI/kmd0sZZfwiPtV+I2rcjU5/sSKh2JiT6Oa0sTLxZtq8edXGi
k0yBFkgpunhzth5LSfj2WdaBS7brk8mkJszv+wLv4P0YDQZabXpbgy/7fwoitbPK
Pt8R72pfqCE+1AMh5Y4q6GATN9ZcSeu0QiVjsKCHXOIUGQXywB9DtjEp6WzqveQ6
Y01QrRuNjRr6M60Hg9ErluV5OKxCW3dF661jybZzsBpQ3rM3XY6+gOoteetT471r
0tH9SccZINqoQDa5A3Yn41g+urpbVemJhLVCkMAhZuvlU5/xbX2QRoIn/Vs6UACN
Ktda/rdbG9ie2JZ06pZrDBtNvC4JGwpibtsji6999+5YBxJIeLG4vnVu630a8pIU
D5Dtf76qR94Pz5jIE7sjJui0577Akymr3NaPWrcN3V4EQIQtc1AJtLE/BQ/49vKX
fPW+KieLW+G9psLWWGUUHqoW8vdlrBNzvzLyqmKXGKm2zTRnXBme29764PPWGcYu
45NFReGyIrAyv2yzRxfMm+se8N5DlOYrkIsSxTiKW/vQas3WOYA=
=zA7d
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

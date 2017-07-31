From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Mon, 31 Jul 2017 17:23:06 +0200
Message-ID: <20170731152306.GB27815@ulmo>
References: <20170709163614.6746-1-contact@paulk.fr>
 <1499763009.1340.11.camel@paulk.fr>
 <1499784841.1520.20.camel@toradex.com>
 <1499785555.1340.15.camel@paulk.fr>
 <1499786264.1520.22.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499786264.1520.22.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "contact@paulk.fr" <contact@paulk.fr>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "treding@nvidia.com" <treding@nvidia.com>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "swarren@nvidia.com" <swarren@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 03:17:46PM +0000, Marcel Ziswiler wrote:
> On Tue, 2017-07-11 at 18:05 +0300, Paul Kocialkowski wrote:
> > On Tue, 2017-07-11 at 14:54 +0000, Marcel Ziswiler wrote:
> > > On Tue, 2017-07-11 at 11:50 +0300, Paul Kocialkowski wrote:
> > > > On Sun, 2017-07-09 at 19:36 +0300, Paul Kocialkowski wrote:
> > > > > This registers the host1x node with the SMMU (as HC swgroup) to
> > > > > allow
> > > > > the host1x code to attach to it. It avoid failing the probe
> > > > > sequence,
> > > > > which resulted in the tegra drm driver not probing and thus
> > > > > nothing
> > > > > being displayed on-screen.
> > > >=20
> > > > Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
> > > >=20
> > > > > Signed-off-by: Paul Kocialkowski <contact-
> > > > > W9ppeneeCTY@public.gmane.org>
> > >=20
> > > Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > Tested-on: Apalis TK1, Jetson-TK1
> > >=20
> > > > > ---
> > > > > =C2=A0arch/arm/boot/dts/tegra124.dtsi | 1 +
> > > > > =C2=A01 file changed, 1 insertion(+)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/tegra124.dtsi
> > > > > b/arch/arm/boot/dts/tegra124.dtsi
> > > > > index 187a36c6d0fc..b3b89befffeb 100644
> > > > > --- a/arch/arm/boot/dts/tegra124.dtsi
> > > > > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > > > > @@ -85,6 +85,7 @@
> > > > > =C2=A0		clocks =3D <&tegra_car TEGRA124_CLK_HOST1X>;
> > > > > =C2=A0		resets =3D <&tegra_car 28>;
> > > > > =C2=A0		reset-names =3D "host1x";
> > > > > +		iommus =3D <&mc TEGRA_SWGROUP_HC>;
> > > > > =C2=A0
> > > > > =C2=A0		#address-cells =3D <2>;
> > > > > =C2=A0		#size-cells =3D <2>;
> > >=20
> > > So I take it we still will need this one moving forward, correct?
> >=20
> > Yes, this one actually enables the IOMMU while the other one handles
> > the
> > failure to attach the IOMMU without brinding the whole drm driver
> > down.
> >=20
> > So it's best to actually make use of the feature!
> >=20
> > > How about tegra30, I guess the same applies there, isn't it? Should
> > > I
> > > send a patch or are you guys doing that?
> >=20
> > I don't have any tegra hardware aside of tegra124, so that's all I
> > can
> > contribute to. I don't know if others have looked into the same type
> > of
> > issue happening on either newer or older platforms.
>=20
> OK, as we happen to still selling Apalis/Colibri T30 and me having
> Beaver as well as Cardhu available for testing I can cook something up,
> test and send it along. First tries indicate it working on 4.12 but
> somehow crashing during memory allocation on -next. We'll see.

I think we're going to need the same change on Tegra30 and Tegra114. And
Tegra132 and Tegra210 for that matter. With the gpu/host1x fix applied
things should keep working on all generations, but we need DT changes if
we want to make use of the SMMU.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/S1gACgkQ3SOs138+
s6HAmhAAjF9+95ZgE2PcMrVuHckC7fTh2fyTwZ1QmjBDvGR+aZZLjMjA4vkHPQm2
sTo/rZar/gKYWoSDT2edIKi9LW1KfqpHr1nQ4QwS3nlwx5T3bQKPveu9cXVdPNUR
2PhIs8ki77uukRGYpQUFZabtY24IRufBYM6VwVo+vis6U+insRGaWZgRuDtPwL6k
+1eosEicVCTp2ECUObwEDRGb9WTzUhaPg+Dutc84x8lNGGgJeHeLCZDsNH+qdZHA
RHPUD0vx+cmtDvaBusB7jjEPI2bEEmQU8Tr2ca9GlNkmDhIe4eYoBHkr8x3jbHpN
wOEgG7EKco7js0YU8yytOz8pxogMir1t/KQeg70jryt+alyUzlk6TRVhl8uImr8Y
qwXA2IT/39Jdaem9orS7oyw2oOKzEIcwhFn2VelcedA8WQkOi7HVgAsdwfuEvCn+
Snz8igPtu5rw/evAKBImpBiFdHBQ8CKXfbPclzND1Y61Vkfc6T0diCXTM4U3HiDd
uYTmNO+RntD/IjnJEjlI52l0+pGN0zenGP2xoXqdIvvsGTEuGm+c53y/9ytMBwze
FK/WA2LDun/r0cskuf+QCn/CkpGgwAWE115Gh/u5F5qzIMvuQt/bruojza17psyC
Y1DjM8slkI1dvr1WasPKhjRa0E37DIzWqXfaUqJgW5ez1kRIPvQ=
=BDCw
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--

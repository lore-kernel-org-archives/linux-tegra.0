From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add the GPU on Tegra194
Date: Thu, 16 Jul 2020 15:17:53 +0200
Message-ID: <20200716131753.GG535268@ulmo>
References: <20200716120138.532906-1-thierry.reding@gmail.com>
 <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3748e071-4d08-8e77-43f6-de37f5a7eb1e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Debarshi Dutta <ddutta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 01:59:33PM +0100, Jon Hunter wrote:
>=20
> On 16/07/2020 13:01, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
> > GV11B.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index 259e40469908..f559fe983ebe 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
> >  				nvidia,interface =3D <3>;
> >  			};
> >  		};
> > +
> > +		gpu@17000000 {
> > +			compatible =3D "nvidia,gv11b";
>=20
> I think we also need to add the to binding doc.

I've got a patch that converts the nvidia,gk20a.txt to the json-schema
format and then a patch on top that adds this compatible string. Since
that patch is part of a larger series that's a bit stalled, I'll add
this to the existing bindings for now.

> > +			reg =3D <0x17000000 0x10000000>,
> > +			      <0x18000000 0x10000000>;
> > +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names =3D "stall", "nonstall";
> > +			clocks =3D <&bpmp TEGRA194_CLK_GPCCLK>,
> > +				 <&bpmp TEGRA194_CLK_GPU_PWR>;
> > +			clock-names =3D "gpu", "pwr";
> > +			resets =3D <&bpmp TEGRA194_RESET_GPU>;
> > +			reset-names =3D "gpu";
> > +			status =3D "disabled";
> > +
> > +			power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> > +			interconnects =3D <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
> > +					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
> > +			interconnect-names =3D "dma-mem", "read-0-hp", "write-0",
> > +					     "read-1", "read-1-hp", "write-1",
> > +					     "read-2", "read-2-hp", "write-2",
> > +					     "read-3", "read-3-hp", "write-3";
> > +		};
> >  	};
>=20
> I also see that for gv11b we populate 'dma-coherent' and so we should
> probably add this as well.

Do we know for certain that the GPU is DMA coherent? I've only tested
this (with local patches to Nouveau) without dma-coherent, so I have not
actually verified that it works without.

I vaguely recall reading that there are different apertures for sysmem,
one for coherent sysmem and another for non-coherent sysmem. So I'm not
sure if dma-coherent here will work without additional code in the
driver to ensure that all memory is allocated from the coherent sysmem
aperture.

I'd suggest we leave this as-is for now until we're further along with
GPU support and we can properly test this. Leaving out dma-coherent
should be harmless and in the worst case unnecessarily flushes caches.

Thierry

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QU38ACgkQ3SOs138+
s6G23A/+JGq1eXi2Wl1m1cgp1KNRfwUw1v3aZF4quY2ZYcPFiF8bYE2Eq8H3dBWb
k4vo0mJyxoaLZ9IZI3QPEtFsNc5wbIAsAmHcW8u5OqSO5Z3oW1C/sLJqkX6GzVef
E9c7k2+4GXsDVCb6YC/VqvR0shnQofg7EwFhqlfvxukrqA68Wem6y4KZoOnUs2WZ
oDnKyaKU+fCiP8UexyD0bad9qGNeNvoVS3yV0Hj8Wv/XlTWpZChi3bpcyQ70n5Aj
T+qyMq7DZ/tCEwVrFfNucEeDdxiwzch/QjEU/95ttDQFZ1QaXOHWENeBfNsS26fe
BTw9mWnNJCBJhwtp4gFrf6Z8OeRMByccfAcgYSX388zQB7ZZNd4E9hGOuwQrppJx
olr/gZqcjOPnsRynHL50T3rvQ1gtXKW2c19X67EBmi7cjg6x2RO3VPusCE1jVAAd
SxyHa8D9zN+Nx0M6TCo751FBgF4/W7BNtBO00cU1nfb2mv8060nn38S7WRIAPEm9
Dr6AGybIUR5rwl25p2Gev3E8aG9KrcV9i0V7T97+scsMMYHRIV4FknnghTSb4Lq9
E0Y12VDV6W2wo3v25Ny9Br4YLO7lq60NaJD/4y07qHR7Ktw4widLkxGDDGnGKu9F
5+qORB3Lh64Zfk/R8YjnyimGnW4y0F8kNs7fOuyXb01qdZguOQU=
=heBN
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--

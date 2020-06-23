From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for
 dual ARM MMU-500 usage
Date: Tue, 23 Jun 2020 14:47:35 +0200
Message-ID: <20200623124735.GB696655@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-2-vdumpa@nvidia.com>
 <20200623102927.GD4098287@ulmo>
 <5f29c794-406a-db13-d6d0-75dcb0d0b0cc@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5f29c794-406a-db13-d6d0-75dcb0d0b0cc-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 12:16:55PM +0100, Robin Murphy wrote:
> On 2020-06-23 11:29, Thierry Reding wrote:
> [...]
> > > diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-i=
mpl.c
> > > index c75b9d957b702..52c84c30f83e4 100644
> > > --- a/drivers/iommu/arm-smmu-impl.c
> > > +++ b/drivers/iommu/arm-smmu-impl.c
> > > @@ -160,6 +160,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct=
 arm_smmu_device *smmu)
> > >   	 */
> > >   	switch (smmu->model) {
> > >   	case ARM_MMU500:
> > > +		if (of_device_is_compatible(smmu->dev->of_node,
> > > +					    "nvidia,tegra194-smmu-500"))
> > > +			return nvidia_smmu_impl_init(smmu);
> >=20
> > Should NVIDIA_TEGRA194_SMMU be a separate value for smmu->model,
> > perhaps? That way we avoid this somewhat odd check here.
>=20
> No, this is simply in the wrong place. The design here is that we pick up
> anything related to the basic SMMU IP (model) first, then make any
> platform-specific integration checks. That way a platform-specific init
> function can see the model impl set and subclass it if necessary (although
> nobody's actually done that yet). The setup for Cavium is just a short-cut
> since their model is unique to their integration, so the lines get a bit
> blurred and there's little benefit to trying to separate it out.
>=20
> In short, put this down below with the other of_device_is_compatible()
> checks.
>=20
> > >   		smmu->impl =3D &arm_mmu500_impl;
> > >   		break;
> > >   	case CAVIUM_SMMUV2:
> > > diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu=
-nvidia.c
> >=20
> > I wonder if it would be better to name this arm-smmu-tegra.c to make it
> > clearer that this is for a Tegra chip. We do have regular expressions in
> > MAINTAINERS that catch anything with "tegra" in it to make this easier.
>=20
> There was a notion that these would be grouped by vendor, but if there's a
> strong preference for all NVIDIA-SoC-related stuff to be named "Tegra" th=
en
> I'm not going to complain too much.

Maybe I was being overly cautious. I was just trying to avoid adding
something called nvidia-arm-smmu which might eventually turn out to be
ambiguous if there was ever a non-Tegra chip and the ARM SMMU
implementation was not compatible with the one instantiated on Tegra.

Note that I have no knowledge of such a chip being designed, so this may
never actually become an issue.

In either case, the compatible string already identifies this as Tegra-
specific, so we could always change the driver name later on if we have
to.

> > > new file mode 100644
> > > index 0000000000000..dafc293a45217
> > > --- /dev/null
> > > +++ b/drivers/iommu/arm-smmu-nvidia.c
> > > @@ -0,0 +1,161 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +// Nvidia ARM SMMU v2 implementation quirks
> >=20
> > s/Nvidia/NVIDIA/
> >=20
> > > +// Copyright (C) 2019 NVIDIA CORPORATION.  All rights reserved.
> >=20
> > I suppose this should now also include 2020.
> >=20
> > > +
> > > +#define pr_fmt(fmt) "nvidia-smmu: " fmt
> >=20
> > Same here. Might be worth making this "tegra-smmu: " for consistency.
>=20
> On the other hand, a log prefix that is literally the name of a completely
> unrelated driver seems more confusing to users than useful. Same for the
> function naming - the tegra_smmu_* namespace is already owned by that
> driver.

The ARM SMMU replaced the Tegra SMMU on Tegra186 and later, so both
drivers are never going to run concurrently. The only "problem" might be
that both drivers have symbols with the same prefix, but since they
don't export any of those symbols I don't see how that would become a
real issue.

But then again, the Tegra SMMU is also technically an NVIDIA SMMU, so
sticking with the current name might also be confusing.

Perhaps a good compromise would be to use a "tegra194{-,_}smmu" prefix
instead, which would make this fairly specific to just Tegra194 (and
compatible chips). That's a fairly common pattern we've been following
on Tegra, as you can for example see in drivers/gpio/gpio-tegra186.c,
drivers/dma/tegra210-adma.c, drivers/memory/tegra/tegra186-emc.c, etc.

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7x+eQACgkQ3SOs138+
s6GQ6BAAuC+O1E0XBRiRyV/lar7nlljqvp4Z3V8QPPBm+vu4HT67YEP97q3fRts8
NvEwoueGRYB+gC9rimuFcbW+2+dpWDR09UqjKefH+zLc4M8lWA4NGkMaZQYZ9ffX
pzjlT3dGL19K6Qsi3esMMps1+p2N69kuum1BORc9lKjayqcV59tc+3wPkZ3/guvn
CBgzh7ZnbFW3bkRLqnRxIfNtrEVw0jDWeI0CE7EYxSzP2pgL/h7ab8ixm19G8CG/
LqVNWlhtn8o7s+EJVoBU/PY9ZqGGcTFiMe1xFW67nb3lrJjns024Hr9//IDRPKHx
dxXIQJpAtSl8qo3Z75suNGoeLOp/yrrQsoGcY5BObJJpzAlQscNj93c373Gzc5qj
uDYK4eC2wE+st177p6nHaCn7ti8MvTd/HcNgCToAS1PBf1T5dlvriVvCixxV73Ls
+fhO00LuWH3luLh2xxx07yxvBMfVsujVn5jwFhvpraeqbQAkA6lXi0qCMJw+iVhF
2Y+bxHrFqEgnZwCAeqRLaEYBnepYZNehTPMVJjQiT00Vrx82CXGpmFc9dmQpQMdQ
RSP8RSIt3+piUgbsiGLZeQLF+SI2g7ISn46xWe13Lx2+3yKaklquH+To2YIhTUbh
bZvRfHKL6fTN6WWMFC41HQU1UPSiplf0ECIBCy3K8JHkowJRinQ=
=4bht
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Nvidia Arm SMMUv2 Implementation
Date: Fri, 22 May 2020 17:14:44 +0200
Message-ID: <20200522151444.GB2374603@ulmo>
References: <20200521233107.11968-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200521233107.11968-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 04:31:02PM -0700, Krishna Reddy wrote:
> Changes in v5:
> Rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iomm=
u.git next
>=20
> v4 - https://lkml.org/lkml/2019/10/30/1054
> v3 - https://lkml.org/lkml/2019/10/18/1601
> v2 - https://lkml.org/lkml/2019/9/2/980
> v1 - https://lkml.org/lkml/2019/8/29/1588
>=20
> Krishna Reddy (5):
>   iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
>   dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
>   iommu/arm-smmu: Add global/context fault implementation hooks

For the record: I don't think we should apply these because we don't
have a good way of testing them. We currently have three problems that
prevent us from enabling SMMU on Tegra194:

  1) If we enable SMMU support, then the DMA API will automatically try
     to use SMMU domains for allocations. This means that translations
     will happen as soon as a device's IOMMU operations are initialized
     and that is typically a long time (in kernel time at least) before
     a driver is bound and has a chance of configuring the device.

     This causes problems for non-quiesced devices like display
     controllers that the bootloader might have set up to scan out a
     boot splash.

     What we're missing here is a way to:

     a) advertise reserved memory regions for boot splash framebuffers
     b) map reserved memory regions early during SMMU setup

     Patches have been floating on the public mailing lists for b) but
     a) requires changes to the bootloader (both proprietary ones and
     U-Boot for SoCs prior to Tegra194).

  2) Even if we don't enable SMMU for a given device (by not hooking up
     the iommus property), with a default kernel configuration we get a
     bunch of faults during boot because the ARM SMMU driver faults by
     default (rather than bypass) for masters which aren't hooked up to
     the SMMU.

     We could work around that by changing the default configuration or
     overriding it on the command-line, but that's not really an option
     because it decreases security and means that Tegra194 won't work
     out-of-the-box.

  3) We don't properly describe the DMA hierarchy, which causes the DMA
     masks to be improperly set. As a bit of background: Tegra194 has a
     special address bit (bit 39) that causes some swizzling to happen
     within the memory controller. As a result, any I/O virtual address
     that has bit 39 set will cause this swizzling to happen on access.
     The DMA/IOMMU allocator always starts allocating from the top of
     the IOVA space, which means that the first couple of gigabytes of
     allocations will cause most devices to fail because of the
     undesired swizzling that occurs.

     We had an initial patch for SDHCI merged that hard-codes the DMA
     mask to DMA_BIT_MASK(39) on Tegra194 to work around that. However,
     the devices all do support addressing 40 bits and the restriction
     on bit 39 is really a property of the bus rather than a capability
     of the device. This means that we would have to work around this
     for every device driver by adding similar hacks. A better option is
     to properly describe the DMA hierarchy (using dma-ranges) because
     that will then automatically be applied as a constraint on each
     device's DMA mask.

     I have been working on patches to address this, but they are fairly
     involved because they require device tree bindings changes and so
     on.

So before we solve all of the above issues we can't really enable SMMU
on Tegra194 and hence won't be able to test it. As such we don't know if
these patches even work, nor can we validate that they continue to work.

As such, I don't think there's any use in applying these patches
upstream since they will be effectively dead code until all of the above
issues are resolved.

>   arm64: tegra: Add DT node for T194 SMMU
>   arm64: tegra: enable SMMU for SDHCI and EQOS on T194

This one is going to cause EQOS to break because of 3) above. It might
work for SDHCI because of the workaround we currently have in that
driver. However, I do have a local patch that reverts the workaround
and replaces it with the proper fix, which uses dma-ranges as mentioned
above.

That said, I have tested earlier versions of this patchset on top of my
local branch with fixes for the above and they do seem to work as
expected.

So I'll leave it up to the IOMMU maintainers whether they're willing to
merge the driver patches as is. But I want to clarify that I won't be
applying the DTS patches until we've solved all of the above issues and
therefore it should be clear that these won't be runtime tested until
then.

I expect it will take at least until v5.9-rc1 before we have all the
changes merged that would allow us to enable SMMU support.

Thierry

>  .../devicetree/bindings/iommu/arm,smmu.yaml   |   5 +
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  81 ++++++
>  drivers/iommu/Makefile                        |   2 +-
>  drivers/iommu/arm-smmu-impl.c                 |   3 +
>  drivers/iommu/arm-smmu-nvidia.c               | 261 ++++++++++++++++++
>  drivers/iommu/arm-smmu.c                      |  11 +-
>  drivers/iommu/arm-smmu.h                      |   4 +
>  8 files changed, 366 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/arm-smmu-nvidia.c
>=20
>=20
> base-commit: 365f8d504da50feaebf826d180113529c9383670
> --=20
> 2.26.2
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7H7GIACgkQ3SOs138+
s6ElqQ/+JBjV0XEuyUSw2d7Jz7F2AdG1VGitmIgCcLapsei88OHPW3BCoLB0iMpo
aIpVGYKX2fT7Rq2hkg4VeNFCSnFeA0MoNtdOcGLZ3/JYsT4SgZpBTKSL1jy4pVmY
oc+NfkmnuAumMDKIa6GNc/K6uhRtNGCxqW05ynR5Mzvp8/hdmJPm5KAlZ40PEvw3
zk6SUxQ94pPjg3dHAZqMh7C7SpTrSEQzkUV3DSQpDSi2YlLTKjnLmApKRVEpNgJj
ugFjySpPpLdTPM7vuooKLv8q34Ya7FAS91DOWzfbSwCEeL8vsuVOZ1ZMG9YZ/T+5
5uOlVWJcOjWF8hNvHop2lkO64VYFr593pkyz2rMKqteapE/xzadOHvo3ov0awjzO
B9wp/VqKJGHKWaA6BW7Z9gXnIb4oVh2Ej2vH7a6HnEzjEOWwaaTCj3iqZ1n5A7Mk
FZUNlcmqTQS+NUxDPKLbB9h5kkiw1pdHI0RJavzFH3iukRPCQ82huSsbcLTjDWMk
Q9+Kox0o3iBBJ9mCGleDL+yXIW5/44uX26fxGGLyWQ1AHyIBPMNuNJxHzknYr4TN
CurNIXwSC/ZmB1YE/RUtR6fOy3/HQf/tatUCLhDcU6z0Zr6wS7xAZfAW4MF/hcCm
a5KxqmF2MQpns0TfB+gB2trhcevp1/0S+wHa1Nx27JWRXJpHiw4=
=L2CZ
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

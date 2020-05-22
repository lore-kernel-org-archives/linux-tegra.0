From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v5 0/5] Nvidia Arm SMMUv2 Implementation
Date: Fri, 22 May 2020 18:10:23 +0000
Message-ID: <BYAPR12MB27108F134E65484613449B07B3B40@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <20200521233107.11968-1-vdumpa@nvidia.com>
 <20200522151444.GB2374603@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200522151444.GB2374603@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

>For the record: I don't think we should apply these because we don't have =
a good way of testing them. We currently have three problems that prevent u=
s from enabling SMMU on Tegra194:

Out of three issues pointed here, I see that only issue 2) is a real blocke=
r for enabling SMMU HW by default in upstream.

>That said, I have tested earlier versions of this patchset on top of my lo=
cal branch with fixes for the above and they do seem to work as expected.
>So I'll leave it up to the IOMMU maintainers whether they're willing to me=
rge the driver patches as is.
> But I want to clarify that I won't be applying the DTS patches until we'v=
e solved all of the above issues and therefore it should be clear that thes=
e won't be runtime tested until then.

SMMU driver patches as such are complete and can be used by nvidia with a l=
ocal config change(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=3Dn) to disabl=
e_bypass and
Protects the driver patches against kernel changes. This config disable opt=
ion is tested already by Nicolin Chen and me.

Robin/Will, Can you comment if smmu driver patches alone(1,2,3 out of 5 pat=
ches) can be merged without DT enable patches? Is it reasonable to merge th=
e driver patches alone?

>1) If we enable SMMU support, then the DMA API will automatically try
>     to use SMMU domains for allocations. This means that translations
>     will happen as soon as a device's IOMMU operations are initialized
>     and that is typically a long time (in kernel time at least) before
>     a driver is bound and has a chance of configuring the device.

>     This causes problems for non-quiesced devices like display
>     controllers that the bootloader might have set up to scan out a
>     boot splash.

>     What we're missing here is a way to:

>     a) advertise reserved memory regions for boot splash framebuffers
>     b) map reserved memory regions early during SMMU setup

>     Patches have been floating on the public mailing lists for b) but
>     a) requires changes to the bootloader (both proprietary ones and
>     U-Boot for SoCs prior to Tegra194).

This happens if SMMU translations is enabled for display before reserved
 Memory regions issue is fixed. This issue is not a real blocker for SMMU e=
nable.


>  2) Even if we don't enable SMMU for a given device (by not hooking up
>     the iommus property), with a default kernel configuration we get a
>     bunch of faults during boot because the ARM SMMU driver faults by
>     default (rather than bypass) for masters which aren't hooked up to
>     the SMMU.

>     We could work around that by changing the default configuration or
>     overriding it on the command-line, but that's not really an option
>     because it decreases security and means that Tegra194 won't work
>     out-of-the-box.

This is the real issue that blocks enabling SMMU.  The USF faults for devic=
es
that don't have SMMU translations enabled should be fixed or WAR'ed before
SMMU can be enabled. We should look at keeping SID as 0x7F for the devices
that can't have SMMU enabled yet. SID 0x7f bypasses SMMU externally.

>  3) We don't properly describe the DMA hierarchy, which causes the DMA
>     masks to be improperly set. As a bit of background: Tegra194 has a
>     special address bit (bit 39) that causes some swizzling to happen
>     within the memory controller. As a result, any I/O virtual address
>     that has bit 39 set will cause this swizzling to happen on access.
>     The DMA/IOMMU allocator always starts allocating from the top of
>     the IOVA space, which means that the first couple of gigabytes of
>     allocations will cause most devices to fail because of the
>     undesired swizzling that occurs.

>     We had an initial patch for SDHCI merged that hard-codes the DMA
>     mask to DMA_BIT_MASK(39) on Tegra194 to work around that. However,
>     the devices all do support addressing 40 bits and the restriction
>     on bit 39 is really a property of the bus rather than a capability
>     of the device. This means that we would have to work around this
>     for every device driver by adding similar hacks. A better option is
>     to properly describe the DMA hierarchy (using dma-ranges) because
>     that will then automatically be applied as a constraint on each
>     device's DMA mask.

>     I have been working on patches to address this, but they are fairly
>     involved because they require device tree bindings changes and so
>     on.

Dma_mask issue is again outside SMMU driver and as long as the clients with
Dma_mask issue don't have SMMU enabled, it would be fine.
SDHCI can have SMMU enabled in upstream as soon as issue 2 is taken care.

>So before we solve all of the above issues we can't really enable SMMU on =
Tegra194 and hence won't be able to test it. As such we don't know if these=
 patches even work, nor can we validate that they continue to work.
>As such, I don't think there's any use in applying these patches upstream =
since they will be effectively dead code until all of the above issues are =
resolved.
>   arm64: tegra: Add DT node for T194 SMMU
>   arm64: tegra: enable SMMU for SDHCI and EQOS on T194
>This one is going to cause EQOS to break because of 3) above. It might wor=
k for SDHCI because of the workaround we currently have in that driver. How=
ever, I do have a local patch that reverts the workaround and replaces it w=
ith the proper fix, which uses dma->ranges as mentioned above.

The DT patches can't be merged as of now. The enable patches can follow up =
later after issue 2 is fixed.

>I expect it will take at least until v5.9-rc1 before we have all the chang=
es merged that would allow us to enable SMMU support.

Thierry

>  .../devicetree/bindings/iommu/arm,smmu.yaml   |   5 +
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  81 ++++++
>  drivers/iommu/Makefile                        |   2 +-
>  drivers/iommu/arm-smmu-impl.c                 |   3 +
>  drivers/iommu/arm-smmu-nvidia.c               | 261 ++++++++++++++++++
>  drivers/iommu/arm-smmu.c                      |  11 +-
>  drivers/iommu/arm-smmu.h                      |   4 +
>  8 files changed, 366 insertions(+), 3 deletions(-)  create mode=20
> 100644 drivers/iommu/arm-smmu-nvidia.c
>=20
>=20
> base-commit: 365f8d504da50feaebf826d180113529c9383670
> --
> 2.26.2
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

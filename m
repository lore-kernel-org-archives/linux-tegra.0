From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Tue, 25 Jun 2013 18:36:28 +0200
Message-ID: <20130625.193628.2143557800560690024.hdoyu@nvidia.com>
References: <20130624163340.GB26084@e102568-lin.cambridge.arm.com><CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg@mail.gmail.com><51C9AF96.3040107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51C9AF96.3040107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Tue, 25 Jun 2013 16:56:22 +0200:

> >> How this problem is supposed to be solved in the kernel ?
> >>
> >> 1- drivers that are to be up and running at early_initcall time must not
> >>    rely on the device/driver model (but then they cannot use any API that
> >>    requires a struct device to function (eg regmap))
> >> 2- the driver should allocate a platform device at early initcall from
> >>    a DT compatible node. Do not know how to deal with platform device
> >>    duplication though, since of_platform_populate() will create another
> >>    platform device when the node is parsed
> > 
> > While I've resisted it in the past, I would be okay with adding struct
> > device pointer in the device_node structure. I've resisted because I
> > don't want drivers following the device_node pointer and making an
> > assumption about what /kind/ of device is pointed to by it. However,
> > this is an important use case and it makes it feasible to use an early
> > platform device with of_platform_populate.
> 
> Hiroshi (who I have CC'd here) has also been asking about this same
> issue downstream. The issue for us is that we need to initialize an SMMU
> driver before any devices that are translated by the SMMU. One option is
> to force the register/probe of the SMMU driver explicitly, early in the
> machine's .init_machine() callback, before of_platform_populate(), to
> ensure the ordering. Then, we run into the same duplicate device issue,
> and the change Grant mentions above would help solve this.

Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
to avoid duplicated device registration.

From f4d88b8521c278b41b72028d326c03cfd2e90af8 Mon Sep 17 00:00:00 2001
From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Fri, 14 Jun 2013 15:22:02 +0300
Subject: [PATCH 1/1] ARM: tegra: Populate AHB/IOMMU earlier than others

Populate AHB/IOMMU earlier than others. IOMMU depends on AHB. IOMMU
needs to be instanciated earlier than others so that IOMMU can
register other platform devices as IOMMU'able. Once IOMMU is
populated, IOMMU/AHB nodes are detached to prevent another
registeration.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig |  1 +
 arch/arm/mach-tegra/tegra.c | 24 ++++++++++++++++++++++++
 drivers/iommu/tegra-smmu.c  |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index ef3a8da..79905fe 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -15,6 +15,7 @@ config ARCH_TEGRA
 	select SOC_BUS
 	select SPARSE_IRQ
 	select USE_OF
+	select OF_DYNAMIC
 	help
 	  This enables support for NVIDIA Tegra based systems.
 
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 0d1e412..0c494b5 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -80,6 +80,28 @@ static struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 	{}
 };
 
+static void tegra_of_platform_populate_iommu(void)
+{
+	int i;
+	struct platform_device *pdev;
+	const char * const dname[] = {"ahb", "iommu", };
+
+	for (i = 0; i < ARRAY_SIZE(dname); i++) {
+		struct device_node *np;
+		char path[NAME_MAX];
+
+		snprintf(path, sizeof(path), "/%s", dname[i]);
+		np  = of_find_node_by_path(path);
+		if (!np)
+			break;
+
+		pdev = of_platform_device_create(np, NULL, NULL);
+		of_node_put(np);
+		if (!pdev)
+			break;
+	}
+}
+
 static void __init tegra_dt_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
@@ -107,6 +129,8 @@ static void __init tegra_dt_init(void)
 
 	parent = soc_device_to_device(soc_dev);
 
+	tegra_of_platform_populate_iommu();
+
 	/*
 	 * Finished with the static registrations now; fill in the missing
 	 * devices
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f6f120e..6c9de3f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1238,6 +1238,9 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 	smmu_debugfs_create(smmu);
 	smmu_handle = smmu;
 	bus_set_iommu(&platform_bus_type, &smmu_iommu_ops);
+
+	of_detach_node(dev->of_node);
+	of_detach_node(smmu->ahb);
 	return 0;
 }
 
-- 
1.8.1.5

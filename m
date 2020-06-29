From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
Date: Sun, 28 Jun 2020 19:28:36 -0700
Message-ID: <20200629022838.29628-2-vdumpa@nvidia.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629022838.29628-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra194 SoC uses two ARM MMU-500s together to interleave
IOVA accesses across them.
Add NVIDIA implementation for dual ARM MMU-500s and add new compatible
string for Tegra194 SoC SMMU topology.

Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 MAINTAINERS                     |   2 +
 drivers/iommu/Makefile          |   2 +-
 drivers/iommu/arm-smmu-impl.c   |   3 +
 drivers/iommu/arm-smmu-nvidia.c | 195 ++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.h        |   1 +
 5 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b5ffd646c6b9..64c37dbdd4426 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16808,8 +16808,10 @@ F:	drivers/i2c/busses/i2c-tegra.c
=20
 TEGRA IOMMU DRIVERS
 M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+R:	Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
+F:	drivers/iommu/arm-smmu-nvidia.c
 F:	drivers/iommu/tegra*
=20
 TEGRA KBC DRIVER
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 342190196dfb0..2b8203db73ec3 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_AMD_IOMMU) +=3D amd/iommu.o amd/init.o amd/q=
uirks.o
 obj-$(CONFIG_AMD_IOMMU_DEBUGFS) +=3D amd/debugfs.o
 obj-$(CONFIG_AMD_IOMMU_V2) +=3D amd/iommu_v2.o
 obj-$(CONFIG_ARM_SMMU) +=3D arm_smmu.o
-arm_smmu-objs +=3D arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
+arm_smmu-objs +=3D arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-q=
com.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D arm-smmu-v3.o
 obj-$(CONFIG_DMAR_TABLE) +=3D intel/dmar.o
 obj-$(CONFIG_INTEL_IOMMU) +=3D intel/iommu.o intel/pasid.o
diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index c75b9d957b702..70f7318017617 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -171,6 +171,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_s=
mmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl =3D &calxeda_impl;
=20
+	if (of_device_is_compatible(smmu->dev->of_node, "nvidia,tegra194-smmu"))
+		return nvidia_smmu_impl_init(smmu);
+
 	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
 	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidi=
a.c
new file mode 100644
index 0000000000000..b73c483fa3376
--- /dev/null
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// NVIDIA ARM SMMU v2 implementation quirks
+// Copyright (C) 2019-2020 NVIDIA CORPORATION.  All rights reserved.
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "arm-smmu.h"
+
+/*
+ * Tegra194 has three ARM MMU-500 Instances.
+ * Two of them are used together for interleaved IOVA accesses and
+ * used by non-isochronous HW devices for SMMU translations.
+ * Third one is used for SMMU translations from isochronous HW devices.
+ * It is possible to use this implementation to program either
+ * all three or two of the instances identically as desired through
+ * DT node.
+ *
+ * Programming all the three instances identically comes with redundant TL=
B
+ * invalidations as all three never need to be TLB invalidated for a HW de=
vice.
+ *
+ * When Linux kernel supports multiple SMMU devices, the SMMU device used =
for
+ * isochornous HW devices should be added as a separate ARM MMU-500 device
+ * in DT and be programmed independently for efficient TLB invalidates.
+ */
+#define MAX_SMMU_INSTANCES 3
+
+#define TLB_LOOP_TIMEOUT_IN_US		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
+
+struct nvidia_smmu {
+	struct arm_smmu_device	smmu;
+	unsigned int		num_inst;
+	void __iomem		*bases[MAX_SMMU_INSTANCES];
+};
+
+static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *s=
mmu)
+{
+	return container_of(smmu, struct nvidia_smmu, smmu);
+}
+
+static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
+			       unsigned int inst, int page)
+{
+	struct nvidia_smmu *nvidia_smmu =3D to_nvidia_smmu(smmu);
+
+	if (!nvidia_smmu->bases[0])
+		nvidia_smmu->bases[0] =3D smmu->base;
+
+	return nvidia_smmu->bases[inst] + (page << smmu->pgshift);
+}
+
+static u32 nvidia_smmu_read_reg(struct arm_smmu_device *smmu,
+			      int page, int offset)
+{
+	void __iomem *reg =3D nvidia_smmu_page(smmu, 0, page) + offset;
+
+	return readl_relaxed(reg);
+}
+
+static void nvidia_smmu_write_reg(struct arm_smmu_device *smmu,
+			    int page, int offset, u32 val)
+{
+	unsigned int i;
+	struct nvidia_smmu *nvidia_smmu =3D to_nvidia_smmu(smmu);
+
+	for (i =3D 0; i < nvidia_smmu->num_inst; i++) {
+		void __iomem *reg =3D nvidia_smmu_page(smmu, i, page) + offset;
+
+		writel_relaxed(val, reg);
+	}
+}
+
+static u64 nvidia_smmu_read_reg64(struct arm_smmu_device *smmu,
+				int page, int offset)
+{
+	void __iomem *reg =3D nvidia_smmu_page(smmu, 0, page) + offset;
+
+	return readq_relaxed(reg);
+}
+
+static void nvidia_smmu_write_reg64(struct arm_smmu_device *smmu,
+				  int page, int offset, u64 val)
+{
+	unsigned int i;
+	struct nvidia_smmu *nvidia_smmu =3D to_nvidia_smmu(smmu);
+
+	for (i =3D 0; i < nvidia_smmu->num_inst; i++) {
+		void __iomem *reg =3D nvidia_smmu_page(smmu, i, page) + offset;
+
+		writeq_relaxed(val, reg);
+	}
+}
+
+static void nvidia_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
+			   int sync, int status)
+{
+	unsigned int delay;
+
+	arm_smmu_writel(smmu, page, sync, 0);
+
+	for (delay =3D 1; delay < TLB_LOOP_TIMEOUT_IN_US; delay *=3D 2) {
+		unsigned int spin_cnt;
+
+		for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			u32 val =3D 0;
+			unsigned int i;
+			struct nvidia_smmu *nvidia_smmu =3D to_nvidia_smmu(smmu);
+
+			for (i =3D 0; i < nvidia_smmu->num_inst; i++) {
+				void __iomem *reg =3D
+					nvidia_smmu_page(smmu, i, page) + status;
+
+				val |=3D readl_relaxed(reg);
+			}
+
+			if (!(val & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
+				return;
+
+			cpu_relax();
+		}
+
+		udelay(delay);
+	}
+
+	dev_err_ratelimited(smmu->dev,
+			    "TLB sync timed out -- SMMU may be deadlocked\n");
+}
+
+static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < to_nvidia_smmu(smmu)->num_inst; i++) {
+		u32 val;
+		void __iomem *reg =3D nvidia_smmu_page(smmu, i, ARM_SMMU_GR0) +
+				    ARM_SMMU_GR0_sGFSR;
+
+		/* clear global FSR */
+		val =3D readl_relaxed(reg);
+		writel_relaxed(val, reg);
+	}
+
+	return 0;
+}
+
+static const struct arm_smmu_impl nvidia_smmu_impl =3D {
+	.read_reg =3D nvidia_smmu_read_reg,
+	.write_reg =3D nvidia_smmu_write_reg,
+	.read_reg64 =3D nvidia_smmu_read_reg64,
+	.write_reg64 =3D nvidia_smmu_write_reg64,
+	.reset =3D nvidia_smmu_reset,
+	.tlb_sync =3D nvidia_smmu_tlb_sync,
+};
+
+struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
)
+{
+	unsigned int i;
+	struct nvidia_smmu *nvidia_smmu;
+	struct platform_device *pdev =3D to_platform_device(smmu->dev);
+
+	nvidia_smmu =3D devm_kzalloc(smmu->dev, sizeof(*nvidia_smmu), GFP_KERNEL)=
;
+	if (!nvidia_smmu)
+		return ERR_PTR(-ENOMEM);
+
+	nvidia_smmu->smmu =3D *smmu;
+	/* Instance 0 is ioremapped by arm-smmu.c after this function returns */
+	nvidia_smmu->num_inst =3D 1;
+
+	for (i =3D 1; i < MAX_SMMU_INSTANCES; i++) {
+		struct resource *res;
+
+		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
+			break;
+
+		nvidia_smmu->bases[i] =3D devm_ioremap_resource(smmu->dev, res);
+		if (IS_ERR(nvidia_smmu->bases[i]))
+			return ERR_CAST(nvidia_smmu->bases[i]);
+
+		nvidia_smmu->num_inst++;
+	}
+
+	nvidia_smmu->smmu.impl =3D &nvidia_smmu_impl;
+	/* Free the arm_smmu_device struct allocated in arm-smmu.c.
+	 * Once this function returns, arm-smmu.c would use arm_smmu_device
+	 * allocated as part of nvidia_smmu struct.
+	 */
+	devm_kfree(smmu->dev, smmu);
+
+	return &nvidia_smmu->smmu;
+}
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d172c024be618..8cf1511ed9874 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -450,6 +450,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_devi=
ce *smmu, int page,
 	arm_smmu_writeq((s), ARM_SMMU_CB((s), (n)), (o), (v))
=20
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
=20
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
--=20
2.26.2

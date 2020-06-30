From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault implementation hooks
Date: Mon, 29 Jun 2020 17:10:51 -0700
Message-ID: <20200630001051.12350-4-vdumpa@nvidia.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200630001051.12350-1-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, bbiswas@nvidia.com, mperttunen@nvidia.com, nicolinc@nvidia.com, bhuntsman@nvidia.com, nicoleotsuka@gmail.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add global/context fault hooks to allow NVIDIA SMMU implementation
handle faults across multiple SMMUs.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 98 +++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c        | 17 +++++-
 drivers/iommu/arm-smmu.h        |  3 +
 3 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidi=
a.c
index 1124f0ac1823a..c9423b4199c65 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -147,6 +147,102 @@ static int nvidia_smmu_reset(struct arm_smmu_device *=
smmu)
 	return 0;
 }
=20
+static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct arm_smmu_domain, domain);
+}
+
+static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
+					       struct arm_smmu_device *smmu,
+					       int inst)
+{
+	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
+	void __iomem *gr0_base =3D nvidia_smmu_page(smmu, inst, 0);
+
+	gfsr =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
+	if (!gfsr)
+		return IRQ_NONE;
+
+	gfsynr0 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
+	gfsynr1 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
+	gfsynr2 =3D readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
+
+	dev_err_ratelimited(smmu->dev,
+		"Unexpected global fault, this could be serious\n");
+	dev_err_ratelimited(smmu->dev,
+		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
+		gfsr, gfsynr0, gfsynr1, gfsynr2);
+
+	writel_relaxed(gfsr, gr0_base + ARM_SMMU_GR0_sGFSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
+{
+	int inst;
+	irqreturn_t irq_ret =3D IRQ_NONE;
+	struct arm_smmu_device *smmu =3D dev;
+	struct nvidia_smmu *nvidia_smmu =3D to_nvidia_smmu(smmu);
+
+	for (inst =3D 0; inst < nvidia_smmu->num_inst; inst++) {
+		irq_ret =3D nvidia_smmu_global_fault_inst(irq, smmu, inst);
+		if (irq_ret =3D=3D IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	return irq_ret;
+}
+
+static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
+					    struct arm_smmu_device *smmu,
+					    int idx, int inst)
+{
+	u32 fsr, fsynr, cbfrsynra;
+	unsigned long iova;
+	void __iomem *gr1_base =3D nvidia_smmu_page(smmu, inst, 1);
+	void __iomem *cb_base =3D nvidia_smmu_page(smmu, inst, smmu->numpage + id=
x);
+
+	fsr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
+	if (!(fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr =3D readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
+	iova =3D readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
+	cbfrsynra =3D readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	dev_err_ratelimited(smmu->dev,
+	"Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x, cbfrs=
ynra=3D0x%x, cb=3D%d\n",
+			    fsr, iova, fsynr, cbfrsynra, idx);
+
+	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
+{
+	int inst, idx;
+	irqreturn_t irq_ret =3D IRQ_NONE;
+	struct iommu_domain *domain =3D dev;
+	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
+		/*
+		 * Interrupt line shared between all context faults.
+		 * Check for faults across all contexts.
+		 */
+		for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
+			irq_ret =3D nvidia_smmu_context_fault_bank(irq, smmu,
+								 idx, inst);
+
+			if (irq_ret =3D=3D IRQ_HANDLED)
+				return irq_ret;
+		}
+	}
+
+	return irq_ret;
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl =3D {
 	.read_reg =3D nvidia_smmu_read_reg,
 	.write_reg =3D nvidia_smmu_write_reg,
@@ -154,6 +250,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl =3D =
{
 	.write_reg64 =3D nvidia_smmu_write_reg64,
 	.reset =3D nvidia_smmu_reset,
 	.tlb_sync =3D nvidia_smmu_tlb_sync,
+	.global_fault =3D nvidia_smmu_global_fault,
+	.context_fault =3D nvidia_smmu_context_fault,
 };
=20
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu=
)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705b..3bb0aba15a356 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_do=
main *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
+	irqreturn_t (*context_fault)(int irq, void *dev);
=20
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -835,7 +836,13 @@ static int arm_smmu_init_domain_context(struct iommu_d=
omain *domain,
 	 * handler seeing a half-initialised domain state.
 	 */
 	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
-	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
+
+	if (smmu->impl && smmu->impl->context_fault)
+		context_fault =3D smmu->impl->context_fault;
+	else
+		context_fault =3D arm_smmu_context_fault;
+
+	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
 			       IRQF_SHARED, "arm-smmu-context-fault", domain);
 	if (ret < 0) {
 		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
@@ -2107,6 +2114,7 @@ static int arm_smmu_device_probe(struct platform_devi=
ce *pdev)
 	struct arm_smmu_device *smmu;
 	struct device *dev =3D &pdev->dev;
 	int num_irqs, i, err;
+	irqreturn_t (*global_fault)(int irq, void *dev);
=20
 	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2193,9 +2201,14 @@ static int arm_smmu_device_probe(struct platform_dev=
ice *pdev)
 		smmu->num_context_irqs =3D smmu->num_context_banks;
 	}
=20
+	if (smmu->impl && smmu->impl->global_fault)
+		global_fault =3D smmu->impl->global_fault;
+	else
+		global_fault =3D arm_smmu_global_fault;
+
 	for (i =3D 0; i < smmu->num_global_irqs; ++i) {
 		err =3D devm_request_irq(smmu->dev, smmu->irqs[i],
-				       arm_smmu_global_fault,
+				       global_fault,
 				       IRQF_SHARED,
 				       "arm-smmu global fault",
 				       smmu);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 8cf1511ed9874..8b330076ff2af 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -18,6 +18,7 @@
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/irqreturn.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -387,6 +388,8 @@ struct arm_smmu_impl {
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
+	irqreturn_t (*global_fault)(int irq, void *dev);
+	irqreturn_t (*context_fault)(int irq, void *dev);
 };
=20
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, in=
t n)
--=20
2.26.2

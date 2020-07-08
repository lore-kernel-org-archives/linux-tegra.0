From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v10 1/5] iommu/arm-smmu: move TLB timeout and spin count macros
Date: Tue, 7 Jul 2020 22:00:13 -0700
Message-ID: <20200708050017.31563-2-vdumpa@nvidia.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708050017.31563-1-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, bbiswas@nvidia.com, mperttunen@nvidia.com, nicolinc@nvidia.com, bhuntsman@nvidia.com, nicoleotsuka@gmail.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Move TLB timeout and spin count macros to header file to
allow using the same from vendor specific implementations.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu.c | 3 ---
 drivers/iommu/arm-smmu.h | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705..d2054178df35 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -52,9 +52,6 @@
  */
 #define QCOM_DUMMY_VAL -1
=20
-#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
-#define TLB_SPIN_COUNT			10
-
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
=20
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d172c024be61..c7d0122a7c6c 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -236,6 +236,8 @@ enum arm_smmu_cbar_type {
 /* Maximum number of context banks per SMMU */
 #define ARM_SMMU_MAX_CBS		128
=20
+#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
=20
 /* Shared driver definitions */
 enum arm_smmu_arch_version {
--=20
2.26.2

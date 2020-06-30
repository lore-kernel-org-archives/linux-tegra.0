From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v9 1/4] iommu/arm-smmu: move TLB timeout and spin count macros
Date: Tue, 30 Jun 2020 16:57:49 -0700
Message-ID: <20200630235752.8737-2-vdumpa@nvidia.com>
References: <20200630235752.8737-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200630235752.8737-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Move TLB timeout and spin count macros to header file to
allow using the same values from vendor specific implementations.

Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/arm-smmu.c | 3 ---
 drivers/iommu/arm-smmu.h | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705b..d2054178df357 100644
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
index d172c024be618..c7d0122a7c6ca 100644
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

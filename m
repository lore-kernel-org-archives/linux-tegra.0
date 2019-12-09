From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/2] iommu: arm-smmu: Extract arm_smmu_of_parse()
Date: Mon,  9 Dec 2019 16:07:47 +0100
Message-ID: <20191209150748.2471814-2-thierry.reding@gmail.com>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20191209150748.2471814-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function will be subsequently used to extract stream ID information
early, before a struct device is available.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/arm-smmu.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index d1aef07bb784..5c5cf942077e 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1545,18 +1545,28 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 	return ret;
 }
 
-static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
+static u32 arm_smmu_of_parse(struct device_node *np, const u32 *args,
+			     unsigned int count)
 {
-	u32 mask, fwid = 0;
+	u32 fwid = 0, mask;
 
-	if (args->args_count > 0)
-		fwid |= FIELD_PREP(SMR_ID, args->args[0]);
+	if (count > 0)
+		fwid |= FIELD_PREP(SMR_ID, args[0]);
 
-	if (args->args_count > 1)
-		fwid |= FIELD_PREP(SMR_MASK, args->args[1]);
-	else if (!of_property_read_u32(args->np, "stream-match-mask", &mask))
+	if (count > 1)
+		fwid |= FIELD_PREP(SMR_MASK, args[1]);
+	else if (!of_property_read_u32(np, "stream-match-mask", &mask))
 		fwid |= FIELD_PREP(SMR_MASK, mask);
 
+	return fwid;
+}
+
+static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
+	u32 fwid;
+
+	fwid = arm_smmu_of_parse(args->np, args->args, args->args_count);
+
 	return iommu_fwspec_add_ids(dev, &fwid, 1);
 }
 
-- 
2.23.0

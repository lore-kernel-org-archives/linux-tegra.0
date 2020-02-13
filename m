From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 2/5] of: Use memory-controllers property for DMA parent
Date: Thu, 13 Feb 2020 17:39:56 +0100
Message-ID: <20200213163959.819733-3-thierry.reding@gmail.com>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200213163959.819733-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Olof Johansson <olof@lixom.net>, linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Prefer the memory-controllers property to determine the DMA parent of a
device over the interconnects property, which can be ambiguous since it
can be used to describe multiple paths to system memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/address.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e8a39c3ec4d4..ae841bd36bb0 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -697,17 +697,24 @@ static struct device_node *__of_get_dma_parent(const struct device_node *np)
 	struct of_phandle_args args;
 	int ret, index;
 
-	index = of_property_match_string(np, "interconnect-names", "dma-mem");
-	if (index < 0)
-		return of_get_parent(np);
+	ret = of_parse_phandle_with_args(np, "memory-controllers",
+					 "#memory-controller-cells",
+					 0, &args);
+	if (!ret) {
+		return of_node_get(args.np);
+	}
 
-	ret = of_parse_phandle_with_args(np, "interconnects",
-					 "#interconnect-cells",
-					 index, &args);
-	if (ret < 0)
-		return of_get_parent(np);
+	index = of_property_match_string(np, "interconnect-names", "dma-mem");
+	if (index >= 0) {
+		ret = of_parse_phandle_with_args(np, "interconnects",
+						 "#interconnect-cells",
+						 index, &args);
+		if (!ret) {
+			return of_node_get(args.np);
+		}
+	}
 
-	return of_node_get(args.np);
+	return of_get_parent(np);
 }
 
 static struct device_node *of_get_next_dma_parent(struct device_node *np)
-- 
2.24.1

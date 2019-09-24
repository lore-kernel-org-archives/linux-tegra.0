From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 01/11] of: address: clean-up unused variable in of_dma_get_range()
Date: Tue, 24 Sep 2019 20:12:32 +0200
Message-ID: <20190924181244.7159-2-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: mbrugger@suse.com, robin.murphy@arm.com, f.fainelli@gmail.com, james.quinlan@broadcom.com, wahrenst@gmx.net, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
List-Id: linux-tegra@vger.kernel.org

'len' in of_dma_get_range() is used to check the 'dma-ranges' property
length. After the fact, some calculations are run on the variable to be
then left unused.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

 drivers/of/address.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 978427a9d5e6..0f898756199d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -922,7 +922,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 {
 	struct device_node *node = of_node_get(np);
 	const __be32 *ranges = NULL;
-	int len, naddr, nsize, pna;
+	int naddr, nsize, pna;
 	int ret = 0;
 	u64 dmaaddr;
 
@@ -931,6 +931,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 
 	while (1) {
 		struct device_node *parent;
+		int len;
 
 		naddr = of_n_addr_cells(node);
 		nsize = of_n_size_cells(node);
@@ -962,8 +963,6 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		goto out;
 	}
 
-	len /= sizeof(u32);
-
 	pna = of_n_addr_cells(node);
 
 	/* dma-ranges format:
-- 
2.23.0

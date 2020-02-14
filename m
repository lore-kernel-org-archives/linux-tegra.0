From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] dmaengine: tegra210-adma: Replace zero-length array with
 flexible-array member
Date: Fri, 14 Feb 2020 11:16:57 -0600
Message-ID: <20200214171657.GA25663@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-tegra@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/dma/tegra210-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 6e1268552f74..c4ce5dfb149b 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -164,7 +164,7 @@ struct tegra_adma {
 	const struct tegra_adma_chip_data *cdata;
 
 	/* Last member of the structure */
-	struct tegra_adma_chan		channels[0];
+	struct tegra_adma_chan		channels[];
 };
 
 static inline void tdma_write(struct tegra_adma *tdma, u32 reg, u32 val)
-- 
2.25.0

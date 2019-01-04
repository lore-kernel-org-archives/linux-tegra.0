From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH] soc/tegra: fuse: fix typo in tegra210_init_speedo_data
Date: Fri, 4 Jan 2019 15:16:46 +0800
Message-ID: <20190104071646.15828-3-josephl@nvidia.com>
References: <20190104071646.15828-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104071646.15828-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix typo when reading SoC speedo value from fuse SoC speedo register.

Reported-by: Mark Zhang <markz@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 5373f4c16b54..8ed35d9851f8 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -131,7 +131,7 @@ void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	soc_speedo[0] = tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
 	soc_speedo[1] = tegra_fuse_read_early(FUSE_SOC_SPEEDO_1);
-	soc_speedo[2] = tegra_fuse_read_early(FUSE_CPU_SPEEDO_2);
+	soc_speedo[2] = tegra_fuse_read_early(FUSE_SOC_SPEEDO_2);
 
 	cpu_iddq = tegra_fuse_read_early(FUSE_CPU_IDDQ) * 4;
 	soc_iddq = tegra_fuse_read_early(FUSE_SOC_IDDQ) * 4;
-- 
2.20.1

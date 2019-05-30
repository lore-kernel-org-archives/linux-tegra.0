From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: media: tegra-vde: Remove variable
Date: Fri, 31 May 2019 02:14:39 +0530
Message-ID: <20190530204439.29830-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: digetx@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathan@nvidia.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Remove unnecessary variable iram_tables and use its value directly.
Issue found using Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index a5020dbf6eef..3205973218e4 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -273,12 +273,10 @@ static void tegra_vde_setup_iram_entry(struct tegra_vde *vde,
 				       unsigned int row,
 				       u32 value1, u32 value2)
 {
-	u32 *iram_tables = vde->iram;
-
 	trace_vde_setup_iram_entry(table, row, value1, value2);
 
-	iram_tables[0x20 * table + row * 2] = value1;
-	iram_tables[0x20 * table + row * 2 + 1] = value2;
+	vde->iram[0x20 * table + row * 2] = value1;
+	vde->iram[0x20 * table + row * 2 + 1] = value2;
 }
 
 static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
-- 
2.19.1

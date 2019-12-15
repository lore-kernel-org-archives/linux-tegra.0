From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/3] media: staging: tegra-vde: Sort headers alphabetically
Date: Sun, 15 Dec 2019 21:07:51 +0300
Message-ID: <20191215180752.5408-3-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Keep the alphabetical order for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/staging/media/tegra-vde/vde.h
index d369f1466bc7..5561291b0c88 100644
--- a/drivers/staging/media/tegra-vde/vde.h
+++ b/drivers/staging/media/tegra-vde/vde.h
@@ -10,11 +10,11 @@
 
 #include <linux/completion.h>
 #include <linux/dma-direction.h>
+#include <linux/iova.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
-#include <linux/iova.h>
 
 struct clk;
 struct dma_buf;
-- 
2.24.0

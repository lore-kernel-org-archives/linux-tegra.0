From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Fri, 25 Jan 2019 11:15:54 +0100
Message-ID: <20190125101554.5947-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When requesting a reset control for exclusive use that's already in use,
an -EBUSY error code is returned. Users can react accordingly when they
receive that error code, so there is no need to loudly complain.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/reset/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 9582efb70025..6b452f010b66 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -416,7 +416,7 @@ static struct reset_control *__reset_control_get_internal(
 
 	list_for_each_entry(rstc, &rcdev->reset_control_head, list) {
 		if (rstc->id == index) {
-			if (WARN_ON(!rstc->shared || !shared))
+			if (!rstc->shared || !shared)
 				return ERR_PTR(-EBUSY);
 
 			kref_get(&rstc->refcnt);
-- 
2.19.1

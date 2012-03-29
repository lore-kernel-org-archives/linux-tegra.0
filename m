From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] Input: tegra-kbc - restore missing pdata allocation
Date: Thu, 29 Mar 2012 09:52:59 -0600
Message-ID: <1333036379-14088-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

Commit 023cea0 "Input: tegra-kbc - allow skipping setting up some of
GPIO pins" accidentally removed this code. Add it back.

Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
 drivers/input/keyboard/tegra-kbc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 21c42f8..fe4ac95 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -630,6 +630,7 @@ tegra_kbc_dt_parse_pdata(struct platform_device *pdev)
 	if (!np)
 		return NULL;
 
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return NULL;
 
-- 
1.7.0.4


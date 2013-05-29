From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCHv2 5/7] gpu: host1x: Fix memory access in syncpt request
Date: Wed, 29 May 2013 13:26:06 +0300
Message-ID: <1369823168-5396-6-git-send-email-amerilainen@nvidia.com>
References: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: tbergstrom@nvidia.com, linux-kernel@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch fixes a bad memory access in syncpoint request code. If
no syncpoints were available, the code accessed unreserved memory
area causing unexpected behaviour.

Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 4b49345..2b03f1b 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -40,7 +40,8 @@ static struct host1x_syncpt *_host1x_syncpt_alloc(struct host1x *host,
 
 	for (i = 0; i < host->info->nb_pts && sp->name; i++, sp++)
 		;
-	if (sp->dev)
+
+	if (i >= host->info->nb_pts)
 		return NULL;
 
 	name = kasprintf(GFP_KERNEL, "%02d-%s", sp->id,
-- 
1.8.1.5

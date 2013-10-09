From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCH 3/3] drm/tegra: Reserve base for gr2d
Date: Wed, 9 Oct 2013 14:54:10 +0300
Message-ID: <1381319650-9799-4-git-send-email-amerilainen@nvidia.com>
References: <1381319650-9799-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381319650-9799-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tbergstrom@nvidia.com, thierry.reding@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, amerilainen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

This patch modifies the gr2d to reserve a base for syncpoint.

Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/gpu/host1x/drm/gr2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 27ffcf1..f0c3fd5 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -285,7 +285,7 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!gr2d->channel)
 		return -ENOMEM;
 
-	*syncpts = host1x_syncpt_request(dev, false);
+	*syncpts = host1x_syncpt_request_based(dev, false);
 	if (!(*syncpts)) {
 		host1x_channel_free(gr2d->channel);
 		return -ENOMEM;
-- 
1.8.1.5

From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Fri, 17 May 2013 14:49:44 +0300
Message-ID: <1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@avionic-design.de, airlied@linux.ie, linux-tegra@vger.kernel.org
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Syncpoint wait returned EAGAIN if it was called with zero timeout.
This patch modifies the function to return ETIMEDOUT.

Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 4b49345..5bf5366 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -187,7 +187,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	}
 
 	if (!timeout) {
-		err = -EAGAIN;
+		err = -ETIMEDOUT;
 		goto done;
 	}
 
@@ -205,7 +205,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	if (err)
 		goto done;
 
-	err = -EAGAIN;
+	err = -ETIMEDOUT;
 	/* Caller-specified timeout may be impractically low */
 	if (timeout < 0)
 		timeout = LONG_MAX;
-- 
1.7.9.5

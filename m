From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] gpu/host1x: Remove excess parameter in host1x_subdev_add docs
Date: Thu, 20 Jul 2017 13:47:42 -0400
Message-ID: <20170720174746.29100-4-seanpaul@chromium.org>
References: <20170720174746.29100-1-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720174746.29100-1-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fixes the following warning when building docs:
../drivers/gpu/host1x/bus.c:50: warning: Excess function parameter 'driver' description in 'host1x_subdev_add'

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index a048e3ac523d..7ece0e9058c6 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -41,7 +41,6 @@ struct host1x_subdev {
 /**
  * host1x_subdev_add() - add a new subdevice with an associated device node
  * @device: host1x device to add the subdevice to
- * @driver: host1x driver
  * @np: device node
  */
 static int host1x_subdev_add(struct host1x_device *device,
-- 
2.14.0.rc0.284.gd933b75aa4-goog

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/12] drm/nouveau/timer: skip calibration on GK20A
Date: Mon, 24 Mar 2014 17:42:24 +0900
Message-ID: <1395650554-31925-3-git-send-email-acourbot@nvidia.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

GK20A's timer is directly attached to the system timer and cannot be
calibrated. Skip the calibration phase on that chip since the
corresponding registers do not exist.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
index c0bdd10358d7..822fe0d8a871 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
@@ -185,6 +185,10 @@ nv04_timer_init(struct nouveau_object *object)
 	if (ret)
 		return ret;
 
+	/* gk20a does not have the calibration registers */
+	if (device->chipset == 0xea)
+		goto skip_clk_init;
+
 	/* aim for 31.25MHz, which gives us nanosecond timestamps */
 	d = 1000000 / 32;
 
@@ -235,20 +239,23 @@ nv04_timer_init(struct nouveau_object *object)
 		d >>= 1;
 	}
 
-	/* restore the time before suspend */
-	lo = priv->suspend_time;
-	hi = (priv->suspend_time >> 32);
-
 	nv_debug(priv, "input frequency : %dHz\n", f);
 	nv_debug(priv, "input multiplier: %d\n", m);
 	nv_debug(priv, "numerator       : 0x%08x\n", n);
 	nv_debug(priv, "denominator     : 0x%08x\n", d);
 	nv_debug(priv, "timer frequency : %dHz\n", (f * m) * d / n);
-	nv_debug(priv, "time low        : 0x%08x\n", lo);
-	nv_debug(priv, "time high       : 0x%08x\n", hi);
 
 	nv_wr32(priv, NV04_PTIMER_NUMERATOR, n);
 	nv_wr32(priv, NV04_PTIMER_DENOMINATOR, d);
+
+skip_clk_init:
+	/* restore the time before suspend */
+	lo = priv->suspend_time;
+	hi = (priv->suspend_time >> 32);
+
+	nv_debug(priv, "time low        : 0x%08x\n", lo);
+	nv_debug(priv, "time high       : 0x%08x\n", hi);
+
 	nv_wr32(priv, NV04_PTIMER_INTR_0, 0xffffffff);
 	nv_wr32(priv, NV04_PTIMER_INTR_EN_0, 0x00000000);
 	nv_wr32(priv, NV04_PTIMER_TIME_1, hi);
-- 
1.9.1

From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC 10/16] drm/nouveau/timer: skip calibration on GK20A
Date: Sat,  1 Feb 2014 12:16:52 +0900
Message-ID: <1391224618-3794-11-git-send-email-acourbot@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: gnurou@gmail.com, Eric Brower <ebrower@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Terje Bergstrom <tbergstrom@nvidia.com>, Ken Adams <KAdams@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

GK20A's timer is directly attached to the system timer and cannot be
calibrated. Skip the calibration phase on that chip since the
corresponding registers do not exist.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
index c0bdd10..822fe0d 100644
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
1.8.5.3

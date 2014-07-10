From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau/clk: make therm and volt devices
	optional
Date: Thu, 10 Jul 2014 16:34:35 +0900
Message-ID: <1404977677-22248-2-git-send-email-acourbot@nvidia.com>
References: <1404977677-22248-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404977677-22248-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Allow the clock subsystem to operate even if voltage and thermal devices
are not set for the device (for people with watercooling! ;))

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/clock/base.c | 36 +++++++++++++++---------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/base.c b/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
index 22351f594d2a..63b314a033cb 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/base.c
@@ -90,16 +90,20 @@ nouveau_cstate_prog(struct nouveau_clock *clk,
 		cstate = &pstate->base;
 	}
 
-	ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, +1);
-	if (ret && ret != -ENODEV) {
-		nv_error(clk, "failed to raise fan speed: %d\n", ret);
-		return ret;
+	if (ptherm) {
+		ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, +1);
+		if (ret && ret != -ENODEV) {
+			nv_error(clk, "failed to raise fan speed: %d\n", ret);
+			return ret;
+		}
 	}
 
-	ret = volt->set_id(volt, cstate->voltage, +1);
-	if (ret && ret != -ENODEV) {
-		nv_error(clk, "failed to raise voltage: %d\n", ret);
-		return ret;
+	if (volt) {
+		ret = volt->set_id(volt, cstate->voltage, +1);
+		if (ret && ret != -ENODEV) {
+			nv_error(clk, "failed to raise voltage: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = clk->calc(clk, cstate);
@@ -108,13 +112,17 @@ nouveau_cstate_prog(struct nouveau_clock *clk,
 		clk->tidy(clk);
 	}
 
-	ret = volt->set_id(volt, cstate->voltage, -1);
-	if (ret && ret != -ENODEV)
-		nv_error(clk, "failed to lower voltage: %d\n", ret);
+	if (volt) {
+		ret = volt->set_id(volt, cstate->voltage, -1);
+		if (ret && ret != -ENODEV)
+			nv_error(clk, "failed to lower voltage: %d\n", ret);
+	}
 
-	ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, -1);
-	if (ret && ret != -ENODEV)
-		nv_error(clk, "failed to lower fan speed: %d\n", ret);
+	if (ptherm) {
+		ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, -1);
+		if (ret && ret != -ENODEV)
+			nv_error(clk, "failed to lower fan speed: %d\n", ret);
+	}
 
 	return 0;
 }
-- 
2.0.0

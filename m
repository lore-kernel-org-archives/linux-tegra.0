From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/12] drm/nouveau/graph: enable when using
	external firmware
Date: Mon, 24 Mar 2014 17:42:30 +0900
Message-ID: <1395650554-31925-9-git-send-email-acourbot@nvidia.com>
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

nvc0_graph_ctor() would only let the graphics engine be enabled if its
oclass has a proper microcode linked to it. This prevents GR from being
enabled at all on chips that rely exclusively on external firmware, even
though such a use-case is valid.

Relax the conditions enabling the GR engine to also include the case
where an external firmware has also been loaded.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index 6ef8bf181b2d..f997a18f5760 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -1133,10 +1133,14 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvc0_graph_oclass *oclass = (void *)bclass;
 	struct nouveau_device *device = nv_device(parent);
 	struct nvc0_graph_priv *priv;
+	bool use_fw;
 	int ret, i;
 
+	use_fw = nouveau_boolopt(device->cfgopt, "NvGrUseFW", false);
+
 	ret = nouveau_graph_create(parent, engine, bclass,
-				   (oclass->fecs.ucode != NULL), &priv);
+				   (oclass->fecs.ucode != NULL) || use_fw,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
@@ -1146,7 +1150,7 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	priv->base.units = nvc0_graph_units;
 
-	if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", false)) {
+	if (use_fw) {
 		nv_info(priv, "using external firmware\n");
 		if (nvc0_graph_ctor_fw(priv, "fuc409c", &priv->fuc409c) ||
 		    nvc0_graph_ctor_fw(priv, "fuc409d", &priv->fuc409d) ||
-- 
1.9.1

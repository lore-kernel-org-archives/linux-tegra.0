From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 07/10] drm/nouveau/graph: pad firmware code at
	load time
Date: Mon, 21 Apr 2014 15:02:19 +0900
Message-ID: <1398060142-7937-8-git-send-email-acourbot@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1398060142-7937-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Pad the microcode to a multiple of 0x40 bytes, otherwise firmware will
fail to run from non-prepadded firmware files.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index e5b75f189988..013475c62986 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -894,6 +894,10 @@ nvc0_graph_init_fw(struct nvc0_graph_priv *priv, u32 fuc_base,
 			nv_wr32(priv, fuc_base + 0x0188, i >> 6);
 		nv_wr32(priv, fuc_base + 0x0184, code->data[i]);
 	}
+
+	/* code must be padded to 0x40 bytes */
+	for (; i & 0x3f; i++)
+		nv_wr32(priv, fuc_base + 0x0184, 0);
 }
 
 static void
-- 
1.9.2

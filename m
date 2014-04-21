From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 10/10] drm/nouveau: support for probing GK20A
Date: Mon, 21 Apr 2014 15:02:22 +0900
Message-ID: <1398060142-7937-11-git-send-email-acourbot@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: gnurou@gmail.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Set the correct subdev/engine classes when GK20A (0xea) is probed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/engine/device/nve0.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
index 9784cbf8a9d2..b014928286d6 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
@@ -156,6 +156,26 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_PERFMON] = &nve0_perfmon_oclass;
 		break;
+	case 0xea:
+		device->cname = "GK20A";
+		device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
+		device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
+		device->oclass[NVDEV_SUBDEV_TIMER  ] = &gk20a_timer_oclass;
+		device->oclass[NVDEV_SUBDEV_FB     ] =  gk20a_fb_oclass;
+		device->oclass[NVDEV_SUBDEV_IBUS   ] = &gk20a_ibus_oclass;
+		device->oclass[NVDEV_SUBDEV_INSTMEM] = nv50_instmem_oclass;
+		device->oclass[NVDEV_SUBDEV_VM     ] = &nvc0_vmmgr_oclass;
+		device->oclass[NVDEV_SUBDEV_BAR    ] = &nvc0_bar_oclass;
+		device->oclass[NVDEV_ENGINE_DMAOBJ ] = &nvd0_dmaeng_oclass;
+		device->oclass[NVDEV_ENGINE_FIFO   ] =  gk20a_fifo_oclass;
+		/* TODO will need an implementation for this at some point... */
+#if 0
+		device->oclass[NVDEV_ENGINE_SW     ] =  nvc0_software_oclass;
+#endif
+		device->oclass[NVDEV_ENGINE_GR     ] =  gk20a_graph_oclass;
+		device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
+		device->oclass[NVDEV_ENGINE_PERFMON] = &nve0_perfmon_oclass;
+		break;
 	case 0xf0:
 		device->cname = "GK110";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-- 
1.9.2

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] nvc0: add GK20A 3D class
Date: Tue, 27 May 2014 16:03:01 +0900
Message-ID: <1401174182-2182-2-git-send-email-acourbot@nvidia.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401166783-24086-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GK20A is mostly compatible with GK104, but features a new 3D
class. Add it to the relevant header and use it when GK20A is
detected.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv_object.xml.h    | 1 +
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nv_object.xml.h b/src/gallium/drivers/nouveau/nv_object.xml.h
index 4c93e6564838..0a0e187dc028 100644
--- a/src/gallium/drivers/nouveau/nv_object.xml.h
+++ b/src/gallium/drivers/nouveau/nv_object.xml.h
@@ -190,6 +190,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define NVC8_3D_CLASS						0x00009297
 #define NVE4_3D_CLASS						0x0000a097
 #define NVF0_3D_CLASS						0x0000a197
+#define NVEA_3D_CLASS						0x0000a297
 #define GM107_3D_CLASS						0x0000b097
 #define NV50_2D_CLASS						0x0000502d
 #define NVC0_2D_CLASS						0x0000902d
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index cccfe2bba23d..95e5ef81cd79 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -702,7 +702,14 @@ nvc0_screen_create(struct nouveau_device *dev)
       obj_class = NVF0_3D_CLASS;
       break;
    case 0xe0:
-      obj_class = NVE4_3D_CLASS;
+      switch (dev->chipset) {
+      case 0xea:
+         obj_class = NVEA_3D_CLASS;
+         break;
+      default:
+         obj_class = NVE4_3D_CLASS;
+         break;
+      }
       break;
    case 0xd0:
       obj_class = NVC8_3D_CLASS;
-- 
1.9.3

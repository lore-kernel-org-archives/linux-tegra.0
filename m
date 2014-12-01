From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [V2 PATCH nouveau 2/3] volt: allow non-bios voltage scaling
Date: Mon, 1 Dec 2014 21:43:28 +0800
Message-ID: <1417441409-4733-2-git-send-email-vinceh@nvidia.com>
References: <1417441409-4733-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417441409-4733-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

v2: add Alex's Acked-by

 nvkm/subdev/volt/base.c | 67 ++++++++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/nvkm/subdev/volt/base.c b/nvkm/subdev/volt/base.c
index 32794a999106..26ccd8df193f 100644
--- a/nvkm/subdev/volt/base.c
+++ b/nvkm/subdev/volt/base.c
@@ -101,6 +101,41 @@ nouveau_volt_set_id(struct nouveau_volt *volt, u8 id, int condition)
 	return ret;
 }
 
+static void nouveau_volt_parse_bios(struct nouveau_bios *bios,
+		struct nouveau_volt *volt)
+{
+	struct nvbios_volt_entry ivid;
+	struct nvbios_volt info;
+	u8  ver, hdr, cnt, len;
+	u16 data;
+	int i;
+
+	data = nvbios_volt_parse(bios, &ver, &hdr, &cnt, &len, &info);
+	if (data && info.vidmask && info.base && info.step) {
+		for (i = 0; i < info.vidmask + 1; i++) {
+			if (info.base >= info.min &&
+				info.base <= info.max) {
+				volt->vid[volt->vid_nr].uv = info.base;
+				volt->vid[volt->vid_nr].vid = i;
+				volt->vid_nr++;
+			}
+			info.base += info.step;
+		}
+		volt->vid_mask = info.vidmask;
+	} else if (data && info.vidmask) {
+		for (i = 0; i < cnt; i++) {
+			data = nvbios_volt_entry_parse(bios, i, &ver, &hdr,
+							  &ivid);
+			if (data) {
+				volt->vid[volt->vid_nr].uv = ivid.voltage;
+				volt->vid[volt->vid_nr].vid = ivid.vid;
+				volt->vid_nr++;
+			}
+		}
+		volt->vid_mask = info.vidmask;
+	}
+}
+
 int
 _nouveau_volt_init(struct nouveau_object *object)
 {
@@ -136,10 +171,6 @@ nouveau_volt_create_(struct nouveau_object *parent,
 {
 	struct nouveau_bios *bios = nouveau_bios(parent);
 	struct nouveau_volt *volt;
-	struct nvbios_volt_entry ivid;
-	struct nvbios_volt info;
-	u8  ver, hdr, cnt, len;
-	u16 data;
 	int ret, i;
 
 	ret = nouveau_subdev_create_(parent, engine, oclass, 0, "VOLT",
@@ -152,31 +183,9 @@ nouveau_volt_create_(struct nouveau_object *parent,
 	volt->set = nouveau_volt_set;
 	volt->set_id = nouveau_volt_set_id;
 
-	data = nvbios_volt_parse(bios, &ver, &hdr, &cnt, &len, &info);
-	if (data && info.vidmask && info.base && info.step) {
-		for (i = 0; i < info.vidmask + 1; i++) {
-			if (info.base >= info.min &&
-			    info.base <= info.max) {
-				volt->vid[volt->vid_nr].uv = info.base;
-				volt->vid[volt->vid_nr].vid = i;
-				volt->vid_nr++;
-			}
-			info.base += info.step;
-		}
-		volt->vid_mask = info.vidmask;
-	} else
-	if (data && info.vidmask) {
-		for (i = 0; i < cnt; i++) {
-			data = nvbios_volt_entry_parse(bios, i, &ver, &hdr,
-						      &ivid);
-			if (data) {
-				volt->vid[volt->vid_nr].uv = ivid.voltage;
-				volt->vid[volt->vid_nr].vid = ivid.vid;
-				volt->vid_nr++;
-			}
-		}
-		volt->vid_mask = info.vidmask;
-	}
+	/* Assuming the non-bios device should build the voltage table later */
+	if (bios)
+		nouveau_volt_parse_bios(bios, volt);
 
 	if (volt->vid_nr) {
 		for (i = 0; i < volt->vid_nr; i++) {
-- 
1.9.1

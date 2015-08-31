From: =?UTF-8?q?Konsta=20H=C3=B6ltt=C3=A4?= <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 2/5] don't verify route == owner in nvkm ioctl
Date: Mon, 31 Aug 2015 14:38:32 +0300
Message-ID: <1441021115-28537-3-git-send-email-kholtta@nvidia.com>
References: <1441021115-28537-1-git-send-email-kholtta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441021115-28537-1-git-send-email-kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

HACK: Some objects we need to access from userspace are first created i=
n
kernel, and thus owned by the kernel layer. Bypass a safety mechanism
that allows to only use userspace-created objects and create new ones
(for userspace). The objects do not span across processes but are still
owned by the same client.

This will need to be fixed in some proper way. Will these objects be
managed by userspace at some point?

Signed-off-by: Konsta H=C3=B6ltt=C3=A4 <kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/core/ioctl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drm/nouveau/nvkm/core/ioctl.c b/drm/nouveau/nvkm/core/ioct=
l.c
index 4459ff5..30164c7 100644
--- a/drm/nouveau/nvkm/core/ioctl.c
+++ b/drm/nouveau/nvkm/core/ioctl.c
@@ -474,18 +474,23 @@ nvkm_ioctl_path(struct nvkm_handle *parent, u32 t=
ype, u32 nr, u32 *path,
 			nv_debug(object, "handle 0x%08x not found\n", path[nr]);
 			return -ENOENT;
 		}
 		nvkm_namedb_put(handle);
 		parent =3D handle;
 	}
=20
 	if (owner !=3D NVIF_IOCTL_V0_OWNER_ANY && owner !=3D handle->route) {
-		nv_ioctl(object, "object route !=3D owner\n");
-		return -EACCES;
+		nv_ioctl(object, "object route !=3D owner: route =3D 0x%x, owner =3D=
 0x$%x\n",
+				handle->route, owner);
+		/* return -EACCES; */
+
+		/* continue anyway - this is required for calling objects
+		 * created in the kernel for this client from userspace, such
+		 * as the channel fifo object or its gr obj. */
 	}
 	*route =3D handle->route;
 	*token =3D handle->token;
=20
 	if (ret =3D -EINVAL, type < ARRAY_SIZE(nvkm_ioctl_v0)) {
 		if (nvkm_ioctl_v0[type].version =3D=3D 0)
 			ret =3D nvkm_ioctl_v0[type].func(handle, data, size);
 	}
--=20
2.1.4

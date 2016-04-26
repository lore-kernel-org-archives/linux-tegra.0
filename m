From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 27/35] drm/tegra: Use lockless gem BO free callback
Date: Tue, 26 Apr 2016 19:30:00 +0200
Message-ID: <1461691808-12414-28-git-send-email-daniel.vetter@ffwll.ch>
References: <1461691808-12414-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461691808-12414-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

No dev->struct_mutex anywhere to be seen.

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstr=C3=B6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 2be88eb0cb83..3d9241482f81 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -932,7 +932,7 @@ static struct drm_driver tegra_drm_driver =3D {
 	.debugfs_cleanup =3D tegra_debugfs_cleanup,
 #endif
=20
-	.gem_free_object =3D tegra_bo_free_object,
+	.gem_free_object_unlocked =3D tegra_bo_free_object,
 	.gem_vm_ops =3D &tegra_bo_vm_ops,
=20
 	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
--=20
2.8.1

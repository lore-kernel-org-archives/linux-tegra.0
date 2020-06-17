From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Thu, 18 Jun 2020 02:40:37 +0300
Message-ID: <20200617234040.1094-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series adds 180° display plane rotation support to the NVIDIA Tegra
DRM driver which is needed for devices that have display panel physically
mounted upside-down, like Nexus 7 tablet device for example [1]. Since
DRM panel rotation is a new thing for a userspace, currently only
Opentegra Xorg driver [2] and a recent Weston [3] have support for the
rotated display panels, but this is more than good enough for the starter.

[1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327.18589-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
[2] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Changelog:

v3: - Factored out the panel patches into standalone series [4] because
      this series doesn't have hard dependency on the panel patches and it
      should be nicer to review and apply the properly grouped patches.

    - The DRM_MODE_ROTATE_180 now isn't passed to drm_rotation_simplify(),
      like it was suggested by Ville Syrjälä in the comment to v2.

    - Added clarifying comment for the tegra_fb_is_bottom_up() in the code.

[4] https://lore.kernel.org/lkml/20200617231842.30671-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/T/#t

Dmitry Osipenko (3):
  drm/tegra: plane: Rename bottom_up to reflect_y
  drm/tegra: plane: Support horizontal reflection
  drm/tegra: plane: Support 180° rotation

 drivers/gpu/drm/tegra/dc.c    | 46 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/tegra/dc.h    |  3 ++-
 drivers/gpu/drm/tegra/plane.c |  3 ++-
 drivers/gpu/drm/tegra/plane.h |  3 ++-
 4 files changed, 43 insertions(+), 12 deletions(-)

-- 
2.26.0

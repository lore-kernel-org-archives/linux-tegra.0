From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Sun, 14 Jun 2020 23:01:16 +0300
Message-ID: <20200614200121.14147-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series adds 180° display plane rotation support to the NVIDIA Tegra
DRM driver which is needed for devices that have display panel physically
mounted upside-down, like Nexus 7 tablet device for example [1]. Since
DRM panel rotation is a new thing for a userspace, currently only
Opentegra Xorg driver handles the rotated display panel [2], but this
is good enough for the start.

Note that later on it should be possible to implement a transparent 180°
display rotation for Tegra DRM driver which will remove the need to have
a bleeding edge userspace that knows how to rotate display planes and I'm
slowly working on it. For the starter we can go with the minimal rotation
support, so it's not a blocker.

This series is based on the work that was made by Derek Basehore for the
Mediatek driver [3], his patch is included into this patchset. I added
my tested-by tag to the Derek's patch.

Please review and apply, thanks in advance!

[1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327.18589-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
[2] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
[3] https://lkml.org/lkml/2020/3/5/1119

Changelog:

v2: - Dropped "drm/panel: Set display info in panel attach" patch, which
      turned out to be obsolete now.

    - Renamed the cover-latter, hopefully this will fix the bouncing emails.

Derek Basehore (1):
  drm/panel: Add helper for reading DT rotation

Dmitry Osipenko (4):
  drm/panel: lvds: Set up panel orientation
  drm/tegra: plane: Rename bottom_up to reflect_y
  drm/tegra: plane: Support horizontal reflection mode
  drm/tegra: plane: Support 180° rotation

 drivers/gpu/drm/drm_panel.c        | 43 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c |  8 ++++++
 drivers/gpu/drm/tegra/dc.c         | 43 ++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/dc.h         |  3 ++-
 drivers/gpu/drm/tegra/plane.c      |  3 ++-
 drivers/gpu/drm/tegra/plane.h      |  3 ++-
 include/drm/drm_panel.h            |  9 +++++++
 7 files changed, 101 insertions(+), 11 deletions(-)

-- 
2.26.0

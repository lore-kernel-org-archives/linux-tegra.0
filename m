From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v11 0/4] Panel rotation patches
Date: Thu, 18 Jun 2020 02:18:38 +0300
Message-ID: <20200617231842.30671-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This series adds support for display panel's DT rotation property. It's a
continuation of the work that was initially started by Derek Basehore for
the panel driver that is used by some Mediatek device [1]. I picked up the
Derek's patches and added my t-b and r-b tags to them, I also added
rotation support to the panel-lvds and panel-simple drivers.

We need the rotation support for the Nexus 7 tablet device which is pending
to become supported by upstream kernel, the device has display panel mounted
upside-down and it uses panel-lvds [2].

[1] https://lkml.org/lkml/2020/3/5/1119
[2] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327.18589-3-digetx@gmail.com/

Changelog:

v11: - This series is factored out from this patchset [3] because these
       patches do not have hard dependency on the Tegra DRM patches and
       it should be nicer to review and apply the properly grouped patches.

     - Initially [3] only touched the panel-lvds driver and Emil Velikov
       suggested that it will be better to support more panels in the review
       comments to [3]. So I included the Derek's patch for the BOE panel
       and added rotation support to the panel-simple driver. I tested that
       panel-lvds and panel-simple work properly with the rotated panel using
       the Opentegra Xorg driver [4] and Wayland Weston [5].

     - The panel-lvds driver now prints a error message if rotation property
       fails to be parsed.

[3] https://lore.kernel.org/lkml/20200614200121.14147-1-digetx@gmail.com/
[4] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
[5] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Derek Basehore (2):
  drm/panel: Add helper for reading DT rotation
  drm/panel: Read panel orientation for BOE TV101WUM-NL6

Dmitry Osipenko (2):
  drm/panel: lvds: Read panel orientation
  drm/panel-simple: Read panel orientation

 drivers/gpu/drm/drm_panel.c                   | 43 +++++++++++++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  6 +++
 drivers/gpu/drm/panel/panel-lvds.c            | 10 +++++
 drivers/gpu/drm/panel/panel-simple.c          | 11 +++++
 include/drm/drm_panel.h                       |  9 ++++
 5 files changed, 79 insertions(+)

-- 
2.26.0

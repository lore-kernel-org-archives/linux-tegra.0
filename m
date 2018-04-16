From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/4] More DRM object properties on Tegra
Date: Mon, 16 Apr 2018 15:16:24 +0300
Message-ID: <cover.1523880381.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patchset adds new custom plane / CRTC properties that are very useful
for displaying video overlay, they will be used by Opentegra Xorg driver.
Also generic zPos property is implemented for older Tegra's.

Dmitry Osipenko (4):
  drm/tegra: plane: Implement zPos plane property for older Tegra's
  drm/tegra: dc: Rename supports_blending to legacy_blending
  drm/tegra: plane: Add custom colorkey properties for older Tegra's
  drm/tegra: plane: Add custom CSC BLOB property

 drivers/gpu/drm/tegra/dc.c    | 402 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/dc.h    |  31 ++-
 drivers/gpu/drm/tegra/plane.c | 268 ++++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  27 ++-
 include/uapi/drm/tegra_drm.h  |  11 +
 5 files changed, 623 insertions(+), 116 deletions(-)

-- 
2.17.0

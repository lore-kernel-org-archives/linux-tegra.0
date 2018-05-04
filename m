From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/3] Couple more DRM plane features for Tegra
Date: Fri,  4 May 2018 17:39:57 +0300
Message-ID: <20180504144000.8597-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This series improves DRM plane support by supporting zPos on older Tegra's
and enabling plane scaling filters (up to Tegra210).

Changelog:

v2:
	- Addressed v1 review comments.

Dmitry Osipenko (3):
  drm/tegra: dc: Enable plane scaling filters
  drm/tegra: plane: Implement zPos plane property for older Tegra's
  drm/tegra: dc: Rename supports_blending to has_legacy_blending

 drivers/gpu/drm/tegra/dc.c    | 235 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/tegra/dc.h    |   9 +-
 drivers/gpu/drm/tegra/plane.c | 193 ++++++++++++++++++++--------
 drivers/gpu/drm/tegra/plane.h |  13 +-
 4 files changed, 343 insertions(+), 107 deletions(-)

-- 
2.17.0

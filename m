From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Tegra DRM: Support memory bandwidth management for display
Date: Sun,  5 May 2019 20:37:04 +0300
Message-ID: <20190505173707.29282-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Display controllers have a need for minimum memory bandwidth in order to
maintain data-stream to output at a required rate. There is a visual
corruption once the requirement is violated and CRTC reset may be required
in order to recover. This series adds preliminary support for the memory
bandwidth management, it will become active once Memory Controller drivers
will get support for the PM memory bandwidth QoS.

Dmitry Osipenko (3):
  drm/tegra: dc: Tune up high priority request controls on Tegra20
  drm/tegra: dc: Extend debug stats with total number of events
  drm/tegra: Support PM QoS memory bandwidth management

 drivers/gpu/drm/tegra/dc.c    | 234 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h    |  13 ++
 drivers/gpu/drm/tegra/drm.c   |  18 +++
 drivers/gpu/drm/tegra/plane.c |   1 +
 drivers/gpu/drm/tegra/plane.h |   4 +-
 5 files changed, 264 insertions(+), 6 deletions(-)

-- 
2.21.0

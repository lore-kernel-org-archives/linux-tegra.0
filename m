From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/4] drm/dsi/tegra: continuous clock support
Date: Tue,  8 Jul 2014 21:32:10 +0900
Message-ID: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

This small series adds a flag that allows to specify that a DSI device supports
non-continuous clock mode, and uses it in the Tegra DSI driver to only enable
this mode on panels that support it. Until now, the Tegra DSI driver
unconditionally enabled non-continuous mode, which prevented continous-mode-only
panels from working with it.

This allows us to enable the panel embedded in NVIDIA SHIELD and which only
supports continuous mode.

Changes since v2:
- Changed the flag to enable non-continuous behavior instead of the contrary,
  to match the DSI spec more closely and highlight the fact continuous behavior
  is the default

Changes since v1:
- Removed unneeded regulator-always-on property for vdd_lcd regulator

Alexandre Courbot (4):
  drm/dsi: Flag for non-continuous clock behavior
  drm/panel: Set non-continuous clock flag on supporting panels
  drm/tegra: dsi - Handle non-continuous clock flag
  ARM: tegra: roth: add display DT node

 arch/arm/boot/dts/tegra114-roth.dts  | 22 +++++++++++++++++++---
 drivers/gpu/drm/panel/panel-simple.c |  5 +++--
 drivers/gpu/drm/tegra/dsi.c          |  3 ++-
 include/drm/drm_mipi_dsi.h           |  2 ++
 4 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.0.0

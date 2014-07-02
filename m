From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/4] drm/dsi/tegra: continuous clock support
Date: Wed,  2 Jul 2014 21:19:16 +0900
Message-ID: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

This small series adds support for DSI continuous clock as required by the
DSI specification and as needed for NVIDIA SHIELD's panel. Continuous clock
mode can be specified as the flags of a DSI device, and host drivers can check
this flag to adapt their behavior.

The flag is then added to the panel embedded in NVIDIA SHIELD, which allows
us to finally enable the panel in its device tree.

Alexandre Courbot (4):
  drm/dsi: Add flag for continuous clock behavior
  drm/tegra: dsi - Handle continuous clock flag
  drm/panel: LG LH500WX1-SD03 uses continuous clock
  ARM: tegra: roth: add display DT node

 arch/arm/boot/dts/tegra114-roth.dts  | 23 ++++++++++++++++++++---
 drivers/gpu/drm/panel/panel-simple.c |  2 +-
 drivers/gpu/drm/tegra/dsi.c          |  3 ++-
 include/drm/drm_mipi_dsi.h           |  2 ++
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.0.0

From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/3] drm/tegra: Restore licensing consistency
Date: Thu, 20 Feb 2014 16:48:09 +0100
Message-ID: <1392911292-6438-1-git-send-email-thierry.reding@gmail.com>
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
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Emil Goode <emilgoode@gmail.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The bulk of the Tegra DRM driver is GPL v2 licensed, but some of the new
subdrivers were licensed under an MIT license. This was simply oversight
on my part.

One exception to this is the public header file that will eventually be
used within libdrm. Since all the other headers in libdrm use the MIT
license, do the same for Tegra.

Since I need to respin this series anyway, I'm adding Wei Yongjun and
Emil Goode on Cc as requested by Stephen.

Wei, Emil, I'd like to have your Acked-by on this licensing change since
you modified some of the files (Wei: dsi.c, Emil: tegra_drm.h).

Changes in v2:
- use the generic MIT license header rather than one modified to include
  Tungsten Graphics

Thierry

Thierry Reding (3):
  drm/tegra: Relicense public header under MIT
  drm/tegra: Relicense under GPL v2
  drm/tegra: Use standard GPL v2 license text

 drivers/gpu/drm/tegra/dsi.c      | 20 +++-----------------
 drivers/gpu/drm/tegra/dsi.h      | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c      | 11 +++--------
 drivers/gpu/drm/tegra/gem.h      | 14 +++-----------
 drivers/gpu/drm/tegra/gr2d.c     | 14 +++-----------
 drivers/gpu/drm/tegra/mipi-phy.c | 20 +++-----------------
 drivers/gpu/drm/tegra/mipi-phy.h | 20 +++-----------------
 include/uapi/drm/tegra_drm.h     | 24 +++++++++++++++---------
 8 files changed, 36 insertions(+), 107 deletions(-)

-- 
1.8.4.2

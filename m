From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:48:35 +0100
Message-ID: <20200111004835.2412858-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1

for you to fetch changes up to 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.6-rc1

This contains a small set of mostly fixes and some minor improvements.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: sor: Mark PM functions as __maybe_unused

Thierry Reding (3):
      gpu: host1x: Rename "parent" to "host"
      drm/tegra: Do not implement runtime PM
      drm/tegra: output: Implement system suspend/resume

YueHaibing (1):
      gpu: host1x: Remove dev_err() on platform_get_irq() failure

 drivers/gpu/drm/tegra/dc.c     | 147 +++++++++++++++++-------------
 drivers/gpu/drm/tegra/dpaux.c  |   2 +-
 drivers/gpu/drm/tegra/drm.c    |   4 +-
 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/dsi.c    | 177 ++++++++++++++++++++----------------
 drivers/gpu/drm/tegra/gr2d.c   |   4 +-
 drivers/gpu/drm/tegra/gr3d.c   |   4 +-
 drivers/gpu/drm/tegra/hdmi.c   | 118 +++++++++++++-----------
 drivers/gpu/drm/tegra/hub.c    | 198 ++++++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/hub.h    |   2 +-
 drivers/gpu/drm/tegra/output.c |  16 ++++
 drivers/gpu/drm/tegra/sor.c    | 163 ++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/vic.c    |   8 +-
 drivers/gpu/host1x/bus.c       |  79 +++++++++++++++-
 drivers/gpu/host1x/dev.c       |   4 +-
 drivers/gpu/host1x/syncpt.c    |   2 +-
 include/linux/host1x.h         |  15 +++-
 17 files changed, 593 insertions(+), 352 deletions(-)

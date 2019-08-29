From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/7] Replace Tegra FUSE API by nvmem API
Date: Fri, 30 Aug 2019 00:19:04 +0200
Message-ID: <20190829221911.24876-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The nvmem API provides a generic API to retrieve the kind of information
currently retrieved using the custom Tegra FUSE API. Convert the Tegra
FUSE driver to be an nvmem provider and export cells used by existing
drivers.

The three non-SoC drivers included in this series are meant to serve as
examples for how to use this. I'm not Cc'ing them to the subsystem
maintainers because the idea is to first merge the soc/tegra patches and
after that convert the consumers. Once the first patches are applied, I
will send out the consumers conversion patches to the respective
subsystems.

What's not included in this series is a cleanup patch that finally
removes the custom Tegra FUSE API. I'll follow up with that once these
patches have been applied.

Thierry

Thierry Reding (7):
  soc/tegra: fuse: Restore base on sysfs failure
  soc/tegra: fuse: Implement nvmem device
  soc/tegra: fuse: Add cell information
  soc/tegra: fuse: Register cell lookups for compatibility
  drm/nouveau: tegra: Use nvmem API
  phy: tegra: xusb: Use nvmem API
  thermal: tegra: Use nvmem API

 .../gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c   |  12 +-
 drivers/phy/tegra/xusb-tegra124.c             |  10 +-
 drivers/phy/tegra/xusb-tegra186.c             |   7 +-
 drivers/phy/tegra/xusb-tegra210.c             |  10 +-
 drivers/soc/tegra/fuse/fuse-tegra.c           | 193 +++++++++++++-----
 drivers/soc/tegra/fuse/fuse-tegra30.c         | 154 ++++++++++++++
 drivers/soc/tegra/fuse/fuse.h                 |   8 +
 drivers/thermal/tegra/soctherm-fuse.c         |  19 +-
 drivers/thermal/tegra/soctherm.c              |   4 +-
 drivers/thermal/tegra/soctherm.h              |   9 +-
 drivers/thermal/tegra/tegra124-soctherm.c     |   8 -
 drivers/thermal/tegra/tegra132-soctherm.c     |   8 -
 drivers/thermal/tegra/tegra210-soctherm.c     |   8 -
 13 files changed, 344 insertions(+), 106 deletions(-)

-- 
2.22.0

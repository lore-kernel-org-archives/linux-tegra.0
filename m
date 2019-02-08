From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 4/9] soc/tegra: Changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:30 +0100
Message-ID: <20190208150935.32108-5-thierry.reding@gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-soc

for you to fetch changes up to e247deae1a55089cb04cc25c91faeba083d0c39c:

  soc/tegra: pmc: Support systems where PMC is marked secure (2019-01-25 16:18:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.1-rc1

This contains a couple of miscellaneous fixes for minor issues and a
largish rework of the PMC driver to make it work on systems where the
PMC has been locked down and can only be accessed from secure firmware.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Make tegra_powergate_is_powered() a local function

Joseph Lo (1):
      soc/tegra: fuse: Fix typo in tegra210_init_speedo_data

Mikko Perttunen (1):
      soc/tegra: pmc: Support systems where PMC is marked secure

Thierry Reding (6):
      soc/tegra: pmc: Use TEGRA186_ prefix for GPIO names
      soc/tegra: pmc: Sort includes alphabetically
      soc/tegra: pmc: Add missing kerneldoc
      soc/tegra: pmc: Pass struct tegra_pmc * where possible
      soc/tegra: pmc: Make alignment consistent
      soc/tegra: pmc: Explicitly initialize all fields

Timo Alho (1):
      soc/tegra: fuse: Fix illegal free of IO base address

 drivers/soc/tegra/fuse/fuse-tegra.c      |  12 +-
 drivers/soc/tegra/fuse/speedo-tegra210.c |   2 +-
 drivers/soc/tegra/pmc.c                  | 424 +++++++++++++++++++++----------
 include/soc/tegra/pmc.h                  |   6 -
 4 files changed, 298 insertions(+), 146 deletions(-)

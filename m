From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/9] soc/tegra: Changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:13 +0200
Message-ID: <20190418150721.8828-2-thierry.reding@gmail.com>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418150721.8828-1-thierry.reding@gmail.com>
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

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-soc

for you to fetch changes up to 6ac2a01de1700c1b6d889f02f61c4c9602573a8d:

  soc/tegra: pmc: Move powergate initialisation to probe (2019-04-17 10:32:33 +0200)

Note that this pulls in a stable branch from Philipp for the core
acquire/release protocol changes to the reset framework.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.2-rc1

Besides a couple of fixes to better cope with deferred probing, this set
of patches also implements the acquire/release protocol for resets used
during powergate operations. This is necessary to allow these resets to
be temporarily shared with other devices that may also need to control
these resets.

----------------------------------------------------------------
Jon Hunter (3):
      soc/tegra: pmc: Fix reset sources and levels
      soc/tegra: pmc: Remove reset sysfs entries on error
      soc/tegra: pmc: Move powergate initialisation to probe

Philipp Zabel (1):
      reset: add acquired/released state for exclusive reset controls

Thierry Reding (4):
      reset: Add acquired flag to of_reset_control_array_get()
      reset: Add acquire/release support for arrays
      Merge branch 'reset/acquire' of git://git.pengutronix.de/git/pza/linux into for-5.2/soc
      soc/tegra: pmc: Implement acquire/release for resets

 drivers/reset/core.c              | 180 +++++++++++++++++++++++++++++++++++---
 drivers/soc/tegra/pmc.c           | 171 ++++++++++++++++++++++++++++--------
 drivers/usb/dwc3/dwc3-of-simple.c |   3 +-
 include/linux/reset.h             | 113 ++++++++++++++++++------
 4 files changed, 389 insertions(+), 78 deletions(-)

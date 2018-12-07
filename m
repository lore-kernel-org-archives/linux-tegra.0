From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/6] soc/tegra: Changes for v4.21-rc1
Date: Fri,  7 Dec 2018 15:17:35 +0100
Message-ID: <20181207141739.9085-2-thierry.reding@gmail.com>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207141739.9085-1-thierry.reding@gmail.com>
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

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-soc

for you to fetch changes up to e3e403c218cd07b497127a29e604fc26a71e8558:

  soc/tegra: pmc: Add initial Tegra194 wake events (2018-11-28 17:32:28 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v4.21-rc1

These changes are mostly cleanups to the PMC driver, but they also add
support for wake events on Tegra186 and Tegra194, which can be used to
wake the system from sleep. With this and the corresponding device
tree additions suspend/resume is finally working on these SoCs.

----------------------------------------------------------------
Bo Yan (1):
      soc/tegra: fuse: Remove duplicated function declaration

Dmitry Osipenko (1):
      soc/tegra: pmc: Drop locking from tegra_powergate_is_powered()

Jon Hunter (1):
      soc/tegra: pmc: Don't power-up XUSB power-domains

Sandipan Patra (1):
      soc/tegra: pmc: Add sysfs entries for reset info

Thierry Reding (4):
      soc/tegra: pmc: Add Tegra194 support
      soc/tegra: pmc: Add wake event support
      soc/tegra: pmc: Add initial Tegra186 wake events
      soc/tegra: pmc: Add initial Tegra194 wake events

Yangtao Li (2):
      soc/tegra: Don't leak device tree node reference
      soc/tegra: pmc: Change to use DEFINE_SHOW_ATTRIBUTE macro

 drivers/soc/tegra/common.c |   6 +-
 drivers/soc/tegra/pmc.c    | 472 +++++++++++++++++++++++++++++++++++++++++----
 include/soc/tegra/fuse.h   |   1 -
 include/soc/tegra/pmc.h    |  21 ++
 4 files changed, 462 insertions(+), 38 deletions(-)

From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/5] soc: tegra: Changes for v5.3-rc1
Date: Fri, 21 Jun 2019 17:02:04 +0200
Message-ID: <20190621150206.19037-3-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
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

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-soc

for you to fetch changes up to 7ac13f6dcbd59b8f99395588cd7ef31f7e3bd3c6:

  soc/tegra: Select pinctrl for Tegra194 (2019-06-13 10:44:08 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc: tegra: Changes for v5.3-rc1

This contains a set of minor fixes and cleanups for core Tegra drivers.

----------------------------------------------------------------
Krishna Yarlagadda (1):
      soc/tegra: Select pinctrl for Tegra194

Thierry Reding (4):
      soc/tegra: pmc: Fail to allocate more than one wake IRQ
      soc/tegra: pmc: Avoid crash for non-wake IRQs
      soc/tegra: pmc: Add comments clarifying wake events
      soc/tegra: fuse: Do not log error message on deferred probe

 drivers/soc/tegra/Kconfig           |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c |  6 ++++--
 drivers/soc/tegra/pmc.c             | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

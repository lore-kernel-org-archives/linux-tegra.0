From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 2/9] cpufreq: tegra: Add support for Tegra210
Date: Fri,  8 Feb 2019 16:09:28 +0100
Message-ID: <20190208150935.32108-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-cpufreq

for you to fetch changes up to 43c36002b86d6027b48f7c68ac32245f73f29f6b:

  cpufreq: dt-platdev: add Tegra210 to blacklist (2019-02-06 14:31:19 +0100)

Thanks,
Thierry

----------------------------------------------------------------
cpufreq: tegra: Add support for Tegra210

This uses the DFLL clock support to enable CPU frequency scaling on
Tegra210.

----------------------------------------------------------------
Joseph Lo (3):
      cpufreq: tegra124: do not handle the CPU rail
      cpufreq: tegra124: extend to support Tegra210
      cpufreq: dt-platdev: add Tegra210 to blacklist

 drivers/cpufreq/Kconfig.arm          |  4 ++--
 drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
 drivers/cpufreq/tegra124-cpufreq.c   | 44 ++++--------------------------------
 3 files changed, 7 insertions(+), 42 deletions(-)

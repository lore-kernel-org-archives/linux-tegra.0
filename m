From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/5] ARM: tegra: Core changes for v4.18-rc1
Date: Fri, 18 May 2018 16:22:43 +0200
Message-ID: <20180518142245.20242-3-thierry.reding@gmail.com>
References: <20180518142245.20242-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180518142245.20242-1-thierry.reding@gmail.com>
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

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.18-arm-soc

for you to fetch changes up to 15164e0072b579f77c9025f3da3ed931869b89cd:

  ARM: tegra: Create platform device for tegra20-cpufreq driver (2018-05-18 11:15:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v4.18-rc1

Contains a single patch that instantiates a platform device for the CPU
frequency driver.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Create platform device for tegra20-cpufreq driver

 arch/arm/mach-tegra/tegra.c | 4 ++++
 1 file changed, 4 insertions(+)

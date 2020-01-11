From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:50 +0100
Message-ID: <20200111003553.2411874-5-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: arm@kernel.org, soc@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm-core

for you to fetch changes up to 9c65b8463f41f3a9edef97e3109752159d4c6a4b:

  ARM: tegra: Use clk_m CPU on Tegra124 LP1 resume (2020-01-08 12:58:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.6-rc1

Contains a couple of fixes for RAM repair on Tegra124.

----------------------------------------------------------------
Stephen Warren (3):
      ARM: tegra: Enable PLLP bypass during Tegra124 LP1
      ARM: tegra: Modify reshift divider during LP1
      ARM: tegra: Use clk_m CPU on Tegra124 LP1 resume

 arch/arm/mach-tegra/sleep-tegra30.S | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

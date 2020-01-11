From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:51 +0100
Message-ID: <20200111003553.2411874-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm-dt

for you to fetch changes up to 834f1d6cf3647e804e7a80569e42ee7fbee50eb1:

  ARM: dts: tegra20: paz00: Add memory timings (2020-01-10 15:41:54 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.6-rc1

This adds memory timings for the PAZ100 and does some minor cleanup for
the external memory controller device tree node on Tegra124.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: dts: tegra20: paz00: Add memory timings

Thierry Reding (2):
      ARM: tegra: Let the EMC hardware use the EMC clock
      ARM: tegra: Rename EMC on Tegra124

 arch/arm/boot/dts/tegra124-apalis-emc.dtsi     |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  2 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi   |  2 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  2 +-
 arch/arm/boot/dts/tegra124.dtsi                |  4 ++-
 arch/arm/boot/dts/tegra20-paz00.dts            | 46 ++++++++++++++++++++++++++
 6 files changed, 53 insertions(+), 5 deletions(-)

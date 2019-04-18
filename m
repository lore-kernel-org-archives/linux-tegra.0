From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 6/9] ARM: tegra: Device tree changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:17 +0200
Message-ID: <20190418150721.8828-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm-dt

for you to fetch changes up to 1078946b4b2e44ffe924b0261afddbb38ff7d2c2:

  ARM: tegra: Add ACTMON support on Tegra30 (2019-04-18 11:37:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.2-rc1

This contains a set of changes to move PLL power supplies to the XUSB
pad controller, which is necessary to ensure the proper sequencing
during boot. Other patches in this set clean up usage of SPDX license
identifiers in device tree files as well as add support for the ACTMON
hardware on Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Add ACTMON support on Tegra30

Igor Opaniuk (1):
      ARM: tegra: Convert to SPDX license tags for Tegra124 Apalis

Thierry Reding (5):
      ARM: tegra: Remove gratuitous parentheses in SPDX license identifier
      ARM: tegra: apalis: Move PLL power supplies to XUSB pad controller
      ARM: tegra: jetson-tk1: Move PLL power supplies to XUSB pad controller
      ARM: tegra: nyan: Move PLL power supplies to XUSB pad controller
      ARM: tegra: venice2: Move PLL power supplies to XUSB pad controller

 arch/arm/boot/dts/tegra124-apalis-emc.dtsi      | 39 ++-------------------
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 40 ++--------------------
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     |  9 ++++-
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 45 ++++---------------------
 arch/arm/boot/dts/tegra124-jetson-tk1.dts       |  5 +++
 arch/arm/boot/dts/tegra124-nyan.dtsi            |  5 +++
 arch/arm/boot/dts/tegra124-venice2.dts          |  5 +++
 arch/arm/boot/dts/tegra30.dtsi                  | 11 ++++++
 9 files changed, 46 insertions(+), 115 deletions(-)

From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 0/3] ARM: dts: tegra: apalis/colibri updates
Date: Sat, 10 Feb 2018 02:36:35 +0100
Message-ID: <20180210013638.28164-1-marcel@ziswiler.com>
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
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


This series fixes the I2C bus frequencies, uses the correct compatible
for the RTC and removes an unneeded reg property for Tegra based
Toradex Apalis and Colibri modules.


Marcel Ziswiler (3):
  apalis_t30/tk1, colibri_t20/t30: fix i2c bus frequencies
  ARM: dts: tegra: apalis/colibri: use correct compatible for rtc
  ARM: dts: tegra: apalis/colibri: remove unneeded reg property

 arch/arm/boot/dts/tegra124-apalis-eval.dts    |  7 +++----
 arch/arm/boot/dts/tegra124-apalis.dtsi        |  2 +-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi    | 16 +++++++++++-----
 arch/arm/boot/dts/tegra30-apalis-eval.dts     |  4 ++--
 arch/arm/boot/dts/tegra30-apalis.dtsi         |  3 +--
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |  4 ++--
 arch/arm/boot/dts/tegra30-colibri.dtsi        |  3 +--
 7 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.14.3

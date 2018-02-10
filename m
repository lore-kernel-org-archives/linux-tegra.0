From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 0/6] ARM: dts: tegra: apalis-tk1: updates incl. v1.2 hardware
 support
Date: Sat, 10 Feb 2018 02:38:00 +0100
Message-ID: <20180210013806.28496-1-marcel@ziswiler.com>
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


This series sets critical trips, activates PWM pin muxing for PWM3,
adds a missing AS3722 GPIO0 configuration, adds a hog group for
Ethernet, PCIe, reset GPIOs, updates the copyright period, removes
spurious newlines and adds support for the V1.2 hardware revision of
the Toradex Apalis TK1 system on module.


Marcel Ziswiler (6):
  arm: tegra: apalis-tk1: set critical trips
  ARM: dts: tegra: apalis-tk1: activate pwm pin muxing for pwm3
  ARM: dts: tegra: apalis-tk1: add missing as3722 gpio0 configuration
  ARM: dts: tegra: apalis-tk1: hog group for ethernet, pcie, reset gpios
  ARM: dts: tegra: apalis-tk1: copyright period, spurious newlines
  ARM: dts: tegra: apalis-tk1: support v1.2 hardware revision

 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/tegra124-apalis-eval.dts      |   16 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  250 +++
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 2052 +++++++++++++++++++++++
 arch/arm/boot/dts/tegra124-apalis.dtsi          |   70 +-
 5 files changed, 2344 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi

-- 
2.14.3

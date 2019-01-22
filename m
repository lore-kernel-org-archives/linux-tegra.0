From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 0/2] Adding DTS to support STMPE811 ADC on Toradex Boards
Date: Tue, 22 Jan 2019 14:21:33 +0100
Message-ID: <20190122132135.5012-1-dev@pschenker.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: marcel.ziswiler@toradex.com, stefan@agner.ch, max.krummenacher@toradex.com, Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-tegra@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

Hello,

Recently the STMPE811 driver got pulled by MFD (for 5.1).
This patches I'm sending are now adding support for STMPE811 ADC in
devicetree. These patches have been in the STMPE811 ADC driver patchset
but were not pulled by Lee, as they had no reviews and I also corrected
some minor comment errors.


Philippe Schenker (2):
  ARM: dts: Add stmpe-adc DT node to Toradex iMX6 modules
  ARM: dts: Add stmpe-adc DT node to Toradex T30 modules

 arch/arm/boot/dts/imx6qdl-apalis.dtsi      | 22 ++++++++++++++--------
 arch/arm/boot/dts/imx6qdl-colibri.dtsi     | 22 ++++++++++++++--------
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 22 ++++++++++++++--------
 arch/arm/boot/dts/tegra30-apalis.dtsi      | 22 ++++++++++++++--------
 arch/arm/boot/dts/tegra30-colibri.dtsi     | 22 ++++++++++++++--------
 5 files changed, 70 insertions(+), 40 deletions(-)

-- 
2.20.1

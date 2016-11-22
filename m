From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 0/6] apalis-tk1: updates for v1.1 hw
Date: Tue, 22 Nov 2016 01:14:01 +0100
Message-ID: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


This series updates the device tree for the upcoming V1.1 HW samples.
All changes are purely opportunistic meaning they fix stuff which on
older HW was anyway broken so there should be no backwards
compatibility issues.


Marcel Ziswiler (6):
  apalis-tk1: remove spurious new lines
  apalis-tk1: temp alert pull-up
  apalis-tk1: optional displayport hot-plug detect
  apalis-tk1: adjust pin muxing for v1.1 hw
  apalis-tk1: working sd card detect on v1.1 hw
  apalis-tk1: update compatibility comment

 arch/arm/boot/dts/tegra124-apalis-eval.dts | 11 +----
 arch/arm/boot/dts/tegra124-apalis.dtsi     | 73 +++++++++++-------------------
 2 files changed, 29 insertions(+), 55 deletions(-)

-- 
2.5.5

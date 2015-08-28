From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 0/9] arm: tegra: apalis_t30: fix pin mux, hdmi, wakeup and enable hda
Date: Fri, 28 Aug 2015 14:42:27 +0200
Message-ID: <1440765756-1382-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This series finally continues on my previous Easter efforts (BTW:
thanks all for the feedback and all the patches thereof already having
been applied) and additionally to fixing the pin muxing and enabling
HDA audio also fixes HDMI and the wake-up key.


Marcel Ziswiler (9):
  arm: tegra: apalis_t30: update hardware revisions compatibility
    comment
  arm: tegra: apalis_t30: fix hdmi supply
  arm: tegra: apalis_t30: fix pin muxing
  arm: tegra: apalis_t30: add comment concerning emmc
  arm: tegra: apalis_t30: add digital audio pin muxing
  arm: tegra: apalis_t30: enable hda for eval board
  arm: tegra: apalis_t30: set otg dr_mode for eval board
  arm: tegra: apalis_t30: fix backlight pwm comment for eval board
  arm: tegra: apalis_t30: fix power/wakeup key for eval board

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 13 +++--
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 80 ++++++++++++++++++++++++-------
 2 files changed, 73 insertions(+), 20 deletions(-)

-- 
2.4.3

From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH 2nd RESEND] Clock changes for Tegra30 USB Host support
Date: Wed, 28 Aug 2013 18:18:46 +0300
Message-ID: <1377703127-7020-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@linaro.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@wwwdotorg.org, linux-usb@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi all,

This patch is required for USB support on Tegra30 due to a hardware
quirk in the PLL_U oscillator which clocks the USB complex.

The other USB patches for Tegra30 and Tegra114 are already on their way
to 3.12, so it would be nice to have this one as well in 3.12.

Diff from previous: Added swarren's Tested-by & Acked-by.

Tuomas Tynkkynen (1):
  clk: tegra30: Don't wait for PLL_U lock bit

 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.5

From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH] Clock changes for Tegra30 USB Host support
Date: Wed, 31 Jul 2013 20:42:30 +0300
Message-ID: <1375292551-7933-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@linaro.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@wwwdotorg.org, linux-usb@vger.kernel.org, pgaikwad@nvidia.com, pdeschrijver@nvidia.com, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi all,

This patch is required for USB support on Tegra30 due to a likely hardware
bug in the PLL_U oscillator which clocks the USB complex.

Tuomas Tynkkynen (1):
  clk: tegra30: Don't wait for PLL_U lock bit

 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.1.5

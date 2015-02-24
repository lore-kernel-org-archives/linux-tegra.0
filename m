From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 3/4] pinctrl: tegra: support nvidia,io-hv DT property
Date: Tue, 24 Feb 2015 14:00:50 -0700
Message-ID: <1424811651-18660-3-git-send-email-swarren@wwwdotorg.org>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Both nvidia,io-hv and nvidia,rcv-sel represent the fact that a particular
pin's IO buffers are configured to accept "high voltage" input signals.
The TRM for different chips names the register field rcv-sel on older
SoCs and io_hv on newer SoCs. Add the new naming option into the pinctrl
driver so that DT files can use naming consistent with the TRM.

This new property name will be documented in the patch that adds support
for the new SoC.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/pinctrl/pinctrl-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 6cd651a88398..4c95c2024a1c 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -103,6 +103,7 @@ static const struct cfg_param {
 	{"nvidia,lock",			TEGRA_PINCONF_PARAM_LOCK},
 	{"nvidia,io-reset",		TEGRA_PINCONF_PARAM_IORESET},
 	{"nvidia,rcv-sel",		TEGRA_PINCONF_PARAM_RCV_SEL},
+	{"nvidia,io-hv",		TEGRA_PINCONF_PARAM_RCV_SEL},
 	{"nvidia,high-speed-mode",	TEGRA_PINCONF_PARAM_HIGH_SPEED_MODE},
 	{"nvidia,schmitt",		TEGRA_PINCONF_PARAM_SCHMITT},
 	{"nvidia,low-power-mode",	TEGRA_PINCONF_PARAM_LOW_POWER_MODE},
-- 
1.9.1

From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra1x4: initialize at arch_initcall time
Date: Mon, 13 Jan 2014 10:02:39 -0700
Message-ID: <52D41C2F.3050308@wwwdotorg.org>
References: <1389401416-29892-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389401416-29892-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/10/2014 05:50 PM, Andrew Bresticker wrote:
> Many devices rely on pinctrl/pinmux settings being applied
> before probing and some of these may probe before device_initcall
> time (e.g. i2c at subsys_initcall).  Move Tegra1x4 pinctrl driver
> registration to arch_initcall time so that proper pin settings
> can be applied earlier.

NAK. We shouldn't play games with initcall levels to achieve probe
ordering. It's not scalable and there's no actual guarantee it'll
produce the desired result.

Instead, if one device depends on another, it should do so explicitly.
In other words, the device that relies on a particular pinctrl setting
should have a pinctrl state defined, that references the pin controller,
which then triggers deferred probe until the pin controller is initialized.

Since we initialize the whole pinctrl setup in one go in a state
associated with the pin controller, rather than as separate states
associated with each device, you'll need to have the leaf devices
reference an empty pinctrl state defined in the desired pin controller.

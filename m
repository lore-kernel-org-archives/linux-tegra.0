From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra124: add pinctrl driver for NVIDIA's Tegra124
 SoC
Date: Wed, 04 Dec 2013 12:30:48 -0700
Message-ID: <529F82E8.3000206@wwwdotorg.org>
References: <1384191718-16817-1-git-send-email-aghuge@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1384191718-16817-1-git-send-email-aghuge@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ashwini Ghuge <aghuge@nvidia.com>, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, linus.walleij@linaro.org, grant.likely@linaro.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/11/2013 10:41 AM, Ashwini Ghuge wrote:
> The driver uses the common Tegra pinctrl driver utility functions to
> implement the majority of the driver. It is based on the similar Tegra114
> pinctrl

> +static const struct tegra_function  tegra124_functions[] = {
...
> +	FUNCTION(i2c1),
> +	FUNCTION(i2c2),
> +	FUNCTION(i2c3),
> +	FUNCTION(i2c4),
> +	FUNCTION(i2cpwr),

Is that complete? Tegra124 apparently has 6 I2C controllers. Are the
pins for the new sixth controller (0x7000d100) not affected by the pinmux?

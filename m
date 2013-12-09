From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: add pinmux controller driver for
 Tegra124
Date: Mon, 09 Dec 2013 11:27:38 -0700
Message-ID: <52A60B9A.7010709@wwwdotorg.org>
References: <1386585140-1137-1-git-send-email-ldewangan@nvidia.com> <1386585140-1137-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386585140-1137-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, thierry.reding@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Ashwini Ghuge <aghuge@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 12/09/2013 03:32 AM, Laxman Dewangan wrote:
> From: Ashwini Ghuge <aghuge@nvidia.com>
> 
> This adds a driver for the Tegra124 pinmux, and required
> parameterization data for Tegra124.
> 
> The driver uses the common Tegra pincontrol driver utility
> functions to implement the majority of the driver.
> 
> This driver is not compatible with the earlier NVIDIA's SoCs,
> hence add new compatibile as "nvidia,tegra124-pinmux".
> 
> Originally written by Ashwini Gguhe.
> Thierry:
> 	- Cleanups in patches.
> ldewangan:
>         - Fix some entries for groups.
> 	- Fix MUX enums and group sequence.

> +static const struct pinctrl_pin_desc  tegra124_pins[] = {

Still two spaces there...

BTW, I said the following before for both patches; please make sure you
add this to the commit description...

Acked-by: Stephen Warren <swarren@nvidia.com>

Even if I didn't say it before, it's certainly now,

Tested-by: Stephen Warren <swarren@nvidia.com>

(I also tested your patches that add the pinctrl DT entries to the
Venice2 DT file. Thanks.)

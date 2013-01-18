From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra114: add pinctrl driver for NVIDIA's
 Tegra114 SoC
Date: Fri, 18 Jan 2013 16:15:35 +0100
Message-ID: <CACRpkdYm8tjhbVofGJA59n78GRpUVBhss6zdQ8gDBme-URo=4w@mail.gmail.com>
References: <1357630357-7309-1-git-send-email-ldewangan@nvidia.com>
	<1357630357-7309-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1357630357-7309-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: praithatha@nvidia.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 8, 2013 at 8:32 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> From: Pritesh Raithatha <praithatha@nvidia.com>
>
> This adds a driver for the Tegra114 pinmux, and required
> parameterization data for Tegra114.
>
> The driver uses the common Tegra pincontrol driver utility
> functions to implement the majority of the driver.
>
> This driver is not compatible with the earlier NVIDIA's SoCs,
> hence add new compatibile as "nvidia,tegra114-pinmux".
>
> Originally written by Pritesh.
> ldewangan:
>         - cleanup the patches,
>         - remove non-require tables.
>         - Use module_platform_driver() for driver registartion.
>
> Signed-off-by: Pritesh Raithatha <praithatha@nvidia.com>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Patch applied, thanks.

Yours,
Linus Walleij

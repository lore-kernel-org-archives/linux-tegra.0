From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: fix pllu rate configuration
Date: Fri, 2 Mar 2018 08:56:46 +0000
Message-ID: <2feb313b-ef9f-be2f-68a5-b8cc46ad75c3@nvidia.com>
References: <20180222230451.15515-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180222230451.15515-1-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 22/02/18 23:04, Marcel Ziswiler wrote:
> Turns out latest upstream U-Boot does not configure/enable pllu which
> leaves it at some default rate of 500 kHz:
> 
> root@apalis-t30:~# cat /sys/kernel/debug/clk/clk_summary | grep pll_u
>        pll_u                  3        3        0      500000          0
> 
> Of course this won't quite work leading to the following messages:
> 
> [    6.559593] usb 2-1: new full-speed USB device number 2 using tegra-
> ehci
> [   11.759173] usb 2-1: device descriptor read/64, error -110
> [   27.119453] usb 2-1: device descriptor read/64, error -110
> [   27.389217] usb 2-1: new full-speed USB device number 3 using tegra-
> ehci
> [   32.559454] usb 2-1: device descriptor read/64, error -110
> [   47.929777] usb 2-1: device descriptor read/64, error -110
> [   48.049658] usb usb2-port1: attempt power cycle
> [   48.759475] usb 2-1: new full-speed USB device number 4 using tegra-
> ehci
> [   59.349457] usb 2-1: device not accepting address 4, error -110
> [   59.509449] usb 2-1: new full-speed USB device number 5 using tegra-
> ehci
> [   70.069457] usb 2-1: device not accepting address 5, error -110
> [   70.079721] usb usb2-port1: unable to enumerate USB device
> 
> Fix this by actually allowing the rate also being set from within
> the Linux kernel.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  drivers/clk/tegra/clk-pll.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 7c369e21c91c..830d1c87fa7c 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1151,6 +1151,8 @@ static const struct clk_ops tegra_clk_pllu_ops = {
>  	.enable = clk_pllu_enable,
>  	.disable = clk_pll_disable,
>  	.recalc_rate = clk_pll_recalc_rate,
> +	.round_rate = clk_pll_round_rate,
> +	.set_rate = clk_pll_set_rate,
>  };
>  
>  static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,

Thanks for the fix. I have tested this on Tegra30 cardhu and this
resolves a problem booting this board with the upstream uboot bootloader.

We just need to align with Peter on the best way to fix.

Cheers,
Jon

-- 
nvpublic

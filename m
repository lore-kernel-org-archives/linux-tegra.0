From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 2/4] mmc: mediatek: refine msdc timeout api
Date: Mon, 20 Jul 2020 17:43:33 +0200
Message-ID: <eb1d5973-55f2-3fb4-bf9c-03b98bd6955b@gmail.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
 <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 20/07/2020 02:42, Chun-Hung Wu wrote:
> Extract msdc timeout api common part to have
> better code architecture and avoid redundant code.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ed37a3c..347ed72 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -723,21 +723,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
>   	}
>   }
>   
> -/* clock control primitives */
> -static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
> +static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>   {
> -	u32 timeout, clk_ns;
> +	u64 timeout, clk_ns;
>   	u32 mode = 0;
>   
> -	host->timeout_ns = ns;
> -	host->timeout_clks = clks;
>   	if (host->mmc->actual_clock == 0) {
>   		timeout = 0;
>   	} else {
> -		clk_ns  = 1000000000UL / host->mmc->actual_clock;
> -		timeout = (ns + clk_ns - 1) / clk_ns + clks;
> +		clk_ns  = 1000000000ULL;
> +		do_div(clk_ns, host->mmc->actual_clock);
> +		timeout = ns + clk_ns - 1;
> +		do_div(timeout, clk_ns);
> +		timeout += clks;
>   		/* in 1048576 sclk cycle unit */
> -		timeout = (timeout + (0x1 << 20) - 1) >> 20;
> +		timeout = DIV_ROUND_UP(timeout, (0x1 << 20));
>   		if (host->dev_comp->clk_div_bits == 8)
>   			sdr_get_field(host->base + MSDC_CFG,
>   				      MSDC_CFG_CKMOD, &mode);
> @@ -747,9 +747,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
>   		/*DDR mode will double the clk cycles for data timeout */
>   		timeout = mode >= 2 ? timeout * 2 : timeout;
>   		timeout = timeout > 1 ? timeout - 1 : 0;
> -		timeout = timeout > 255 ? 255 : timeout;
>   	}
> -	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, timeout);
> +	return timeout;
> +}
> +
> +/* clock control primitives */
> +static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
> +{
> +	u64 timeout;
> +
> +	host->timeout_ns = ns;
> +	host->timeout_clks = clks;
> +
> +	timeout = msdc_timeout_cal(host, ns, clks);
> +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
> +		      (u32)(timeout > 255 ? 255 : timeout));
>   }
>   
>   static void msdc_gate_clock(struct msdc_host *host)
> 

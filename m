From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Correct error path in probe
Date: Mon, 27 Jun 2016 10:28:52 +0100
Message-ID: <5770F1D4.8000406@nvidia.com>
References: <1465936007-18599-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465936007-18599-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

On 14/06/16 21:26, Jon Hunter wrote:
> Commit 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")
> enables the Tegra I2C 'div_clk' for adapters using the multi-master mode
> during the device probe. Although the probe error path was updated to
> disable the clock on probe failure, there is one place after calling
> tegra_i2c_init() where the clock will not be disabled on failure. Correct
> the error path so that the 'div_clk' is disabled if calling
> tegra_i2c_init() fails.
> 
> Fixes: 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 445398c314a3..b126dbaa47e3 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -912,7 +912,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	ret = tegra_i2c_init(i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize i2c controller");
> -		goto unprepare_div_clk;
> +		goto disable_div_clk;
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,

Any feedback on this?

Jon

-- 
nvpublic

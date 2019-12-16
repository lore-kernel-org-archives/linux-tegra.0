From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 12/17] clk: socfpga: convert to
 devm_platform_ioremap_resource
Date: Mon, 16 Dec 2019 14:20:50 -0600
Message-ID: <2ebd88a1-7b04-a6e6-cffc-59353a6846dc@kernel.org>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-12-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209195749.868-12-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, afaerber@suse.de, manivannan.sadhasivam@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org, krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, mripard@kernel.org, wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net, kstewart@linuxfoundation.org, swinslow@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org



On 12/9/19 1:57 PM, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/socfpga/clk-s10.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
> index 993f3a73c71e..85055fc56404 100644
> --- a/drivers/clk/socfpga/clk-s10.c
> +++ b/drivers/clk/socfpga/clk-s10.c
> @@ -276,11 +276,9 @@ static struct stratix10_clock_data *__socfpga_s10_clk_init(struct platform_devic
>  	struct device *dev = &pdev->dev;
>  	struct stratix10_clock_data *clk_data;
>  	struct clk **clk_table;
> -	struct resource *res;
>  	void __iomem *base;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		pr_err("%s: failed to map clock registers\n", __func__);
>  		return ERR_CAST(base);
> 

Tested-by: Dinh Nguyen <dinguyen@kernel.org>

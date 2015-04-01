From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/11] clk: tegra: Add peripheral registers for bank Y
Date: Wed, 1 Apr 2015 08:25:49 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1504010825330.19540@utopia.booyaka.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com> <1427718673-32011-9-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-9-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 30 Mar 2015, Thierry Reding wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra210 has an extra bank of peripheral clock registers. Add it to the
> generic peripheral clock code.
> 
> Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 7a1df61847fc..41cd87c67be6 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -30,6 +30,7 @@
>  #define CLK_OUT_ENB_V			0x360
>  #define CLK_OUT_ENB_W			0x364
>  #define CLK_OUT_ENB_X			0x280
> +#define CLK_OUT_ENB_Y			0x298
>  #define CLK_OUT_ENB_SET_L		0x320
>  #define CLK_OUT_ENB_CLR_L		0x324
>  #define CLK_OUT_ENB_SET_H		0x328
> @@ -42,6 +43,8 @@
>  #define CLK_OUT_ENB_CLR_W		0x44c
>  #define CLK_OUT_ENB_SET_X		0x284
>  #define CLK_OUT_ENB_CLR_X		0x288
> +#define CLK_OUT_ENB_SET_Y		0x29c
> +#define CLK_OUT_ENB_CLR_Y		0x2a0
>  
>  #define RST_DEVICES_L			0x004
>  #define RST_DEVICES_H			0x008
> @@ -50,6 +53,7 @@
>  #define RST_DEVICES_V			0x358
>  #define RST_DEVICES_W			0x35C
>  #define RST_DEVICES_X			0x28C
> +#define RST_DEVICES_Y			0x2a4
>  #define RST_DEVICES_SET_L		0x300
>  #define RST_DEVICES_CLR_L		0x304
>  #define RST_DEVICES_SET_H		0x308
> @@ -62,6 +66,8 @@
>  #define RST_DEVICES_CLR_W		0x43c
>  #define RST_DEVICES_SET_X		0x290
>  #define RST_DEVICES_CLR_X		0x294
> +#define RST_DEVICES_SET_Y		0x2a8
> +#define RST_DEVICES_CLR_Y		0x2ac
>  
>  /* Global data of Tegra CPU CAR ops */
>  static struct tegra_cpu_car_ops dummy_car_ops;
> @@ -122,6 +128,14 @@ static struct tegra_clk_periph_regs periph_regs[] = {
>  		.rst_set_reg = RST_DEVICES_SET_X,
>  		.rst_clr_reg = RST_DEVICES_CLR_X,
>  	},
> +	[6] = {
> +		.enb_reg = CLK_OUT_ENB_Y,
> +		.enb_set_reg = CLK_OUT_ENB_SET_Y,
> +		.enb_clr_reg = CLK_OUT_ENB_CLR_Y,
> +		.rst_reg = RST_DEVICES_Y,
> +		.rst_set_reg = RST_DEVICES_SET_Y,
> +		.rst_clr_reg = RST_DEVICES_CLR_Y,
> +	},
>  };
>  
>  static void __iomem *clk_base;

Reviewed-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>


- Paul

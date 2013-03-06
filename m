From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] clk: tegra: Fix periph_clk_to_bit macro
Date: Wed, 06 Mar 2013 14:59:05 -0700
Message-ID: <5137BC29.2030909@wwwdotorg.org>
References: <1362606444-19970-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362606444-19970-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2013 02:47 PM, Andrew Chew wrote:
> The parameter name should be "gate", not "periph".  This worked, however,
> because it happens that everywhere periph_clk_to_bit is called, "gate" was
> in the local scope.

Peter, Prashant, can I get an ack/reviewed-by please?

Note: I'm also CC'ing Mike and the LAKML mailing list; common clock
driver changes should be sent to Mike as CCF maintainer, and any
ARM-related changes should typically get sent to LAKML in the absence of
any other specific subsystem list.

> Signed-off-by: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-periph-gate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 6dd5332..d87e1ce 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -41,7 +41,7 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>  #define write_rst_clr(val, gate) \
>  	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
>  
> -#define periph_clk_to_bit(periph) (1 << (gate->clk_num % 32))
> +#define periph_clk_to_bit(gate) (1 << (gate->clk_num % 32))
>  
>  /* Peripheral gate clock ops */
>  static int clk_periph_is_enabled(struct clk_hw *hw)

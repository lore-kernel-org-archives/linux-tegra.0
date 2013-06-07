From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: tegra: T114: add DFLL source clocks
Date: Fri, 07 Jun 2013 10:53:38 -0600
Message-ID: <51B21012.2030302@wwwdotorg.org>
References: <20130607121505.21868.72360.stgit@dusk.lan> <20130607121858.21868.73882.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130607121858.21868.73882.stgit-orwA252wQtA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/07/2013 06:19 AM, Paul Walmsley wrote:
> Add the input clocks needed by the DFLL IP blocks.  Initialize them to
> 51MHz (as required by the DFLL GFD) and to use the PLL_P clock source.
> 
> This patch is a collaboration with Peter De Schrijver
> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Thanks to Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for identifying the
> requirement to keep the DFLL clocks enabled to resolve PWR_I2C timeout
> issues.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

> @@ -792,6 +794,7 @@ enum tegra114_clk {
>  	audio1, audio2, audio3, audio4, spdif, clk_out_1, clk_out_2, clk_out_3,
>  	blink, xusb_host_src = 252, xusb_falcon_src, xusb_fs_src, xusb_ss_src,
>  	xusb_dev_src, xusb_dev, xusb_hs_src, sclk, hclk, pclk, cclk_g, cclk_lp,
> +	dfll_ref = 264, dfll_soc,

Those values need to be added to the DT binding documentation, or rather
the header file that now defines the constants for that binding.

BTW, I was rather hoping that Hiroshi would have converted the clock
drivers to actually use that header file by now... Then this requirement
would have been a lot more obvious. Hiroshi, are patches for that coming
soon? Paul, if not, are you able to do that?

For reference, include/dt-bindings/clock/tegra*-car.h.

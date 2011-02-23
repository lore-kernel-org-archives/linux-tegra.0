From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: Tegra: Rename I2S clocks to match driver name
Date: Wed, 23 Feb 2011 13:06:27 -0800
Message-ID: <AANLkTintojPzByxWM9L3JUzbvmTozf0pLA_Joy+01DUk@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298487532-5000-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> The driver is tegra-i2s not just i2s. Rename the clocks to match, so =
that
> clk_get_sys can look up by driver name.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> NOTE: This patch should apply right now.
>
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index 3015a2c..ee3f9d7 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -2128,8 +2128,8 @@ struct clk tegra_list_clks[] =3D {
> =A0 =A0 =A0 =A0PERIPH_CLK("apbdma", =A0 =A0"tegra-dma", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 34, =A0 =A0 0, =A0 =A0 =A0108000000, mux_pclk, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00),
> =A0 =A0 =A0 =A0PERIPH_CLK("rtc", =A0 =A0 =A0 "rtc-tegra", =A0 =A0 =A0=
 =A0 =A0 =A0NULL, =A0 4, =A0 =A0 =A00, =A0 =A0 =A032768, =A0 =A0 mux_cl=
k_32k, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PERIPH_NO_RESET),
> =A0 =A0 =A0 =A0PERIPH_CLK("timer", =A0 =A0 "timer", =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0NULL, =A0 5, =A0 =A0 =A00, =A0 =A0 =A026000000, =A0mux_clk_=
m, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0),
> - =A0 =A0 =A0 PERIPH_CLK("i2s1", =A0 =A0 =A0"i2s.0", =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0NULL, =A0 11, =A0 =A0 0x100, =A026000000, =A0mux_pllaout=
0_audio2x_pllp_clkm, =A0 =A0 =A0MUX | DIV_U71),
> - =A0 =A0 =A0 PERIPH_CLK("i2s2", =A0 =A0 =A0"i2s.1", =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0NULL, =A0 18, =A0 =A0 0x104, =A026000000, =A0mux_pllaout=
0_audio2x_pllp_clkm, =A0 =A0 =A0MUX | DIV_U71),
> + =A0 =A0 =A0 PERIPH_CLK("i2s1", =A0 =A0 =A0"tegra-i2s.0", =A0 =A0 =A0=
 =A0 =A0NULL, =A0 11, =A0 =A0 0x100, =A026000000, =A0mux_pllaout0_audio=
2x_pllp_clkm, =A0 =A0 =A0MUX | DIV_U71),
> + =A0 =A0 =A0 PERIPH_CLK("i2s2", =A0 =A0 =A0"tegra-i2s.1", =A0 =A0 =A0=
 =A0 =A0NULL, =A0 18, =A0 =A0 0x104, =A026000000, =A0mux_pllaout0_audio=
2x_pllp_clkm, =A0 =A0 =A0MUX | DIV_U71),
> =A0 =A0 =A0 =A0PERIPH_CLK("spdif_out", "spdif_out", =A0 =A0 =A0 =A0 =A0=
 =A0NULL, =A0 10, =A0 =A0 0x108, =A0100000000, mux_pllaout0_audio2x_pll=
p_clkm, =A0 =A0 =A0MUX | DIV_U71),
> =A0 =A0 =A0 =A0PERIPH_CLK("spdif_in", =A0"spdif_in", =A0 =A0 =A0 =A0 =
=A0 =A0 NULL, =A0 10, =A0 =A0 0x10c, =A0100000000, mux_pllp_pllc_pllm, =
=A0 =A0 =A0 =A0 =A0MUX | DIV_U71),
> =A0 =A0 =A0 =A0PERIPH_CLK("pwm", =A0 =A0 =A0 "pwm", =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0NULL, =A0 17, =A0 =A0 0x110, =A0432000000, mux_pllp_pll=
c_audio_clkm_clk32, =A0 =A0 =A0MUX | DIV_U71),
> --
> 1.7.1
>
>

Ack, I'll put it in for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

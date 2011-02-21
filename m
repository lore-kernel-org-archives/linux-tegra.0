From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: APB DMA: Enable clock and remove reset.
Date: Sun, 20 Feb 2011 20:10:19 -0800
Message-ID: <AANLkTi=sOyVN+3EQ7aSkG3Ay=3NhBXwT7d6PHufeKAXT@mail.gmail.com>
References: <1294263140-25700-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1294263140-25700-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 5, 2011 at 1:32 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> =
wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is for, and rediff'd against, for-next.
>
> The Tegra audio driver relies on this. The other DMA driver fix I jus=
t
> sent might rely on this in order to get zero fuzz/offset.
>
> =A0arch/arm/mach-tegra/dma.c =A0 =A0 =A0 =A0 =A0 | =A0 14 +++++++++++=
+++
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A06 ++++++
> =A02 files changed, 20 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
> index edda6ec..d8eb096 100644
> --- a/arch/arm/mach-tegra/dma.c
> +++ b/arch/arm/mach-tegra/dma.c
> @@ -27,6 +27,7 @@
> =A0#include <linux/err.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/delay.h>
> +#include <linux/clk.h>
> =A0#include <mach/dma.h>
> =A0#include <mach/irqs.h>
> =A0#include <mach/iomap.h>
> @@ -646,6 +647,19 @@ int __init tegra_dma_init(void)
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0unsigned int irq;
> =A0 =A0 =A0 =A0void __iomem *addr;
> + =A0 =A0 =A0 struct clk *c;
> +
> + =A0 =A0 =A0 c =3D clk_get_sys("tegra-dma", NULL);
> + =A0 =A0 =A0 if (IS_ERR(c)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Unable to get clock for APB DMA=
\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(c);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 ret =3D clk_enable(c);
> + =A0 =A0 =A0 if (ret !=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Unable to enable clock for APB =
DMA\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0addr =3D IO_ADDRESS(TEGRA_APB_DMA_BASE);
> =A0 =A0 =A0 =A0writel(GEN_ENABLE, addr + APB_DMA_GEN);
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index f7e1e68..ef46313 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -1588,6 +1588,11 @@ static struct clk_mux_sel mux_clk_32k[] =3D {
> =A0 =A0 =A0 =A0{ 0, 0},
> =A0};
>
> +static struct clk_mux_sel mux_pclk[] =3D {
> + =A0 =A0 =A0 { .input =3D &tegra_clk_pclk, .value =3D 0},
> + =A0 =A0 =A0 { 0, 0},
> +};
> +
> =A0#define PERIPH_CLK(_name, _dev, _con, _clk_num, _reg, _max, _input=
s, _flags) \
> =A0 =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0=3D _name, =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> @@ -1604,6 +1609,7 @@ static struct clk_mux_sel mux_clk_32k[] =3D {
> =A0 =A0 =A0 =A0}
>
> =A0struct clk tegra_periph_clks[] =3D {
> + =A0 =A0 =A0 PERIPH_CLK("apbdma", =A0 =A0"tegra-dma", =A0 =A0 =A0 =A0=
 =A0 =A0NULL, =A0 34, =A0 =A0 0, =A0 =A0 =A0108000000, mux_pclk, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00),
> =A0 =A0 =A0 =A0PERIPH_CLK("rtc", =A0 =A0 =A0 "rtc-tegra", =A0 =A0 =A0=
 =A0 =A0 =A0NULL, =A0 4, =A0 =A0 =A00, =A0 =A0 =A032768, =A0 =A0 mux_cl=
k_32k, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PERIPH_NO_RESET),
> =A0 =A0 =A0 =A0PERIPH_CLK("timer", =A0 =A0 "timer", =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0NULL, =A0 5, =A0 =A0 =A00, =A0 =A0 =A026000000, =A0mux_clk_=
m, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0),
> =A0 =A0 =A0 =A0PERIPH_CLK("i2s1", =A0 =A0 =A0"i2s.0", =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0NULL, =A0 11, =A0 =A0 0x100, =A026000000, =A0mux_pllaou=
t0_audio2x_pllp_clkm, =A0 =A0 =A0MUX | DIV_U71),
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Pushed to tegra for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

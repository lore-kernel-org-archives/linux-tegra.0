From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
Date: Tue, 23 Apr 2019 09:49:28 +0200
Message-ID: <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
 <20190418111211.10474-2-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418111211.10474-2-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>, Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, Anatolij Gustschin <agust@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra <linux-tegra@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Pengutronix Kernel Team <kernel@pengutron>
List-Id: linux-tegra@vger.kernel.org

Hi Jonas,

On Thu, Apr 18, 2019 at 1:12 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> Add a clock specific flag to switch register accesses to big endian, to
> allow runtime configuration of big endian divider clocks.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> V2 -> V3:
>  * fix passed arguments to clk_div_readl found by kbuild
>  * drop unneeded else in clk_div_readl
> V1 -> V2:
>  * switch from global to local flag
>
>  drivers/clk/clk-divider.c    | 26 ++++++++++++++++++++++----
>  include/linux/clk-provider.h |  4 ++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index e5a17265cfaf..25c7404e376c 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -25,6 +25,24 @@
>   * parent - fixed parent.  No clk_set_parent support
>   */
>
> +static inline u32 clk_div_readl(struct clk_divider *divider)
> +{
> +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +               return ioread32be(divider->reg);
> +
> +       return clk_readl(divider->reg);
> +}
> +
> +static inline void clk_div_writel(struct clk_divider *divider, u32 val)
> +{
> +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +               iowrite32be(val, divider->reg);
> +       else
> +               clk_writel(val, divider->reg);
> +}
> +
> +#define div_mask(width)        ((1 << (width)) - 1)

What's the purpose of adding this definition?
It does not seem to be used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 04:37:17 +0800
Message-ID: <CAEExFWu=DC_kjYFgk90RexUXJrqpA27L_ruu9tiLN-N=c3dL1g@mail.gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, john@p
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2019 at 4:44 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>
> On 09.12.2019 21:58, Yangtao Li wrote:
> > Use devm_platform_ioremap_resource() to simplify code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >   drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > index c0aff7ca6374..10ae712447c6 100644
> > --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> > @@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
> >       struct clk_hw_onecell_data *clk_data;
> >       const struct imx8qxp_ss_lpcg *ss_lpcg;
> >       const struct imx8qxp_lpcg_data *lpcg;
> > -     struct resource *res;
> >       struct clk_hw **clks;
> >       void __iomem *base;
> >       int i;
> > @@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
> >       if (!ss_lpcg)
> >               return -ENODEV;
> >
> > -     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     if (!res)
> > -             return -EINVAL;
> > -     base = devm_ioremap(dev, res->start, resource_size(res));
> > +     base = devm_platform_ioremap_resource(pdev, 0);
> >       if (!base)
> >               return -ENOMEM;
>
> This breaks imx8qxp-mek boot by causing most peripherals (like uart) to
> fail to probe.
>
> The old and new paths are not equivalent: devm_platform_ioremap_resource
> calls devm_ioremap_resource which differs from devm_ioremap by also
> calling devm_request_mem_region.
>
> This prevents other mappings in the area and imx8qxp-lpcg nodes map
> whole hardware "subsystems" and overlap most peripherals. For example:
>
>                   adma_lpcg: clock-controller@59000000 {
>                           compatible = "fsl,imx8qxp-lpcg-adma";
>                           reg = <0x59000000 0x2000000>;
>                           #clock-cells = <1>;
>                 };

It's a bit surprising that the clock driver does such a large mapping.

So, it is best to check the dts reg configuration of the driver.


Yours,
Yangtao

>
>                  adma_lpuart0: serial@5a060000 {
>                         reg = <0x5a060000 0x1000>;
>                         ...
>                 };
>
> I don't know if this issue affects any other platforms (imx8 lpcg
> bindings are unusual) but if you found this with an automated tool
> perhaps it should be adjusted?
>
> By my count it's the 4th time this incorrect cleanup was posted.
>
> Previously: https://lkml.org/lkml/2019/12/4/487
>
> --
> Regards,
> Leonard

From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Mon, 9 Dec 2019 20:44:39 +0000
Message-ID: <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Yangtao Li <tiny.windzz@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, john@p
List-Id: linux-tegra@vger.kernel.org

On 09.12.2019 21:58, Yangtao Li wrote:=0A=
> Use devm_platform_ioremap_resource() to simplify code.=0A=
> =0A=
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>=0A=
> ---=0A=
>   drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----=0A=
>   1 file changed, 1 insertion(+), 5 deletions(-)=0A=
> =0A=
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx=
8qxp-lpcg.c=0A=
> index c0aff7ca6374..10ae712447c6 100644=0A=
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c=0A=
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c=0A=
> @@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_dev=
ice *pdev)=0A=
>   	struct clk_hw_onecell_data *clk_data;=0A=
>   	const struct imx8qxp_ss_lpcg *ss_lpcg;=0A=
>   	const struct imx8qxp_lpcg_data *lpcg;=0A=
> -	struct resource *res;=0A=
>   	struct clk_hw **clks;=0A=
>   	void __iomem *base;=0A=
>   	int i;=0A=
> @@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_de=
vice *pdev)=0A=
>   	if (!ss_lpcg)=0A=
>   		return -ENODEV;=0A=
>   =0A=
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A=
> -	if (!res)=0A=
> -		return -EINVAL;=0A=
> -	base =3D devm_ioremap(dev, res->start, resource_size(res));=0A=
> +	base =3D devm_platform_ioremap_resource(pdev, 0);=0A=
>   	if (!base)=0A=
>   		return -ENOMEM;=0A=
=0A=
This breaks imx8qxp-mek boot by causing most peripherals (like uart) to =0A=
fail to probe.=0A=
=0A=
The old and new paths are not equivalent: devm_platform_ioremap_resource=0A=
calls devm_ioremap_resource which differs from devm_ioremap by also =0A=
calling devm_request_mem_region.=0A=
=0A=
This prevents other mappings in the area and imx8qxp-lpcg nodes map =0A=
whole hardware "subsystems" and overlap most peripherals. For example:=0A=
=0A=
                  adma_lpcg: clock-controller@59000000 {=0A=
                          compatible =3D "fsl,imx8qxp-lpcg-adma";=0A=
                          reg =3D <0x59000000 0x2000000>;=0A=
                          #clock-cells =3D <1>;=0A=
		};=0A=
=0A=
                 adma_lpuart0: serial@5a060000 {=0A=
			reg =3D <0x5a060000 0x1000>;=0A=
			...=0A=
		};=0A=
=0A=
I don't know if this issue affects any other platforms (imx8 lpcg =0A=
bindings are unusual) but if you found this with an automated tool =0A=
perhaps it should be adjusted?=0A=
=0A=
By my count it's the 4th time this incorrect cleanup was posted.=0A=
=0A=
Previously: https://lkml.org/lkml/2019/12/4/487=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=

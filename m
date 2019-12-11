From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Wed, 11 Dec 2019 17:51:35 +0000 (UTC)
Message-ID: <alpine.DEB.2.21.999.1912111743560.32095@utopia.booyaka.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191210132146.GF2703785@ulmo>
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@v>
List-Id: linux-tegra@vger.kernel.org

+ Dong

On Tue, 10 Dec 2019, Thierry Reding wrote:

> On Mon, Dec 09, 2019 at 08:44:39PM +0000, Leonard Crestez wrote:
>
> > This breaks imx8qxp-mek boot by causing most peripherals (like uart) to 
> > fail to probe.
> > 
> > The old and new paths are not equivalent: devm_platform_ioremap_resource
> > calls devm_ioremap_resource which differs from devm_ioremap by also 
> > calling devm_request_mem_region.
> > 
> > This prevents other mappings in the area and imx8qxp-lpcg nodes map 
> > whole hardware "subsystems" and overlap most peripherals. For example:
> > 
> >                   adma_lpcg: clock-controller@59000000 {
> >                           compatible = "fsl,imx8qxp-lpcg-adma";
> >                           reg = <0x59000000 0x2000000>;
> >                           #clock-cells = <1>;
> > 		};
> > 
> >                  adma_lpuart0: serial@5a060000 {
> > 			reg = <0x5a060000 0x1000>;
> > 			...
> > 		};
> 
> The whole point of doing a request_mem_region() is to avoid having
> multiple drivers trample on each others' mappings. What you do above
> doesn't look right. Why does that clock controller need access to 32
> MiB of I/O memory space?

Thierry's right; your DT data looks broken.  Unfortunately the IMX8M TRM 
requires some sort of signup to download, so I can't easily read it, but 
based on files like this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/imx/clk-imx8qxp-lpcg.h

it looks like what should be in the DT instead is either a large set of 
smaller register ranges, or a set of separate DT nodes/drivers: one per 
peripheral LPCG instance.  That should avoid the overlapping memory range 
issue.


- Paul

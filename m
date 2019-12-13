From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to
 devm_platform_ioremap_resource
Date: Fri, 13 Dec 2019 16:05:41 +0800
Message-ID: <CAGb2v67Ec3KPZZqAWHwx00ii1L+va-QTa78mj=4pFFCBVtwscw@mail.gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: kstewart@linuxfoundation.org, pgaikwad@nvidia.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, geert+renesas@glider.be, chunhui.dai@mediatek.com, Mike Turquette <mturquette@baylibre.com>, palmer@sifive.com, nsekhar@ti.com, Tomasz Figa <tomasz.figa@gmail.com>, rfontana@redhat.com, Thierry Reding <thierry.reding@gmail.com>, weiyongjun1@huawei.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, Rob Herring <robh@kernel.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, Krzysztof Kozlowski <krzk@kernel.org>, jonathanh@nvidia.com, Chanwoo Choi <cw00.choi@samsung.com>, John Crispin <john@phrozen.org>, agross@kernel.org, linux-imx@nxp.com, Eugeniy Paltsev <Eugeniy.Palt>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2019 at 3:58 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c    | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c     | 4 +---
>  drivers/clk/sunxi/clk-mod0.c             | 4 +---
>  drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 4 +---
>  drivers/clk/sunxi/clk-sun6i-apb0.c       | 4 +---
>  drivers/clk/sunxi/clk-sun6i-ar100.c      | 4 +---
>  drivers/clk/sunxi/clk-sun8i-apb0.c       | 4 +---
>  13 files changed, 13 insertions(+), 39 deletions(-)

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

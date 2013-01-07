From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 08/11] clk: tegra: add clock support for tegra30
Date: Mon, 7 Jan 2013 16:54:30 +0200
Message-ID: <20130107145430.GH26066@tbergstrom-lnx.Nvidia.com>
References: <1356619644-18565-1-git-send-email-pgaikwad@nvidia.com>
 <1356619644-18565-9-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1356619644-18565-9-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 27, 2012 at 03:47:21PM +0100, Prashant Gaikwad wrote:
> Add tegra30 clock support based on common clock framework.
> 
> Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>
> ---
>  drivers/clk/tegra/Makefile      |    1 +
>  drivers/clk/tegra/clk-tegra30.c | 1968 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |    6 +
>  3 files changed, 1975 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/clk/tegra/clk-tegra30.c
> 
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 00484fd..2b41b0f 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -8,3 +8,4 @@ obj-y                                   += clk-pll-out.o
>  obj-y                                  += clk-super.o
> 
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
> +obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> new file mode 100644
> index 0000000..a5496fe
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -0,0 +1,1968 @@
> +/*
> + * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +

...

> +       TEGRA_INIT_DATA_MUX("i2c1",     "div-clk",      "tegra-i2c.0",          mux_pllp_clkm,          CLK_SOURCE_I2C1,        12,     &periph_l_regs, TEGRA_PERIPH_ON_APB, i2c1),
> +       TEGRA_INIT_DATA_MUX("i2c2",     "div-clk",      "tegra-i2c.1",          mux_pllp_clkm,          CLK_SOURCE_I2C2,        54,     &periph_h_regs, TEGRA_PERIPH_ON_APB, i2c2),
> +       TEGRA_INIT_DATA_MUX("i2c3",     "div-clk",      "tegra-i2c.2",          mux_pllp_clkm,          CLK_SOURCE_I2C3,        67,     &periph_u_regs, TEGRA_PERIPH_ON_APB, i2c3),
> +       TEGRA_INIT_DATA_MUX("i2c4",     "div-clk",      "tegra-i2c.3",          mux_pllp_clkm,          CLK_SOURCE_I2C4,        103,    &periph_v_regs, TEGRA_PERIPH_ON_APB, i2c4),
> +       TEGRA_INIT_DATA_MUX("i2c5",     "div-clk",      "tegra-i2c.4",          mux_pllp_clkm,          CLK_SOURCE_I2C5,        47,     &periph_h_regs, TEGRA_PERIPH_ON_APB, i2c5),

These clocks have a 16bit divider according to the TRM, so I think you need
a new type for this?

Cheers,

Peter.

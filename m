From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 01/11] clk: tegra: Add tegra specific clocks
Date: Mon, 7 Jan 2013 14:13:47 +0200
Message-ID: <20130107121347.GG26066@tbergstrom-lnx.Nvidia.com>
References: <1356619644-18565-1-git-send-email-pgaikwad@nvidia.com>
 <1356619644-18565-2-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1356619644-18565-2-git-send-email-pgaikwad@nvidia.com>
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

On Thu, Dec 27, 2012 at 03:47:14PM +0100, Prashant Gaikwad wrote:
> Add tegra specific clocks, pll, pll_out, peripheral,
> frac_divider, super.
> 

...

> diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
> new file mode 100644
> index 0000000..60a117b
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-pll-out.c
> @@ -0,0 +1,124 @@
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
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +
> +#include "clk.h"
> +
> +#define to_clk_pll_out(_hw) container_of(_hw, struct tegra_clk_pll_out, hw)
> +
> +#define pll_out_enb(p) (BIT(p->enb_bit_idx))
> +#define pll_out_rst(p) (BIT(p->rst_bit_idx))
> +

Given that these 2 are always consecutive bits, wouldn't it make more sense to
specify the bit offset once and then add 1 for the enable bit?

Cheers,

Peter.

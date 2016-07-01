From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: drm/tegra: sor: Implement sor1_brick clock
Date: Fri, 1 Jul 2016 23:58:13 +0300
Message-ID: <20160701205813.GA12447@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry Reding,

The patch a7ba8310c7f5: "drm/tegra: sor: Implement sor1_brick clock"
from Oct 1, 2015, leads to the following static checker warning:

	drivers/gpu/drm/tegra/sor.c:318 tegra_clk_sor_brick_get_parent()
	warn: assigning (-22) to unsigned variable 'parent'

drivers/gpu/drm/tegra/sor.c
   314  static u8 tegra_clk_sor_brick_get_parent(struct clk_hw *hw)
               ^^
returns u8.

   315  {
   316          struct tegra_clk_sor_brick *brick = to_brick(hw);
   317          struct tegra_sor *sor = brick->sor;
   318          u8 parent = -EINVAL;
                ^^^^^^^^^^^^^^^^^^^
can't be -EINVAL.

   319          u32 value;
   320  
   321          value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
   322  
   323          switch (value & SOR_CLK_CNTRL_DP_CLK_SEL_MASK) {
   324          case SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_PCLK:
   325          case SOR_CLK_CNTRL_DP_CLK_SEL_DIFF_PCLK:
   326                  parent = 0;
   327                  break;
   328  
   329          case SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK:
   330          case SOR_CLK_CNTRL_DP_CLK_SEL_DIFF_DPCLK:
   331                  parent = 1;
   332                  break;
   333          }
   334  
   335          return parent;
   336  }

regards,
dan carpenter

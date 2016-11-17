From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] clk: tegra: Add BPMP clock driver
Date: Thu, 17 Nov 2016 15:59:54 +0300
Message-ID: <20161117125645.GA32763@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry Reding,

The patch 569d53d81e37: "clk: tegra: Add BPMP clock driver" from Aug
18, 2016, leads to the following static checker warning:

	drivers/clk/tegra/clk-bpmp.c:183 tegra_bpmp_clk_get_parent()
	warn: sizeof(&pointer)?

drivers/clk/tegra/clk-bpmp.c
   171  static u8 tegra_bpmp_clk_get_parent(struct clk_hw *hw)
   172  {
   173          struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
   174          struct cmd_clk_get_parent_response response;
   175          struct tegra_bpmp_clk_message msg;
   176          unsigned int i;
   177          int err;
   178  
   179          memset(&msg, 0, sizeof(msg));
   180          msg.cmd = CMD_CLK_GET_PARENT;
   181          msg.clk = clk->id;
   182          msg.rx.data = &response;
   183          msg.rx.size = sizeof(&response);

This should almost certainly sizeof(response). int vs pointer.

   184  
   185          err = tegra_bpmp_clk_transfer(clk->bpmp, &msg);
   186          if (err < 0) {
   187                  dev_err(clk->bpmp->dev, "failed to get parent for %s: %d\n",

regards,
dan carpenter

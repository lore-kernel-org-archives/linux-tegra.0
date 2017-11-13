From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] clk: tegra: dfll: Properly clean up on failure and
 removal
Date: Mon, 13 Nov 2017 14:00:49 +0300
Message-ID: <20171113110049.fkjrxptvxfef3cg4@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry Reding,

The patch f7c42d986217: "clk: tegra: dfll: Properly clean up on
failure and removal" from Apr 8, 2016, leads to the following static
checker warning:

	drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:140 tegra124_dfll_fcpu_remove()
	error: 'soc' dereferencing possible ERR_PTR()

drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
   131  static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
   132  {
   133          struct tegra_dfll_soc_data *soc;
   134  
   135          soc = tegra_dfll_unregister(pdev);
   136          if (IS_ERR(soc))
                           ^^^
   137                  dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
   138                          PTR_ERR(soc));
   139  
   140          tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   141  
   142          return 0;
   143  }


regards,
dan carpenter

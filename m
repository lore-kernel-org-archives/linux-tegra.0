From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: clk: tegra: Add closed loop support for the DFLL
Date: Sat, 23 May 2015 20:15:49 +0300
Message-ID: <20150523171549.GA27611@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Tuomas Tynkkynen,

The patch 435874b0fdf4: "clk: tegra: Add closed loop support for the
DFLL" from May 13, 2015, leads to the following static checker
warning:

	drivers/clk/tegra/clk-dfll.c:1448 dfll_build_i2c_lut()
	warn: unsigned 'td->i2c_lut[0]' is never less than zero.

drivers/clk/tegra/clk-dfll.c
  1446          v = td->soc->min_millivolts * 1000;
  1447          td->i2c_lut[0] = find_vdd_map_entry_exact(td, v);
  1448          if (td->i2c_lut[0] < 0)
                    ^^^^^^^^^^^^^^^^^^
Never true.

  1449                  goto out;
  1450  

regards,
dan carpenter

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Do not print errors for clk_round_rate()
Date: Wed, 27 Nov 2013 23:33:24 +0100
Message-ID: <20131127223324.GA25278@luegisland.agner.local>
References: <1385569563-25408-1-git-send-email-treding@nvidia.com>
 <20131127163442.GA25458@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131127163442.GA25458-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 27, 2013 at 05:34:43PM +0100, Thierry Reding wrote:
> Cc'ing Stefan, since he reported this error or IRC. Stefan, can you
> check whether this fixes the issue you were seeing? In case you're not
> subscribed, please let me know and I'll resend the patch.

I am. The stacktrace for the records:

[    1.501717] _calc_rate: Failed to set pll_d rate 1142000000
[    1.507272] ------------[ cut here ]------------
[    1.511889] WARNING: CPU: 0 PID: 1 at drivers/clk/tegra/clk-pll.c:394 _calc_rate+0x288/0x2a0()
[    1.520491] Modules linked in:
[    1.523542] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W    3.13.0-rc1-00144-g5f53252-dirty #43
[    1.532672] [<c0015b84>] (unwind_backtrace+0x0/0xf8) from [<c0011864>] (show_stack+0x10/0x14)
[    1.541194] [<c0011864>] (show_stack+0x10/0x14) from [<c0552854>] (dump_stack+0x80/0xc0)
[    1.549272] [<c0552854>] (dump_stack+0x80/0xc0) from [<c00256d8>] (warn_slowpath_common+0x64/0x88)
[    1.558225] [<c00256d8>] (warn_slowpath_common+0x64/0x88) from [<c0025718>] (warn_slowpath_null+0x1c/0x24)
[    1.567870] [<c0025718>] (warn_slowpath_null+0x1c/0x24) from [<c03b6df4>] (_calc_rate+0x288/0x2a0)
[    1.576822] [<c03b6df4>] (_calc_rate+0x288/0x2a0) from [<c03b7fd8>] (clk_pll_round_rate+0x74/0x94)
[    1.585774] [<c03b7fd8>] (clk_pll_round_rate+0x74/0x94) from [<c03b3dcc>] (__clk_round_rate+0x6c/0x8c)
[    1.595072] [<c03b3dcc>] (__clk_round_rate+0x6c/0x8c) from [<c03b3e08>] (clk_round_rate+0x1c/0x2c)
[    1.604023] [<c03b3e08>] (clk_round_rate+0x1c/0x2c) from [<c02a0528>] (tegra_output_hdmi_check_mode+0x24/0x3c)
[    1.614018] [<c02a0528>] (tegra_output_hdmi_check_mode+0x24/0x3c) from [<c029faf8>] (tegra_connector_mode_valid+0x3c/0x58)
[    1.625054] [<c029faf8>] (tegra_connector_mode_valid+0x3c/0x58) from [<c027ed1c>] (drm_helper_probe_single_connector_modes+0x278/0x334)
[    1.637216] [<c027ed1c>] (drm_helper_probe_single_connector_modes+0x278/0x334) from [<c027f768>] (drm_fb_helper_probe_connector_modes+0x48/0x68)
[    1.650158] [<c027f768>] (drm_fb_helper_probe_connector_modes+0x48/0x68) from [<c02810b0>] (drm_fb_helper_initial_config+0x134/0x4b8)
[    1.662145] [<c02810b0>] (drm_fb_helper_initial_config+0x134/0x4b8) from [<c029bb74>] (tegra_drm_fb_init+0x94/0x108)
[    1.672658] [<c029bb74>] (tegra_drm_fb_init+0x94/0x108) from [<c029abc4>] (tegra_drm_load+0x94/0xc0)
[    1.681784] [<c029abc4>] (tegra_drm_load+0x94/0xc0) from [<c0289644>] (drm_dev_register+0x94/0x188)
[    1.690822] [<c0289644>] (drm_dev_register+0x94/0x188) from [<c029a7bc>] (drm_host1x_init+0x38/0x94)
[    1.699939] [<c029a7bc>] (drm_host1x_init+0x38/0x94) from [<c02a4e90>] (host1x_subdev_register+0xb8/0xd4)
[    1.709497] [<c02a4e90>] (host1x_subdev_register+0xb8/0xd4) from [<c02a5170>] (host1x_attach_driver+0x2c4/0x308)
[    1.719662] [<c02a5170>] (host1x_attach_driver+0x2c4/0x308) from [<c02a5678>] (host1x_register+0x60/0x84)
[    1.729224] [<c02a5678>] (host1x_register+0x60/0x84) from [<c02a64a4>] (host1x_probe+0x1c8/0x260)
[    1.738091] [<c02a64a4>] (host1x_probe+0x1c8/0x260) from [<c02b04dc>] (platform_drv_probe+0x18/0x48)
[    1.747217] [<c02b04dc>] (platform_drv_probe+0x18/0x48) from [<c02af144>] (driver_probe_device+0x114/0x22c)
[    1.756949] [<c02af144>] (driver_probe_device+0x114/0x22c) from [<c02af2e8>] (__driver_attach+0x8c/0x90)
[    1.766419] [<c02af2e8>] (__driver_attach+0x8c/0x90) from [<c02ad920>] (bus_for_each_dev+0x54/0x88)
[    1.775459] [<c02ad920>] (bus_for_each_dev+0x54/0x88) from [<c02ae8f0>] (bus_add_driver+0xd4/0x1d0)
[    1.784496] [<c02ae8f0>] (bus_add_driver+0xd4/0x1d0) from [<c02af904>] (driver_register+0x78/0xf4)
[    1.793449] [<c02af904>] (driver_register+0x78/0xf4) from [<c0772898>] (tegra_host1x_init+0x20/0x48)
[    1.802576] [<c0772898>] (tegra_host1x_init+0x20/0x48) from [<c0008a3c>] (do_one_initcall+0xec/0x148)
[    1.811787] [<c0008a3c>] (do_one_initcall+0xec/0x148) from [<c075bbec>] (kernel_init_freeable+0xfc/0x1c8)
[    1.821346] [<c075bbec>] (kernel_init_freeable+0xfc/0x1c8) from [<c054e1cc>] (kernel_init+0x8/0x118)
[    1.830472] [<c054e1cc>] (kernel_init+0x8/0x118) from [<c000e738>] (ret_from_fork+0x14/0x3c)
[    1.838888] ---[ end trace 2b7e969b76d1ea4d ]---
[    1.843499] ------------[ cut here ]------------
[    1.848108] WARNING: CPU: 0 PID: 1 at drivers/clk/tegra/clk-pll.c:571 clk_pll_round_rate+0x88/0x94()
[    1.857225] Modules linked in:
[    1.860284] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W    3.13.0-rc1-00144-g5f53252-dirty #43
[    1.869404] [<c0015b84>] (unwind_backtrace+0x0/0xf8) from [<c0011864>] (show_stack+0x10/0x14)
[    1.877927] [<c0011864>] (show_stack+0x10/0x14) from [<c0552854>] (dump_stack+0x80/0xc0)
[    1.886014] [<c0552854>] (dump_stack+0x80/0xc0) from [<c00256d8>] (warn_slowpath_common+0x64/0x88)
[    1.894966] [<c00256d8>] (warn_slowpath_common+0x64/0x88) from [<c0025718>] (warn_slowpath_null+0x1c/0x24)
[    1.904612] [<c0025718>] (warn_slowpath_null+0x1c/0x24) from [<c03b7fec>] (clk_pll_round_rate+0x88/0x94)
[    1.914085] [<c03b7fec>] (clk_pll_round_rate+0x88/0x94) from [<c03b3dcc>] (__clk_round_rate+0x6c/0x8c)
[    1.923388] [<c03b3dcc>] (__clk_round_rate+0x6c/0x8c) from [<c03b3e08>] (clk_round_rate+0x1c/0x2c)
[    1.932341] [<c03b3e08>] (clk_round_rate+0x1c/0x2c) from [<c02a0528>] (tegra_output_hdmi_check_mode+0x24/0x3c)
[    1.942336] [<c02a0528>] (tegra_output_hdmi_check_mode+0x24/0x3c) from [<c029faf8>] (tegra_connector_mode_valid+0x3c/0x58)
[    1.953373] [<c029faf8>] (tegra_connector_mode_valid+0x3c/0x58) from [<c027ed1c>] (drm_helper_probe_single_connector_modes+0x278/0x334)
[    1.965534] [<c027ed1c>] (drm_helper_probe_single_connector_modes+0x278/0x334) from [<c027f768>] (drm_fb_helper_probe_connector_modes+0x48/0x68)
[    1.978476] [<c027f768>] (drm_fb_helper_probe_connector_modes+0x48/0x68) from [<c02810b0>] (drm_fb_helper_initial_config+0x134/0x4b8)
[    1.990463] [<c02810b0>] (drm_fb_helper_initial_config+0x134/0x4b8) from [<c029bb74>] (tegra_drm_fb_init+0x94/0x108)
[    2.000977] [<c029bb74>] (tegra_drm_fb_init+0x94/0x108) from [<c029abc4>] (tegra_drm_load+0x94/0xc0)
[    2.010094] [<c029abc4>] (tegra_drm_load+0x94/0xc0) from [<c0289644>] (drm_dev_register+0x94/0x188)
[    2.019131] [<c0289644>] (drm_dev_register+0x94/0x188) from [<c029a7bc>] (drm_host1x_init+0x38/0x94)
[    2.028257] [<c029a7bc>] (drm_host1x_init+0x38/0x94) from [<c02a4e90>] (host1x_subdev_register+0xb8/0xd4)
[    2.037825] [<c02a4e90>] (host1x_subdev_register+0xb8/0xd4) from [<c02a5170>] (host1x_attach_driver+0x2c4/0x308)
[    2.047993] [<c02a5170>] (host1x_attach_driver+0x2c4/0x308) from [<c02a5678>] (host1x_register+0x60/0x84)
[    2.057552] [<c02a5678>] (host1x_register+0x60/0x84) from [<c02a64a4>] (host1x_probe+0x1c8/0x260)
[    2.066419] [<c02a64a4>] (host1x_probe+0x1c8/0x260) from [<c02b04dc>] (platform_drv_probe+0x18/0x48)
[    2.075546] [<c02b04dc>] (platform_drv_probe+0x18/0x48) from [<c02af144>] (driver_probe_device+0x114/0x22c)
[    2.085280] [<c02af144>] (driver_probe_device+0x114/0x22c) from [<c02af2e8>] (__driver_attach+0x8c/0x90)
[    2.094753] [<c02af2e8>] (__driver_attach+0x8c/0x90) from [<c02ad920>] (bus_for_each_dev+0x54/0x88)
[    2.103791] [<c02ad920>] (bus_for_each_dev+0x54/0x88) from [<c02ae8f0>] (bus_add_driver+0xd4/0x1d0)
[    2.112829] [<c02ae8f0>] (bus_add_driver+0xd4/0x1d0) from [<c02af904>] (driver_register+0x78/0xf4)
[    2.121787] [<c02af904>] (driver_register+0x78/0xf4) from [<c0772898>] (tegra_host1x_init+0x20/0x48)
[    2.130915] [<c0772898>] (tegra_host1x_init+0x20/0x48) from [<c0008a3c>] (do_one_initcall+0xec/0x148)
[    2.140118] [<c0008a3c>] (do_one_initcall+0xec/0x148) from [<c075bbec>] (kernel_init_freeable+0xfc/0x1c8)
[    2.149677] [<c075bbec>] (kernel_init_freeable+0xfc/0x1c8) from [<c054e1cc>] (kernel_init+0x8/0x118)
[    2.158804] [<c054e1cc>] (kernel_init+0x8/0x118) from [<c000e738>] (ret_from_fork+0x14/0x3c)
[    2.167252] ---[ end trace 2b7e969b76d1ea4e ]---

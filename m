From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.7-rc1
Date: Wed, 25 Mar 2020 23:45:38 +0300
Message-ID: <d20adc1e-2996-e215-95f8-2487a648cd08@gmail.com>
References: <20200313170409.2922165-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313170409.2922165-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

13.03.2020 20:04, Thierry Reding пишет:
> Hi Mike, Stephen,
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-clk
> 
> for you to fetch changes up to efdd205ccbfaa80bd932bc2fba498026c09db502:
> 
>   clk: tegra: Remove audio clocks configuration from clock driver (2020-03-12 12:10:49 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> clk: tegra: Changes for v5.7-rc1
> 
> These changes remove PMC clocks from the clock and reset controller
> driver because they are controlled by bits in the PMC controller.

Hello Thierry,

Since the audio-clk patches haven't been updated and applied, now there
are warnings in the kernel log. Please work with Sowjanya to fix it in
5.7, thanks in advance.

[    2.079453] tegra30-i2s 70080400.i2s: DMA channels sourced from
device 70080000.ahub
[    2.079898] ------------[ cut here ]------------
[    2.079995] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:954
clk_core_disable+0xa5/0x1f4
[    2.080135] pmc_clk_out_1 already disabled
[    2.080209] Modules linked in:
[    2.080290] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.080429] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.080587] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.080686] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.080834] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.080975] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.081064] [<c011e7fd>] (warn_slowpath_fmt) from [<c046fde9>]
(clk_core_disable+0xa5/0x1f4)
[    2.081207] [<c046fde9>] (clk_core_disable) from [<c046ff4f>]
(clk_core_disable_lock+0x17/0x20)
[    2.081360] [<c046ff4f>] (clk_core_disable_lock) from [<c0751fa7>]
(tegra_asoc_utils_set_rate+0x53/0x208)
[    2.081509] [<c0751fa7>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.081661] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.081763] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.081910] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.082056] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.082201] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.082291] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.082434] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.082578] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.082722] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.082815] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.082962] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.083111] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.083256] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.083340] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.083475] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.083567] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.083707] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.083846] ---[ end trace c0759f12f3d44704 ]---
[    2.083954] ------------[ cut here ]------------
[    2.084101] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:812
clk_core_unprepare+0xab/0x1a8
[    2.084185] pmc_clk_out_1 already unprepared
[    2.084313] Modules linked in:
[    2.084393] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.084535] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.084623] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.084770] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.084915] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.085001] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.085146] [<c011e7fd>] (warn_slowpath_fmt) from [<c0472417>]
(clk_core_unprepare+0xab/0x1a8)
[    2.085290] [<c0472417>] (clk_core_unprepare) from [<c0472531>]
(clk_unprepare+0x1d/0x28)
[    2.085438] [<c0472531>] (clk_unprepare) from [<c0751fad>]
(tegra_asoc_utils_set_rate+0x59/0x208)
[    2.085530] [<c0751fad>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.085677] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.085826] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.085972] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.086062] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.086206] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.086350] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.086493] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.086583] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.086724] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.086869] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.087014] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.087105] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.087248] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.087387] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.087468] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.087609] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.087749] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.087828] ---[ end trace c0759f12f3d44705 ]---
[    2.087957] ------------[ cut here ]------------
[    2.088039] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:954
clk_core_disable+0xa5/0x1f4
[    2.088176] pll_a_out0 already disabled
[    2.088250] Modules linked in:
[    2.088329] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.088470] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.088611] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.088756] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.088846] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.088985] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.089127] [<c011e7fd>] (warn_slowpath_fmt) from [<c046fde9>]
(clk_core_disable+0xa5/0x1f4)
[    2.089216] [<c046fde9>] (clk_core_disable) from [<c046ff4f>]
(clk_core_disable_lock+0x17/0x20)
[    2.089361] [<c046ff4f>] (clk_core_disable_lock) from [<c0751fb5>]
(tegra_asoc_utils_set_rate+0x61/0x208)
[    2.089507] [<c0751fb5>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.089654] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.089802] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.089893] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.090035] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.090179] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.090322] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.090411] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.090570] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.090713] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.090803] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.090946] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.091090] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.091178] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.091261] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.091395] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.091481] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.091620] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.091752] ---[ end trace c0759f12f3d44706 ]---
[    2.091829] ------------[ cut here ]------------
[    2.091911] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:812
clk_core_unprepare+0xab/0x1a8
[    2.092048] pll_a_out0 already unprepared
[    2.092176] Modules linked in:
[    2.092256] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.092397] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.092484] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.092630] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.092773] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.092858] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.093001] [<c011e7fd>] (warn_slowpath_fmt) from [<c0472417>]
(clk_core_unprepare+0xab/0x1a8)
[    2.093147] [<c0472417>] (clk_core_unprepare) from [<c0472531>]
(clk_unprepare+0x1d/0x28)
[    2.093237] [<c0472531>] (clk_unprepare) from [<c0751fbb>]
(tegra_asoc_utils_set_rate+0x67/0x208)
[    2.093382] [<c0751fbb>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.093530] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.093680] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.093827] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.093917] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.094061] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.094204] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.094349] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.094437] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.094579] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.094723] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.094868] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.094959] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.095104] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.095242] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.095322] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.095463] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.095603] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.095745] ---[ end trace c0759f12f3d44707 ]---
[    2.095884] ------------[ cut here ]------------
[    2.095968] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:954
clk_core_disable+0xa5/0x1f4
[    2.096105] pll_a already disabled
[    2.096180] Modules linked in:
[    2.096259] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.096401] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.096545] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.096692] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.096782] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.096921] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.097010] [<c011e7fd>] (warn_slowpath_fmt) from [<c046fde9>]
(clk_core_disable+0xa5/0x1f4)
[    2.097153] [<c046fde9>] (clk_core_disable) from [<c046ff4f>]
(clk_core_disable_lock+0x17/0x20)
[    2.097300] [<c046ff4f>] (clk_core_disable_lock) from [<c0751fc3>]
(tegra_asoc_utils_set_rate+0x6f/0x208)
[    2.097447] [<c0751fc3>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.097594] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.097688] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.097780] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.097925] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.098069] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.098214] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.098303] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.098447] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.098590] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.098680] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.098825] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.098971] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.099114] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.099196] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.099330] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.099472] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.099559] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.099692] ---[ end trace c0759f12f3d44708 ]---
[    2.099795] ------------[ cut here ]------------
[    2.099943] WARNING: CPU: 1 PID: 1 at drivers/clk/clk.c:812
clk_core_unprepare+0xab/0x1a8
[    2.100028] pll_a already unprepared
[    2.100157] Modules linked in:
[    2.100235] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
5.6.0-rc7-next-20200325-00206-g2a91360087e3-dirty #1927
[    2.100377] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.100465] [<c010d97d>] (unwind_backtrace) from [<c01093d5>]
(show_stack+0x11/0x14)
[    2.100556] [<c01093d5>] (show_stack) from [<c098f411>]
(dump_stack+0x85/0x94)
[    2.100701] [<c098f411>] (dump_stack) from [<c011e53d>]
(__warn+0xc1/0xc4)
[    2.100786] [<c011e53d>] (__warn) from [<c011e7fd>]
(warn_slowpath_fmt+0x61/0x78)
[    2.100929] [<c011e7fd>] (warn_slowpath_fmt) from [<c0472417>]
(clk_core_unprepare+0xab/0x1a8)
[    2.101074] [<c0472417>] (clk_core_unprepare) from [<c0472531>]
(clk_unprepare+0x1d/0x28)
[    2.101220] [<c0472531>] (clk_unprepare) from [<c0751fc9>]
(tegra_asoc_utils_set_rate+0x75/0x208)
[    2.101312] [<c0751fc9>] (tegra_asoc_utils_set_rate) from
[<c07521d1>] (tegra_asoc_utils_init+0x75/0x118)
[    2.101458] [<c07521d1>] (tegra_asoc_utils_init) from [<c07544ed>]
(tegra_rt5640_probe+0xd5/0x130)
[    2.101607] [<c07544ed>] (tegra_rt5640_probe) from [<c0526ce3>]
(platform_drv_probe+0x33/0x68)
[    2.101753] [<c0526ce3>] (platform_drv_probe) from [<c052556f>]
(really_probe+0x14f/0x240)
[    2.101897] [<c052556f>] (really_probe) from [<c0525767>]
(driver_probe_device+0x43/0x11c)
[    2.101987] [<c0525767>] (driver_probe_device) from [<c052594d>]
(device_driver_attach+0x3d/0x40)
[    2.102130] [<c052594d>] (device_driver_attach) from [<c0525987>]
(__driver_attach+0x37/0x78)
[    2.102274] [<c0525987>] (__driver_attach) from [<c052418b>]
(bus_for_each_dev+0x43/0x6c)
[    2.102418] [<c052418b>] (bus_for_each_dev) from [<c0524c9f>]
(bus_add_driver+0xe3/0x148)
[    2.102507] [<c0524c9f>] (bus_add_driver) from [<c0526155>]
(driver_register+0x39/0xa0)
[    2.102651] [<c0526155>] (driver_register) from [<c0101d71>]
(do_one_initcall+0x45/0x1e4)
[    2.102795] [<c0101d71>] (do_one_initcall) from [<c100108f>]
(kernel_init_freeable+0x153/0x1a4)
[    2.102886] [<c100108f>] (kernel_init_freeable) from [<c099fa09>]
(kernel_init+0xd/0xd0)
[    2.103027] [<c099fa09>] (kernel_init) from [<c010015d>]
(ret_from_fork+0x11/0x34)
[    2.103164] Exception stack(0xde907fb0 to 0xde907ff8)
[    2.103243] 7fa0:                                     00000000
00000000 00000000 00000000
[    2.103384] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.103523] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.103602] ---[ end trace c0759f12f3d44709 ]---

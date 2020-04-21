From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 00/22] Move PMC clocks into Tegra PMC driver
Date: Tue, 21 Apr 2020 14:52:11 +0100
Message-ID: <64b70163-05be-e4f9-2dbc-5088ac2a3af9@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/01/2020 07:24, Sowjanya Komatineni wrote:
> This patch series moves Tegra PMC clocks from clock driver to pmc driver
> along with the device trees changes and audio driver which uses one of
> the pmc clock for audio mclk.
> 
> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
> are currently registered by Tegra clock driver using clk_regiser_mux and
> clk_register_gate which performs direct Tegra PMC register access.
> 
> When Tegra PMC is in secure mode, any access from non-secure world will
> not go through.
> 
> This patch series adds these Tegra PMC clocks and blink controls to Tegra
> PMC driver with PMC as clock provider and removes them from Tegra clock
> driver.
> 
> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru Tegra210
> and clock driver does inital parent configuration for it and enables them.
> But this clock should be taken care by audio driver as there is no need
> to have this clock pre enabled.
> 
> So, this series also includes patch that updates ASoC utils to take
> care of parent configuration for mclk if device tree don't specify
> initial parent configuration using assigned-clock-parents and enable
> audio mclk during utils init.
> 
> DTs are also updated to use clk_out_1 as audio mclk rather than extern1.
> 
> This series also includes a patch for mclk fallback to extern1 when
> retrieving mclk fails to have this backward compatible of new DT with
> old kernels.


On the current mainline kernel I am seeing the following WARNING on boot
for tegra20-ventana, tegra30-cardhu-a04 and tegra124-jetson-tk1 ...

[   10.723511] ------------[ cut here ]------------

[   10.730901] WARNING: CPU: 0 PID: 126 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/clk/clk.c:954 clk_core_disable+0xf4/0x280

[   10.745986] cdev1 already disabled

[   10.752309] Modules linked in: snd_soc_tegra_wm8903(+) snd_soc_tegra20_i2s snd_soc_tegra_utils snd_soc_tegra_pcm snd_soc_wm8903 snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore snd_soc_tegra20_das

[   10.778071] CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.7.0-rc2-next-20200420-g6735c84f78e4 #1

[   10.790485] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)

[   10.800088] [<c0311a70>] (unwind_backtrace) from [<c030bd14>] (show_stack+0x10/0x14)

[   10.811227] [<c030bd14>] (show_stack) from [<c0714710>] (dump_stack+0xc0/0xd4)

[   10.821863] [<c0714710>] (dump_stack) from [<c0345b64>] (__warn+0xe0/0xf8)

[   10.832118] [<c0345b64>] (__warn) from [<c0345bf0>] (warn_slowpath_fmt+0x74/0xb8)

[   10.843006] [<c0345bf0>] (warn_slowpath_fmt) from [<c0812dcc>] (clk_core_disable+0xf4/0x280)

[   10.854863] [<c0812dcc>] (clk_core_disable) from [<c0812f70>] (clk_core_disable_lock+0x18/0x24)

[   10.867021] [<c0812f70>] (clk_core_disable_lock) from [<bf072230>] (tegra_asoc_utils_set_rate+0x74/0x2b4 [snd_soc_tegra_utils])

[   10.882055] [<bf072230>] (tegra_asoc_utils_set_rate [snd_soc_tegra_utils]) from [<bf072504>] (tegra_asoc_utils_init+0x94/0xb90 [snd_soc_tegra_utils])

[   10.899177] [<bf072504>] (tegra_asoc_utils_init [snd_soc_tegra_utils]) from [<bf07c558>] (tegra_wm8903_driver_probe+0x294/0x310 [snd_soc_tegra_wm8903])

[   10.916562] [<bf07c558>] (tegra_wm8903_driver_probe [snd_soc_tegra_wm8903]) from [<c09d2944>] (platform_drv_probe+0x48/0x98)

[   10.931678] [<c09d2944>] (platform_drv_probe) from [<c09d09f0>] (really_probe+0x218/0x348)

[   10.943886] [<c09d09f0>] (really_probe) from [<c09d0c60>] (driver_probe_device+0x60/0x168)

[   10.956140] [<c09d0c60>] (driver_probe_device) from [<c09d0f10>] (device_driver_attach+0x58/0x60)

[   10.969029] [<c09d0f10>] (device_driver_attach) from [<c09d0f98>] (__driver_attach+0x80/0xbc)

[   10.981613] [<c09d0f98>] (__driver_attach) from [<c09ced9c>] (bus_for_each_dev+0x74/0xb4)

[   10.993891] [<c09ced9c>] (bus_for_each_dev) from [<c09cfd90>] (bus_add_driver+0x164/0x1e8)

[   11.006298] [<c09cfd90>] (bus_add_driver) from [<c09d1a1c>] (driver_register+0x7c/0x114)

[   11.018586] [<c09d1a1c>] (driver_register) from [<c0302040>] (do_one_initcall+0x54/0x22c)

[   11.031016] [<c0302040>] (do_one_initcall) from [<c03ddc98>] (do_init_module+0x60/0x210)

[   11.043370] [<c03ddc98>] (do_init_module) from [<c03dcdac>] (load_module+0x1f9c/0x2480)

[   11.055684] [<c03dcdac>] (load_module) from [<c03dd4b4>] (sys_finit_module+0xac/0xd8)

[   11.067843] [<c03dd4b4>] (sys_finit_module) from [<c03002a0>] (__sys_trace_return+0x0/0x20)

[   11.080560] Exception stack(0xede3bfa8 to 0xede3bff0)

[   11.089988] bfa0:                   b6eb9a8c 00000000 00000010 b6eb91bc 00000000 b6eb9cd0

[   11.102625] bfc0: b6eb9a8c 00000000 fca6e200 0000017b 00555918 bea799ac 00000000 00564640

[   11.115289] bfe0: bea798a8 bea79898 b6eb3951 b6f61f42

[   11.124833] ---[ end trace 3752c80347dfd3ca ]---


It appears that some of the patches in this series made v5.7-rc1 but not
all and I am guessing the ASoC changes are the ones we are missing to
avoid this.

Sowjanya, any ideas on the best way to resolve this for v5.7?

Cheers
Jon

-- 
nvpublic

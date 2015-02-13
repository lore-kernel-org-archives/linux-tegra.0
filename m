From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: DSI panel not working on -next
Date: Fri, 13 Feb 2015 15:29:09 +0900
Message-ID: <54DD99B5.2080504@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

I noticed that the DSI panel of SHIELD (tegra114-roth) was not brought 
up on -next. I have bisected the following commit as introducing that 
behavior:

commit f4c5cf88fbd50e4779042268947b2e2f90c20484
Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Thu Dec 18 15:29:14 2014 +0100

     gpu: host1x: Provide a proper struct bus_type


With and without this patch, the DSI panel is probed, but the stack 
trace in the probe() function is different:


Working case:
[    2.045189] [<c02f4cc8>] (panel_simple_probe) from [<c02f4e6c>] 
(panel_simple_dsi_probe+0x2c/0x64)
[    2.054159] [<c02f4e6c>] (panel_simple_dsi_probe) from [<c0303618>] 
(driver_probe_device+0x108/0x23c)
[    2.063413] [<c0303618>] (driver_probe_device) from [<c0301c84>] 
(bus_for_each_drv+0x64/0x98)
[    2.072027] [<c0301c84>] (bus_for_each_drv) from [<c03034e0>] 
(device_attach+0x74/0x88)
[    2.080126] [<c03034e0>] (device_attach) from [<c0302bcc>] 
(bus_probe_device+0x84/0xa8)
[    2.088227] [<c0302bcc>] (bus_probe_device) from [<c0300fac>] 
(device_add+0x398/0x520)
[    2.096248] [<c0300fac>] (device_add) from [<c02e35cc>] 
(mipi_dsi_host_register+0xb8/0x198)
[    2.104698] [<c02e35cc>] (mipi_dsi_host_register) from [<c02f0ad4>] 
(tegra_dsi_probe+0x2dc/0x4d4)
[    2.113611] [<c02f0ad4>] (tegra_dsi_probe) from [<c0304d74>] 
(platform_drv_probe+0x44/0xa4)
[    2.122031] [<c0304d74>] (platform_drv_probe) from [<c0303618>] 
(driver_probe_device+0x108/0x23c)
[    2.130991] [<c0303618>] (driver_probe_device) from [<c0301c84>] 
(bus_for_each_drv+0x64/0x98)
[    2.139608] [<c0301c84>] (bus_for_each_drv) from [<c03034e0>] 
(device_attach+0x74/0x88)
[    2.147706] [<c03034e0>] (device_attach) from [<c0302bcc>] 
(bus_probe_device+0x84/0xa8)
[    2.155806] [<c0302bcc>] (bus_probe_device) from [<c0302fec>] 
(deferred_probe_work_func+0x64/0x94)
[    2.164863] [<c0302fec>] (deferred_probe_work_func) from [<c0038c5c>] 
(process_one_work+0x120/0x330)
[    2.174033] [<c0038c5c>] (process_one_work) from [<c00394cc>] 
(worker_thread+0x4c/0x474)
[    2.182193] [<c00394cc>] (worker_thread) from [<c003d548>] 
(kthread+0xdc/0xf4)
[    2.189505] [<c003d548>] (kthread) from [<c000e8c0>] 
(ret_from_fork+0x14/0x34)


Failure case:
[    1.540582] [<c03067f0>] (panel_simple_probe) from [<c0306994>] 
(panel_simple_dsi_probe+0x2c/0x64)
[    1.549731] [<c0306994>] (panel_simple_dsi_probe) from [<c030ced8>] 
(driver_probe_device+0x108/0x23c)
[    1.559145] [<c030ced8>] (driver_probe_device) from [<c030d0dc>] 
(__driver_attach+0x8c/0x90)
[    1.567763] [<c030d0dc>] (__driver_attach) from [<c030b498>] 
(bus_for_each_dev+0x6c/0xa0)
[    1.576122] [<c030b498>] (bus_for_each_dev) from [<c030c700>] 
(bus_add_driver+0x148/0x1f0)
[    1.584565] [<c030c700>] (bus_add_driver) from [<c030d6e0>] 
(driver_register+0x78/0xf8)
[    1.592723] [<c030d6e0>] (driver_register) from [<c09792c8>] 
(panel_simple_init+0x28/0x34)
[    1.601160] [<c09792c8>] (panel_simple_init) from [<c0008b30>] 
(do_one_initcall+0x8c/0x1d4)
[    1.609697] [<c0008b30>] (do_one_initcall) from [<c095ddc8>] 
(kernel_init_freeable+0x144/0x1e4)
[    1.618577] [<c095ddc8>] (kernel_init_freeable) from [<c0675da8>] 
(kernel_init+0x8/0xe8)
[    1.626850] [<c0675da8>] (kernel_init) from [<c000e8c0>] 
(ret_from_fork+0x14/0x34)


i.e. with f4c5cf88fbd, the panel is not probed from tegra_dsi_probe() 
anymore, which means DSI remains without a valid connector:

[    1.378513] [drm] Initialized drm 1.1.0 20060810
[    1.384564] 54300000.dsi supply avdd-dsi-csi not found, using dummy 
regulator
[    1.396394] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.403021] [drm] No driver support for vblank timestamp query.
[    1.409080] drm drm: No connectors reported connected with modes
[    1.415128] [drm] Cannot find any crtc or sizes - going 1024x768


Are you aware of this? Does it affect other DSI panels? Does SHIELD's DT 
need an update of some sort?

Cheers,
Alex.

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Port SDIO GPIO to DTS
Date: Thu, 18 Jan 2018 03:38:20 +0300
Message-ID: <91eab00b-9cfa-f150-369e-2426f9b9dc42@gmail.com>
References: <20180117221318.GA1594@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180117221318.GA1594-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle Evans <kvans32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Kyle,

On 18.01.2018 01:13, Kyle Evans wrote:
> I have an ASUS TF101(ventana) that I am trying to get running on 
> mainline. It is mostly there, but there are a few issues that I believe 
> to be dts related. I am focusing on one at a time. Currently, when I 
> warm boot/reboot, the wireless SDIO device fails to initialize. It 
> works great on cold boot. I'm fairly certain the problem is in the 
> dts, but I'd like some feedback on the correct way.
> 
> From a working, pre-dts kernel I have stuff like this.
> 
> arch/arm/mach-tegra/board-tf101-sdhci.c:
> ...
> #define TF101_WLAN_RST  TEGRA_GPIO_PK6
> #define TF101_WLAN_WOW  TEGRA_GPIO_PS0
> #define TF101_SDIO_WOW  TEGRA_GPIO_PY6
> ...
> static struct embedded_sdio_data embedded_sdio_data1 = {
>         .cccr   = {
>                 .sdio_vsn       = 2,
>                 .multi_block    = 1,
>                 .low_speed      = 0,
>                 .wide_bus       = 0,
>                 .high_power     = 1,
>                 .high_speed     = 1,
>         },
>         .cis  = {
>                 .vendor         = 0x02d0,
>                 .device         = 0x4329,
>         },
> 
> static struct tegra_sdhci_platform_data tegra_sdhci_platform_data1 = {
>         .mmc_data = {
>                 .register_status_notify = tf101_wifi_status_register,
>                 .embedded_sdio = &embedded_sdio_data1,
>                 .built_in = 0,
>         },
>         .wow_gpio = TF101_SDIO_WOW,
>         .cd_gpio = -1,
>         .wp_gpio = -1,
>         .power_gpio = -1,
>         .max_clk_limit = 40000000,
> };
> ...
> static int tf101_wifi_power(int on)
> {
>         pr_debug("%s: %d\n", __func__, on);
> 
> #if 0
>         gpio_set_value(TF101_WLAN_PWR, on);
>         mdelay(100);
> #endif
>         gpio_set_value(TF101_WLAN_RST, on);
>         mdelay(200);
> 
>         return 0;
> }
> 
> static int tf101_wifi_reset(int on)
> {
>         pr_debug("%s: do nothing\n", __func__);
>         return 0;
> }
> 
> static int __init tf101_wifi_init(void)
> {
>         //gpio_request(TF101_WLAN_PWR, "wlan_power");
>         gpio_request(TF101_WLAN_RST, "wlan_rst");
>         gpio_request(TF101_WLAN_WOW, "bcmsdh_sdmmc");
> 
>         //tegra_gpio_enable(TF101_WLAN_PWR);
>         tegra_gpio_enable(TF101_WLAN_RST);
>         tegra_gpio_enable(TF101_WLAN_WOW);
> 
>         //gpio_direction_output(TF101_WLAN_PWR, 0);
>         gpio_direction_output(TF101_WLAN_RST, 0);
>         gpio_direction_input(TF101_WLAN_WOW);
> 
>         platform_device_register(&tf101_wifi_device);
> 
>         device_init_wakeup(&tf101_wifi_device.dev, 1);
>         device_set_wakeup_enable(&tf101_wifi_device.dev, 0);
> 
>         return 0;
> }
> ...
> 
> It looks like I have three GPIO lines dealing with mmc0/wlan. Can I 
> assume WOW is Wireless pOWer?

WoW should stand for Wake on Wireless [0]. You could ping your TF101 while it
is suspended and it will wake up.

[0] https://wireless.wiki.kernel.org/en/users/documentation/wowlan

> I'm not sure of the difference between WLAN_WOW & SDIO_WOW. I'm 
> assuming one for chip, one for radio, but I don't know their place in 
> the dts.
> 
> From tegra20-ventana.dts I've got:
> 
> 	sdhci@c8000000 {
>                 status = "okay";
>                 power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
>                 bus-width = <4>;
>                 keep-power-in-suspend;
>         };
> 
> I'm guessing I need to add the other pins to power-gpois and 
> set up mmc-pwrseq?

The 'power-gpois' that you've defined looks fine and probably sufficient to get
WiFi up and running.

Take a look at the changes that were needed to get WiFi working on Acer A500,
maybe some of it also applicable to TF101:

https://github.com/digetx/picasso_upstream_support/commit/beab29d4f172836c5faad91d3232a7c77c5fc6fb
https://github.com/digetx/picasso_upstream_support/commit/165e488e82c97fa1da6ccfe832a43569136000bc
https://github.com/digetx/picasso_upstream_support/commit/7e584ca4108707c6469a04bf92d9b659ce76c5cc
https://github.com/digetx/picasso_upstream_support/commit/4f0d7ac43592826e03f766005a3720ecc5ad1476#diff-4ce775d33b1aadd3981ea13ea140eca6R702

Also note that (at least on A500) BCM chip also provides Bluetooth and the
'power/rst' GPIO affects both Wifi and Bluetooth.

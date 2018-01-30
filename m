From: Kyle Evans <kvans32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Port SDIO GPIO to DTS
Date: Mon, 29 Jan 2018 21:52:29 -0500
Message-ID: <20180130025229.GA1183@localhost.localdomain>
References: <20180117221318.GA1594@localhost.localdomain>
 <91eab00b-9cfa-f150-369e-2426f9b9dc42@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <91eab00b-9cfa-f150-369e-2426f9b9dc42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kyle Evans <kvans32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

* Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello Kyle,
> 
> On 18.01.2018 01:13, Kyle Evans wrote:
> > I have an ASUS TF101(ventana) that I am trying to get running on 
> > mainline. It is mostly there, but there are a few issues that I believe 
> > to be dts related. I am focusing on one at a time. Currently, when I 
> > warm boot/reboot, the wireless SDIO device fails to initialize. It 
> > works great on cold boot. I'm fairly certain the problem is in the 
> > dts, but I'd like some feedback on the correct way.
> >

> > I'm not sure of the difference between WLAN_WOW & SDIO_WOW. I'm 
> > assuming one for chip, one for radio, but I don't know their place in 
> > the dts.
> > 
> > From tegra20-ventana.dts I've got:
> > 
> > 	sdhci@c8000000 {
> >                 status = "okay";
> >                 power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
> >                 bus-width = <4>;
> >                 keep-power-in-suspend;
> >         };
> > 
> > I'm guessing I need to add the other pins to power-gpois and 
> > set up mmc-pwrseq?
> 
> The 'power-gpois' that you've defined looks fine and probably sufficient to get
> WiFi up and running.
> 
> Take a look at the changes that were needed to get WiFi working on Acer A500,
> maybe some of it also applicable to TF101:

Thanks for this. I have made some progress by adding regulator nodes 
for pins D,1 & K,6, but am now getting the following error on second 
boot.

[    2.425281] mmc2: Invalid maximum block size, assuming 512 bytes
[    2.480692] mmc2: SDHCI controller on c8000000.sdhci [c8000000.sdhci] using ADMA
[    2.494647] mmc2: error -110 whilst initialising SDIO card

> 
> https://github.com/digetx/picasso_upstream_support/commit/beab29d4f172836c5faad91d3232a7c77c5fc6fb
  HACK: mmc: sdio: Add workaround for wrongly reported CCCR

Would you recommend this over setting cap-sd-highspeed in the DT?
Without either communication has been trouble free thus far. 

> https://github.com/digetx/picasso_upstream_support/commit/165e488e82c97fa1da6ccfe832a43569136000bc
  mmc: Add "ignore mmc pm notify" functionality

This does not apply cleanly, what are the symptoms?

> https://github.com/digetx/picasso_upstream_support/commit/7e584ca4108707c6469a04bf92d9b659ce76c5cc
  ARM: tegra: Add Picasso board file

I am trying to implement this, but as-is boot hangs before u-boot clears.

static struct gpiod_lookup_table bluetooth_gpio_lookup = {
       .dev_id = "rfkill_gpio.1",
       .table = {
               GPIO_LOOKUP("tegra-gpio", 160, "reset", 0),
               { },
       },
}

Where does 160 come from?

static int __init tegra_picasso_wifi_pwr_and_reset(void)
{
       if (!of_machine_is_compatible("acer,picasso"))
               return 0;

       writel(0x00004000, IO_TO_VIRT(0x6000D928));
       writel(0x00004040, IO_TO_VIRT(0x6000D918));
       writel(0x00004040, IO_TO_VIRT(0x6000D908));

       writel(0x00000200, IO_TO_VIRT(0x6000D82C));
       writel(0x00000202, IO_TO_VIRT(0x6000D81C));
       writel(0x00000202, IO_TO_VIRT(0x6000D80C));

       writel(0x00004040, IO_TO_VIRT(0x6000D928));
       mdelay(100);

       writel(0x00000202, IO_TO_VIRT(0x6000D82C));
       mdelay(200);

       return 0;
}

What is this magic, or where to find it in a stock kernel? 

> https://github.com/digetx/picasso_upstream_support/commit/4f0d7ac43592826e03f766005a3720ecc5ad1476#diff-4ce775d33b1aadd3981ea13ea140eca6R702
  ARM: dt: tegra: Add Picasso board dts

> 
> Also note that (at least on A500) BCM chip also provides Bluetooth and the
> 'power/rst' GPIO affects both Wifi and Bluetooth.

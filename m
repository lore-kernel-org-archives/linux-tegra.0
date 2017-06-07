From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: u-boot-flasher fails with current u-boot
Date: Tue, 6 Jun 2017 21:13:01 -0600
Message-ID: <CAPnjgZ08jAH7OgTwQj6m5E1R26AqkwBiZEnPxHwWr==K=f9oWQ@mail.gmail.com>
References: <84tw3sk7sq.wl-Peter.Chubb@data61.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <84tw3sk7sq.wl-Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chubb <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On 6 June 2017 at 17:36,  <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org> wrote:
> Recent changes to U-Boot have broken u-boot-flasher.    I now see,
> after
>         ./tegra-uboot-flasher flash jetson-tk1
> on the serial port:
>   >>> Selecting MMC device...
>   tegra_mmc_send_cmd_bounced: MMC Timeout
>     Interrupt status        0x00000001
>     Interrupt status enable 0xffff003b
>     Interrupt signal enable 0xffff0002
>     Present status          0x01fb02f6
>   mmc_init: -1, time 8042
>
> and nothing is flashed to the MMC.
>
> I can do
>      ./tegra-uboot-flasher exec jetson-tk1
> and everything works as expected.  The running-from-RAM u-boot can
> access the MMC.
>
> The patch in U-Boot that causes the problems (found by git-bisect) is
> 0e513e788f tegra: convert MMC to use driver model for operations

Oh dear. I cannot find my board but will see if I can repeat this on a beaver.

>
> --
> Dr Peter Chubb         Tel: +61 2 9490 5852      http://ts.data61.csiro.au/
> Trustworthy Systems Group                           Data61 (formerly NICTA)

Regards,
Simon

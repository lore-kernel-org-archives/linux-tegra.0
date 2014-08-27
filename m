From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/9] pinctrl: tegra-xusb: Add USB PHY support
Date: Wed, 27 Aug 2014 09:44:02 -0700
Message-ID: <CAL1qeaHMa_KrqQyPgvJssOnW8mefQ8KPO9+WdkVODbY2XJe_LQ@mail.gmail.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
	<1408381705-3623-5-git-send-email-abrestic@chromium.org>
	<53FB8CFE.3090007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB8CFE.3090007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel@lists>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 25, 2014 at 12:22 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>>
>> In addition to the PCIe and SATA PHYs, the XUSB pad controller also
>> supports 3 UTMI, 2 HSIC, and 2 USB3 PHYs.  Each USB3 PHY uses a single
>> PCIe or SATA lane and is mapped to one of the three UTMI ports.
>>
>> The xHCI controller will also send messages intended for the PHY driver,
>> so request and listen for messages on the mailbox's PHY channel.
>
>
> I'd like a review from Thierry here as the HW expert.
>
> I need an ack from LinusW in order to take this pinctrl patch through the
> Tegra tree.
>
>> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c
>> b/drivers/pinctrl/pinctrl-tegra-xusb.c
>
>
>> +static int usb3_phy_power_on(struct phy *phy)
>> +{
>> +       struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
>> +       int port = usb3_phy_to_port(phy);
>> +       int lane = padctl->usb3_ports[port].lane;
>> +       u32 value, offset;
>> +
>> +       if (!is_pcie_or_sata_lane(lane)) {
>> +               dev_err(padctl->dev, "USB3 PHY %d mapped to invalid lane:
>> %d\n",
>> +                       port, lane);
>> +               return -EINVAL;
>> +       }
>
>
> An aside: This implies that the SATA driver should be talking to this
> pinctrl driver and explicitly powering on the XUSB pins. However, the SATA
> driver doesn't depend on this series. I'm a bit confused how that works.
> Perhaps it's just by accident? Mikko, can you comment?

As Mikko mentioned, the enabling of the SATA lane in
usb3_phy_power_on() is for when the SATA lane is being used for USB3.

>> +static int utmi_phy_to_port(struct phy *phy)
>> +{
>> +       struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
>> +       int i;
>> +
>> +       for (i = 0; i < TEGRA_XUSB_UTMI_PHYS; i++) {
>> +               if (phy == padctl->phys[TEGRA_XUSB_PADCTL_UTMI_P0 + i])
>> +                       break;
>> +       }
>> +       BUG_ON(i == TEGRA_XUSB_UTMI_PHYS);
>
>
> Can this be triggered by e.g. bad DT content? If so, returning an error
> would be nicer. The comment applies to other xxx_to_port() functions.

No, it cannot.  The struct phy that's passed in here comes from the
PHY core and must be a PHY that we registered earlier in probe().

From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v2 4/9] pinctrl: tegra-xusb: Add USB PHY support
Date: Tue, 26 Aug 2014 10:29:33 +0300
Message-ID: <53FC375D.5060206@nvidia.com>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org> <1408381705-3623-5-git-send-email-abrestic@chromium.org> <53FB8CFE.3090007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FB8CFE.3090007@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Jassi Brar <jassisinghbrar@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 25/08/14 22:22, Stephen Warren wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
>> In addition to the PCIe and SATA PHYs, the XUSB pad controller also
>> supports 3 UTMI, 2 HSIC, and 2 USB3 PHYs.  Each USB3 PHY uses a single
>> PCIe or SATA lane and is mapped to one of the three UTMI ports.
>>
>> The xHCI controller will also send messages intended for the PHY driver,
>> so request and listen for messages on the mailbox's PHY channel.
>
> I'd like a review from Thierry here as the HW expert.
>
> I need an ack from LinusW in order to take this pinctrl patch through
> the Tegra tree.
>
>> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c
>> b/drivers/pinctrl/pinctrl-tegra-xusb.c
>
>> +static int usb3_phy_power_on(struct phy *phy)
>> +{
>> +    struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
>> +    int port = usb3_phy_to_port(phy);
>> +    int lane = padctl->usb3_ports[port].lane;
>> +    u32 value, offset;
>> +
>> +    if (!is_pcie_or_sata_lane(lane)) {
>> +        dev_err(padctl->dev, "USB3 PHY %d mapped to invalid lane: %d\n",
>> +            port, lane);
>> +        return -EINVAL;
>> +    }
>
> An aside: This implies that the SATA driver should be talking to this
> pinctrl driver and explicitly powering on the XUSB pins. However, the
> SATA driver doesn't depend on this series. I'm a bit confused how that
> works. Perhaps it's just by accident? Mikko, can you comment?

The SATA driver does depend on the pinctrl-tegra-xusb driver to power on 
the SATA lane. It looks like what this patch does is it adds support for 
using the SATA pad for USB3, in which case the SATA lane also needs to 
be powered on. At least that's the understanding I got from a quick read.

Mikko

From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V6 07/12] pinctrl: tegra-xusb: Add USB PHY support
Date: Wed, 26 Nov 2014 11:41:58 -0800
Message-ID: <CAL1qeaHZCh1AomPTQGKN-ytx7EyW8Gncb64S1ikGk0eB16maRA@mail.gmail.com>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
	<1416874644-12070-8-git-send-email-abrestic@chromium.org>
	<547488EB.2040507@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547488EB.2040507-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <li>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 25, 2014 at 5:49 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Tuesday 25 November 2014 05:47 AM, Andrew Bresticker wrote:
>> In addition to the PCIe and SATA PHYs, the XUSB pad controller also
>> supports 3 UTMI, 2 HSIC, and 2 USB3 PHYs.  Each USB3 PHY uses a single
>> PCIe or SATA lane and is mapped to one of the three UTMI ports.
>>
>> The xHCI controller will also send messages intended for the PHY driver,
>> so request and listen for messages on the mailbox's PHY channel.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> No changes from v5.
>> Changes from v4:
>>  - Disabled USB support on missing mailbox channel instead of failing
>>    to probe.
>>  - Made usb3-port a pinconfig property.
>>  - Addressed review comments from Thierry.
>> No changes from v3.
>> Changes from v2:
>>  - Added support for nvidia,otg-hs-curr-level-offset property.
>>  - Moved mailbox request handling to workqueue.
>>  - Added filtering out of non-PHY mailbox messages.
>>  - Dropped "-otg" from VBUS supplies.
>> Changes from v1:
>>  - Updated to use common mailbox API.
>>  - Added SATA PHY enable sequence for USB3 ports using the SATA lane.
>>  - Made USB3 port-to-lane mappins a top-level binding rather than a pinconfig
>>    binding.
>> ---
>>  drivers/pinctrl/Kconfig              |    1 +
>>  drivers/pinctrl/pinctrl-tegra-xusb.c | 1262 +++++++++++++++++++++++++++++++++-
>>  include/soc/tegra/xusb.h             |    7 +
>>  3 files changed, 1254 insertions(+), 16 deletions(-)
>
> The devm_phy_create() API has changed (see linux-phy next) and the patch that
> modified the existing devm_phy_create() in pinctrl-tegra-xusb.c has also been
> merged in linux-phy tree.

Ok, I'll rebase on top of that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] usb: host: ehci-tegra: Remove USB_PHY dependencies
 from Kconfig
Date: Tue, 19 Dec 2017 21:32:27 +0300
Message-ID: <74c031eb-64eb-5ff6-0c44-c1ab734e4dfc@gmail.com>
References: <Pine.LNX.4.44L0.1712191249030.1429-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1712191249030.1429-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 19.12.2017 20:52, Alan Stern wrote:
> On Sun, 17 Dec 2017, Dmitry Osipenko wrote:
> 
>> Previously tegra-phy driver was built only when ehci-tegra was, now
>> tegra-phy has its own Kconfig entry. Remove the USB_PHY dependencies
>> from ehci-tegra's Kconfig since they aren't useful anymore.
> 
> Are you sure they aren't useful?  Does this mean it is now
> possible/useful to configure a kernel with USB_EHCI_TEGRA enabled and
> USB_PHY disabled?

I'm not entirely sure that USB_TEGRA_PHY isn't useful because initially (in V1)
I proposed to do the other way around, to select PHY when ehci-tegra / chipidea
drivers are enabled. But that proposal wasn't very successful [0][1]. Yes, it
means that ehci-tegra could be built without the tegra-phy.

The USB_ULPI option isn't needed for compiling ehci-tegra, but for tegra-phy
driver. I've moved that option to the tegra-phy's Kconfig, see the previous
patch in the series ("Add Kconfig entry for Tegra PHY driver").

[0] https://marc.info/?l=linux-tegra&m=151307881119328
[1] https://marc.info/?l=linux-tegra&m=151294749618823

>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/host/Kconfig | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 6150bed7cfa8..5042e72c1b76 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -234,9 +234,6 @@ config USB_EHCI_TEGRA
>>         tristate "NVIDIA Tegra HCD support"
>>         depends on ARCH_TEGRA
>>         select USB_EHCI_ROOT_HUB_TT
>> -       select USB_PHY
>> -	select USB_ULPI
>> -	select USB_ULPI_VIEWPORT
> 
> Maybe you should add
> 
> 	select USB_TEGRA_PHY
> 
> here.  Also, what happened to USB_ULPI_VIEWPORT?  Is it still 
> important?  If not, then what changed?

USB_ULPI_VIEWPORT is selected by USB_ULPI, so we don't need to duplicate the
selection. See drivers/usb/phy/Kconfig.

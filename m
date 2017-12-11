From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] usb: chipidea: tegra: Select Tegra's PHY in
 Kconfig
Date: Mon, 11 Dec 2017 16:09:44 +0300
Message-ID: <6dddb581-e708-b96e-cf56-f3bf106117e2@gmail.com>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
 <d6b64530412955aba1284886b3f5f74e42d776da.1512947332.git.digetx@gmail.com>
 <20171211100400.GE10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211100400.GE10671@ulmo>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 13:04, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:10:00AM +0300, Dmitry Osipenko wrote:
>> UDC driver won't probe without Tegra's PHY, hence select it in the
>> Kconfig.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/chipidea/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
>> index 785f0ed037f7..2ef3b27ea72b 100644
>> --- a/drivers/usb/chipidea/Kconfig
>> +++ b/drivers/usb/chipidea/Kconfig
>> @@ -27,6 +27,7 @@ config USB_CHIPIDEA_PCI
>>  config USB_CHIPIDEA_UDC
>>  	bool "ChipIdea device controller"
>>  	depends on USB_GADGET
>> +	select USB_TEGRA_PHY if ARCH_TEGRA
> 
> This is kind of pointless given that USB_TEGRA_PHY originally was
> automatically enabled if ARCH_TEGRA was enabled.

Again, please take a closer look at the patches. USB_TEGRA_PHY was enabled if
USB_EHCI_TEGRA was and not ARCH_TEGRA.

> What do we gain by these two patches, other than maybe make the driver
> buildable as a module?

Firstly, tegra-phy is built only if ehci-tegra is built.

Secondly, I think we need to enforce Tegra PHY to be compiled as built-in if one
of ehci-tegra or chipidea drivers is built-in and the other is compiled as a module.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

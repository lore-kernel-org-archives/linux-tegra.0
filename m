From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 0/5] efuse driver for Tegra
Date: Fri, 30 May 2014 10:17:49 -0600
Message-ID: <5388AF2D.4060909@wwwdotorg.org>
References: <1401281677-32110-1-git-send-email-pdeschrijver@nvidia.com> <53878407.3050409@wwwdotorg.org> <20140530082356.GP5961@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140530082356.GP5961-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/30/2014 02:23 AM, Peter De Schrijver wrote:
> On Thu, May 29, 2014 at 09:01:27PM +0200, Stephen Warren wrote:
>> On 05/28/2014 06:54 AM, Peter De Schrijver wrote:
>>> This driver allows userspace to read the raw efuse data. Its userspace
>>> interface is modelled after the sunxi_sid driver which provides similar
>>> functionality for some Allwinner SoCs. It has been tested on
>>> Tegra20 (ventana), Tegra30 (beaverboard), Tegra114 (dalmore) and
>>> Tegra124 (jetson TK1).
>>
>>> Changes since v4:
>>>
>>> * Provide fallback to hardcoded 0x70000800 in case the apbmisc DT node is
>>>   missing. This is exactly what the current code does and prevents a system
>>>   crash in that case due to an invalid memory access by tegra_read_chipid()
>>
>> Wouldn't it be better to simply return an error?
> 
> This would mean you can't boot a system with these patches applied unless you
> also update the device tree. The system would crash during boot because CCF
> relies on tegra_read_chipid() as an APB barrier. Also tegra_boot_secondary()
> relies on the chipid to select the correct method for booting secondary cores.

Is this series really backwards-compatible anyway? tegra_init_fuse()
contains a whole bunch of places where resources are pulled out of DT,
and only one of those has a fallback to use APBMISC_BASE if the DT entry
isn't present.

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/6] misc: fuse: Add efuse driver for Tegra
Date: Tue, 07 Jan 2014 13:41:19 -0700
Message-ID: <52CC666F.1010501@wwwdotorg.org>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com> <1387891931-9854-3-git-send-email-pdeschrijver@nvidia.com> <52CB12D8.7000203@wwwdotorg.org> <20140107140502.GE26588@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140107140502.GE26588-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/07/2014 07:05 AM, Peter De Schrijver wrote:
> On Mon, Jan 06, 2014 at 09:32:24PM +0100, Stephen Warren wrote:
>> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
>>> Implement fuse driver for Tegra20, Tegra30, Tegra114 and Tegra124.

>>> diff --git a/drivers/misc/fuse/tegra/fuse-tegra20.c b/drivers/misc/fuse/tegra/fuse-tegra20.c
>>
>>> +static int fuse_size;
>>
>> I don't think that's used.
>>
>>> +static u32 tegra20_fuse_readl(const unsigned int offset)
>> ...
>>> +	ret = tegra_apb_readl_using_dma(fuse_phys + FUSE_BEGIN + offset, &val);
>>
>> Shouldn't this use the generic tegra_apb_readl(), so that it works
>> irrespective of whether the Tegra20 APB DMA driver is available?
>
> tegra_apb_readl() doesn't work reliably on Tegra20 for reading the fuses.
> So if the Tegra20 APB DMA, this driver should also be unavailable.

There's no "depends TEGRA20_APB_DMA" in the Kconfig. Perhaps
ARCH_TEGRA_2x_SOC or FUSE_TEGRA should "select TEGRA20_APB_DMA"?

>>> +static int tegra_fuse_probe(struct platform_device *pdev)
>> ...
>>> +	fuse_randomness();
>>
>> If this is a driver, and particularly if this could be in a module, is
>> there any guarantee at all that fuse_randomness() gets called early
>> enough to be useful?
> 
> For a module this might be true yes... Should we disallow this making a
> module?

That would simplify things, I expect...

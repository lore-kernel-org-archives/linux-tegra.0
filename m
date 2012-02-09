From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: use regmap for device register
 access.
Date: Thu, 9 Feb 2012 17:29:38 +0530
Message-ID: <4F33B52A.5020900@nvidia.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com> <20120208114120.GF3120@opensource.wolfsonmicro.com> <4F32676F.1010305@nvidia.com> <20120208130726.GB5943@opensource.wolfsonmicro.com> <4F3279D6.4000009@nvidia.com> <20120208135816.GE5943@opensource.wolfsonmicro.com> <4F335385.5040400@nvidia.com> <20120209115502.GD3058@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120209115502.GD3058-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 09 February 2012 05:25 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Feb 09, 2012 at 10:33:01AM +0530, Laxman Dewangan wrote:
>> On Wednesday 08 February 2012 07:28 PM, Mark Brown wrote:
>>> But that's just raw_write(), there's no benefit to the additional API
>>> call.
>> raw_write supported for the volatile register only.
>
> Note that there's a very important difference between the bulk and raw
> versions of the API which you're not taking into account: the bulk
> version takes care of endianness differences between the device and the
> host.  This would mean that for send we'd need to rewrite the input
> array which means we have to take a copy of the data as we probably
> shouldn't be changing the input data.
>
Yes, I am taking care of this. Probably my code will explain this :)

I have my patch ready. Let me send this..

> Indeed, looking at the drivers in mainline I can't actually see any of
> them which do block writes.
>
I am working on mfd/tps65910.c and function is:
static int tps65910_i2c_write(struct tps65910 *tps65910, u8 reg,
                                    int bytes, void *src)

All your feedback will help me to improve my next two mfd/pmic drivers 
which I am planning to upstream...


> * Unknown Key
> * 0x6E30FDDD

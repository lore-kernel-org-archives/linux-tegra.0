From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] regmap: add bulk_write() for non-volatile register
 set
Date: Thu, 9 Feb 2012 18:15:18 +0530
Message-ID: <4F33BFDE.7020006@nvidia.com>
References: <1328789531-10067-1-git-send-email-ldewangan@nvidia.com> <20120209121704.GF3058@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120209121704.GF3058-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "gregkh-l3A5Bk7waGM@public.gmane.org" <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 09 February 2012 05:47 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Feb 09, 2012 at 05:42:11PM +0530, Laxman Dewangan wrote:
>
>> +	if (vol || map->cache_type == REGCACHE_NONE) {
>> +		ret = _regmap_raw_write(map, reg, val, val_bytes * val_count);
> You still need to do the byte swap here.
I saw the regmap_raw_write() and it is using the same way without byte 
swapping.
Want to use the same function as it is.. I am not sure why do we require 
byte-swapping in this case. Required things will be done by 
_regmap_raw_write only.
This api just break the transfer in register-wise if any of the register 
is cached..

>> +	} else {
>> +		for (i = 0; i<  val_count; i++) {
>> +			memcpy(map->work_buf, val + (i * val_bytes), val_bytes);
>> +			ival = map->format.parse_val(map->work_buf);
> They're currently symmetric but really this should use format_val().
>
The format_val is require integer argument and issue is that I dont have 
this otherwise I need not to parse, can use directly.

Am I missing something here?


> * Unknown Key
> * 0x6E30FDDD

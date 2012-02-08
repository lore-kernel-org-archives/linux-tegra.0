From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: use regmap for device register
 access.
Date: Wed, 8 Feb 2012 17:45:43 +0530
Message-ID: <4F32676F.1010305@nvidia.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com> <20120208114120.GF3120@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120208114120.GF3120-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks for quick review.
On Wednesday 08 February 2012 05:11 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Feb 08, 2012 at 04:16:24PM +0530, Laxman Dewangan wrote:
>
>> +static bool is_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +	struct tps65910 *tps65910 = dev_get_drvdata(dev);
>> +	return test_bit(reg, tps65910->cache_reg) ? false : true;
>> +}
> This is *really* odd.  Why is this not static data (or mostly static
> data), why does it vary at runtime?
>
I did not wanted to make the list of register in core driver. Wanted to 
leave the decision to the sub-devices driver where they need to enable 
cache based on their requirements.
Do you think that the register list (although it is used in the 
regulator driver) should be in the core file? If this is allow then I 
can make the static table in core driver.

>> +static bool regmap_volatile_range(struct tps65910 *tps65910,
>> +			unsigned int reg, unsigned int bytes)
>> +{
>> +	unsigned int i;
>> +	for (i = 0; i<  bytes; i++)
>> +		if (!is_volatile_reg(tps65910->dev, reg + i))
>> +			return false;
>> +	return true;
>> +}
> I don't think this should be here (the naming is a bit of a clue - it's
> named like a core function), see below where you're using it...
>
Oops, the function is copied from the regmap and so this error... sorry..
There is no core function where bulk_write is happening on which some of 
register is cached.

>> +	unsigned char *wbuf = src;
>> +	unsigned int ival;
>> +
>> +	if (regmap_volatile_range(tps65910, reg, bytes))
>> +		return regmap_raw_write(tps65910->regmap, reg, src, bytes);
>> +
>> +	/* If any of register is non-volatile then use byte-wise transfer */
>> +	for (i = 0; i<  bytes; ++i) {
>> +		ival = (unsigned int) (*wbuf++);
>> +		ret = regmap_write(tps65910->regmap, reg, ival);
>> +		if (ret<  0)
>> +			return ret;
>> +	}
> There's nothing specific to the driver about this, if this is a good
> idea add support for it to the core.
>
This function added because there is no bulk_write function in core 
driver which supports the non-volatile in the list. Even if number of 
bytes read is 1.
Should we move the above logic to core driver?
- If any of the register is non-volatile in bulk write then split the 
transfer into the byte-wise/short-wise/long-wise (format.val_bytes) 
based on register width?
- If all register is volatile the uses the regmap_raw_write()

Does it sounds reasonable? If yes then I can move this code to regmap.c 
as regmap_bulk_write() i.e. new function.

>> +void tps65910_enable_reg_cache(struct tps65910 *tps65910, int reg)
>> +{
>> +	set_bit(reg, tps65910->cache_reg);
>> +}
>> +EXPORT_SYMBOL_GPL(tps65910_enable_reg_cache);
> Why are you doing this?  This looks very icky, and if it is needed there
> needs to be more code here to make sure the register cache and device
> are in sync.
I think If register are volatile  then read/write happen to device only 
i.e. without caching. There is no entry for such register in cache 
table. Once this is cache enable, new entry is created on cache and the 
first value for the cache-val is read from device. So it will be in 
sync. All read/writes are io-locked in regmap and so not seeing any 
issue here.


> * Unknown Key
> * 0x6E30FDDD

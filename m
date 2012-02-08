From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: use regmap for device register
 access.
Date: Wed, 8 Feb 2012 19:04:14 +0530
Message-ID: <4F3279D6.4000009@nvidia.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com> <20120208114120.GF3120@opensource.wolfsonmicro.com> <4F32676F.1010305@nvidia.com> <20120208130726.GB5943@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120208130726.GB5943-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 08 February 2012 06:37 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Feb 08, 2012 at 05:45:43PM +0530, Laxman Dewangan wrote:
>
>> I did not wanted to make the list of register in core driver. Wanted
>> to leave the decision to the sub-devices driver where they need to
>> enable cache based on their requirements.
>> Do you think that the register list (although it is used in the
>> regulator driver) should be in the core file? If this is allow then
>> I can make the static table in core driver.
> Yes, it should be in the core driver.
>
Fine, it will much simple in this case.

>
>> This function added because there is no bulk_write function in core
>> driver which supports the non-volatile in the list. Even if number
>> of bytes read is 1.
>> Should we move the above logic to core driver?
> This is the core driver?  If you mean the regmap core then yes.
>
Yes, change regmap core driver i.e. regmap.c
>> - If any of the register is non-volatile in bulk write then split
>> the transfer into the byte-wise/short-wise/long-wise
>> (format.val_bytes) based on register width?
>> - If all register is volatile the uses the regmap_raw_write()
>> Does it sounds reasonable? If yes then I can move this code to
>> regmap.c as regmap_bulk_write() i.e. new function.
> Yes, though bulk_write() is tricky as it's *really* unclear what it
> should take as an argument - should it be raw register size (in which
> case it's just raw_write()) or should it be ints (in which case it needs
> to repack the data too)?  I suspect ints but I'm really not convinced
> there's much use case for this.
>
  * @map: Register map to write to
  * @reg: Initial register to write to
  * @val: Block of data to be written, laid out for direct transmission 
to the
  *       device
  * @@val_count: Number of registers to write
int regmap_bulk_write(struct regmap *map, unsigned int reg, void *val,
                      size_t val_count)


only support if map->format.parse_val not null like bulk_read.

It will just do the regamp_raw_write() if all regs are volatile
otherwise make the unsigned int from the val by function 
map->format.parse_val for separate write for each register.

> * Unknown Key
> * 0x6E30FDDD

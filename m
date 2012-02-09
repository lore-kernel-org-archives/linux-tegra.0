From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: use regmap for device register
 access.
Date: Thu, 9 Feb 2012 10:33:01 +0530
Message-ID: <4F335385.5040400@nvidia.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com> <20120208114120.GF3120@opensource.wolfsonmicro.com> <4F32676F.1010305@nvidia.com> <20120208130726.GB5943@opensource.wolfsonmicro.com> <4F3279D6.4000009@nvidia.com> <20120208135816.GE5943@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120208135816.GE5943@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "lrg@ti.com" <lrg@ti.com>, "jedu@slimlogic.co.uk" <jedu@slimlogic.co.uk>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 08 February 2012 07:28 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Feb 08, 2012 at 07:04:14PM +0530, Laxman Dewangan wrote:
>> On Wednesday 08 February 2012 06:37 PM, Mark Brown wrote:
>>> Yes, though bulk_write() is tricky as it's *really* unclear what it
>>> should take as an argument - should it be raw register size (in which
>>> case it's just raw_write()) or should it be ints (in which case it needs
>>> to repack the data too)?  I suspect ints but I'm really not convinced
>>> there's much use case for this.
>>   * @map: Register map to write to
>>   * @reg: Initial register to write to
>>   * @val: Block of data to be written, laid out for direct transmission to the
>>   *       device
>>   * @@val_count: Number of registers to write
>> int regmap_bulk_write(struct regmap *map, unsigned int reg, void *val,
>>                       size_t val_count)
>> only support if map->format.parse_val not null like bulk_read.
>> It will just do the regamp_raw_write() if all regs are volatile
>> otherwise make the unsigned int from the val by function
>> map->format.parse_val for separate write for each register.
> But that's just raw_write(), there's no benefit to the additional API
> call.
>
raw_write supported for the volatile register only.
I require an api which can work for volatile as well as non-volatile 
registers.
Either extend raw_write to support both cases (remove warning and handle 
properly) or add bulk_write.

I think as bulk_read is there and so having bulk_write on same line 
should be OK.

> * Unknown Key
> * 0x6E30FDDD

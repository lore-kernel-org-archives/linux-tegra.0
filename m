From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Wed, 13 Apr 2016 14:30:57 +0530
Message-ID: <570E0AC9.9050701@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-5-git-send-email-ldewangan@nvidia.com> <570E07B7.1070209@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <570E07B7.1070209@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Wednesday 13 April 2016 02:17 PM, Jon Hunter wrote:
> On 12/04/16 15:56, Laxman Dewangan wrote:
>> NVIDIA Tegra210 supports some of the IO interface which can operate
>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>> Tegra PMC register to set different voltage level of IO interface based
>> on IO rail voltage from power supply i.e. power regulators.
>>
>> Add APIs to set and get IO rail voltage from the client driver.
> I think that we need some further explanation about the scenario when
> this is used. In other words, why this configuration needs to be done in
> the kernel versus the bootloader. Is this something that can change at
> runtime? I could see that for SD cards it may.

Yes, SDIO3.0 support needs dynamic IO rail voltage change and so pad 
voltage change.

>>   
>>   #define GPU_RG_CNTRL			0x2d4
>>   
>> +static DEFINE_SPINLOCK(tegra_pmc_access_lock);
>> +
> We already have a mutex for managing concurrent accesses, do we need this?
Mutex is sleeping calls and we really dont need this. This is sleep for 
small duration and we should do this in spinlock.


>>   
>> +
>> +static struct tegra_io_rail_voltage_bit_info tegra210_io_rail_voltage_info[] = {
>> +	TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
>> +	TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
>> +	TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
>> +	TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
>> +	TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
>> +	TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
>> +};
>> +
> You could simply this by having a look-up table similar to what we do
> for the powergates.
Revising the power gate code, it needs ID matches with bit location but 
it is not the case here. We need to have lookup from ID to  bit position.


>
>>   static u32 tegra_pmc_readl(unsigned long offset)
>>   {
>>   	return readl(pmc->base + offset);
>> @@ -175,6 +202,16 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
>>   	writel(value, pmc->base + offset);
>>   }
>>   
>> +static void _tegra_pmc_register_update(unsigned long addr, unsigned long mask,
>> +				       unsigned long val)
> u32 for mask and val. May be consider renaming to tegra_pmc_rmw().

update is common from the other framework like regmap so it is here.


>
>>   
>> +static int tegra_io_rail_voltage_get_bit_pos(int io_rail_id)
> All the tegra_io_rail_xxx() APIs just use "id" and it is an unsigned
> int. Any reason this needs to be an int? We should keep the naming and
> type consistent.

OK, will do.

>> +
>> +int tegra_io_rail_voltage_set(int io_rail, int val)
> Same here w.r.t "io_rail".
>
> Also it appears that "val" should only be 0 or 1 but we don't check for
> this. I see that you treat all non-zero values as '1' but that seems a
> bit funny. You may consider having the user pass uV and then you could
> check for either 3300000 or 1800000.

What about enums then?
May be we can use the DT binding header here.


>
>> +
>> +	spin_lock_irqsave(&tegra_pmc_access_lock, flags);
>> +	_tegra_pmc_register_update(PMC_PWR_DET, mask, mask);
>> +	_tegra_pmc_register_update(PMC_PWR_DET_VAL, mask, bval);
> Hmmm ... this does not appear to be consistent with the TRM. It says to
> write to the PMC_PWR_DET register and then the PMC_PWR_LATCH register. I
> see in the Tegra210 TRM it says to only write the to ONLY the
> PMC_PWR_DET_VAL register in other places. The TRM appears to be quite
> confusing here, can you explain this?

The TRM needs to be update. There is no LATCH register in the T210. 
PMC_PWR_DET and PMC_PWR_DET_VAL are registers for this. I have internal 
tracking bug for correcting this.



>
>> +static inline int tegra_io_rail_voltage_get(int io_rail)
>> +{
>> +	return -ENOTSUP;
>> +}
> I think that you are missing a 'P' in -ENOTSUPP.
>
Yes and kbuildtest reported the failure. :-)



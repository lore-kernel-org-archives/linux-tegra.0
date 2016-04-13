From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Wed, 13 Apr 2016 10:56:12 +0100
Message-ID: <570E17BC.7010304@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
 <570E07B7.1070209@nvidia.com> <570E0AC9.9050701@nvidia.com>
 <570E109D.6070805@nvidia.com> <570E0F7B.6060006@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <570E0F7B.6060006@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/04/16 10:20, Laxman Dewangan wrote:
> 
> On Wednesday 13 April 2016 02:55 PM, Jon Hunter wrote:
>> On 13/04/16 10:00, Laxman Dewangan wrote:
>>> On Wednesday 13 April 2016 02:17 PM, Jon Hunter wrote:
>>>> On 12/04/16 15:56, Laxman Dewangan wrote:
>>>>> NVIDIA Tegra210 supports some of the IO interface which can operate
>>>>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>>>>> Tegra PMC register to set different voltage level of IO interface
>>>>> based
>>>>> on IO rail voltage from power supply i.e. power regulators.
>>>>>
>>>>> Add APIs to set and get IO rail voltage from the client driver.
>>>> I think that we need some further explanation about the scenario when
>>>> this is used. In other words, why this configuration needs to be
>>>> done in
>>>> the kernel versus the bootloader. Is this something that can change at
>>>> runtime? I could see that for SD cards it may.
>>> Yes, SDIO3.0 support needs dynamic IO rail voltage change and so pad
>>> voltage change.
>>>
>>>>>      #define GPU_RG_CNTRL            0x2d4
>>>>>    +static DEFINE_SPINLOCK(tegra_pmc_access_lock);
>>>>> +
>>>> We already have a mutex for managing concurrent accesses, do we need
>>>> this?
>>> Mutex is sleeping calls and we really dont need this. This is sleep for
>>> small duration and we should do this in spinlock.
>> Yes but do you need to call it from a interrupt context? It seems that
>> these are not called very often, may be on boot, or when swapping an SD
>> card, and so although a spinlock would be faster, the overhead of the
>> mutex would be negligible in this case. I think that you need to justify
>> why this needs to be a spinlock with a use-case that requires it.
>>
> 
> This is just based on my OS theory that if critical region is taking
> less time, in order of us instead of ms then better to use spin lock
> instead of mutex lock.

Yes, but you also need to be practical. Furthermore, someone could be
powering up/down a rail at the same time someone is setting the voltage.
May be this is not a big deal ...

>>>>>    +
>>>>> +static struct tegra_io_rail_voltage_bit_info
>>>>> tegra210_io_rail_voltage_info[] = {
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
>>>>> +};
>>>>> +
>>>> You could simply this by having a look-up table similar to what we do
>>>> for the powergates.
>>> Revising the power gate code, it needs ID matches with bit location but
>>> it is not the case here. We need to have lookup from ID to  bit
>>> position.
>> I still don't see why you could not have ...
>>
>> static unsigned int tegra210_io_rail_voltage_bit[] = {
>>     [TEGRA_IO_RAIL_SDMMC1] = 12,
>>     ...
>> }
>>
>> You could avoid the for-loop in the lookup as well as all the extra
>> definitions. Seems a lot simpler.
> 
> This makes the table in larger size, max index is maximum of all the 
> macros used in LHS.

True. May be there is not a better way to do this ...

> Also if we have 0 as valid (which is not there now) then it can be trouble.
>>> The TRM needs to be update. There is no LATCH register in the T210.
>>> PMC_PWR_DET and PMC_PWR_DET_VAL are registers for this. I have internal
>>> tracking bug for correcting this.
>> Why do you need to program both? I think that we should be clear here
>> about the procedure. If the TRM is wrong, then there should be at least
>> a comment here describing the correct sequence.
> OK, will mention the details.

Thanks
Jon


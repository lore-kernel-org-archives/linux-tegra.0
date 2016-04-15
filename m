From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Fri, 15 Apr 2016 10:59:13 -0600
Message-ID: <57111DE1.5040908@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
 <571115CE.50906@wwwdotorg.org> <57111524.60708@nvidia.com>
 <571119D5.3040309@wwwdotorg.org> <571117F5.2090504@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571117F5.2090504@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/15/2016 10:33 AM, Laxman Dewangan wrote:
>
> On Friday 15 April 2016 10:11 PM, Stephen Warren wrote:
>> On 04/15/2016 10:21 AM, Laxman Dewangan wrote:
>>>
>>> On Friday 15 April 2016 09:54 PM, Stephen Warren wrote:
>>>> On 04/12/2016 08:56 AM, Laxman Dewangan wrote:
>>>>> NVIDIA Tegra210 supports some of the IO interface which can operate
>>>>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>>>>> Tegra PMC register to set different voltage level of IO interface
>>>>> based
>>>>> on IO rail voltage from power supply i.e. power regulators.
>>>>>
>>>>> Add APIs to set and get IO rail voltage from the client driver.
>>>>
>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>
>>>>> +static struct tegra_io_rail_voltage_bit_info
>>>>> tegra210_io_rail_voltage_info[] = {
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
>>>>> +    TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
>>>>> +};
>>>>
>>>> That table is likely specific to Tegra210, yet ...
>>>>
>>>>> +static int tegra_io_rail_voltage_get_bit_pos(int io_rail_id)
>>>>> +int tegra_io_rail_voltage_set(int io_rail, int val)
>>>>> +int tegra_io_rail_voltage_get(int io_rail)
>>>>
>>>> ... these functions are all named as if they are generic. Presumably
>>>> they will indeed be needed for the next chip too? How will you prevent
>>>> their use, or turn these functions into no-ops, or return errors, on
>>>> other SoCs?
>>>
>>> It will return error for the Soc which does to support or the parameter
>>> to the apis which are not applicable.
>>
>> Are you saying that will happen in the current code? I don't see where
>> there's anything that validates that.
>>
>> Or does "will" mean "I will do that in the next patch revision"?
>
> I have code like this in this patch
>
>
> +int tegra_pmc_pad_voltage_update(unsigned long offset, unsigned long mask,
> +                                unsigned long val)
> +{
> +       unsigned long flags;
> +
> +       if (!pmc->soc->has_pad_voltage_config)
> +               return -ENODEV;
> +
>
>
> So this flag is try only for T210 and all previous chip has false setting.

I assume that's in the next patch revision? I don't see it in the 
patches you posted.

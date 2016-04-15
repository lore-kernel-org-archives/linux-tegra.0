From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Fri, 15 Apr 2016 21:51:56 +0530
Message-ID: <57111524.60708@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-5-git-send-email-ldewangan@nvidia.com> <571115CE.50906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <571115CE.50906@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 09:54 PM, Stephen Warren wrote:
> On 04/12/2016 08:56 AM, Laxman Dewangan wrote:
>> NVIDIA Tegra210 supports some of the IO interface which can operate
>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>> Tegra PMC register to set different voltage level of IO interface based
>> on IO rail voltage from power supply i.e. power regulators.
>>
>> Add APIs to set and get IO rail voltage from the client driver.
>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>
>> +static struct tegra_io_rail_voltage_bit_info 
>> tegra210_io_rail_voltage_info[] = {
>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
>> +    TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
>> +    TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
>> +    TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
>> +    TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
>> +};
>
> That table is likely specific to Tegra210, yet ...
>
>> +static int tegra_io_rail_voltage_get_bit_pos(int io_rail_id)
>> +int tegra_io_rail_voltage_set(int io_rail, int val)
>> +int tegra_io_rail_voltage_get(int io_rail)
>
> ... these functions are all named as if they are generic. Presumably 
> they will indeed be needed for the next chip too? How will you prevent 
> their use, or turn these functions into no-ops, or return errors, on 
> other SoCs?

It will return error for the Soc which does to support or the parameter 
to the apis which are not applicable.


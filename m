From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Fri, 15 Apr 2016 10:41:57 -0600
Message-ID: <571119D5.3040309@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
 <571115CE.50906@wwwdotorg.org> <57111524.60708@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57111524.60708-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/15/2016 10:21 AM, Laxman Dewangan wrote:
>
> On Friday 15 April 2016 09:54 PM, Stephen Warren wrote:
>> On 04/12/2016 08:56 AM, Laxman Dewangan wrote:
>>> NVIDIA Tegra210 supports some of the IO interface which can operate
>>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>>> Tegra PMC register to set different voltage level of IO interface based
>>> on IO rail voltage from power supply i.e. power regulators.
>>>
>>> Add APIs to set and get IO rail voltage from the client driver.
>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>
>>> +static struct tegra_io_rail_voltage_bit_info
>>> tegra210_io_rail_voltage_info[] = {
>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
>>> +    TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
>>> +    TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
>>> +    TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
>>> +    TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
>>> +    TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
>>> +};
>>
>> That table is likely specific to Tegra210, yet ...
>>
>>> +static int tegra_io_rail_voltage_get_bit_pos(int io_rail_id)
>>> +int tegra_io_rail_voltage_set(int io_rail, int val)
>>> +int tegra_io_rail_voltage_get(int io_rail)
>>
>> ... these functions are all named as if they are generic. Presumably
>> they will indeed be needed for the next chip too? How will you prevent
>> their use, or turn these functions into no-ops, or return errors, on
>> other SoCs?
>
> It will return error for the Soc which does to support or the parameter
> to the apis which are not applicable.

Are you saying that will happen in the current code? I don't see where 
there's anything that validates that.

Or does "will" mean "I will do that in the next patch revision"?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

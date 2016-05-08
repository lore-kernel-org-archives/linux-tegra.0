From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V4 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Sun, 8 May 2016 13:13:56 +0100
Message-ID: <572F2D84.3060505@nvidia.com>
References: <1462531548-12914-1-git-send-email-ldewangan@nvidia.com>
 <1462531548-12914-4-git-send-email-ldewangan@nvidia.com>
 <572CAC20.9030307@nvidia.com> <572CB906.3090004@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <572CB906.3090004@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/05/16 16:32, Laxman Dewangan wrote:
> 
> On Friday 06 May 2016 08:07 PM, Jon Hunter wrote:
>> On 06/05/16 11:45, Laxman Dewangan wrote:
>> +
>> +    /* Last entry */
>> +    TEGRA_IO_PAD_MAX,
>> Nit should these be TEGRA_IO_PADS_xxx?
> 
> Because this was name of single pad and hence I said TEGRA_IO_PAD_XXX.

Aren't these used to set the voltage level and power state for the
entire group of IOs? Confused :-(

>>> +};
>>> +
>>> +/* tegra_io_pads_source_voltage: The voltage level of IO rails which
>>> source
>>> + *                 the IO pads.
>>> + */
>>> +enum tegra_io_pads_source_voltage {
>>> +    TEGRA_IO_PADS_SOURCE_VOLTAGE_1800000UV,
>>> +    TEGRA_IO_PADS_SOURCE_VOLTAGE_3300000UV,
>>> +};
>> Nit I wonder if we can make this shorter ...
>>
>> enum tegra_io_pads_vconf {
>>     TEGRA_IO_PADS_VCONF_1V8,
>>     TEGRA_IO_PADS_VCONF_3V3,
> 
> This looks good but for voltage and current, unit is used uV/uV across
> the system. So wanted to have same unit.

Now it is an enum does it matter? Or maybe just have ...

enum tegra_io_pads_vconf {
	TEGRA_IO_PADS_1800000UV,
	TEGRA_IO_PADS_3300000UV,
};

Cheers
Jon

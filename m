From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] soc/tegra: pmc: Add support for IO pads power state
 and voltage
Date: Tue, 3 May 2016 18:01:39 +0530
Message-ID: <57289A2B.7040501@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com> <1462191434-28933-4-git-send-email-ldewangan@nvidia.com> <57289AC0.4090604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57289AC0.4090604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 03 May 2016 06:04 PM, Jon Hunter wrote:
> On 02/05/16 13:17, Laxman Dewangan wrote:
>> +
>> +	return tegra_io_rail_power_on(dpd_bit);
>  From a readability standpoint the above seems weird because
> tegra_io_pads_power_enable() takes an ID as the argument, translates it
> to a bit value and passes it to tegra_io_rail_power_on() which also
> takes an ID for the argument.

Yaah, I did not want to duplicate the implementation and hence it is there.
We will get rid of the older APIs once this is IN and new mechanism there.



>> +
>> +	bval = (io_volt_uv == 3300000) ? BIT(pwr_bit) : 0;
>> +
>> +	mutex_lock(&pmc->powergates_lock);
>> +	tegra_pmc_read_modify_write(PMC_PWR_DET, BIT(pwr_bit), BIT(pwr_bit));
>> +	tegra_pmc_read_modify_write(PMC_PWR_DET_VAL, BIT(pwr_bit), bval);
>> +	mutex_unlock(&pmc->powergates_lock);
> There are 4 instances of BIT(pwr_bit). May be we should do this once or
> have tegra_io_pads_to_power_val() return the bit?

OK, will re-write this part.


>
>> +int tegra_io_pads_power_disable(int io_pad_id);
>> +int tegra_io_pads_power_is_enabled(int io_pad_id);
> What I don't like here, is now we have two public APIs to do the same
> job because tegra_io_pads_power_enable/disable() calls
> tegra_io_rail_power_off/on() internally. Furthermore, the two APIs use
> different ID definitions to accomplish the same job. This shouldn't be
> necessary.

Currently SOR driver is using the tegra_io_rail_power_off/on() APIs. 
Once the proper interface available then I will move sor driver to use 
new method and then we can full get rid of older APIs and macros.

Till that, we need to have this.

>

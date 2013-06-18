From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: tps65910: Fix crash in i2c_driver .probe
Date: Tue, 18 Jun 2013 12:35:49 +0300
Message-ID: <51C029F5.3000205@nvidia.com>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com> <1371491257-23791-2-git-send-email-ttynkkynen@nvidia.com> <51BF5060.8060001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51BF5060.8060001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/17/2013 09:07 PM, Stephen Warren wrote:
> On 06/17/2013 11:47 AM, Tuomas Tynkkynen wrote:
>> Commit "i2c: core: make it possible to match a pure device tree driver"
>> changed semantics of the i2c probing for device tree devices.
>> Device tree probed devices now get a NULL i2c_device_id pointer.
>> This caused kernel panics due to NULL dereference.
> 
>> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> 
>>  	pmic_plat_data = dev_get_platdata(&i2c->dev);
>>  
>> -	if (!pmic_plat_data && i2c->dev.of_node) {
>> +	if (id) {
>> +		chip_id = id->driver_data;
>> +	} else if (i2c->dev.of_node) {
>>  		pmic_plat_data = tps65910_parse_dt(i2c, &chip_id);
> 
> That over-writes pmic_plat_data even if it was already set above. This
> should really only happen if the earlier assignment didn't find any
> pdata, i.e. if (!pmic_plat_data) here.

That would cause the probe() to fail since it doesn't have a chip_id.

> 
> Looking at patch 2/2, the structure in that driver is correct, and
> perhaps could be implemented the same or similarly here?
> 

This seems to be the best way, I'll change it that way.

>>  		of_pmic_plat_data = pmic_plat_data;
> 
> Or just swap those assignments:
> 
> of_pmic_plat_data = tps65910_parse_dt(...);
> if (!pmic_plat_data)
>     pmic_plat_data = of_pmic_plat_data;
> 
> (although there's perhaps little point parsing the pdata from DT if it's
> already provided through the device object)

Yeah, especially since tps65910_parse_dt can dev_warn().

> 
>>  	}
>>  
>> -	if (!pmic_plat_data)
>> +	if (!pmic_plat_data || chip_id < 0)
>>  		return -EINVAL;
> 

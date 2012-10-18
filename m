From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 15:00:09 +0800
Message-ID: <507FA8F9.9000202@nvidia.com>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <1350375538.2332.31.camel@markz-hp6200> <507D856C.1070708@wwwdotorg.org> <507E0AC1.8020001@nvidia.com> <507F175A.3000406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <507F175A.3000406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 04:38 AM, Stephen Warren wrote:
> On 10/16/2012 07:32 PM, Mark Zhang wrote:
>> On 10/17/2012 12:03 AM, Stephen Warren wrote:
>>> On 10/16/2012 02:18 AM, Mark Zhang wrote:
>>>> Hi,
>>>>
>>>> I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
>>>> But the code that Thierry
>>>> hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
>>>> directly. If you build and run it, you'll get a white blank screen on
>>>> Tegra 3. I didn't find the root cause but I think this is not caused by
>>>> drm driver itself(maybe the PCIE codes?). The main symptom is: some
>>>> regulators can't be inited all the time. I tried to build drm driver as
>>>> kernel module, after kernel booted, modprobe the drm driver, and you'll
>>>> find there are a lot of error prints like this:
>>>>
>>>> =========================================================
>>>> [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
>>>> [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
>>>> regulator: -517
>>>> [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
>>>> probe deferral
>>>> [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
>>>> probe deferral
>>>> =========================================================
>>>
>>> This is normal; it's probe deferral. You'll find that those regulators
>>> initialize correctly later. Hopefully tegra-drm handles this correctly,
>>> and passes that error code through as the result of its probe.
>>>
>>
>> I don't think so. In normal scenario, the regulator will be inited
>> correctly finally. But in the scenario I described above, these
>> regulators will not be inited correctly all the time. Just as I
>> mentioned above, I tried to build drm driver as kernel module, that
>> means I will load drm driver after kernel booting finished. Besides,
>> during the loading of drm driver, these regulator probe error were still
>> be printed out. And I'm sure this is not the normal case.
>
> The Cardhu PMIC driver isn't enabled in tegra_defconfig in Thierry's
> branch. Do this:
>
>> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
>> index c2a2f6e..90f4d5c 100644
>> --- a/arch/arm/configs/tegra_defconfig
>> +++ b/arch/arm/configs/tegra_defconfig
>> @@ -124,16 +124,19 @@ CONFIG_SPI_OCORES=m
>>   CONFIG_GPIO_SYSFS=y
>>   CONFIG_GPIO_ADNP=y
>>   CONFIG_GPIO_TPS6586X=y
>> +CONFIG_GPIO_TPS65910=y
>>   CONFIG_POWER_SUPPLY=y
>>   CONFIG_BATTERY_SBS=y
>>   CONFIG_SENSORS_LM90=y
>> -CONFIG_SENSORS_ADC081C=m
>>   CONFIG_MFD_TPS6586X=y
>> +CONFIG_MFD_TPS65910=y
>>   CONFIG_REGULATOR=y
>>   CONFIG_REGULATOR_FIXED_VOLTAGE=y
>>   CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
>>   CONFIG_REGULATOR_GPIO=y
>> +CONFIG_REGULATOR_TPS62360=y
>>   CONFIG_REGULATOR_TPS6586X=y
>> +CONFIG_REGULATOR_TPS65910=y
>>   CONFIG_DRM=m
>>   CONFIG_DRM_TEGRA=m
>>   CONFIG_DRM_TEGRA_DEBUG=y
>> @@ -172,7 +175,7 @@ CONFIG_RTC_CLASS=y
>>   CONFIG_RTC_INTF_SYSFS=y
>>   CONFIG_RTC_INTF_PROC=y
>>   CONFIG_RTC_INTF_DEV=y
>> -CONFIG_RTC_DRV_PCF8523=y
>> +CONFIG_RTC_DRV_TPS65910=y
>>   CONFIG_RTC_DRV_TEGRA=y
>>   CONFIG_DMADEVICES=y
>>   CONFIG_TEGRA20_APB_DMA=y
>
> (That still doesn't make tegradrm work for me on Cardhu, but it does
> solve the regulator issue)

Yes, it works. Thank you.
To make the cardhu working(LVDS and HDMI), you need this patch(check 
below). Sorry I forget to send this patch to Thierry and I'll do that now.

diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c 
b/arch/arm/mach-tegra/board-dt-tegra30.c
index 03d2932..9f83b35 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -73,6 +73,10 @@ static __initdata struct tegra_clk_init_table 
tegra_dt_clk_init_table[] = {
         { "i2s2",       "pll_a_out0",   11289600,       false},
         { "i2s3",       "pll_a_out0",   11289600,       false},
         { "i2s4",       "pll_a_out0",   11289600,       false},
+        { "host1x",     "pll_c",        144000000,      true },
+        { "disp1",      "pll_p",        74000000,       false },
+        { "disp2",      "pll_d2_out0",  148500000,      false },
+        { "hdmi",       "pll_d2_out0",  148500000,      false },
         { NULL,         NULL,           0,              0},
  };

Mark
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

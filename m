From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 13/16] PM / devfreq: tegra: Support Tegra30
Date: Tue, 25 Jun 2019 14:30:01 +0300
Message-ID: <7488653b-e8ec-27e6-0390-5e23481857e9@gmail.com>
References: <7561edbc-c17c-101a-b339-fc7f9968a470@gmail.com>
 <37db00bc-3a22-d1c2-7bdc-e27af42cd5c7@gmail.com>
 <20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p1>
 <20190624073414epcms1p87b6dc13758b6bd401d275cfba583314a@epcms1p8>
 <20190624111134epcms1p361aed3c72edd6eebc95408331c8d9739@epcms1p3>
 <CGME20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p1>
 <20190625014214epcms1p1b8f2d76cd8cfdf3fdf517be08a92ccdf@epcms1p1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625014214epcms1p1b8f2d76cd8cfdf3fdf517be08a92ccdf@epcms1p1>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: Chanwoo Choi <cw00.choi@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

25.06.2019 4:42, MyungJoo Ham пишет:
> Sender : Dmitry Osipenko <digetx@gmail.com>
>> 24.06.2019 14:11, MyungJoo Ham пишет:
>>>>
>>>> --------- Original Message ---------
>>>> Sender : Dmitry Osipenko <digetx@gmail.com>
>>>>
>>>> 24.06.2019 10:34, MyungJoo Ham пишет:
>>>>>>
>>>>>> A question:
>>>>>>
>>>>>> Does this driver support Tegra20 as well?
>>>>>> I'm asking this because ARCH_TEGRA includes ARCH_TEGRA_2x_SOC
>>>>>> according to /drivers/soc/tegra/Kconfig.
>>>>>>
>>>>>
>>>>> For this matter, how about updating your 13/16 patch as follows?
>>>>>
>>> []
>>>>
>>>> Good call! I'll update this patch following yours suggestion, thanks.
>>>
>>> Or, you may approve the modified commits here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/log/?h=for-next
>>
>> Looks almost good to me!
>>
>> I just recalled that there is also a 64bit variant of Tegra124, the Tegra132. Hence
>> the Tegra30+ Kconfig entry should look like this (it's also worthy to break the lines
>> for readability):
>>
>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>> index ccb1a68c4b51..bd2efbc27725 100644
>> --- a/drivers/devfreq/Kconfig
>> +++ b/drivers/devfreq/Kconfig
>> @@ -94,7 +94,10 @@ config ARM_EXYNOS_BUS_DEVFREQ
>>
>> config ARM_TEGRA_DEVFREQ
>>        tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
>> -       depends on ARCH_TEGRA || COMPILE_TEST
>> +       depends on ARCH_TEGRA_3x_SOC  || ARCH_TEGRA_114_SOC || \
>> +                  ARCH_TEGRA_132_SOC || ARCH_TEGRA_124_SOC || \
>> +                  ARCH_TEGRA_210_SOC || \
>> +                  COMPILE_TEST
>>        select PM_OPP
>>        help
>>          This adds the DEVFREQ driver for the Tegra family of SoCs.
>>
>> Could you please adjust the patches like I'm suggesting? I'll approve yours change
>> then and won't re-spin the first batch of the patches.
> 
> I've adjusted as you suggested. It's pushed to the git repo as well.

Thank you very much, looking good now!

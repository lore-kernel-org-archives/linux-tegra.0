From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 14/16] PM / devfreq: tegra: Enable COMPILE_TEST for the
 driver
Date: Tue, 4 Jun 2019 17:41:53 +0300
Message-ID: <02a6651f-17f3-2e79-7780-57657596ba23@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-15-digetx@gmail.com> <20190604112026.GN16519@ulmo>
 <ed2c502f-8f49-d89b-32c6-4b5415e1fa47@gmail.com> <20190604141031.GB397@ulmo>
 <20190604141824.GC397@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604141824.GC397@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 17:18, Thierry Reding пишет:
> On Tue, Jun 04, 2019 at 04:10:31PM +0200, Thierry Reding wrote:
>> On Tue, Jun 04, 2019 at 04:53:17PM +0300, Dmitry Osipenko wrote:
>>> 04.06.2019 14:20, Thierry Reding пишет:
>>>> On Thu, May 02, 2019 at 02:38:13AM +0300, Dmitry Osipenko wrote:
>>>>> The driver's compilation doesn't have any specific dependencies, hence
>>>>> the COMPILE_TEST option can be supported in Kconfig.
>>>>>
>>>>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  drivers/devfreq/Kconfig | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>>>>> index 56db9dc05edb..a6bba6e1e7d9 100644
>>>>> --- a/drivers/devfreq/Kconfig
>>>>> +++ b/drivers/devfreq/Kconfig
>>>>> @@ -93,7 +93,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
>>>>>  
>>>>>  config ARM_TEGRA_DEVFREQ
>>>>>  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
>>>>> -	depends on ARCH_TEGRA
>>>>> +	depends on ARCH_TEGRA || COMPILE_TEST
>>>>>  	select PM_OPP
>>>>>  	help
>>>>>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.
>>>>
>>>> You need to be careful with these. You're using I/O register accessors,
>>>> which are not supported on the UM architecture, for example.
>>>>
>>>> This may end up getting flagged during build testing.
>>>
>>> We have similar cases in other drivers and it doesn't cause any known
>>> problems because (I think) build-bots are aware of this detail. Hence
>>
>> I don't understand how the build-bots would be aware of this detail.
>> Unless you explicitly state what the dependencies are, how would the
>> build-bots know? Perhaps there's some logic built-in somewhere that I
>> don't know about?
> 
> So looks like COMPILE_TEST has a !UML dependency, so this might just
> work.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thank you very much for the clarification! Certainly that would caused
problems already since there are such cases all over the kernel,
including Tegra drivers.

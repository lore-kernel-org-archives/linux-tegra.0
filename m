From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/18] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Fri, 1 Nov 2019 16:22:17 +0300
Message-ID: <a72463cd-cc16-691c-3c82-54ebb618ec32@gmail.com>
References: <20191015170015.1135-1-digetx@gmail.com>
 <20191016192133.GB26038@pdeschrijver-desktop.Nvidia.com>
 <72636eb3-5354-eea3-3a51-4975a04186b2@gmail.com>
 <53ee8bd3-5c53-f0aa-175c-7fa3024d0af5@gmail.com>
 <20191028140443.GA27141@pdeschrijver-desktop.Nvidia.com>
 <40de641f-c38e-51ee-ae27-c5db468c45b5@gmail.com>
 <20191101123359.GG27141@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191101123359.GG27141@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.11.2019 15:33, Peter De Schrijver пишет:
> On Tue, Oct 29, 2019 at 03:47:56AM +0300, Dmitry Osipenko wrote:
> ..
> 
>>>>>> It would be useful to switch the power state terminology to the one used
>>>>>> for later chips:
>>>>>>
>>>>>> LP0 becomes SC7
>>>>>> LP1 becomes C1
>>>>>> LP2 becomes CC7
>>>>>>
>>>>>> Meaning of these states is as follows
>>>>>>
>>>>>> C is a core state:
>>>>>>
>>>>>> C1 clock gating
>>>>>> C2 not defined
>>>>>> C3 not defined
>>>>>> C4 not defined
>>>>>> C5 not defined
>>>>>> C6 not defined for ARM cores
>>>>>> C7 power-gating
>>>>>>
>>>>>> CC is a CPU cluster C state:
>>>>>>
>>>>>> CC1 cluster clock gated
>>>>>> CC2 not defined
>>>>>> CC3 fmax@Vmin: not used prior to Tegra186
>>>>>> CC4: cluster retention: no longer supported
>>>>>> CC5: not defined
>>>>>> CC6: cluster power gating
>>>>>> CC7: cluster rail gating
>>>>>>
>>>>>> SC is a System C state:
>>>>>>
>>>>>> SC1: not defined
>>>>>> SC2: not defined
>>>>>> SC3: not defined
>>>>>> SC4: not defined
>>>>>> SC5: not defined
>>>>>> SC6: not defined
>>>>>> SC7: VDD_SOC off
>>>>>
>>>>> Hello Peter,
>>>>>
>>>>> But new "drivers/cpuidle/cpuidle-tegra.c" uses exactly that terminology,
>>>>> please see "cpuidle: Refactor and move NVIDIA Tegra20 driver into
>>>>> drivers/cpuidle/" and further patches. Am I missing something? Or do you
>>>>> want the renaming to be a separate patch?
>>>>>
>>>>
>>>> Or maybe you're suggesting to change the names everywhere and not only
>>>> in the cpuidle driver? Please clarify :)
>>>
>>> At least some of the variable and function names still say lp2?
>>
>> The cpuidle driver uses LP2 terminology for everything that comes from
>> the external arch / firmware includes. But it says CC6 for everything
>> that is internal to the driver. So yes, there is a bit of new/old
>> terminology mixing in the code.
>>
>> The arch code / PMC driver / TF firmware are all saying LP2. The LP2
>> naming is also a part of the device-tree binding.
>>
>> It will be a lot of mess to rename the mach-tegra/pm.c code. I guess
>> eventually it could be moved to drivers/soc/, so maybe it will be better
>> to postpone the renaming until then?
> 
> Or maybe add a comment somewhere indicating:
> 
> LP2 = CC6
> LP1 = C1
> LP0 = SC7
> 
> TF predates the new naming, so that may make some sense.

Today it should make more sense just to add an explicit comment to the
cpuidle driver that clarifies the new naming (IMHO). I'll prepare v7
with that change.

Maybe later on, once more code will be consolidated in
drivers/soc/tegra/, it will become useful to duplicate the clarification
there as well.

Please let me know if you disagree or think that something better could
be done.

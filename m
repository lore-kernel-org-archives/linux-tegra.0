From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/4] ARM: tegra: Clear EMC interrupts on resume from
 LP1 on Tegra30+
Date: Tue, 20 Nov 2018 14:32:09 +0300
Message-ID: <0f4dfa92-e534-4ea5-cdad-1a68465384e5@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
 <20180830185404.7224-5-digetx@gmail.com>
 <9c085248-41df-c8be-294d-6bf8b95c1085@nvidia.com>
 <60898d23-63a1-caf5-8fd4-2bbd7bb6aaab@gmail.com>
 <d60c4888-c95a-4ec5-ba0d-992970089449@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d60c4888-c95a-4ec5-ba0d-992970089449@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.11.2018 13:27, Jon Hunter wrote:
> 
> On 19/11/2018 22:35, Dmitry Osipenko wrote:
>> On 20.11.2018 1:00, Jon Hunter wrote:
>>>
>>> On 30/08/2018 19:54, Dmitry Osipenko wrote:
>>>> Two interrupts are raised on resume from LP1 on Tegra30+: first is the
>>>> clock change completed interrupt which is set after updating timing
>>>> configuration, second is DLL alarm interrupt which is set when DLL
>>>> starts re-calibration after being reset. Clear these two interrupts
>>>> in the end of exiting from the self-refresh mode for consistency, that
>>>> will also allow to not receive spurious interrupts in the EMC driver
>>>> after resume from suspend.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  arch/arm/mach-tegra/sleep-tegra30.S | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
>>>> index 828f6c37afde..78c6e9fb56e7 100644
>>>> --- a/arch/arm/mach-tegra/sleep-tegra30.S
>>>> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
>>>> @@ -26,6 +26,7 @@
>>>>  #include "irammap.h"
>>>>  #include "sleep.h"
>>>>  
>>>> +#define EMC_INTSTATUS			0x0
>>>>  #define EMC_CFG				0xc
>>>>  #define EMC_ADR_CFG			0x10
>>>>  #define EMC_TIMING_CONTROL		0x28
>>>> @@ -44,6 +45,9 @@
>>>>  #define EMC_XM2VTTGENPADCTRL		0x310
>>>>  #define EMC_XM2VTTGENPADCTRL2		0x314
>>>>  
>>>> +#define EMC_CLKCHANGE_COMPLETE_INT	(1 << 4)
>>>> +#define EMC_DLL_ALARM_INT		(1 << 7)
>>>> +
>>>>  #define MC_EMEM_ARB_CFG			0x90
>>>>  
>>>>  #define PMC_CTRL			0x0
>>>> @@ -539,6 +543,9 @@ zcal_done:
>>>>  
>>>>  	emc_timing_update r1, r0
>>>>  
>>>> +	mov	r1, #(EMC_CLKCHANGE_COMPLETE_INT | EMC_DLL_ALARM_INT)
>>>> +	str	r1, [r0, #EMC_INTSTATUS]	@ clear interrupts
>>>> +
>>>>  	/* Tegra114 had dual EMC channel, now config the other one */
>>>>  	cmp	r10, #TEGRA114
>>>>  	bne	__no_dual_emc_chanl
>>>>
>>>
>>> Where are these interrupts enabled? I did not see where they are
>>> enabled. I see that the Tegra24 EMC driver does poll these, but it did
>>> not look like they were enabled. If they are enabled, I wondering if
>>> they should be masked on entering self-refresh?
>>
>> EMC interrupt is not enabled on Tegra124. IIRC, it doesn't use the interrupt at all in the driver. Indeed, T124 EMC driver polls the interrupt status, but it clears the status before starting to poll. Probably I was just thinking about to write T30 EMC driver at that time and to utilize the interrupt.. 
>>
>> Seems it should be okay to drop this patch for now, but maybe then we will have to return to it sometime later. Up to you to decide.
> 
> I would be tempted to drop for now. If you have such a driver maybe the
> driver should mask any interrupts it uses on suspending.

I don't have such driver yet. Masking interrupts on suspend and clearing status on resume within the driver should result in possibility to miss some trouble that happened between "CPU wake"->"EMC driver resuming", but probably that's not too important and unlikely to happen.

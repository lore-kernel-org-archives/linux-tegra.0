From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] cpuidle: change enter_s2idle() prototype
Date: Wed, 1 Jul 2020 07:50:56 +0200
Message-ID: <a65bb456-d5f4-2208-f924-0af989b8dd5f@linaro.org>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com>
 <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
 <9963896.lEaLCsxmBZ@kreacher> <1593571181.7383.5.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593571181.7383.5.camel@mtkswgap22>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sami Tolvanen <samitolvanen-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/07/2020 04:39, Neal Liu wrote:
> On Mon, 2020-06-29 at 17:17 +0200, Rafael J. Wysocki wrote:
>> On Monday, June 29, 2020 11:05:40 AM CEST Neal Liu wrote:
>>> Control Flow Integrity(CFI) is a security mechanism that disallows
>>> changes to the original control flow graph of a compiled binary,
>>> making it significantly harder to perform such attacks.
>>>
>>> init_state_node() assigns same function pointer to idle_state->enter
>>> and idle_state->enter_s2idle. This definitely causes CFI failure
>>> when calling either enter() or enter_s2idle().
>>>
>>> Align enter_s2idle() with enter() function prototype to fix CFI
>>> failure.
>>
>> That needs to be documented somewhere close to the definition of the
>> callbacks in question.
>>
>> Otherwise it is completely unclear why this is a good idea.
>>
> 
> The problem is, init_state_mode() assign same function callback to
> different function pointer declarations.
> 
> static int init_state_node(struct cpuidle_state *idle_state,
>                            const struct of_device_id *matches,
>                            struct device_node *state_node)
> {
> ...
>         idle_state->enter = match_id->data;
> ...
>         idle_state->enter_s2idle = match_id->data;
> }
> 
> Function declarations:
> 
> struct cpuidle_state {
> ...
>         int (*enter)    (struct cpuidle_device *dev,
>                         struct cpuidle_driver *drv,
>                         int index);
> 
>         void (*enter_s2idle) (struct cpuidle_device *dev,
>                               struct cpuidle_driver *drv,
>                               int index);
> };
> 
> In this case, either enter() or enter_s2idle() would cause CFI check
> failed since they use same callee.
> 
> We try to align function prototype of enter() since it needs return
> value for some use cases. The return value of enter_s2idle() is no need
> currently.

Thanks for the clarification, you may add this description along with
the changelog.


>>> Signed-off-by: Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  drivers/acpi/processor_idle.c   |    6 ++++--
>>>  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
>>>  drivers/idle/intel_idle.c       |    6 ++++--
>>>  include/linux/cpuidle.h         |    6 +++---
>>>  4 files changed, 16 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
>>> index 75534c5..6ffb6c9 100644
>>> --- a/drivers/acpi/processor_idle.c
>>> +++ b/drivers/acpi/processor_idle.c
>>> @@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
>>>  	return index;
>>>  }
>>>  
>>> -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>>> -				   struct cpuidle_driver *drv, int index)
>>> +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>>> +				  struct cpuidle_driver *drv, int index)
>>>  {
>>>  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
>>>  
>>> @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>>>  		}
>>>  	}
>>>  	acpi_idle_do_entry(cx);
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
>>> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
>>> index 1500458..a12fb14 100644
>>> --- a/drivers/cpuidle/cpuidle-tegra.c
>>> +++ b/drivers/cpuidle/cpuidle-tegra.c
>>> @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>>>  	return err ? -1 : index;
>>>  }
>>>  
>>> -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
>>> -				  struct cpuidle_driver *drv,
>>> -				  int index)
>>> +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
>>> +				 struct cpuidle_driver *drv,
>>> +				 int index)
>>>  {
>>>  	tegra_cpuidle_enter(dev, drv, index);
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  /*
>>> diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
>>> index f449584..b178da3 100644
>>> --- a/drivers/idle/intel_idle.c
>>> +++ b/drivers/idle/intel_idle.c
>>> @@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
>>>   * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
>>>   * scheduler tick and suspended scheduler clock on the target CPU.
>>>   */
>>> -static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
>>> -					struct cpuidle_driver *drv, int index)
>>> +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
>>> +				       struct cpuidle_driver *drv, int index)
>>>  {
>>>  	unsigned long eax = flg2MWAIT(drv->states[index].flags);
>>>  	unsigned long ecx = 1; /* break on interrupt flag */
>>>  
>>>  	mwait_idle_with_hints(eax, ecx);
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  /*
>>> diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
>>> index ec2ef63..bee10c0 100644
>>> --- a/include/linux/cpuidle.h
>>> +++ b/include/linux/cpuidle.h
>>> @@ -66,9 +66,9 @@ struct cpuidle_state {
>>>  	 * suspended, so it must not re-enable interrupts at any point (even
>>>  	 * temporarily) or attempt to change states of clock event devices.
>>>  	 */
>>> -	void (*enter_s2idle) (struct cpuidle_device *dev,
>>> -			      struct cpuidle_driver *drv,
>>> -			      int index);
>>> +	int (*enter_s2idle)(struct cpuidle_device *dev,
>>> +			    struct cpuidle_driver *drv,
>>> +			    int index);
>>>  };
>>>  
>>>  /* Idle State Flags */
>>> -- 
>>> 1.7.9.5
>>>
>>
>>
>>
>>
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

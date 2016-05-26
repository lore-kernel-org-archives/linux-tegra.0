From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
Date: Thu, 26 May 2016 20:01:04 +0300
Message-ID: <6bfd97bc-7e09-973d-e3c3-7e86b08a4550@gmail.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
 <572B47DE.1090804@nvidia.com>
 <c4a3fb3f-adb8-c167-d660-55d3f803c9c3@gmail.com> <5745C02A.20308@nvidia.com>
 <d3552444-75b6-a624-589d-5391d7c09526@gmail.com>
 <5746B6F7.9040101@nvidia.com>
 <e10126b7-de8d-3cee-a1be-d38eb1d7021f@gmail.com>
 <574708E8.3060308@nvidia.com>
 <d7a01310-869e-197e-9fbe-5b4783629e10@gmail.com>
 <574715D7.4060004@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <574715D7.4060004@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.05.2016 18:27, Jon Hunter wrote:
>
> On 26/05/16 15:57, Dmitry Osipenko wrote:
>> On 26.05.2016 17:32, Jon Hunter wrote:
>>>
>>> On 26/05/16 12:42, Dmitry Osipenko wrote:
>>>> On 26.05.2016 11:42, Jon Hunter wrote:
>>>>>
>>>>> On 25/05/16 19:51, Dmitry Osipenko wrote:
>>>>>> On 25.05.2016 18:09, Jon Hunter wrote:
>>>>>
>>>>> ...
>>>>>
>>>>>>> If you are able to reproduce this on v3.18, then it would be good if
>>>>>>> you
>>>>>>> could trace the CCF calls around this WARNING to see what is causing
>>>>>>> the
>>>>>>> contention.
>>>>>>
>>>>>> I managed to reproduce it with some CCF "tracing".
>>>>>> Full kmsg log is here: https://bpaste.net/show/d8ab7b7534b7
>>>>>>
>>>>>> Looks like CPU freq governor thread yields during clk_set_rate() and
>>>>>> then CPU idle kicks in, taking the same mutex.
>>>>>
>>>>> On the surface that sounds odd to me, but without understanding the
>>>>> details, I guess I don't know if this is a valid thing to be doing or
>>>>> even how that actually works!
>>>>>
>>>>
>>>> The reason of that happening should be that I'm using clk PRE/POST rate
>>>> change notifiers in my DVFS driver that takes other mutexes and they
>>>> could be locked, causing schedule. I haven't mentioned it before, sorry.
>>>
>>> OK, but I am not sure how these "other mutexes" would be relevant here
>>> without any more details.
>>>
>>>> From drivers/clk/clk.c:
>>>>
>>>> static struct task_struct *prepare_owner;
>>>>
>>>> ...
>>>>
>>>> /***           locking             ***/
>>>> static void clk_prepare_lock(void)
>>>> {
>>>>     if (!mutex_trylock(&prepare_lock)) {
>>>>         if (prepare_owner == current) {
>>>>             prepare_refcnt++;
>>>>             return;
>>>>         }
>>>>         mutex_lock(&prepare_lock);
>>>>     }
>>>>
>>>> You can see that it would lock the mutex if prepare_owner != current, in
>>>> my case it's idle thread != interactive gov. thread.
>>>
>>> Right, but that would imply that someone else is actively doing
>>> something with a clock. However, if we are entering LP2, then that
>>> implies that all CPUs are idle and so I still don't understand the
>>> scenario where this would be locked in that case. May be there is
>>> something I am overlooking here?
>>>
>>>>>> However, cpufreq_interactive governor is android specific governor and
>>>>>> isn't in upstream kernel yet. Quick googling shows that recent
>>>>>> "upstreaming" patch uses same cpufreq_interactive_speedchange_task:
>>>>>> https://lkml.org/lkml/2016/5/20/41
>>>>>
>>>>> Do you know if this version they are upstreaming could also yield
>>>>> during
>>>>> the clk_set_rate()?
>>>>>
>>>>
>>>> I think it should be assumed that any clk_set_rate() potentially could.
>>>> Please correct me if I'm wrong.
>>>>
>>>>>> I'm not aware of other possibility to reproduce this issue, it needs
>>>>>> some CCF interaction from a separate task. So the current upstream
>>>>>> kernel shouldn't be affected, I guess.
>>>>>
>>>>> What still does not make sense to me is why any frequency changes have
>>>>> not completed before we attempt to enter the LP2 state?
>>>>>
>>>> Why not? I don't see any CPUIDLE <-> CPUFREQ interlocking. Do you think
>>>> it could be harmful somehow?
>>>
>>> Like I said before, I still don't understand that scenario that is
>>> causing this and without being able to fully understand it, I have no
>>> idea what the exact problem we are trying to fix here is.
>>>
>>
>> That's how I see it:
>>
>> +----------------------------------------------+
>> |                    CPU 0                     |
>> +-------------------+--------------------------+
>> |    Idle thread    | Interactive gov. thread  |
>> +----------------------------------------------+
>> |     inactive      |                          |
>> |                   |                          |
>> |                   |   CPU freq. change       |
>> |                   |                          |
>> |                   |   clk_set_rate()         |
>> |                   |                          |
>> |       ...         |   clk_prepare_lock()     |
>> |                   |                          |
>> |                   |   PRE rate notifier call |
>> |                   |                          |
>> |                   |   schedule               |
>
> What is this notifier doing? Is there some sort of hardware activity
> that it is waiting for to complete?
>

It changes regulator voltage if required. So at least I2C would cause scheduling 
on wait_for_completion_timeout().

-- 
Dmitry

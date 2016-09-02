From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH ] drivers/base: cacheinfo: remove warning in resume
Date: Fri, 2 Sep 2016 16:02:09 +0100
Message-ID: <4937b653-6b54-fa6e-10aa-e5b8e567c257@arm.com>
References: <1472455254-27692-1-git-send-email-sumitg@nvidia.com>
 <32ada52a-4d47-282a-ef10-33d3e32fbd52@arm.com>
 <8413522b34f64829a4e601015c76ee45@BGMAIL104.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8413522b34f64829a4e601015c76ee45-gjLx+0+SZqK6sJks/06JalaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bibek Basu <bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 02/09/16 13:58, Sumit Gupta wrote:
> Hi Sudeep,
>
> Thank you for your comments.
>>
>> I understand the warning we get but the patch is completely wrong.
>> One it removes the feature of adding/removing the cache devices on
>> cpu hotplug events. Have you tested your patch with simple cpu
>> hotplug and seen no change before and after this change ?
>>
>
> I referred other node "cpufreq" under "cpu" node and that was also
> not getting deleted when core goes down. So, thought the behavior
> should be similar as entries are only used to read data and it won't
> change after boot.
>

I agree, but for caches it has been like this and in a way make sense.

>> On 29/08/16 08:20, Sumit Gupta wrote:
>>> CPU notifier is present for creating device entries for child
>>> node "cache" under parent node "cpu" as per DT.
>>
>> Again DT is only on few architectures not on all(e.g. x86)
>>
>>> During resume from suspend, while booting all non-boot CPU's,
>>> this notifier for adding cache device gets called before cpu
>>> device is added by device_resume. Because of this warning message
>>> of "parent should not be sleeping" comes during resume.
>>>
>>
>> Yes that's correct and needs to be fixed. I have seen this but
>> haven't spent much time to check in detail. It's harmless warning
>> IMO. See the comment in the code too:"This is a fib. But we'll
>> allow new children to be added below a resumed device, even if the
>> device hasn't been completed yet"
>>
>> CPU devices are special and they have separate hotplug paths. So we
>> need to consider that for cpu devices and set is_prepared quite
>> early.
>>
>>> Removing the notifier to explicitly add/remove cache device as
>>> CPU and cache device get added/removed anyway as part of normal
>>> suspend resume sequence. dpm_resume_end - > dpm_resume ->
>>> device_resume
>>>
>>
>> Yes, but: 1. the caches objects are visible even when the cpu is
>> offline 2. how is this handled for normal cpu-hotplug events ? This
>> patch breaks the existing feature.
>
> Compared with x86 now and there even cpufreq is getting deleted. As
> per the comments, right behavior seems to be where cache entries
> should be created during core on and removed during core off in
> hotplug. I will try to find other way of doing it. Also will see why
> cpufreq is not getting deleted as in x86.
>

IIUC you are saying cpufreq sysfs entries are deleted on x86 while not
on ARM{32,64} ? If so are you running same kernel version on both x86
and ARM ? I remember some recent change around cpufreq sysfs entries, it
could be result of that.


-- 
Regards,
Sudeep

-- 
Regards,
Sudeep

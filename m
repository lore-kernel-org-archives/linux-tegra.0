From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 02:18:04 +0300
Message-ID: <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

07.04.2020 01:07, Sowjanya Komatineni пишет:
> 
> On 4/6/20 3:00 PM, Sowjanya Komatineni wrote:
>>
>> On 4/6/20 2:39 PM, Sowjanya Komatineni wrote:
>>>
>>> On 4/6/20 2:15 PM, Sowjanya Komatineni wrote:
>>>>
>>>> On 4/6/20 2:11 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 07.04.2020 00:02, Sowjanya Komatineni пишет:
>>>>>>>>>>> Am I understanding correctly that this thread will take 100%
>>>>>>>>>>> CPU,
>>>>>>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>>>>>>> on more than 2 frames captures, it breaks thread and on next
>>>>>>>>>> wakeup it
>>>>>>>>>> continues
>>>>>>>>> The wait_event() won't wait if condition is true.
>>>>>>>> condition is checked when waitqueue is woken up
>>>>>>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
>>>>>>>
>>>>>> process is put to sleep until the condition evaluates to true or
>>>>>> signal
>>>>>> is received.
>>>>>>
>>>>>> condition is checked each time the waitqueue head is woken up.
>>>>> This is a wrong assumption in accordance to the code.
>>
>> process is in sleep until the condition is evaluated and when
>> condition is true wakeup still happens only when wake_up on waitqueue
>> is called
>>
>> This is the reason for using this to prevent blocking while waiting
>> for the buffers.
> 
> w.r.t capture list update, wakeup happens when wake_up on waitqueue is
> called.
> 
> wakeup also happens on kthread stop signal event.
> 
>>
>>
>>>>
>>>> when every buffer is available as long as we are in streaming, we
>>>> should process it.
>>>>
>>>> So if wake up happens when list has buffer, it will be processed but
>>>> at a time we limit processing 2 simultaneous buffer capture starts
>>>> only.
>>>>
>>> Fixing typo.
>>>
>>> I meant when ever buffer is available as long as we are in streaming,
>>> we should process it.
>>>
>>> So capture thread processes as long as buffers are available from
>>> user space limiting 2 simultaneous trigger of captures and thread
>>> will be in sleep when capture buffers list is empty or no stop thread
>>> is signaled.

IIUC, the waiting won't happen if more than 2 captures are queued and
thread will be spinning until captures are processed.

I think you need a semaphore with resource count = 2.

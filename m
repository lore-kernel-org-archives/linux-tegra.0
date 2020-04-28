From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Tue, 28 Apr 2020 15:37:57 +0300
Message-ID: <c56acfc2-c87c-7ed7-2cd0-ef31553d910f@gmail.com>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <4981d7eb-b41e-c597-04ff-3d3295804d5a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4981d7eb-b41e-c597-04ff-3d3295804d5a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.04.2020 11:01, Jon Hunter пишет:
> 
> On 27/04/2020 16:18, Dmitry Osipenko wrote:
>> 27.04.2020 18:12, Thierry Reding пишет:
>>> On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
>>>> 27.04.2020 14:00, Thierry Reding пишет:
>>>>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>>>>>> 27.04.2020 10:48, Thierry Reding пишет:
>>>>>> ...
>>>>>>>> Maybe but all these other problems appear to have existed for sometime
>>>>>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>>>>>> best for v5.7.
>>>>>>>
>>>>>>> To me it doesn't sound like we have a good handle on what exactly is
>>>>>>> going on here and we're mostly just poking around.
>>>>>>>
>>>>>>> And even if things weren't working quite properly before, it sounds to
>>>>>>> me like this patch actually made things worse.
>>>>>>
>>>>>> There is a plenty of time to work on the proper fix now. To me it sounds
>>>>>> like you're giving up on fixing the root of the problem, sorry.
>>>>>
>>>>> We're at -rc3 now and I haven't seen any promising progress in the last
>>>>> week. All the while suspend/resume is now broken on at least one board
>>>>> and that may end up hiding any other issues that could creep in in the
>>>>> meantime.
>>>>>
>>>>> Furthermore we seem to have a preexisting issue that may very well
>>>>> interfere with this patch, so I think the cautious thing is to revert
>>>>> for now and then fix the original issue first. We can always come back
>>>>> to this once everything is back to normal.
>>>>>
>>>>> Also, people are now looking at backporting this to v5.6. Unless we
>>>>> revert this from v5.7 it may get picked up for backports to other
>>>>> kernels and then I have to notify stable kernel maintainers that they
>>>>> shouldn't and they have to back things out again. That's going to cause
>>>>> a lot of wasted time for a lot of people.
>>>>>
>>>>> So, sorry, I disagree. I don't think we have "plenty of time".
>>>>
>>>> There is about a month now before the 5.7 release. It's a bit too early
>>>> to start the panic, IMO :)
>>>
>>> There's no panic. A patch got merged and it broken something, so we
>>> revert it and try again. It's very much standard procedure.
>>>
>>>> Jon already proposed a reasonable simple solution: to keep PCIe
>>>> regulators always-ON. In a longer run we may want to have I2C atomic
>>>> transfers supported for a late suspend phase.
>>>
>>> That's not really a solution, though, is it? It's just papering over
>>> an issue that this patch introduced or uncovered. I'm much more in
>>> favour of fixing problems at the root rather than keep papering over
>>> until we loose track of what the actual problems are.
>>
>> It's not "papering over an issue". The bug can't be fixed properly
>> without introducing I2C atomic transfers support for a late suspend
>> phase, I don't see any other solutions for now. Stable kernels do not
>> support atomic transfers at all, that proper solution won't be backportable.
> 
> 
> There are a few issues here, but the issue Thierry and I are referring
> to is the regression introduced by this change. Yes this exposes other
> problems, but we first need to understand why this breaks resume in
> general, regardless of what the PCIe driver is doing. I will look at
> this a bit more later this week.

Let's postpone the reverting by 1-3 weeks then. Likely that there will
be a proper (and trivial) solution by that time, otherwise it should be
okay to revert the I2C patch.

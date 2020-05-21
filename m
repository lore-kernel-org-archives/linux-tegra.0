From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Date: Thu, 21 May 2020 19:02:54 +0300
Message-ID: <5653baa1-b7ae-19ab-5299-ecf227be98c2@gmail.com>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
 <20200519160835.GC2113674@ulmo>
 <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
 <20200520105100.GA2141681@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200520105100.GA2141681@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.05.2020 13:51, Thierry Reding пишет:
> On Wed, May 20, 2020 at 05:19:27AM +0300, Dmitry Osipenko wrote:
>> 19.05.2020 19:08, Thierry Reding пишет:
>>> On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
>>>> 15.05.2020 17:39, Thierry Reding пишет:
>>>>> Hi,
>>>>>
>>>>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
>>>>>
>>>>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
>>>>>
>>>>> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
>>>>>
>>>>>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
>>>>>
>>>>> Thanks,
>>>>> Thierry
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> i2c: tegra: Changes for v5.8-rc1
>>>>>
>>>>> This includes a few improvements to make the Tegra I2C controller behave
>>>>> properly on suspend/resume, does a bit of cleanup and adds support for
>>>>> the VI-variant of the I2C controller that is used primarily for video
>>>>> capture purposes.
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Dmitry Osipenko (2):
>>>>>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>>>>>       i2c: tegra: Synchronize DMA before termination
>>>>>
>>>>> Thierry Reding (5):
>>>>>       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>>>>
>>>>>       i2c: tegra: Restore pinmux on system resume
>>>>
>>>> In general this series is good to me, although I have some concerns
>>>> about this patch. Could you please answer the review comments?
>>>
>>> Sorry, those had been burried under too much email. I've answered your
>>> questions now.
>>
>> Hello Thierry,
>>
>> Thank you for the answers, I'd also want to see the answer to the
>> question about how RPM works, i.e. why I2C is RPM-resumed during
>> system's suspend in some cases and not the others.
> 
> I don't think I've seen a question regarding that, so let me answer
> here: the way I understand how this works is that for each device the PM
> core will grab a runtime PM reference during the suspend/resume
> transition, which is done as a way of preventing any of the resumed
> devices from unexpectedly going to runtime suspend.
> 
> This code is in drivers/base/power/main.c, device_prepare(). Note that
> this will only increment the runtime PM usage counter (and therefore
> block the device from entering runtime suspend) but it won't resume the
> device if it is already suspended.

Does it mean that device won't be RPM-suspended if RPM-resume is invoked
during of system's suspend?

I tried to dig through the code, commit messages, kernel docs, etc and
came to a conclusion that it's hacks made on top of other hacks in order
to accommodate needs of the PCI subsystem. This behaviour isn't
documented, which makes RPM a bit awkward to use.

> So far any devices that are already runtime suspended, there isn't
> really anything we have to do during suspend. For those who are not yet
> suspended, we need to force them into suspend so that their clocks are
> disabled and the pinmux state set properly (to "idle").
> 
> On resume we first need to runtime resume the device undconditionally so
> that context can be restored. Runtime resume will take care of enabling
> the clock and setting the pinmux state to "default". Then we restore the
> context and if the device had been runtime suspended, we manually call
> the runtime suspend callback again so that the state matches what the PM
> core thinks it is. However, if the device had not been runtime suspended
> during system suspend, then we must not manually put it back into
> suspend because it would no longer match the PM core's state.
> 
> Does that answer your question?

Yes, this partially answers my question, thank you. Still I don't have a
full picture.

I also don't like the fact that RPM behavior during of system's suspend
isn't symmetrical to system's resume, yet not sure if it is really
intended. I.e. that RPM allows to resume during of late suspend, but not
on early resume.

Anyways, I haven't noticed any problems using this series, so should be
good.

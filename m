From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/19] More improvements for Tegra30 devfreq driver
Date: Wed, 2 Oct 2019 16:54:44 +0300
Message-ID: <6967777e-b54f-8021-aa6d-8c245e529e10@gmail.com>
References: <20190811212315.12689-1-digetx@gmail.com>
 <CGME20191001211534epcas2p1e5f878969d3f68d4dfcafd82b1538487@epcas2p1.samsung.com>
 <17dabcfc-3351-13a1-b3de-81af88f64d84@gmail.com>
 <503b2ade-ff8e-c354-3886-3b7b511bd07e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <503b2ade-ff8e-c354-3886-3b7b511bd07e@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.10.2019 03:25, Chanwoo Choi пишет:
> Hello Dmitry and Thierry,
> 
> On 19. 10. 2. 오전 6:15, Dmitry Osipenko wrote:
>> 12.08.2019 00:22, Dmitry Osipenko пишет:
>>> Hello,
>>>
>>> This series addresses some additional review comments that were made by
>>> Thierry Reding to [1], makes several important changes to the driver,
>>> fixing excessive interrupts activity, and adds new features. In the end
>>> I'm proposing myself as a maintainer for the Tegra devfreq drivers.
>>>
>>> [1] https://lore.kernel.org/lkml/0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com/T/
>>>
>>> Changelog:
>>>
>>> v6:  Addressed review comment that was made by Chanwoo Choi to v5 by
>>>      squashing "Define ACTMON_DEV_CTRL_STOP" patch into the "Use CPUFreq
>>>      notifier" patch.
>>>
>>> v5:  Addressed review comments that were made by Chanwoo Choi to v4 by
>>>      squashing few patches, dropping some questionable patches, rewording
>>>      comments to the code, restructuring the code and etc.
>>>
>>>      These patches are now dropped from the series:
>>>
>>>        PM / devfreq: tegra30: Use tracepoints for debugging
>>>        PM / devfreq: tegra30: Inline all one-line functions
>>>
>>>      The interrupt-optimization patches are squashed into a single patch:
>>>
>>>        PM / devfreq: tegra30: Reduce unnecessary interrupts activity
>>>
>>>      because it's better to keep the optimizations as a separate change and
>>>      this also helps to reduce code churning, since the code changes depend
>>>      on a previous patch in order to stay cleaner.
>>>
>>>      Fixed a lockup bug that I spotted recently, which is caused by a
>>>      clk-notifier->cpufreq_get()->clk_set_rate() sequence. Now a non-blocking
>>>      variant of CPU's frequency retrieving is used, i.e. cpufreq_quick_get().
>>>
>>>      Further optimized the CPUFreq notifier by postponing the delayed
>>>      updating in accordance to the polling interval, this actually uncovered
>>>      the above lockup bug.
>>>
>>>      Implemented new minor driver feature in the new patch:
>>>
>>>        PM / devfreq: tegra30: Support variable polling interval
>>>
>>> v4:  Added two new patches to the series:
>>>
>>>        PM / devfreq: tegra30: Synchronize average count on target's update
>>>        PM / devfreq: tegra30: Increase sampling period to 16ms
>>>
>>>      The first patch addresses problem where governor could get stuck due
>>>      to outdated "average count" value which is snapshoted by ISR and there
>>>      are cases where manual update of the value is required.
>>>
>>>      The second patch is just a minor optimization.
>>>
>>> v3:  Added support for tracepoints, replacing the debug messages.
>>>      Fixed few more bugs with the help of tracepoints.
>>>
>>>      New patches in this version:
>>>
>>>        PM / devfreq: tegra30: Use tracepoints for debugging
>>>        PM / devfreq: tegra30: Optimize CPUFreq notifier
>>>        PM / devfreq: tegra30: Optimize upper consecutive watermark selection
>>>        PM / devfreq: tegra30: Optimize upper average watermark selection
>>>        PM / devfreq: tegra30: Include appropriate header
>>>
>>>      Some of older patches of this series also got some extra minor polish.
>>>
>>> v2:  Added more patches that are cleaning driver's code further and
>>>      squashing another kHz conversion bug.
>>>
>>>      The patch "Rework frequency management logic" of the v1 series is now
>>>      converted to "Set up watermarks properly" because I found some problems
>>>      in the original patch and then realized that there is no need to change
>>>      the logic much. So the logic mostly preserved and only got improvements.
>>>
>>>      The series is based on the today's linux-next (25 Jun) and takes into
>>>      account minor changes that MyungJoo Ham made to the already queued
>>>      patches from the first batch [1].
>>>
>>> Dmitry Osipenko (19):
>>>   PM / devfreq: tegra30: Change irq type to unsigned int
>>>   PM / devfreq: tegra30: Keep interrupt disabled while governor is
>>>     stopped
>>>   PM / devfreq: tegra30: Handle possible round-rate error
>>>   PM / devfreq: tegra30: Drop write-barrier
>>>   PM / devfreq: tegra30: Set up watermarks properly
>>>   PM / devfreq: tegra30: Tune up boosting thresholds
>>>   PM / devfreq: tegra30: Fix integer overflow on CPU's freq max out
>>>   PM / devfreq: tegra30: Ensure that target freq won't overflow
>>>   PM / devfreq: tegra30: Use kHz units uniformly in the code
>>>   PM / devfreq: tegra30: Reduce unnecessary interrupts activity
>>>   PM / devfreq: tegra30: Use CPUFreq notifier
>>>   PM / devfreq: tegra30: Move clk-notifier's registration to governor's
>>>     start
>>>   PM / devfreq: tegra30: Reset boosting on startup
>>>   PM / devfreq: tegra30: Don't enable consecutive-down interrupt on
>>>     startup
>>>   PM / devfreq: tegra30: Constify structs
>>>   PM / devfreq: tegra30: Include appropriate header
>>>   PM / devfreq: tegra30: Increase sampling period to 16ms
>>>   PM / devfreq: tegra30: Support variable polling interval
>>>   PM / devfreq: tegra20/30: Add Dmitry as a maintainer
>>>
>>>  MAINTAINERS                       |   9 +
>>>  drivers/devfreq/tegra30-devfreq.c | 706 +++++++++++++++++++++++-------
>>>  2 files changed, 555 insertions(+), 160 deletions(-)
>>>
>>
>> Hello Chanwoo,
>>
>> I don't have any more updates in regards to this series, everything is
>> working flawlessly for now. Will be awesome if we could continue the
>> reviewing and then get the patches into linux-next to get some more testing.
>>
>>
> 
> Hello Dmitry,
> 
> I'm sorry for late reply. Except for patch5, I reviewed the patches.
> Please check my comment. Actually, It is difficult to review the patch5
> without any testing environment and detailed knowledge of watermark of tegra.
> It is not familiar with me.

Thank you very much! I'll go through yours comments and reply to them.

I understand that it's not easy for you to review patch5, but probably
you don't need to go into details and a brief-generic review of the code
will be enough in that case.

The hardware is actually very simple, there are watermarks that
correspond to a memory activity that hardware accounts over a given
period of time. Once watermark is reached, hardware generates interrupt.
There are two types of watermarks: average and consecutive. In case of
the average, the memory activity is collected over a larger window of
time. For the consecutive case, the memory activity is collected over
each period (16ms by default in the driver). Memory client may breach
average watermark very frequently, although that may not affect much the
average value and for some memory clients (like CPU) it is more
preferred to not completely ignore those short bursts of memory
activity. The consecutive watermarks are used in order to detect those
short bursts, which we account in the driver in a form of boosting. You
may notice that boost_up_coeff for the CPU's memory client is set to a
higher value in the driver.

> Hello Thierry,
> If possible, Could you review the patch5 related to setting up the watermark
> and other patches?
> 

Indeed, will be very nice if Thierry could also take a look at this
series. Although.. I could be wrong here, but it looks to me that
Thierry also isn't closely familiar with this driver and the hardware.

Thierry, at least please let us know if you're interested in taking a
look at the patches, I'm pretty sure that you're quite busy with other
things ;)

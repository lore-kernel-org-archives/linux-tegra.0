From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
Date: Thu, 2 Jul 2020 08:53:08 +0300
Message-ID: <388eef55-3452-064b-8560-e9d65b908525@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
 <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
 <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
 <2069fb51-f043-795d-7768-0024fc9a9f4e@samsung.com>
 <7988b6cf-e60c-7e5c-ffc3-8075c20af3d3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7988b6cf-e60c-7e5c-ffc3-8075c20af3d3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

02.07.2020 08:43, Dmitry Osipenko пишет:
> 02.07.2020 08:30, Chanwoo Choi пишет:
>> On 7/2/20 2:07 PM, Dmitry Osipenko wrote:
>>> 02.07.2020 07:18, Chanwoo Choi пишет:
>>>> Hi Dmitry,
>>>>
>>>> On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
>>>>> The clk_round_rate() won't be usable for building OPP table once
>>>>> interconnect support will be added to the EMC driver because that CLK API
>>>>> function limits the rounded rate based on the clk rate that is imposed by
>>>>> active clk-users, and thus, the rounding won't work as expected if
>>>>> interconnect will set the minimum EMC clock rate before devfreq driver is
>>>>> loaded. The struct tegra_mc contains memory timings which could be used by
>>>>> the devfreq driver for building up OPP table instead of rounding clock
>>>>> rate, this patch implements this idea.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>>  drivers/devfreq/tegra20-devfreq.c | 18 +++++++++++-------
>>>>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
>>>>> index 6469dc69c5e0..bf504ca4dea2 100644
>>>>> --- a/drivers/devfreq/tegra20-devfreq.c
>>>>> +++ b/drivers/devfreq/tegra20-devfreq.c
>>>>> @@ -123,8 +123,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>>  {
>>>>>  	struct tegra_devfreq *tegra;
>>>>>  	struct tegra_mc *mc;
>>>>> -	unsigned long max_rate;
>>>>> -	unsigned long rate;
>>>>> +	unsigned int i;
>>>>>  	int err;
>>>>>  
>>>>>  	mc = tegra_get_memory_controller();
>>>>> @@ -151,12 +150,17 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>>  
>>>>>  	tegra->regs = mc->regs;
>>>>>  
>>>>> -	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
>>>>> -
>>>>> -	for (rate = 0; rate <= max_rate; rate++) {
>>>>> -		rate = clk_round_rate(tegra->emc_clock, rate);
>>>>> +	if (!mc->num_timings) {
>>>>
>>>> Could you explain what is meaning of 'num_timing?
>>>
>>> The num_timings is the number of memory timings defined in a
>>> device-tree. One timing configuration per memory clock rate.
>>
>> OK. I understand.
>>
>>>
>>>> Also, why add the opp entry in case of mc->num_timings is zero?
>>>
>>> Timings may be not defined in some device-trees at all and in this case
>>> memory always running on a fixed clock rate.
>>
>> You mean that 'timings' information is optional?
> 
> Yes
> 
> Actually, looks like I missed to properly test this case where timings
> are missing in DT and it shouldn't work with the current code. I'll fix
> it in the next version.
> 
>>>
>>> The devfreq driver won't be practically useful if mc->num_timings is
>>> zero since memory frequency can't be changed, but anyways we'd want to
>>> load the devfreq driver in order to prevent confusion about why it's not
>>> loaded.
>>>
>>> For example, you may ask somebody to show contents of
>>> /sys/class/devfreq/tegra20-devfreq/trans_stat and the person says to you
>>> that this file doesn't exist, now you'll have to figure out what
>>> happened to the devfreq driver.
>>
>> I understand why add OPP entry point when timing is not defined on DT.
>> But, actually, I think that you better to change 'timings' info is mandatory
>> instead of optional. Because the devfreq driver is for DVFS
>> and the driver supporting DVFS have to have the frequency information
>> like OPP.

That's what I initially did by bailing out from driver's probe if
timings info is missing, until ran into a situation described above :)

>> Or, 
>> If you want to keep 'timing' is optional on DT,
>> I recommend that you add one timing data to tegra mc driver
>> when DT doesn't include the any timing information
>> I think that is it more clear.
> 
> Okay, I'll move it into the MC driver in the next version.
> 
> Thank you for the review!
> 

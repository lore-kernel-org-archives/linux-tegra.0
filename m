From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] cpuidle: tegra: Correctly handle result of
 arm_cpuidle_simple_enter()
Date: Wed, 8 Jul 2020 17:32:18 +0300
Message-ID: <3bc2064e-e94d-984c-edab-50b4dc2fd2dd@gmail.com>
References: <20200702001354.27056-1-digetx@gmail.com>
 <4ffff3d8-2d41-3fb2-ed16-c9662d18d261@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ffff3d8-2d41-3fb2-ed16-c9662d18d261-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.07.2020 15:34, Jon Hunter пишет:
> 
> On 02/07/2020 01:13, Dmitry Osipenko wrote:
>> The enter() callback of CPUIDLE drivers returns index of the entered idle
>> state on success or a negative value on failure. The negative value could
>> any negative value, i.e. it doesn't necessarily needs to be a error code.
>> That's because CPUIDLE core only cares about the fact of failure and not
>> about the reason of the enter() failure.
>>
>> Like every other enter() callback, the arm_cpuidle_simple_enter() returns
>> the entered idle-index on success. Unlike some of other drivers, it never
>> fails. It happened that TEGRA_C1=index=err=0 in the code of cpuidle-tegra
>> driver, and thus, there is no problem for the cpuidle-tegra driver created
>> by the typo in the code which assumes that the arm_cpuidle_simple_enter()
>> returns a error code.
>>
>> The arm_cpuidle_simple_enter() also may return a -ENODEV error if CPU_IDLE
>> is disabled in a kernel's config, but all CPUIDLE drivers are disabled if
>> CPU_IDLE is disabled, including the cpuidle-tegra driver. So we can't ever
>> see the error code from arm_cpuidle_simple_enter() today.
>>
>> Of course the code may get some changes in the future and then the typo
>> may transform into a real bug, so let's correct the typo in the code by
>> making tegra_cpuidle_enter() to directly return the index returned by the
>> arm_cpuidle_simple_enter().
> 
> Are you suggesting that arm_cpuidle_simple_enter() could be updated to
> actually return an error? Sorry it is not clear to me what you are implying.

Hello, Jon!

Yes, I'm saying that *potentially* arm_cpuidle_simple_enter() could be
updated to actually return error.

The implication is that the current code is wrong and it may strike back
in the future if we won't fix it. Is this more clear? :)

From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 14/17] cpuidle: tegra: Squash Tegra114 driver into the
 common driver
Date: Thu, 27 Feb 2020 19:45:45 +0300
Message-ID: <4f452e32-10c4-b906-7d22-dc8977962666@gmail.com>
References: <20200224224057.21877-1-digetx@gmail.com>
 <20200224224057.21877-15-digetx@gmail.com>
 <dcf45352-8ea3-6273-b4e8-0142f5d5e9f2@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dcf45352-8ea3-6273-b4e8-0142f5d5e9f2-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.02.2020 12:21, Daniel Lezcano пишет:
> On 24/02/2020 23:40, Dmitry Osipenko wrote:
>> Tegra20/30/114/124 SoCs have common idling states, thus there is no much
>> point in having separate drivers for a similar hardware. This patch moves
>> Tegra114/124 arch/ drivers into the common driver without any functional
>> changes. The CC6 state is kept disabled on Tegra114/124 because the core
>> Tegra PM code needs some more work in order to support that state.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> 
> Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Awesome, thank you :)

@Thierry, could you please pick up the updated patches for linux-next +
pick up the cpufreq series? Thanks in advance!

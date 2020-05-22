From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/3] cpuidle: tegra: Support CPU cluster power-down
 state on Tegra30
Date: Fri, 22 May 2020 18:42:35 +0200
Message-ID: <99326cc2-0b08-6793-ee8b-1076ec9c9f55@linaro.org>
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-4-digetx@gmail.com> <20200506163341.GA2723057@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506163341.GA2723057@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2020 18:33, Thierry Reding wrote:
> On Wed, Mar 25, 2020 at 01:43:35AM +0300, Dmitry Osipenko wrote:
>> The new Tegra CPU Idle driver now has a unified code path for the coupled
>> CC6 (LP2) state, this allows to enable the deepest idling state on Tegra30
>> SoC where the whole CPU cluster is power-gated.
>>
>> Tested-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
>> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
>> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/cpuidle/cpuidle-tegra.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Daniel,
> 
> do you mind if I pick this up into the Tegra tree because of the runtime
> dependencies on the firmware and ARM core changes in patches 1 & 2?

Sorry for the late reply, I'm overbooked this cycle.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

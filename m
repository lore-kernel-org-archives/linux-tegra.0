From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 23:50:42 +0300
Message-ID: <37c5af25-c00b-cfe0-4c13-00ac5bdef82c@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
 <20200414145442.GJ3593749@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200414145442.GJ3593749@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

14.04.2020 17:54, Thierry Reding пишет:
...
>> I'd suggest to check how much time invocation of ktime_get() takes, at
>> least it came to a surprise to me in a case of the tegra-cpuidle driver.
>>
>> It may be well over the emc->clkchange_delay.
> 
> I assume that at least each invocation would take roughly the same
> amount of time?

Not sure.

> Since we only use the value to compute the time since
> the last clock change the result should always be valid. In the worst
> case if ktime_get() really takes that long we may be waiting longer
> than we need to, but that wouldn't be all that bad either. Changing
> the EMC clock rate isn't something that you want to do a lot.

Then probably should be cleaner and simpler to have a constant delay in
the code?

From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] PM / OPP: 'UNKNOWN' status of opp-table->shared
Date: Thu, 16 Jun 2016 12:27:03 +0530
Message-ID: <20160616065703.GB5726@vireshk-i7>
References: <87bd097db7b673b1f75ca2086dfa76f4dfbf7f8c.1466058619.git.viresh.kumar@linaro.org>
 <dfe1db09-8361-ebc8-063a-c8e0393ceedc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dfe1db09-8361-ebc8-063a-c8e0393ceedc@nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@codeaurora.org>, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 16-06-16, 15:55, Alexandre Courbot wrote:
> On 06/16/2016 03:33 PM, Viresh Kumar wrote:
> >dev_pm_opp_get_sharing_cpus() returns 0 even in the case where the OPP
> >core doesn't know if the table is shared or not. It is working for most
> >of the platforms, as the OPP table was never created and we returned
> >-ENODEV then.
> >
> >But in case of one of the platforms (Jetson TK1) at least, the situation
> >is a bit different. The OPP table is created (somehow) before
> >dev_pm_opp_get_sharing_cpus() is called and so we returned 0. The caller
> >of this routine treated that as 'CPUs don't share OPPs' and that had bad
> >consequences on performance.
> >
> >Fix this by converting 'shared_opp' to an integer and have an extra
> >value when its state in undefined. dev_pm_opp_get_sharing_cpus() returns
> >-EINVAL now in that case, so that the caller can handle it accordingly
> >(cpufreq-dt considers that as 'all CPUs share the table').
> >
> >Fixes: 6f707daa3833 ("PM / OPP: Add dev_pm_opp_get_sharing_cpus()")
> >Reported-by: Alexandre Courbot <acourbot@nvidia.com>
> >Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >---
> >Hi Alexandre,
> >
> >This is untested, can you please confirm if this fixes it for you?
> 
> Yep, with this cpufreq_init() takes the fallback path and cpufreq behaves as
> expected thereafter.
> 
> Thanks for reacting so quickly! Can this go into 4.7 fixes?

This will :)

> Tested-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks.

-- 
viresh

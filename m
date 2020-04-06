From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v2 0/3] Add cpufreq driver for Tegra194
Date: Mon, 6 Apr 2020 08:17:26 +0530
Message-ID: <20200406024726.sbtutqsv2t2p2gkg@vireshk-i7>
References: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586028547-14993-1-git-send-email-sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05-04-20, 00:59, Sumit Gupta wrote:
> The patch series adds cpufreq driver for Tegra194 SOC.
> 
> v1[1] -> v2:
> - Remove cpufreq_lock mutex from tegra194_cpufreq_set_target [Viresh].
> - Remove CPUFREQ_ASYNC_NOTIFICATION flag [Viresh].
> - Remove redundant _begin|end() call from tegra194_cpufreq_set_target.
> - Rename opp_table to freq_table [Viresh].

Have we concluded the earlier discussion already ? I posted some
questions where I had doubts and you just answered them and posted a
new version. Please wait for the reviewers to have a chance to reply
to them. Your new version may be okay, but still we can avoid another
set of patches which may be wrong.

-- 
viresh

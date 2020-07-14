From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Date: Tue, 14 Jul 2020 13:01:52 +0530
Message-ID: <20200714073152.cof7pdgevcaettm2@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200713032554.cykywnygxln6ukrl@vireshk-i7>
 <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
 <20200714034635.2zdv3wzmftjg2t4a@vireshk-i7>
 <aa941c67-1dec-5363-7bd7-5e9d8d324110@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <aa941c67-1dec-5363-7bd7-5e9d8d324110-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 14-07-20, 08:26, Jon Hunter wrote:
> OK, I can add a get callback. However, there are a few other drivers
> that set the current frequency in the init() and don't implement a get()
> callback ...
> 
> drivers/cpufreq/pasemi-cpufreq.c
> drivers/cpufreq/ppc_cbe_cpufreq.c

These are quite old and I am not sure why they didn't do it.

> drivers/cpufreq/intel_pstate.c

With intel-pstate driver, the firmware sets the frequency of the CPUs
and it can be different from what cpufreq core has asked it to. And so
the kernel normally has no idea of what the frequency a CPU is running
at.

-- 
viresh

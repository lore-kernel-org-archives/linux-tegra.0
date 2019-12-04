From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Date: Wed, 4 Dec 2019 14:47:03 +0530
Message-ID: <20191204091703.d32to5omdm3eynon@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo>
 <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 04-12-19, 10:45, Mikko Perttunen wrote:
> Now, my original patchset (which this series is based on) did add
> nvidia,bpmp properties on the CPU DT nodes itself and query BPMP based on
> that. A change is still required for that since tegra_bpmp_get() currently
> takes a 'struct device *' which we don't have for a CPU DT node.

I may be missing the context, but the CPUs always have a struct device
* for them, which we get via a call to get_cpu_device(cpu), isn't ?

-- 
viresh

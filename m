From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Date: Wed, 4 Dec 2019 15:21:38 +0530
Message-ID: <20191204095138.rrul5vxnkprfwmku@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo>
 <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
 <20191204091703.d32to5omdm3eynon@vireshk-i7>
 <20191204093339.GA2784830@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191204093339.GA2784830@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>, Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04-12-19, 10:33, Thierry Reding wrote:
> Yeah, the code that registers this device is in drivers/base/cpu.c in
> register_cpu(). It even retrieves the device tree node for the CPU from
> device tree and stores it in cpu->dev.of_node, so we should be able to
> just pass &cpu->dev to tegra_bpmp_get() in order to retrieve a reference
> to the BPMP.
> 
> That said, I'm wondering if perhaps we could just add a compatible
> string to the /cpus node for cases like this where we don't have an
> actual device representing the CPU complex. There are a number of CPU
> frequency drivers that register dummy devices just so that they have
> something to bind a driver to.
> 
> If we allow the /cpus node to represent the CPU complex (if no other
> "device" does that yet), we can add a compatible string and have the
> cpufreq driver match on that.
> 
> Of course this would be slightly difficult to retrofit into existing
> drivers because they'd need to remain backwards compatible with existing
> device trees. But it would allow future drivers to do this a little more
> elegantly. For some SoCs this may not matter, but especially once you
> start depending on additional resources this would come in handy.
> 
> Adding Rob and the device tree mailing list for feedback on this idea.

Took some time to find this thread, but something around this was
suggested by Rafael earlier.

https://lore.kernel.org/lkml/8139001.Q4eV8YG1Il@vostro.rjw.lan/

-- 
viresh

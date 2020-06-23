From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v3 3/4] cpufreq: Add Tegra194 cpufreq
 driver
Date: Tue, 23 Jun 2020 11:50:20 +0530
Message-ID: <20200623062020.weg6h4uygelkih7d@vireshk-i7>
References: <1592775274-27513-1-git-send-email-sumitg@nvidia.com>
 <1592775274-27513-4-git-send-email-sumitg@nvidia.com>
 <20200622072052.uryxo4hri6gzrkku@vireshk-i7>
 <ed6956a3-3f77-2943-6387-5affc25b59d2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ed6956a3-3f77-2943-6387-5affc25b59d2@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 23-06-20, 10:49, Sumit Gupta wrote:
> Hi Viresh,
> 
> Thank you for the review. please find my reply inline.
> 
> 
> > > +++ b/drivers/cpufreq/tegra194-cpufreq.c
> > > @@ -0,0 +1,403 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved
> > 
> >                      2020

You missed this ?

> T194 supports four CPU clusters, each with two cores. Each CPU cluster is
> capable of running at a specific frequency sourced by respective NAFLL to
> provide cluster specific clocks. Individual cores within a cluster write
> freq in per core register. Cluster h/w forwards the max(core0, core1)
> request to per cluster NAFLL.

Okay, this is clear now. Add a comment about this max thing in the
target routine to show why you need to do this on all CPUs.

-- 
viresh

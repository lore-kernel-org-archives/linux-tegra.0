From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 0/6] Tegra210 DFLL implementation
Date: Thu, 1 Feb 2018 11:30:27 +0200
Message-ID: <20180201093027.GW7031@tbergstrom-lnx.Nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <31e9aad3-bb3d-2475-4fa7-3ecf43dc2f9e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31e9aad3-bb3d-2475-4fa7-3ecf43dc2f9e@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 31, 2018 at 11:28:31AM +0000, Jon Hunter wrote:
> 
> On 24/01/18 12:45, Peter De Schrijver wrote:
> > This series introduces support for the DFLL as a CPU clock source
> > on Tegra210. As Jetson TX2 uses a PWM controlled regulator IC which
> > is driven directly by the DFLLs PWM output, we also introduce support
> > for PWM regulators next to I2C controlled regulators. The DFLL output
> > frequency is directly controlled by the regulator voltage. The registers
> > for controlling the PWM are part of the DFLL IP block, so there's no
> > separate linux regulator object involved because the regulator IC only
> > supplies the rail powering the DFLL and the CPUs. It doesn't have any
> > other controls.
> > 
> > Changes since v1:
> > * improved commit messages
> > * some style cleanups
> > 
> > Peter De Schrijver (6):
> >   clk: tegra: dfll registration for multiple SoCs
> >   clk: tegra: DT align parameter for CVB calculation
> >   clk: tegra: add CVB tables for Tegra210 CPU DFLL
> >   clk: tegra: dfll: support PWM regulator control
> >   clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
> >   cpufreq: tegra124-cpufreq: extend to support Tegra210
> > 
> >  drivers/clk/tegra/Kconfig                  |   5 +
> >  drivers/clk/tegra/Makefile                 |   2 +-
> >  drivers/clk/tegra/clk-dfll.c               | 481 +++++++++++++++++++++++-----
> >  drivers/clk/tegra/clk-dfll.h               |   7 +
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 492 ++++++++++++++++++++++++++++-
> >  drivers/clk/tegra/cvb.c                    |  18 +-
> >  drivers/clk/tegra/cvb.h                    |   6 +-
> >  drivers/cpufreq/tegra124-cpufreq.c         |  13 +-
> >  8 files changed, 920 insertions(+), 104 deletions(-)
> 
> This series appears to be missing DT documentation and DT source changes?
> 

Yes.. It seems I forgot those..

Peter.

> Cheers
> Jon
> 
> -- 
> nvpublic

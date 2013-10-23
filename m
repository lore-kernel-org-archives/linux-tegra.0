From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: pull request for Tegra clock rework and Tegra124 clock support
Date: Wed, 23 Oct 2013 11:46:31 +0300
Message-ID: <20131023084631.GG22111@tbergstrom-lnx.Nvidia.com>
References: <20131021135638.GA10943@tbergstrom-lnx.Nvidia.com>
 <20131022101904.7554.73999@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131022101904.7554.73999@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 22, 2013 at 12:19:04PM +0200, Mike Turquette wrote:
> Quoting Peter De Schrijver (2013-10-21 06:56:38)
> > Hi Mike,
> > 
> > This pull request contains both the tegra clock rework patches
> > ([PATCH v6 00/15] Introduce common infra for tegra clocks)
> > and the patches to support Tegra124 ([PATCH v4 0/7] Tegra124 clock support)
> > 
> > The following changes since commit d031acfc0b8376209e5b429513766e7028e40e1d:
> > 
> >   clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d (2013-10-16 19:49:25 +0300)
> > 
> > are available in the git repository at:
> >   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-tegra124-0
> 
> Thanks for the pull request Peter. I've taken into clk-next. Next time
> can you generate a signed tag? Due to the increased volume of ccf

Ok :) let's sign some keys next week then :)

Cheers,

Peter.

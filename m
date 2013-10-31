From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for Tegra clock rework and Tegra124 clock support
Date: Thu, 31 Oct 2013 11:52:02 -0700
Message-ID: <20131031185202.11662.1489@quantum>
References: <20131021135638.GA10943@tbergstrom-lnx.Nvidia.com>
 <20131022101904.7554.73999@quantum>
 <20131023084631.GG22111@tbergstrom-lnx.Nvidia.com>
 <20131030004752.GH22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131030004752.GH22111@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2013-10-29 17:47:52)
> Mike,
> 
> This is an update to the previous pull request which fixes some late bugs.
> 
> Thanks,
> 
> Peter.
> 
> The following changes since commit 6c984fc8c6314596c302bbecf79dc59d9f98f348:
> 
>   clk: tegra124: add suspend/resume function for tegra_cpu_car_ops (2013-10-21 16:39:24 +0300)
> 
> are available in the git repository at:
>   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git tegra-clk-tegra124-0

Pulled.

Thanks,
Mike

> 
> Mikko Perttunen (1):
>       clk: tegra114: Initialize clocks needed for HDMI
> 
> Peter De Schrijver (1):
>       clk: tegra: use pll_ref as the pll_e parent
> 
> Thierry Reding (2):
>       clk: tegra: Initialize secondary gr3d clock on Tegra30
>       clk: tegra: Properly setup PWM clock on Tegra30
> 
>  drivers/clk/tegra/clk-pll.c      |    7 ++++---
>  drivers/clk/tegra/clk-tegra114.c |    5 ++++-
>  drivers/clk/tegra/clk-tegra30.c  |    5 ++++-
>  3 files changed, 12 insertions(+), 5 deletions(-)

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] firmware: tegra-bpmp: mark PM function as __maybe_unused
Date: Thu, 4 Oct 2018 17:31:01 +0200
Message-ID: <CAK8P3a1j_Gowa-aK=-3cdgvnhReVyJLigQtceDwXYNZH_tMdbQ@mail.gmail.com>
References: <20181002212208.2971433-1-arnd@arndb.de> <64a99db8-85e4-52ab-d0fa-0faa5bb7187a@nvidia.com>
 <31707122-ae73-c608-e9f6-c114d6db2b25@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <31707122-ae73-c608-e9f6-c114d6db2b25@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: talho@nvidia.com
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 4, 2018 at 5:11 PM Timo Alho <talho@nvidia.com> wrote:
> On 03.10.2018 11:26, Jonathan Hunter wrote:
> > On 02/10/18 22:21, Arnd Bergmann wrote:
> >> The newly added tegra_bpmp_resume function is unused when CONFIG_PM
> >> is disabled:
> >>
> >> drivers/firmware/tegra/bpmp.c:847:12: error: 'tegra_bpmp_resume' defined but not used [-Werror=unused-function]
> >>   static int tegra_bpmp_resume(struct device *dev)
> >>
> >> Mark it as __maybe_unused to avoid the warning and let the compiler
> >> drop it silently.
> >>
> >> Fixes: cd40f6ff124c ("firmware: tegra: bpmp: Implement suspend/resume support")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>   drivers/firmware/tegra/bpmp.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> >> index 41448ba78be9..a3d5b518c10e 100644
> >> --- a/drivers/firmware/tegra/bpmp.c
> >> +++ b/drivers/firmware/tegra/bpmp.c
> >> @@ -844,7 +844,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
> >>      return err;
> >>   }
> >>
> >> -static int tegra_bpmp_resume(struct device *dev)
> >> +static int __maybe_unused tegra_bpmp_resume(struct device *dev)
> >>   {
> >>      struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
> >>      unsigned int i;
> >
> > Arnd, is this seen with 32-bit ARM configs?

This was with a randconfig build on 64-bit ARM. I don't know exactly
what combination of options caused it.

> > Timo, does it make sense to make BPMP dependent on ARCH_TEGRA_186_SOC
> > and ARCH_TEGRA_194_SOC instead of just ARCH_TEGRA? For 64-bit Tegra we
> > have a dependency on PM so this should not be seen for 64-bit Tegra.

CONFIG_PM does not imply CONFIG_PM_SLEEP, so probably it
was just broken for PM=y, PM_SLEEP=n.

> Jon, there will be eventually a BPMP driver for ARCH_TEGRA_210_SOC as
> well. So it is probably more appropriate to make BPMP dependent on ARM64
> & ARCH_TEGRA.

Generally speaking, we are trying to allow building all drivers at least
with CONFIG_COMPILE_TEST, in order to get the best build coverage.

       Arnd

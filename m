From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 07/11] cpufreq: dt-platdev: Blacklist NVIDIA Tegra20
 and Tegra30 SoCs
Date: Mon, 16 Dec 2019 09:38:08 +0530
Message-ID: <20191216040808.w67jxu7oapxgm7yh@vireshk-i7>
References: <20191118164512.8676-1-digetx@gmail.com>
 <20191118164512.8676-8-digetx@gmail.com>
 <20191216040532.mzdovqoub5rdztwb@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191216040532.mzdovqoub5rdztwb@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 16-12-19, 09:35, Viresh Kumar wrote:
> On 18-11-19, 19:45, Dmitry Osipenko wrote:
> > Both NVIDIA Tegra20 and Tegra30 SoCs should be blacklisted because CPU
> > OPPs use supported_hw and thus platdev isn't suitable for these SoCs.
> > Currently cpufreq-dt driver produces a bit annoying warning splats
> > during boot because valid OPPs are not found, this will be fixed once
> > tegra20-cpufreq driver will be update to support cpufreq-dt. The warnings
> > will also happen on older stable kernels using newer device-trees, thus
> > this patch should be backported to stable kernels as well.
> > 
> > Cc: <stable@vger.kernel.org>
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Fixes: 4053aa65c517 ("ARM: tegra: cardhu-a04: Add CPU Operating Performance Points")
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index f1d170dcf4d3..aba591d57c67 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -121,6 +121,8 @@ static const struct of_device_id blacklist[] __initconst = {
> >  	{ .compatible = "mediatek,mt8176", },
> >  	{ .compatible = "mediatek,mt8183", },
> >  
> > +	{ .compatible = "nvidia,tegra20", },
> > +	{ .compatible = "nvidia,tegra30", },
> >  	{ .compatible = "nvidia,tegra124", },
> >  	{ .compatible = "nvidia,tegra210", },
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Oops, pasted the wrong register here :(

Applied. Thanks.

-- 
viresh

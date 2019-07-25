From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
Date: Thu, 25 Jul 2019 12:41:25 +0300
Message-ID: <20190725094125.GL12715@pdeschrijver-desktop.Nvidia.com>
References: <20190707230843.11224-1-digetx@gmail.com>
 <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 18, 2019 at 10:45:31AM +0100, Jon Hunter wrote:
> 
> On 08/07/2019 00:08, Dmitry Osipenko wrote:
> > The PCLK clock is running off SCLK, which is a critical clock that is
> > very unlikely to randomly change its rate. It's also a bit clumsy (and
> > apparently incorrect) to query the clock's rate with interrupts being
> > disabled because clk_get_rate() takes a mutex and that's the case during
> > suspend/cpuidle entering. Lastly, it's better to always fully reprogram
> > PMC state because it's not obvious whether it could be changed after SC7.
> 
> I agree with the first part, but I would drop the last sentence because
> I see no evidence of this. Maybe Peter can confirm.
> 

SCLK and PCLK certainly can change rate at runtime, although the changes
for this haven't made it upstream yet. It's indeed not very obvious, but
certainly doable.

Peter.

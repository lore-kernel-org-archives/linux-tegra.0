From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v3 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Fri, 2 Aug 2019 16:38:46 +0300
Message-ID: <20190802133846.GC3883@pdeschrijver-desktop.Nvidia.com>
References: <20190730174020.15878-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730174020.15878-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 30, 2019 at 08:40:19PM +0300, Dmitry Osipenko wrote:
> The PCLK clock is running off SCLK, which is a critical clock that is
> very unlikely to randomly change its rate. It is possible to get a
> lockup if kernel decides to enter LP2 cpuidle from a clk-notifier, which
> happens occasionally in a case of Tegra30 EMC driver that waits for the
> clk-change event in the clk-notify handler, because CCF's 'prepare' mutex
> in kept locked and thus clk_get_rate() wants to sleep with interrupts
> being disabled.
> 

I don't think this is the right solution. Eventually we will want to
scale sclk and pclk because the clock tree power of those is not
insignificant. Maybe register a notifier which updates the PMC timer
values when pclk changes?

Peter.

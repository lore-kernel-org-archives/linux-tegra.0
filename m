From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 13/17] cpuidle: tegra: Squash Tegra30 driver into the
 common driver
Date: Fri, 21 Feb 2020 17:29:51 +0100
Message-ID: <20200221162951.GQ10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-14-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:30AM +0300, Dmitry Osipenko wrote:
> Tegra20 and Terga30 SoCs have common C1 and CC6 idling states and thus
> share the same code paths, there is no point in having separate drivers
> for a similar hardware. This patch merely moves functionality of the old
> driver into the new, although the CC6 state is kept disabled for now since
> old driver had a rudimentary support for this state (allowing to enter
> into CC6 only when secondary CPUs are put offline), while new driver can
> provide a full-featured support. The new feature will be enabled by
> another patch.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/Makefile          |   3 -
>  arch/arm/mach-tegra/cpuidle-tegra30.c | 123 --------------------------

Add the -M option when resending please.

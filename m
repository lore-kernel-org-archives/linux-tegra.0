From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 0/6] Introduce machine-specific regulators coupling
 API
Date: Sun, 5 May 2019 17:57:42 +0300
Message-ID: <46665d2d-aeda-4b63-1d0e-1599214e7bae@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414175939.12368-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.04.2019 20:59, Dmitry Osipenko пишет:
> Hello,
> 
> I was looking into how to properly implement regulators coupling for
> NVIDIA Tegra SoC's and ended up with this patchset that introduces
> machine-specific regulators coupling. Upstream kernel now has support
> for a simple variants of regulators coupling in a form of limiting
> maximum voltage spreading between two regulators, but that's not enough
> for the case of Tegra SoC's. It's a bit difficult to support universally
> all possible coupling restrictions in a form of device-tree description,
> so here comes the machine-specific coupling API which allow platforms
> to customize coupling algorithms.

Hello people,

I want to point out that the CPUFreq patches are currently blocked
because of the missing support for a regulators coupling on Tegra and we
want to switch to a proper-generic OPP voltage/freq API.

The other thing that I also forgot to mention that we will need a way to
keep on hold CORE voltage changes until all relevant peripheral drivers
are loaded and claimed the required voltage level. That is needed
because some of the critical peripherals are left in a running state
after bootloader. Currently, in this patchset, we are not allowing CORE
voltage to go lower than the level left after bootloader and once all
the relevant drivers will get support for the voltage management, we
should be able to unhold the lower CORE voltages around late_init().

Will be great if you could take a look at this series and tell your
opinion on the approach, I'll be happy to put more effort into it all if
will be needed. There is now a bit more advanced version of the series
that adds more error-checking and makes use of max-spread and max-step
values from the regular constraints (i.e. values defined in device-tree)
instead of hardcoding them in the code.

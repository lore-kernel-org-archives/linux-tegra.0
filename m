From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 0/6] Introduce machine-specific regulators coupling
 API
Date: Wed, 8 May 2019 17:03:36 +0300
Message-ID: <fbdce9b8-46b6-97b3-6ca6-b9cba50c7e41@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <46665d2d-aeda-4b63-1d0e-1599214e7bae@gmail.com>
 <20190508080513.GY14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508080513.GY14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.05.2019 11:05, Mark Brown пишет:
> On Sun, May 05, 2019 at 05:57:42PM +0300, Dmitry Osipenko wrote:
> 
>> after bootloader. Currently, in this patchset, we are not allowing CORE
>> voltage to go lower than the level left after bootloader and once all
>> the relevant drivers will get support for the voltage management, we
>> should be able to unhold the lower CORE voltages around late_init().
> 
> That's going to break as soon as someone like a distro builds drivers as
> modules, you can't rely on things getting done at any particular point
> in initialization or indeed on any given set of drivers being available
> in the particular kernel that the user chooses to run - if they decide
> not to build drivers for devices that they don't use on their particular
> system that should work.

Yes, this is not really well-thought yet. Although I guess it should be
fine to assume that all the relevant hardware units are blocked by the
CLK framework that disables the orphaned clocks (by default).

Probably we'll have to better define what drivers are system-critical
for the platform, making sure that they are always included in the
kernel build and complied as built-in. But I also guess there could be
other (better) variants as well.

For now I'm primarily focused on getting the CPU voltage scaling to
work. The CORE minimum voltage is kept limited for now to the
boot-level. I'm assuming that the boot-stage voltages are at reasonable
levels for all boards because otherwise likely that there is a trouble
already (constraint violations).

> Overall this feels like an abstraction failure and you've not really
> said what the constraints you're trying to implement here are so it's
> hard to tell if that's the case or not.
> 

I described the coupling voltage constraints in the replies to the
relevant patches.

The CORE regulator supplies multiple peripherals in the SoC, each
peripheral has it's own demand for a minimum CORE voltage depending on a
clock rate and hardware version.

Tegra20 has the RTC (real-time-clock domain) regulator being coupled in
addition to the CORE. It doesn't supply any peripherals in the SoC that
have specific demands for minimum RTC voltage.

Please let me know if there is a need to explain anything else in a more
detail.

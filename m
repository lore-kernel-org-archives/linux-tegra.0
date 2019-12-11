From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Wed, 11 Dec 2019 17:10:28 +0200
Message-ID: <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
References: <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
 <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
 <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.comal
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2019 at 08:41:56PM +0300, Dmitry Osipenko wrote:

..

> >
> > PMC clock gate is based on the state of CLKx_ACCEPT_REQ and FORCE_EN
> > like explained above.
> >
> > CLKx_ACCEPT_REQ is 0 default and FORCE_EN acts as gate to enable/disable
> > EXTPERIPH clock output to PMC CLK_OUT_1/2/3.
> 
> [and to enable OSC as well]
> 
> > So I believe we need to register as MUX and Gate rather than as a single
> > clock. Please confirm.
> 
> 1. The force-enabling is applied to both OSC and EXTERN sources of
> PMC_CLK_OUT_x by PMC at once.
> 
> 2. Both of PMC's force-enabling and OSC/EXTERN selection is internal to PMC.
> 
> Should be better to define it as a single "pmc_clk_out_x". I don't see
> any good reasons for differentiating PMC's Gate from the MUX, it's a
> single hardware unit from a point of view of the rest of the system.
> 
> Peter, do you have any objections?

The reason to have separate gate and mux clocks, is to preserve compatibility
with existing users.
Otherwise the current users would need to figure out if there's a
single clock or 2 clocks to configure. I don't think adding that code in
each user is worth it only to have a sligthly nicer modelling of the
hardware.

Cheers,

Peter.

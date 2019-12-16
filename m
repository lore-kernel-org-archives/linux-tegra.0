From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Mon, 16 Dec 2019 14:20:05 +0200
Message-ID: <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
References: <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.comal
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 12, 2019 at 04:43:53AM +0300, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>=20
>=20
> 11.12.2019 18:10, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Dec 10, 2019 at 08:41:56PM +0300, Dmitry Osipenko wrote:
> >
> > ..
> >
> >>>
> >>> PMC clock gate is based on the state of CLKx_ACCEPT_REQ and FORCE_EN
> >>> like explained above.
> >>>
> >>> CLKx_ACCEPT_REQ is 0 default and FORCE_EN acts as gate to enable/disa=
ble
> >>> EXTPERIPH clock output to PMC CLK_OUT_1/2/3.
> >>
> >> [and to enable OSC as well]
> >>
> >>> So I believe we need to register as MUX and Gate rather than as a sin=
gle
> >>> clock. Please confirm.
> >>
> >> 1. The force-enabling is applied to both OSC and EXTERN sources of
> >> PMC_CLK_OUT_x by PMC at once.
> >>
> >> 2. Both of PMC's force-enabling and OSC/EXTERN selection is internal t=
o PMC.
> >>
> >> Should be better to define it as a single "pmc_clk_out_x". I don't see
> >> any good reasons for differentiating PMC's Gate from the MUX, it's a
> >> single hardware unit from a point of view of the rest of the system.
> >>
> >> Peter, do you have any objections?
> >
> > The reason to have separate gate and mux clocks, is to preserve compati=
bility
> > with existing users.
> > Otherwise the current users would need to figure out if there's a
> > single clock or 2 clocks to configure. I don't think adding that code i=
n
> > each user is worth it only to have a sligthly nicer modelling of the
> > hardware.
>=20
> Could you please clarify what do you mean by the "existing users"?
> AFAIK, nothing in kernel uses mux clocks.

The DT clk bindings allow for parent initialization, so it's certainly
possible there are some DTs which rely on this. We promised to never
break the bindings, which changing to 1 clock would do.=20

Peter.

From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
Date: Thu, 18 Jul 2019 22:15:03 +0300
Message-ID: <20190718191503.GF12715@pdeschrijver-desktop.Nvidia.com>
References: <0ee055ad-d397-32e5-60ee-d62c14c6f77b@gmail.com>
 <86fc07d5-ab2e-a52a-a570-b1dfff4c20fe@nvidia.com>
 <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
 <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
 <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
 <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
 <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
 <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 16, 2019 at 09:25:43PM +0300, Dmitry Osipenko wrote:
> 16.07.2019 21:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> > On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
> >>
> >> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
> >>> 16.07.2019 11:06, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
> >>>>>> OK, Will add to CPUFreq driver...
> >>>>>>> The other thing that also need attention is that T124 CPUFreq dri=
ver
> >>>>>>> implicitly relies on DFLL driver to be probed first, which is ick=
y.
> >>>>>>>
> >>>>>> Should I add check for successful dfll clk register explicitly in
> >>>>>> CPUFreq driver probe and defer till dfll clk registers?
> >>> Probably you should use the "device links". See [1][2] for the exampl=
e.
> >>>
> >>> [1]
> >>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra/=
dc.c#L2383
> >>>
> >>>
> >>> [2] https://www.kernel.org/doc/html/latest/driver-api/device_link.htm=
l
> >>>
> >>> Return EPROBE_DEFER instead of EINVAL if device_link_add() fails. And
> >>> use of_find_device_by_node() to get the DFLL's device, see [3].
> >>>
> >>> [3]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/devfreq/tegra20-devfreq.c#n100
> >>>
> >> Will go thru and add...
>=20
> Looks like I initially confused this case with getting orphaned clock.
> I'm now seeing that the DFLL driver registers the clock and then
> clk_get(dfll) should be returning EPROBE_DEFER until DFLL driver is
> probed, hence everything should be fine as-is and there is no real need
> for the 'device link'. Sorry for the confusion!
>=20
> >>>>> Sorry, I didn't follow the mail thread. Just regarding the DFLL par=
t.
> >>>>>
> >>>>> As you know it, the DFLL clock is one of the CPU clock sources and
> >>>>> integrated with DVFS control logic with the regulator. We will not
> >>>>> switch
> >>>>> CPU to other clock sources once we switched to DFLL. Because the
> >>>>> CPU has
> >>>>> been regulated by the DFLL HW with the DVFS table (CVB or OPP table
> >>>>> you see
> >>>>> in the driver.). We shouldn't reparent it to other sources with unk=
new
> >>>>> freq/volt pair. That's not guaranteed to work. We allow switching t=
o
> >>>>> open-loop mode but different sources.
> >>> Okay, then the CPUFreq driver will have to enforce DFLL freq to PLLP'=
s
> >>> rate before switching to PLLP in order to have a proper CPU voltage.
> >>
> >> PLLP freq is safe to work for any CPU voltage. So no need to enforce
> >> DFLL freq to PLLP rate before changing CCLK_G source to PLLP during
> >> suspend
> >>
> > Sorry, please ignore my above comment. During suspend, need to change
> > CCLK_G source to PLLP when dfll is in closed loop mode first and then
> > dfll need to be set to open loop.
>=20
> Okay.
>=20
> >>>>> And I don't exactly understand why we need to switch to PLLP in CPU
> >>>>> idle
> >>>>> driver. Just keep it on CL-DVFS mode all the time.
> >>>>>
> >>>>> In SC7 entry, the dfll suspend function moves it the open-loop
> >>>>> mode. That's
> >>>>> all. The sc7-entryfirmware will handle the rest of the sequence to
> >>>>> turn off
> >>>>> the CPU power.
> >>>>>
> >>>>> In SC7 resume, the warmboot code will handle the sequence to turn o=
n
> >>>>> regulator and power up the CPU cluster. And leave it on PLL_P. Afte=
r
> >>>>> resuming to the kernel, we re-init DFLL, restore the CPU clock
> >>>>> policy (CPU
> >>>>> runs on DFLL open-loop mode) and then moving to close-loop mode.
> >>> The DFLL is re-inited after switching CCLK to DFLL parent during of t=
he
> >>> early clocks-state restoring by CaR driver. Hence instead of having o=
dd
> >>> hacks in the CaR driver, it is much nicer to have a proper
> >>> suspend-resume sequencing of the device drivers. In this case CPUFreq
> >>> driver is the driver that enables DFLL and switches CPU to that clock
> >>> source, which means that this driver is also should be responsible fo=
r
> >>> management of the DFLL's state during of suspend/resume process. If
> >>> CPUFreq driver disables DFLL during suspend and re-enables it during
> >>> resume, then looks like the CaR driver hacks around DFLL are not need=
ed.
> >>>
> >>>>> The DFLL part looks good to me. BTW, change the patch subject to "A=
dd
> >>>>> suspend-resume support" seems more appropriate to me.
> >>>>>
> >>>> To clarify this, the sequences for DFLL use are as follows (assuming
> >>>> all
> >>>> required DFLL hw configuration has been done)
> >>>>
> >>>> Switch to DFLL:
> >>>> 0) Save current parent and frequency
> >>>> 1) Program DFLL to open loop mode
> >>>> 2) Enable DFLL
> >>>> 3) Change cclk_g parent to DFLL
> >>>> For OVR regulator:
> >>>> 4) Change PWM output pin from tristate to output
> >>>> 5) Enable DFLL PWM output
> >>>> For I2C regulator:
> >>>> 4) Enable DFLL I2C output
> >>>> 6) Program DFLL to closed loop mode
> >>>>
> >>>> Switch away from DFLL:
> >>>> 0) Change cclk_g parent to PLLP so the CPU frequency is ok for any
> >>>> vdd_cpu voltage
> >>>> 1) Program DFLL to open loop mode
> >>>>
> > I see during switch away from DFLL (suspend), cclk_g parent is not
> > changed to PLLP before changing dfll to open loop mode.
> >=20
> > Will add this ...
>=20
> The CPUFreq driver switches parent to PLLP during the probe, similar
> should be done on suspend.
>=20
> I'm also wondering if it's always safe to switch to PLLP in the probe.
> If CPU is running on a lower freq than PLLP, then some other more
> appropriate intermediate parent should be selected.
>=20

Yes it is always safe because 408MHz is lower than fmax @ Vmin.

Peter.

From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded controller
Date: Tue, 25 Oct 2011 23:04 +0200
Message-ID: <1687390.Cb8cFQ78Wf@ax5200p>
References: <cover.1319313019.git.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF173E1B4187@HQMAIL01.nvidia.com> <CAOesGMgs97awtrKXd=Ek9R62pWMVDtKcxXAx9Xb5_P6wa6wdpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgs97awtrKXd=Ek9R62pWMVDtKcxXAx9Xb5_P6wa6wdpg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 25 October 2011 09:16:54 Olof Johansson wrote:
> On Tue, Oct 25, 2011 at 7:06 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Marc Dietrich wrote at Saturday, October 22, 2011 2:17 PM:
> >> This adds support for the embedded controller known as NVEC. The
> >> driver
> >> lives currently in the staging tree and we aim to promote it one level
> >> higher in the near future.
> >> 
> >> The NVEC driver uses the I2C resources of the master controller for
> >> now
> >> until slave support is added to the i2c-tegra driver.
> > 
> > I'm in two minds about this:
> > 
> > The fact that the nvec driver accesses the I2C HW directly is a hack;
> > that should all happen in the I2C driver, and the nvec code should
> > /just/ handle the protocol to talk to the microcontroller.
> > 
> > To that end, we're starting to bring on some more engineers internally
> > who will aim to upstream more of our downstream kernel. Part of this
> > includes upstreaming the I2C slave support in a more palatable fashion.
> > I know those engineers are keen in general to get started, but I can't
> > yet estimate a timescale for when this particular change will be ready.
> > 
> > That said, I'm not sure that I want to block progress on getting nvec
> > and the AC100 support going. Olof, do you have any input here? Thanks.
> 
> Yeah, let's not hold up ac100 based on not-yet-ready code, especially
> since the driver is in staging. If the i2c slave driver could be done
> in time to be there before nvec graduates from staging, that would
> probably be ideal.

Thanks Olof!
 
> That being said, let's do it reasonably clean -- Marc, if you guys are
> up for trying to define device-tree bindings for this that would be
> awesome, and move to that for driver probing. That avoids adding an
> include/linux/platform_data header file.

I'm just checking what's the best way to do this. 

But first, something else: booting with device tree enabled gives me the wrong 
order of the mmc's again (or wrong oder of sdhci initialization). Also I only 
need controller 4 and 1 (in that order), how to disable 2 and 3? Same for the 
i2c3 controller, it should not be initialized at all or it will conflict with 
the nvec.

For the nvec, if we only need the platform data, something like

nvec@8a {
		gpio = <0xaa>
}

came into my mind (8a is the slave address). Later I felt this is wrong 
because 8a is not a memory address, and there should be the address of the 
slave controller instead (e.g. 7000c500), but that would require to move all 
of the resources to device tree:

nvec@7000c500 {
		#address-cells = <1>;
		#size-cells = <0>;
		compatible = "nvidia,???";
		reg = <0x7000C500 0x100>;
		interrupts = < 124 >;
		cock-frequency = <80000>
		gpio = <0xaa>
		slave-address = <0x8a>
}

Looking at i2c-tegra I don't see where the memory address is used at all. It 
is specified in the device tree, but the real memory resource still comes from 
the board file, so it seems to be incomplete.

Given that the nvec is a kind of device connected to the i2c bus and has 
devices connected to it, something like this would also make sense:

i2c@7000c500 {
		cock-frequency = <80000>
		is_slave;

		nvec {
				addr = <0x8a>
				gpio = <0xaa>
				
				keyboard {
						cell-index = <0>
				}
				mouse {
						cell-index = <0>
				}
				power {						/* for AC  */
						cell-index = <0>
				}
				power {						/* for battery */
						cell-index = <1>
				}
				leds {
						cell-index = <0>
				}

		}
}

But this is more like it should look like after slave support is added to i2c-
tegra.

I'm a device tree newbie, so any idea what's best?

And finally, looks like linux-next does a minute's silence before booting up 
now. Is this a known issue?

Marc

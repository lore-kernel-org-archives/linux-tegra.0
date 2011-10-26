From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded
 controller
Date: Tue, 25 Oct 2011 23:51:13 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4538@HQMAIL01.nvidia.com>
References: <cover.1319313019.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B4187@HQMAIL01.nvidia.com>
 <CAOesGMgs97awtrKXd=Ek9R62pWMVDtKcxXAx9Xb5_P6wa6wdpg@mail.gmail.com>
 <1687390.Cb8cFQ78Wf@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1687390.Cb8cFQ78Wf@ax5200p>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Tuesday, October 25, 2011 3:04 PM:
> On Tuesday 25 October 2011 09:16:54 Olof Johansson wrote:
> > On Tue, Oct 25, 2011 at 7:06 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > Marc Dietrich wrote at Saturday, October 22, 2011 2:17 PM:
> > >> This adds support for the embedded controller known as NVEC. The
> > >> driver
> > >> lives currently in the staging tree and we aim to promote it one level
> > >> higher in the near future.
> > >>
> > >> The NVEC driver uses the I2C resources of the master controller for
> > >> now
> > >> until slave support is added to the i2c-tegra driver.
> > >
> > > I'm in two minds about this:
...
> > Yeah, let's not hold up ac100 based on not-yet-ready code, especially
> > since the driver is in staging. If the i2c slave driver could be done
> > in time to be there before nvec graduates from staging, that would
> > probably be ideal.
> 
> Thanks Olof!
> 
> > That being said, let's do it reasonably clean -- Marc, if you guys are
> > up for trying to define device-tree bindings for this that would be
> > awesome, and move to that for driver probing. That avoids adding an
> > include/linux/platform_data header file.
> 
> I'm just checking what's the best way to do this.
> 
> But first, something else: booting with device tree enabled gives me the wrong
> order of the mmc's again (or wrong oder of sdhci initialization). Also I only
> need controller 4 and 1 (in that order), how to disable 2 and 3?

To disable devices, add property status = "disabled".

I'm not sure yet hw to solve the ordering issue. Grant had mentioned
using an aliases node to help with this, but I haven't had a chance to
look into that and see how it'd work.

> For the nvec, if we only need the platform data, something like
> 
> nvec@8a {
> 		gpio = <0xaa>
> }
> 
> came into my mind (8a is the slave address). Later I felt this is wrong
> because 8a is not a memory address, and there should be the address of the
> slave controller instead (e.g. 7000c500), but that would require to move all
> of the resources to device tree:
> 
> nvec@7000c500 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		compatible = "nvidia,???";
> 		reg = <0x7000C500 0x100>;
> 		interrupts = < 124 >;
> 		cock-frequency = <80000>
> 		gpio = <0xaa>
> 		slave-address = <0x8a>
> }

Yes, that looks more correct; the address in the node's name should be where
that node exists on the bus that is its parent; the 0x8a address is essentially
some internal implementation detail in this case, since it's a slave.

> Looking at i2c-tegra I don't see where the memory address is used at all. It
> is specified in the device tree, but the real memory resource still comes from
> the board file, so it seems to be incomplete.

The DT reg property is converted to platform resources during DT parsing/probing,
so it looks like the driveris using APIs to get resources from the board data and
devices.c, but it's actually getting the data from DT.

> Given that the nvec is a kind of device connected to the i2c bus and has
> devices connected to it, something like this would also make sense:
> 
> i2c@7000c500 {
> 		cock-frequency = <80000>
> 		is_slave;
> 
> 		nvec {
> 				addr = <0x8a>
> 				gpio = <0xaa>
> 
> 				keyboard {
> 						cell-index = <0>
> 				}
> 				mouse {
> 						cell-index = <0>
> 				}
> 				power {						/* for AC  */
> 						cell-index = <0>
> 				}
> 				power {						/* for battery */
> 						cell-index = <1>
> 				}
> 				leds {
> 						cell-index = <0>
> 				}
> 
> 		}
> }
> 
> But this is more like it should look like after slave support is added to i2c-
> tegra.
> 
> I'm a device tree newbie, so any idea what's best?

I'd go with the nvec@7000c500 a little above for now. The correct binding once
the I2C driver is fixed needs a little more though (well, at least I need to
think more; it may already be obvious to those more experienced with DT!)

> And finally, looks like linux-next does a minute's silence before booting up
> now. Is this a known issue?

That's odd; I certainly haven't noticed it, but I haven't pulled in the latest
linux-next or a half week or so.

-- 
nvpublic

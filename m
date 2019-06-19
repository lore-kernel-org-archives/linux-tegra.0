From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 22/28] PCI: tegra: Access endpoint config only if PCIe
 link is up
Date: Wed, 19 Jun 2019 08:38:17 -0500
Message-ID: <20190619133817.GA143205@google.com>
References: <09bcc121-eaca-3866-d0ef-7806503e883f@nvidia.com>
 <ca34eb24-8696-576f-26bc-8d6141f81a41@nvidia.com>
 <20190613143946.GA30445@e121166-lin.cambridge.arm.com>
 <20190613154250.GA32713@ulmo>
 <a523a19c-fdfa-01f7-6f6d-2ca367a10a50@nvidia.com>
 <20190617114745.GL508@ulmo>
 <20190617193024.GC13533@google.com>
 <a7e0472d-f4a7-ed63-836a-b5e8b1360645@nvidia.com>
 <20190618104918.GA28892@ulmo>
 <9c0fb01f0dc6a193265297eaa100a35ff25413e7.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9c0fb01f0dc6a193265297eaa100a35ff25413e7.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 02:32:59PM +0200, Johannes Berg wrote:
> On Tue, 2019-06-18 at 12:49 +0200, Thierry Reding wrote:
> 
> > > > > > > > > > 1. WiFi devices provides power-off feature for power saving
> > > > > > > > > > in mobiles.  When WiFi is turned off we shouldn't power on
> > > > > > > > > > the HW back without user turning it back on.
> 
> But why would you disconnect the PCIe device just to power it down?!
> 
> > > > > > > The problem that Manikanta is trying to solve here occurs in
> > > > > > > this situation (Manikanta, correct me if I've got this wrong):
> > > > > > > on some setups, a WiFi module connected over PCI will toggle a
> > > > > > > power GPIO as part of runtime suspend. This effectively causes
> > > > > > > the module to disappear from the PCI bus (i.e. it can no longer
> > > > > > > be accessed until the power GPIO is toggled again).
> > > > > > 
> > > > > > GPIO is toggled as part of WiFi on/off, can be triggered from
> > > > > > network manager UI.
> 
> That's kinda icky, IMHO.
> 
> > > > > > Correct, rfkill switch should handle the GPIO.
> > > > > > Sequence will be,
> > > > > >  - WiFi ON
> > > > > >    - rfkill switch enables the WiFi GPIO
> > > > > >    - Tegra PCIe receives hot plug event
> > > > > >    - Tegra PCIe hot plug driver rescans PCI bus and enumerates the device
> > > > > >    - PCI client driver is probed, which will create network interface
> > > > > >  - WiFi OFF
> > > > > >    - rfkill switch disables the WiFi GPIO
> > > > > >    - Tegra PCIe receives hot unplug event
> > > > > >    - Tegra PCIe hot plug driver removes PCI devices under the bus
> > > > > >    - PCI client driver remove is executed, which will remove
> > > > > >      network interface
> > > > > > We don't need current patch in this case because PCI device is not
> > > > > > present in the PCI hierarchy, so there cannot be EP config access
> > > > > > with link down.  However Tegra doesn't support hot plug and unplug
> > > > > > events. I am not sure if we have any software based hot plug event
> > > > > > trigger.
> 
> Looks reasonable to me.
> 
> I guess if you absolutely know in software when the device is
> present or not, you don't need "real" PCIe hotplug, just need to
> tickle the software right?
> 
> > > > How does rfkill work?  It sounds like it completely removes
> > > > power from the wifi device, putting it in D3cold.  Is there
> > > > any software notification other than the "Slot present pin
> > > > change" (which looks like a Tegra-specific thing)?
> 
> Well, they said above it's a GPIO that controls it, so the software
> already knows and doesn't really need an event?

Forgive my ignorance about rfkill.  At least in this Tegra case, it
sounds like rfkill basically controls a power switch for the entire
device, i.e., it doesn't merely turn off the radio portion of the
device; it puts the entire PCI device in D3cold.

Is rfkill integrated with the power management subsystem?  E.g., when
lspci or X tries to read config space via pci_read_config(), does the
pci_config_pm_runtime_get() in that path wake up the device?

IMO, if the struct pci_dev exists, we should be able to rely on the
device actually being accessible (possibly after bringing it back to
D0).  If rfkill only turns off the radio, leaving the PCI interface
active, that would be fine -- in that case generic PCI things like
lspci would work normally and it would be up to the driver to manage
network-related things.

But if rfkill turns off PCI interface and the power management
subsystem can't wake it up, I think we should unbind the driver and
remove the pci_dev, so it wouldn't appear in lspci at all.

Bjorn

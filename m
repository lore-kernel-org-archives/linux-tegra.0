From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: How to represent active low ARM GIC interrupts, enabled by
	external inverter?
Date: Mon, 23 Jan 2012 15:19:42 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81C17@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178CB81BA2@HQMAIL01.nvidia.com>
 <20120123223315.GB1068@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120123223315.GB1068-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "Thomas Gleixner (tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org)" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell King wrote at Monday, January 23, 2012 3:33 PM:
> On Mon, Jan 23, 2012 at 01:18:50PM -0800, Stephen Warren wrote:
> > I'd like guidance on how to model one aspect of Tegra's interrupt
> > structure.
> >
> > Tegra has an interrupt input pin for use by a PMU chip.
> >
> > The PMC HW module within Tegra can optionally invert this signal, but
> > otherwise has no control over it; no interrupt status bits, no masking,
> > etc.
> >
> > The (potentially inverted) signal is then fed into the ARM GIC, which
> > supports level high or rising edge interrupts only.
> 
> When I originally added the IRQ trigger types to request_irq(), the
> original intention was for these to be specified by the requesting
> driver according to what the chip required, and there to be some kind
> of hook to deal with the inversion which happens on some boards.
> 
> However, that was never implemented because there was a far better
> solution: pass this information to the driver via the device resource
> structures, which already have this information defined for PNP
> devices.  The driver would then find the IRQ resource which would
> tell it both the number and the IRQ trigger flags to be used.
> 
> Some drivers have done this, to cope with differing wiring on boards.
> I don't know if DT supports this though, but I'd suggest that it's
> a solution worth investigating.

Yes, that's basically exactly what the primary proposal was in my original
email. The issues are:

* Whether it's possible for the Tegra PMC to be represented as an irq_chip
since the only control it has is inversion; no status register or masking.

* The interrupt specifiers in the PMU device and PMC device both have to
match w.r.t. edge or level selection, which might be confusing.

-- 
nvpublic

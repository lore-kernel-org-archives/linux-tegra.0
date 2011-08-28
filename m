From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [RFC PATCH] add slave mode support to tegra's i2c controller
Date: Sun, 28 Aug 2011 18:02:00 +0200
Message-ID: <201108281802.00822.marvin24@gmx.de>
References: <201108172101.27170.marvin24@gmx.de> <201108180949.05586.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF04B24A366D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B24A366D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 22 August 2011 21:23:52 Stephen Warren wrote:
> Marc Dietich wrote at Thursday, August 18, 2011 1:49 AM:
> > Hi Stephen,
> > 
> > > Marc Dietrich wrote at Wednesday, August 17, 2011 1:01 PM:
> > > > the patch below adds slave mode to tegra's i2c controller. I tried 
to
> > > > make it as small as possible. It is needed to allow the nvec driver
> > > > to deligate the initialization to the i2c-tegra driver as part of
> > > > its cleanup. Patch is tested with our version of nvec. Patch is
> > > > against arm-soc + boards-3.2. Please review and consider it for
> > > > merge.
> > > > [...]
>
> If this patch goes ahead, I think split it out into logically separate
> patches, and them something like:
> 
> i2c/tegra: Allow configuration of slave address
> i2c/tegra: Allow tegra_i2c_dev to be used by nvec/slave driver

ok, but lets see...
 
> > We (the AC100 team) wrote a simple driver for dealing with the
> > communication. You may find the latest version at
> > http://gitorious.org/~marvin24/ac100/marvin24s-kernel/trees/chromeos-
> > ac100-2.6.38/drivers/staging/nvec which I'm trying to push to mainline
> > kernel. The changes to i2c-tegra are required to make some progress on
> > our side. I'm also planing to reuse more of i2c-tegra init stuff.
> 
> It looks like part of the nvec code (e.g. i2c_interrupt()) is simply a
> driver for the slave I2C controller; this should really be moved into
> drivers/i2c/busses/i2c-tegra.c rather than exposing the internals of that
> driver for use by the nvec driver. The nvec driver could then wrap this
> and implement the GPIO-related logic and higher-level protocol.

I agree that exposing the internal data structures is not the best way to 
go. So lets see were the alternatives are. 

First, I definitely don't want to add our interrupt code to i2c-tegra. 
Partly because the ISR is specific to the master/slave protocol used, 
partly because I cannot do a clean implementation myself (no docu, no time, 
no experience).

Second, I aggree that we should use as much of i2c-tegra's code as possible 
(assuming the i2c-tegra maintainers support this idea). This way we may 
also get rid for the need of the internal data structure.

i2c-tegra uses its own readl and writel functions which we could use (thus 
getting rid of knowing the base address) but we would need some kind of 
handle (e.g. a pointer to i2c_dev). Such a handle could also be used to get 
the other required info for the ISR (irq, clock and slave address). This 
could be implemented relative fast without much collateral damage.

A clean solution (longterm) on the other hand would try to split out the 
master/slave protocol out of the ISR and make it as minimal as possible, 
leaving the protocol to the nvec driver. I'm not sure if this is possible 
or would work at all. 

> Yes, it's entirely possible our various product kernels don't do this
> correctly, and may not be a good model to follow. I'm haven't taken an
> in depth look at them to determine either way though.
> 
> > > Some comments below.
> > > 
> > > > diff --git a/drivers/i2c/busses/i2c-tegra.c
> > > > b/drivers/i2c/busses/i2c-tegra.c
> > > 
> > > ...
> > > 
> > > > -struct tegra_i2c_dev {
> > > > -	struct device *dev;
> > > > -	struct i2c_adapter adapter;
> > > 
> > > ...
> > > 
> > > > -};
> > > 
> > > Nothing got added that needed that struct definition in a header 
file;
> > > was there meant to be a new file included in the patch that 
implements
> > > the slave driver (and makefile and perhaps Kconfig changes?)
> > 
> > it is added, but not to i2c-tegra, but nvec.c in drivers/staging/nvec.
> 
> Ah.
> 
> > I think
> > it's better to split these functions because a master can be anything 
so
> > there is no common protocol which can be implemented in i2c-tegra.
> 
> If we do end up implementing separate drivers for the I2C master and 
slave,
> whether the slave is part of nvec or in drivers/i2c, I still don't think
> it's a good idea to share tegra_i2c_dev; if the drivers are truly 
separate,
> then they can have their own device structure. If they're common enough
> that sharing the device structure is useful, it seems like the two 
drivers
> should be fully unified.

Both structures share some information (mostly the hardware info) but also 
some info related to the master or slave protocol respectively (message 
buffers, position pointers or status flags). Given that, we may also just 
split out the protocol related info out of the i2c_dev struct and share the 
latter one, which would be an alternative to the idea descriped above.

> > > ...
> > > 
> > > > -	ret = request_irq(i2c_dev->irq, tegra_i2c_isr, 0, pdev->name,
> > > > i2c_dev); -	if (ret) {
> > > > -		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev-
>irq);
> > > > -		goto err_free;
> > > > +	if (!i2c_dev->is_slave) {
> > > > +		ret = request_irq(i2c_dev->irq, tegra_i2c_isr, 0, pdev-
>name,
> > > > i2c_dev); +		if (ret) {
> > > > +			dev_err(&pdev->dev, "Failed to request irq %i\n", 
i2c_dev-
>irq);
> > > > +			goto err_free;
> > > > +		}
> > > >  	}
> > > 
> > > This appears to make master and slave mode mutually exclusive. 
Doesn't
> > > the HW allow use of both controllers on the same bus?
> > 
> > I cannot think of how both modes can exist at the same time (maybe isr
> > can detect what was meant), but well, as I said already, I'm also not
> > familar with the hw. But you may be right that the i2c master mode
> > should be disabled somehow if we are in slave mode (like slave is
> > normally disabled via I2C_SL_CNFG_NACK).
> 
> I don't see any HW reason why Tegra's master and slave I2C controllers
> could not both be usable at the same time on the same bus. At least, not
> coming from a pure I2C background; perhaps there is some reason in Tegra
> HW, but given a quick look at the registers that the two drivers use, I
> don't see any problematic overlaps, except during initialization.
> 
> The primary reason the SW wouldn't allow both devices to be used at once
> is that there are separate master/slave drivers which both need to handle
> the same interrupt. If the drivers were unified (or at least a shared
> common core created), then I think there wouldn't be any issue having 
both
> drivers active at once.

Well, the ISR could look for the I2C_SL_IRQ (1<<3) status flag in the 
I2C_SL_STATUS (0x28) register and branch accordingly. But again, I don't 
want to bloat the i2c-tegra code with our experimental/unstable driver. 

Any ideas on how to proceed?

	Marc

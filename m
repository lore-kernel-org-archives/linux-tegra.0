From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH] add slave mode support to tegra's i2c controller
Date: Tue, 30 Aug 2011 17:00:06 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B3279F23@HQMAIL01.nvidia.com>
References: <201108172101.27170.marvin24@gmx.de>
 <201108180949.05586.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF04B24A366D@HQMAIL01.nvidia.com>
 <201108281802.00822.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108281802.00822.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Sunday, August 28, 2011 10:02 AM:
> On Monday 22 August 2011 21:23:52 Stephen Warren wrote:
> > Marc Dietich wrote at Thursday, August 18, 2011 1:49 AM:
...
> > > We (the AC100 team) wrote a simple driver for dealing with the
> > > communication. You may find the latest version at
> > > http://gitorious.org/~marvin24/ac100/marvin24s-kernel/trees/chromeos-
> > > ac100-2.6.38/drivers/staging/nvec which I'm trying to push to mainline
> > > kernel. The changes to i2c-tegra are required to make some progress on
> > > our side. I'm also planing to reuse more of i2c-tegra init stuff.
> >
> > It looks like part of the nvec code (e.g. i2c_interrupt()) is simply a
> > driver for the slave I2C controller; this should really be moved into
> > drivers/i2c/busses/i2c-tegra.c rather than exposing the internals of that
> > driver for use by the nvec driver. The nvec driver could then wrap this
> > and implement the GPIO-related logic and higher-level protocol.
...
> A clean solution (longterm) on the other hand would try to split out the
> master/slave protocol out of the ISR and make it as minimal as possible,
> leaving the protocol to the nvec driver. I'm not sure if this is possible
> or would work at all.
...
> Well, the ISR could look for the I2C_SL_IRQ (1<<3) status flag in the
> I2C_SL_STATUS (0x28) register and branch accordingly. But again, I don't
> want to bloat the i2c-tegra code with our experimental/unstable driver.
> 
> Any ideas on how to proceed?

I was assuming that the I2C core already had some infra-structure in
place for abstracting I2C slave controllers. A quick look implies that
isn't actually the case.

However, I do see that the PXA I2C driver does implement slave mode,
such that the I2C controller implements all the register twiddling,
and some callback implements the protocol required by the system. Take
a look at:

include/linux/i2c-pxa.h (struct i2c_slave_client)

drivers/i2c/busses/i2c-pxa.c (i2c_pxa_slave_*())

I'm not sure how the callback model will fit into devicetree, but PAZ00
isn't devicetree-enabled (yet) anyway, and various other drivers need
that problem solved anyway, so I wouldn't let that stop you.

I think even without HW documentation or much experience, it shouldn't be
that big a deal to take the existing slave code from the nvec staging
driver and integrate it into the existing I2C master driver. I suppose
making master vs. slave mode exclusive as a first step actually wouldn't
be so bad. I can test any such patches for regressions on Harmony,
Seaboard, and Trimslice, if you need.

-- 
nvpublic

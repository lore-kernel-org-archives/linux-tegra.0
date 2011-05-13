From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra I2C slave address patches
Date: Fri, 13 May 2011 12:28:27 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD50D@HKMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF04986AA399@HQMAIL01.nvidia.com>
 <201105122109.21735.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF04986AA3D3@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA3D3-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Bharat Nihalani <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Stephen, Marc
These i2c fix are come from the android-tegra-2.6.36, they will
Fix some i2c transfer bugs.

Tegra2 has an improved new i2c slave controller. This should be
used instead of the old i2c slave controller. With old i2c slave
controller, occasionally it generates spurious slave interrupts
causing disruptions in master i2c transfers.
And new i2c slave should be configured with a non-zero i2c address.
Configure i2c slave with an i2c address assigned by platform
data for an i2c dev.

Thanks
Wei.


-----Original Message-----
From: Stephen Warren 
Sent: Friday, May 13, 2011 3:17 AM
To: Marc Dietrich
Cc: Wei Ni; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: RE: Tegra I2C slave address patches

Marc Dietrich wrote at Thursday, May 12, 2011 1:09 PM:
> Hi Stephen,
> 
> Am Donnerstag 12 Mai 2011, 20:15:08 schrieb Stephen Warren:
> > Wei,
> >
> > I'm trying to consolidate the two Tegra I2C slave mode patches we posted
> > to the mailing lists:
> >
> > Yours: http://www.spinics.net/lists/linux-i2c/msg05437.html
> > Mine: http://www.spinics.net/lists/linux-i2c/msg05464.html
> >
> > I had some questions:
> >
> > 1) Why does your patch enable I2C_SL_CNFG_NACK. According to the Tegra
> > documentation, this prevents the slave I2C controller from ACKing any
> > transfers. Doesn't this prevent the slave functionality from working at
> > all?
> >
> > 2) Your patch sets up the slave_addr registers based on platform data.
> > However, I don't see any code in i2c-tegra.c to actually act as a slave
> > device. Hence, it seems pointless to configure the slave address.
> >
> > Are those two things bug workarounds or something?
> >
> > I know that Marc said he'd like to see the slave address configuration
> > code merged, since the AC100 uses it. However, I'm having a hard time
> > seeing how it'll make any difference to the driver right now; it seems
> > if/when slave mode is actually implemented, the slave_addr setup should
> > be part of that patch.
> 
> you are right, slave implementation requires at least an additional ISR. As we
> don't have any tegra documentation, it will probably take a little longer to
> implement it correctly. Maybe I hoped that there are some other devices using
> it. Because there seem to be none, it's ok from my side to drop that part. If we
> ever get something hacked together, I'm going resubmit it.
> 
> Btw, I was a little bit "shocked" that seaboard addedd the slave_addr (0xfc) to
> the board file, which looks like all ports (except dvc) became slaves now. Is
> this a special kind of address, because it is the last possible one?

Interesting. For reference, you're talking about the following in
http://git.chromium.org/chromiumos/third_party/kernel.git chromeos-2.6.38

  1eb243925afed4ef70a04f632f5288e320607ac0
  CHROMIUM: tegra: seaboard: i2c address for new i2c slaves
  New i2c slave should be configured with a non-zero i2c address.
  Configure i2c slave with an i2c address assigned by platform
  data for an i2c dev.
  Assign 0xFC as i2c slave address for all new i2c slaves.

I'll have to let Wei comment on that; he wrote the change. It certainly
sounds like it's setting an unused slave address as some kind of bug
workaround.

-- 
nvpublic

From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Tegra I2C slave address patches
Date: Thu, 12 May 2011 21:09:21 +0200
Message-ID: <201105122109.21735.marvin24@gmx.de>
References: <74CDBE0F657A3D45AFBB94109FB122FF04986AA399@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA399-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Am Donnerstag 12 Mai 2011, 20:15:08 schrieb Stephen Warren:
> Wei,
> 
> I'm trying to consolidate the two Tegra I2C slave mode patches we posted
> to the mailing lists:
> 
> Yours: http://www.spinics.net/lists/linux-i2c/msg05437.html
> Mine: http://www.spinics.net/lists/linux-i2c/msg05464.html
> 
> I had some questions:
> 
> 1) Why does your patch enable I2C_SL_CNFG_NACK. According to the Tegra
> documentation, this prevents the slave I2C controller from ACKing any
> transfers. Doesn't this prevent the slave functionality from working at
> all?
> 
> 2) Your patch sets up the slave_addr registers based on platform data.
> However, I don't see any code in i2c-tegra.c to actually act as a slave
> device. Hence, it seems pointless to configure the slave address.
> 
> Are those two things bug workarounds or something?
> 
> I know that Marc said he'd like to see the slave address configuration
> code merged, since the AC100 uses it. However, I'm having a hard time
> seeing how it'll make any difference to the driver right now; it seems
> if/when slave mode is actually implemented, the slave_addr setup should
> be part of that patch.

you are right, slave implementation requires at least an additional ISR. As we 
don't have any tegra documentation, it will probably take a little longer to 
implement it correctly. Maybe I hoped that there are some other devices using 
it. Because there seem to be none, it's ok from my side to drop that part. If we 
ever get something hacked together, I'm going resubmit it.

Btw, I was a little bit "shocked" that seaboard addedd the slave_addr (0xfc) to 
the board file, which looks like all ports (except dvc) became slaves now. Is  
this a special kind of address, because it is the last possible one?

Thanks!

Marc

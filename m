From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Wed, 30 Mar 2016 12:44:22 +0200
Message-ID: <1459334662.5073.51.camel@ziswiler.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
	 <1459265099.5073.29.camel@ziswiler.com>
	 <20160329170844.GA26314@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160329170844.GA26314-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <public-abrestic-F7+t8E8rja9g9hUCZPvPmw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-devicetree-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-linux-kernel-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2016-03-29 at 19:08 +0200, Thierry Reding wrote:
> On Tue, Mar 29, 2016 at 05:24:59PM +0200, Marcel Ziswiler wrote:
> >=20
> > Hi Thierry
> >=20
> > On Fri, 2016-03-04 at 17:19 +0100, Thierry Reding wrote:
> > >=20
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMToUJ55TTLPZA@public.gmane.org
> > > .org
> > > >=20
> > > >=20
> > > The NVIDIA Tegra XUSB pad controller provides a set of pads, each
> > > with a
> > > set of lanes that are used for PCIe, SATA and USB.
> > I finally got around trying this both on Jetson TK1 as well as our
> > own
> > Toradex Apalis TK1 module we are about to mainline.
> Looking forward to it.

Yes, I'm just running some final tests.

> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0I actually
> > applied
> > your patch set on top of 4.6.0-rc1. While USB 3.0 seems to work
> > fine I
> > noticed PCIe and SATA no more to come up right with the following
> > message:
> >=20
> > [=C2=A0=C2=A0=C2=A0=C2=A02.794458] tegra-pcie 1003000.pcie-controll=
er: PLL failed to
> > lock:
> > -110
> > [=C2=A0=C2=A0=C2=A0=C2=A02.801177] tegra-pcie 1003000.pcie-controll=
er: failed to power
> > on
> > PHY: -110
> > [=C2=A0=C2=A0=C2=A0=C2=A02.809031] tegra-pcie: probe of 1003000.pci=
e-controller failed
> > with
> > error -110
> >=20
> > Do you happen to know what could be the issue?
> That's to be expected. You'll need this one:
>=20
> 	http://patchwork.ozlabs.org/patch/596548/
>=20
> which I had hoped would make v4.6-rc1, but didn't. I'll have to
> respin
> and send out again. I didn't know that SATA failed in the same way,
> but
> I'll need to recheck and see if it needs a similar change.

Ah, I missed that one which you already sent out a v3 still applying
perfectly:

http://article.gmane.org/gmane.linux.ports.tegra/25396

With that it looks much better again:

ubuntu@tegra-ubuntu:~$ lspci
00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)

I also found a more capable test device:

ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda

/dev/sda:
=C2=A0Timing buffered disk reads: 576 MB in=C2=A0=C2=A03.01 seconds =3D=
 191.55 MB/sec

However on Apalis TK1 this broke the second USB 3.0 host port which now
refuses to work. Still works plugging in USB 2.0 gear though.

Hm, it works if plugged in during boot. Strange. What could be the
issue if hot-plugging USB 3.0 devices on the second port does not quite
work?

I'm also wondering whether the Tegra EHCI stuff is still required as
there are now quite many USB buses showing up:

ubuntu@tegra-ubuntu:~$ lsusb
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 174c:07d1 ASMedia Technology Inc.
Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I also noticed xhci to register lots of ports:

[=C2=A0=C2=A0=C2=A0=C2=A03.603688] tegra-xusb 70090000.usb: Firmware ti=
mestamp: 2014-09-16
02:10:07 UTC
[=C2=A0=C2=A0=C2=A0=C2=A03.611109] tegra-xusb 70090000.usb: xHCI Host C=
ontroller
[=C2=A0=C2=A0=C2=A0=C2=A03.616560] tegra-xusb 70090000.usb: new USB bus=
 registered,
assigned bus number 4
[=C2=A0=C2=A0=C2=A0=C2=A03.626052] tegra-xusb 70090000.usb: hcc params =
0x0184f525 hci
version 0x100 quirks 0x00010010
[=C2=A0=C2=A0=C2=A0=C2=A03.634738] tegra-xusb 70090000.usb: irq 346, io=
 mem 0x70090000
[=C2=A0=C2=A0=C2=A0=C2=A03.641572] hub 4-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0=C2=A03.645404] hub 4-0:1.0: 6 ports detected

And:

[=C2=A0=C2=A0=C2=A0=C2=A03.650144] tegra-xusb 70090000.usb: xHCI Host C=
ontroller
[=C2=A0=C2=A0=C2=A0=C2=A03.655599] tegra-xusb 70090000.usb: new USB bus=
 registered,
assigned bus number 5
[=C2=A0=C2=A0=C2=A0=C2=A03.663267] usb usb5: We don't know the algorith=
ms for LPM for this
host, disabling LPM.
[=C2=A0=C2=A0=C2=A0=C2=A03.696888] usb usb5: No SuperSpeed endpoint com=
panion for config
1=C2=A0=C2=A0interface 0 altsetting 0 ep 129: using minimum values
[=C2=A0=C2=A0=C2=A0=C2=A03.715028] hub 5-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0=C2=A03.718819] hub 5-0:1.0: 2 ports detected

> > As for USB I do get some message about the endpoint companion but
> > do
> > not know whether or not this is to be expected:
> >=20
> > [ 1021.575301] usb 4-1: new SuperSpeed USB device number 2 using
> > tegra-
> > xusb
> > [ 1021.598913] usb 4-1: No SuperSpeed endpoint companion for config
> > 1=C2=A0=C2=A0interface 0 altsetting 0 ep 2: using minimum values
> I'm not exactly sure why that message appears, but I think it is
> harmless.

OK. Yes, at least it does not seem to have any adverse effects.

> > Otherwise it looks good:
> >=20
> > ubuntu@tegra-ubuntu:~$ lsusb
> > Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 004 Device 002: ID 0951:1666 Kingston Technology DataTraveler
> > G4
> > Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >=20
> > And performs satisfactorily (up from around 24 MB/sec with just USB
> > 2.0):
> >=20
> > ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda
> >=20
> > /dev/sda:
> > =C2=A0Timing buffered disk reads:=C2=A0=C2=A094 MB in=C2=A0=C2=A03.=
05 seconds =3D=C2=A0=C2=A030.81
> > MB/sec
> >=20
> > Apalis TK1 actually features two USB 3.0 host ports:
> >=20
> > ubuntu@tegra-ubuntu:~$ lsusb
> > Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 005 Device 002: ID 0951:1666 Kingston Technology DataTraveler
> > G4
> > Bus 005 Device 003: ID 1f75:0902 Innostor Technology Corporation
> > IS902
> > UFD controller
> > Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> > Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >=20
> > ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda
> >=20
> > /dev/sda:
> > =C2=A0Timing buffered disk reads: =C2=A096 MB in=C2=A0=C2=A03.00 se=
conds =3D=C2=A0=C2=A031.98
> > MB/sec
> >=20
> > ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sdb
> >=20
> > /dev/sdb:
> > =C2=A0Timing buffered disk reads: 152 MB in=C2=A0=C2=A03.04 seconds=
 =3D=C2=A0=C2=A049.99
> > MB/sec
> Looking great. Thanks for testing.

Thank you.

BTW: Does any of you make it to GTC this year? I will attend and
Toradex is showcasing its latest Apalis TK1 module.

> Thierry


Cheers

Marcel

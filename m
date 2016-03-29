From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Tue, 29 Mar 2016 17:24:59 +0200
Message-ID: <1459265099.5073.29.camel@ziswiler.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <public-abrestic-F7+t8E8rja9g9hUCZPvPmw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-devicetree-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-linux-kernel-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry

On Fri, 2016-03-04 at 17:19 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
> >
>=20
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each
> with a
> set of lanes that are used for PCIe, SATA and USB.

I finally got around trying this both on Jetson TK1 as well as our own
Toradex Apalis TK1 module we are about to mainline. I actually applied
your patch set on top of 4.6.0-rc1. While USB 3.0 seems to work fine I
noticed PCIe and SATA no more to come up right with the following
message:

[=C2=A0=C2=A0=C2=A0=C2=A02.794458] tegra-pcie 1003000.pcie-controller: =
PLL failed to lock:
-110
[=C2=A0=C2=A0=C2=A0=C2=A02.801177] tegra-pcie 1003000.pcie-controller: =
failed to power on
PHY: -110
[=C2=A0=C2=A0=C2=A0=C2=A02.809031] tegra-pcie: probe of 1003000.pcie-co=
ntroller failed with
error -110

Do you happen to know what could be the issue?

As for USB I do get some message about the endpoint companion but do
not know whether or not this is to be expected:

[ 1021.575301] usb 4-1: new SuperSpeed USB device number 2 using tegra-
xusb
[ 1021.598913] usb 4-1: No SuperSpeed endpoint companion for config
1=C2=A0=C2=A0interface 0 altsetting 0 ep 2: using minimum values

Otherwise it looks good:

ubuntu@tegra-ubuntu:~$ lsusb
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

And performs satisfactorily (up from around 24 MB/sec with just USB
2.0):

ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda

/dev/sda:
=C2=A0Timing buffered disk reads:=C2=A0=C2=A094 MB in=C2=A0=C2=A03.05 s=
econds =3D=C2=A0=C2=A030.81 MB/sec

Apalis TK1 actually features two USB 3.0 host ports:

ubuntu@tegra-ubuntu:~$ lsusb
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
Bus 005 Device 003: ID 1f75:0902 Innostor Technology Corporation IS902
UFD controller
Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda

/dev/sda:
=C2=A0Timing buffered disk reads: =C2=A096 MB in=C2=A0=C2=A03.00 second=
s =3D=C2=A0=C2=A031.98 MB/sec

ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sdb

/dev/sdb:
=C2=A0Timing buffered disk reads: 152 MB in=C2=A0=C2=A03.04 seconds =3D=
=C2=A0=C2=A049.99 MB/sec

Cheers

Marcel

> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.
> gmane.org>
> ---
> Changes in v10:
> - clarify that the hardware documentation means something different
> when
> =C2=A0 referring to a "port" (intra-SoC connectivity)
>=20
> Changes in v9:
> - rename UTMI -> USB2 to match hardware documentation
> - reword according to suggestions by Stephen Warren
> - make Tegra132 compatible string list consistent
> - remove mailbox support
> ...

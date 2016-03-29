From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Tue, 29 Mar 2016 19:08:44 +0200
Message-ID: <20160329170844.GA26314@ulmo.nvidia.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1459265099.5073.29.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459265099.5073.29.camel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <public-abrestic-F7+t8E8rja9g9hUCZPvPmw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-devicetree-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, public-linux-kernel-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 05:24:59PM +0200, Marcel Ziswiler wrote:
> Hi Thierry
>=20
> On Fri, 2016-03-04 at 17:19 +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
> > >
> >=20
> > The NVIDIA Tegra XUSB pad controller provides a set of pads, each
> > with a
> > set of lanes that are used for PCIe, SATA and USB.
>=20
> I finally got around trying this both on Jetson TK1 as well as our own
> Toradex Apalis TK1 module we are about to mainline.

Looking forward to it.

>                                                     I actually applied
> your patch set on top of 4.6.0-rc1. While USB 3.0 seems to work fine I
> noticed PCIe and SATA no more to come up right with the following
> message:
>=20
> [=C2=A0=C2=A0=C2=A0=C2=A02.794458] tegra-pcie 1003000.pcie-controller: PL=
L failed to lock:
> -110
> [=C2=A0=C2=A0=C2=A0=C2=A02.801177] tegra-pcie 1003000.pcie-controller: fa=
iled to power on
> PHY: -110
> [=C2=A0=C2=A0=C2=A0=C2=A02.809031] tegra-pcie: probe of 1003000.pcie-cont=
roller failed with
> error -110
>=20
> Do you happen to know what could be the issue?

That's to be expected. You'll need this one:

	http://patchwork.ozlabs.org/patch/596548/

which I had hoped would make v4.6-rc1, but didn't. I'll have to respin
and send out again. I didn't know that SATA failed in the same way, but
I'll need to recheck and see if it needs a similar change.

> As for USB I do get some message about the endpoint companion but do
> not know whether or not this is to be expected:
>=20
> [ 1021.575301] usb 4-1: new SuperSpeed USB device number 2 using tegra-
> xusb
> [ 1021.598913] usb 4-1: No SuperSpeed endpoint companion for config
> 1=C2=A0=C2=A0interface 0 altsetting 0 ep 2: using minimum values

I'm not exactly sure why that message appears, but I think it is
harmless.

> Otherwise it looks good:
>=20
> ubuntu@tegra-ubuntu:~$ lsusb
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> And performs satisfactorily (up from around 24 MB/sec with just USB
> 2.0):
>=20
> ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda
>=20
> /dev/sda:
> =C2=A0Timing buffered disk reads:=C2=A0=C2=A094 MB in=C2=A0=C2=A03.05 sec=
onds =3D=C2=A0=C2=A030.81 MB/sec
>=20
> Apalis TK1 actually features two USB 3.0 host ports:
>=20
> ubuntu@tegra-ubuntu:~$ lsusb
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 005 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
> Bus 005 Device 003: ID 1f75:0902 Innostor Technology Corporation IS902
> UFD controller
> Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>=20
> ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sda
>=20
> /dev/sda:
> =C2=A0Timing buffered disk reads: =C2=A096 MB in=C2=A0=C2=A03.00 seconds =
=3D=C2=A0=C2=A031.98 MB/sec
>=20
> ubuntu@tegra-ubuntu:~$ sudo hdparm -t /dev/sdb
>=20
> /dev/sdb:
> =C2=A0Timing buffered disk reads: 152 MB in=C2=A0=C2=A03.04 seconds =3D=
=C2=A0=C2=A049.99 MB/sec

Looking great. Thanks for testing.

Thierry

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW+raaAAoJEN0jrNd/PrOhYSQQAKMe/PHyeVfd0s8fspyRvl15
luLDCMWIEdkOPq4pmnNl89aKJwsj5v/ieU3vPRWHDCi5DvtPR5esGDjVkqL3vOlo
j0MKa5Xgyvz8uXA227lguP1TI0itFnR+UqSzjOxCwgL2mGU0bEUfzu05QnCCy6wI
W/Vu4/r65qT+tZswmdeqZSAtNw1WNrsb8ZzUvPcwYn1geuwxAvonF1xkugd550xR
j+04wIh/kgj4IHEWoJ2aCzoPPfVtJqPuqK+fk16Zo1G5MP8G3YwW2/Z/vKc+l98+
zryEPxqrQFR81k/PMTQ+Uo2BhxqqN/QCUk69ogEo8jj6pw9eRXjQ8xBUbzZFbx3I
MA4v3blUEjLsA+Hyw1XXuOKDFat6YVWqRY+VLp2m3cRkt/G3ocf7vfeZJxJSqRwK
73MhJT6gF2+v/VxIoRi+XA8mlLfkeKhPenizJ5P66dYQH77oqn+Pd4TeMfYGjpom
9wIihh+GCHOE2wUcxOuLMHhV5cg+MAtN1bPGcliqqhMCsaBknEx+ODYKvExEbyQz
vnLse5IxqoMxd24Ly1BnP9+UJY1uNvshmAyh/QMqJy85KXYVhX5Mk0MmB+IagXBJ
DARPRT8GYrOgFn6kMbaWUldvWgrwPPq9dKtohJz8AsRmzi/AUrdnki3H70bq/dGm
Losfw3aeYWeeUgd8bgTw
=eMUm
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

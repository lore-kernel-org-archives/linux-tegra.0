From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/9] Support UDC on Tegra 20/30/114/124
Date: Thu, 6 Jul 2017 17:11:18 +0200
Message-ID: <20170706151118.GA3736@ulmo.fritz.box>
References: <cover.1499273075.git.digetx@gmail.com>
 <b5c54655-ccf4-2d4e-59fe-4a9e4609605a@wwwdotorg.org>
 <c8d9740a-7792-87d9-9466-8d3a45280403@gmail.com>
 <63e87e5c-5331-2680-7686-5ed22718a2bd@wwwdotorg.org>
 <94e2532d-d342-3062-ec7a-6dfd865c1b62@gmail.com>
 <20170706120328.GB1229@ulmo.fritz.box>
 <1499346277.4445.15.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499346277.4445.15.camel-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: "digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "marvin24-Mmb7MZpHnFY@public.gmane.org" <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Peter.Chen-3arQi8VN3Tc@public.gmane.org" <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 01:04:40PM +0000, Marcel Ziswiler wrote:
> On Thu, 2017-07-06 at 14:03 +0200, Thierry Reding wrote:
> > On Thu, Jul 06, 2017 at 02:20:04AM +0300, Dmitry Osipenko wrote:
> > > On 06.07.2017 01:54, Stephen Warren wrote:
> > > > On 07/05/2017 04:13 PM, Dmitry Osipenko wrote:
> > > > > On 05.07.2017 23:31, Stephen Warren wrote:
> > > > > > On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> > > > > > > Some time ago Thierry Reding sent out patches that enabled
> > > > > > > UDC on NVIDIA
> > > > > > > Tegra, unfortunately they haven't got enough traction to
> > > > > > > get into the
> > > > > > > kernel. I've rebased those patches and added a fix for the
> > > > > > > Ethernet USB
> > > > > > > Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100
> > > > > > > and Nicolas
> > > > > > > Chauvet on TK1. Like an original patchset, this series adds
> > > > > > > support for
> > > > > > > the peripheral mode only.
> > > > > >=20
> > > > > > Does this mean that the relevant ports no longer support host
> > > > > > mode? That's going
> > > > > > to be a user-visible regression, which doesn't sound like a
> > > > > > good idea. Isn't OTG
> > > > > > possible instead?
> > > > >=20
> > > > > We are going to switch only AC100 and TrimSlice to use the UDC
> > > > > driver.
> > > >=20
> > > > Really? I saw patches in the series for Beaver, Dalmore, and
> > > > Jetson TK1 too.
> > > >=20
> > >=20
> > > Yes, the "PHY" and "EHCI" nodes are disabled on those boards in DT.
> > >=20
> > > > > Do you
> > > > > know whether that port is working in a host mode with the
> > > > > tegra-ehci driver on
> > > > > these devices?
> > > >=20
> > > > If any USB port is enabled in the DT, it was certainly validated
> > > > at some point.
> > > > IIRC, we only have host mode enabled at present. So, yes, I'd
> > > > expect this port
> > > > to work in host mode currently without any issue.
> > > >=20
> > >=20
> > > Okay, so we have to decide whether it's reasonable to switch AC100
> > > and TrimSlice
> > > to the peripheral mode. I think realistically chances that someone
> > > uses that
> > > port in a host mode are quite low, while it works fine and probably
> > > more useful
> > > in a device mode.
> >=20
> > Judging by this:
> >=20
> > 	http://trimslice.com/download/documentation/trim-slice-man.pdf
> >=20
> > at least TrimSlice doesn't seem to implement OTG, so we'd have to
> > make a
> > choice to support either host or peripheral mode. I guess technically
> > it
> > would need to be peripheral mode because pin 4 is not connected.
> >=20
> > Does a similar document exist for AC100?
>=20
> Judging by the Compal PAZ00 schematics it does indeed have an ID pin
> which is connected to the mini USB socket.
>=20
> USB1_ID1: From Connector
>=20
> USB1_ID2: From EC
>=20
> So an alternative possibility to switch device/host mode would be from
> the EC (;-p).

According to the TRM, there's a USB PHY register that can be used to
query the ID/VBUS pins. They can optionally also be connected to a pair
of GPIO lines. Apparently it's even possible to hook them up to the PMU
and use a PMU specific mechanism. Most of that information can be found
in downstream kernel code.

Using U-Boot I can monitor the USB1_IF_USB_PHY_VBUS_WAKEUP_ID_0 register
(address 0x7d000408) and I see that bit ID_STS changes, and can
presumably trigger an interrupt when ID_INT_EN is set.

According to the downstream kernel this isn't supposed to work on the
Jetson TK1 up to and including the D revision, but it seems to work in
U-Boot at least on the C revision that I have. For earlier revisions
there is a sysfs attribute that can be used to force the port into the
desired mode.

Can anyone check whether or not the above register (on Tegra20, the
physical address of the register should be 0xc5000408) changes when
switching between micro A and micro B cables on TrimSlice and/or
PAZ00? Note that I wasn't able to see a difference after unplugging a
micro B cable. It only toggles after plugging in the micro A or after
unplugging the micro B, which I think really only means that by default
the port will be in peripheral mode. This can probably also be
influenced by setting or clearing the ID_PU field (pull-up on ID pin).

If this works reliably, we may be able to implement a very simple form
of detecting host/peripheral mode.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlleUxIACgkQ3SOs138+
s6H8uQ/8DmBwYwqsAi43snBUrEFB8f1bQfwEr+3+vj5omYxwbiK8TTb2qUmXZvpM
U+O1wnqVEPCAT2Uc7kC44XF5X6xJq128HoGcTtArNhnL+54xib5tEW1SRPOT+pdF
mWAng873+hsNOoodkG0z/kE/c5cHVvFLsGiMnIOqa8nwUI9cEmCltZpLUT24BQAz
KiXy6+YnCLkXup3wzzLPr1C0XmZghhix/apkMRSWZIWjZX4xutUoNN9889eDNPQd
OPiXbHwE051E4KmOUCPcl49q9ltCzSDCL06XzFer0oVbjlvHWl3Sk47BEOEhOpZH
qgtEbMKREbVEQFHHB/fTw8eP54jH1+m3AUcncDjHOfBZNui0sMAXBgmcUg9Q7+wt
hJV4csTH4omLMXDR85JEWYwhQsh7wUXJ6Y+KaQMEx/SarFgGybZLTDsKwcO12E9f
nLI37Rj3IIbkhUbfsjdaWw5IoOsvn/1UmER09weTJ6l+3ZsSpFX75vLvkkdkJax4
mRPqOP8U379o2XM8DLBOgMsbuM1vMP3dwzmIwFaMdqhCvkhNtVv9giVmakv/syXa
kEbu6EGX6T5cFrCBCn/E/MkcDSiiFkuobJjrIY6+uQnckHYIfsaZjOMKEkrVVzc5
UbQYnOrZS/mJvnMpfb0V61auFxyGBbZAfZ/BEWaEYCtr3yaRRXY=
=9G0O
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

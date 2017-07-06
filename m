From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/9] Support UDC on Tegra 20/30/114/124
Date: Thu, 6 Jul 2017 14:03:28 +0200
Message-ID: <20170706120328.GB1229@ulmo.fritz.box>
References: <cover.1499273075.git.digetx@gmail.com>
 <b5c54655-ccf4-2d4e-59fe-4a9e4609605a@wwwdotorg.org>
 <c8d9740a-7792-87d9-9466-8d3a45280403@gmail.com>
 <63e87e5c-5331-2680-7686-5ed22718a2bd@wwwdotorg.org>
 <94e2532d-d342-3062-ec7a-6dfd865c1b62@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <94e2532d-d342-3062-ec7a-6dfd865c1b62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 02:20:04AM +0300, Dmitry Osipenko wrote:
> On 06.07.2017 01:54, Stephen Warren wrote:
> > On 07/05/2017 04:13 PM, Dmitry Osipenko wrote:
> >> On 05.07.2017 23:31, Stephen Warren wrote:
> >>> On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> >>>> Some time ago Thierry Reding sent out patches that enabled UDC on NV=
IDIA
> >>>> Tegra, unfortunately they haven't got enough traction to get into the
> >>>> kernel. I've rebased those patches and added a fix for the Ethernet =
USB
> >>>> Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100 and Nico=
las
> >>>> Chauvet on TK1. Like an original patchset, this series adds support =
for
> >>>> the peripheral mode only.
> >>>
> >>> Does this mean that the relevant ports no longer support host mode? T=
hat's going
> >>> to be a user-visible regression, which doesn't sound like a good idea=
=2E Isn't OTG
> >>> possible instead?
> >>
> >> We are going to switch only AC100 and TrimSlice to use the UDC driver.
> >=20
> > Really? I saw patches in the series for Beaver, Dalmore, and Jetson TK1=
 too.
> >=20
>=20
> Yes, the "PHY" and "EHCI" nodes are disabled on those boards in DT.
>=20
> >> Do you
> >> know whether that port is working in a host mode with the tegra-ehci d=
river on
> >> these devices?
> >=20
> > If any USB port is enabled in the DT, it was certainly validated at som=
e point.
> > IIRC, we only have host mode enabled at present. So, yes, I'd expect th=
is port
> > to work in host mode currently without any issue.
> >=20
>=20
> Okay, so we have to decide whether it's reasonable to switch AC100 and Tr=
imSlice
> to the peripheral mode. I think realistically chances that someone uses t=
hat
> port in a host mode are quite low, while it works fine and probably more =
useful
> in a device mode.

Judging by this:

	http://trimslice.com/download/documentation/trim-slice-man.pdf

at least TrimSlice doesn't seem to implement OTG, so we'd have to make a
choice to support either host or peripheral mode. I guess technically it
would need to be peripheral mode because pin 4 is not connected.

Does a similar document exist for AC100?

Thierry

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlleJwwACgkQ3SOs138+
s6H+DA/+JrklCBdivschklRF/UridfdwkvecRq0J8Ys0KpHkEvkCEX7dQAqwfQWG
79Jg4a+UeiWimajLQO1AmG4yyxpK/DIkDlcOjsvCSbTj5CEdN84kbTu9KnVtXVIR
8HWJvBSJO2R+nIfKBi/AwfWVNlvaqSP+htBF6m6NLxQrYlJbH2KdOg1sMwpANlXE
naAl4f4uxHbZDrxy9T172IzHkac/O6r/Hi1LwwDSaZymTUGytkJHoCQL2L2GphV4
VyJXSqlIFJvSKsvrdlU3KUtNneEGsUqGNZyNWKCM1b7W4cuVMRdfA5nFPNzxiis+
5bm2fb70uMAm8Ns2rxg+ArlpXfd69N4UNFwV6ewE8FQyZ6e9HJi0deMNNnFJDSnS
XSMo1IjeccTtO/POCbn6LVC8GooskK4cAsueXp+lAbr1VvGZETTW81cFa68We/TU
Kl+Rx8NSnyvJnrY88PaPGj+dTAp+w5snUO280pFXVx1UEDRnksmL/3FaJ/s10LVN
K7t7yJaLcUNHk6TUDpXJFa0AqxqqYilzJ4yZ6r7+/A88ZhsfOnRTi7OBNSZCUtTr
ob33MVSncpCyD4xXrlpdhV5dv5N7n9vTRUWVuVONxb5L4vkO5ZcMeh9dOYQaH+Vx
B24F9HF2cVxU/NGqR+UEyMNDHsYYaTZ0DIQn8e4MFGCF4RjlaNk=
=avot
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

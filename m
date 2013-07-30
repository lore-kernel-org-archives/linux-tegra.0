From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Tue, 30 Jul 2013 09:33:03 +0300
Message-ID: <20130730063303.GJ9155@radagast>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
 <1372422796-23524-3-git-send-email-mperttunen@nvidia.com>
 <51F6893E.6070604@wwwdotorg.org>
 <20130729211932.GA6901@radagast>
 <20130729212313.GB6901@radagast>
 <51F758C4.3020906@nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51F758C4.3020906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2013 at 09:10:12AM +0300, Mikko Perttunen wrote:
> On 07/30/2013 12:23 AM, Felipe Balbi wrote:
> >* PGP Signed by an unknown key
> >
> >Hi,
> >
> >On Tue, Jul 30, 2013 at 12:19:32AM +0300, Felipe Balbi wrote:
> >>On Mon, Jul 29, 2013 at 09:24:46AM -0600, Stephen Warren wrote:
> >>>On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> >>>>Add vbus-supply as an optional property for host mode phy-tegra-usb P=
HYs.
> >>>
> >>>Felipe, I see that you didn't merge this one patch from this series. W=
as
> >>>there a reason for that? At this stage, I would consider it reasonable
> >>>for DT binding documentation changes to go through the same tree as
> >>>driver changes.
> >>
> >>no reason, just missed it. Will apply now.
> >
> >actually, patch _is_ in my tree:
> >
> >https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=3Dn=
ext&id=3D80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e
> >
> >commit 80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e
> >Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >Date:   Wed Jul 17 10:37:50 2013 +0300
> >
> >     usb: tegra: Add vbus-supply property for host mode PHYs
> >
> >     Document vbus-supply as an optional property for host mode phy-tegr=
a-usb PHYs.
> >
> >     Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >     Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >     Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >     Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> >
> >diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-ph=
y.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> >index c4c9e9e..59c4854 100644
> >--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> >+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> >@@ -48,5 +48,5 @@ Optional properties:
> >        peripheral means it is device controller
> >        otg means it can operate as either ("on the go")
> >
> >-Required properties for dr_mode =3D=3D otg:
> >+VBUS control (required for dr_mode =3D=3D host, optional for dr_mode =
=3D=3D otg):
> >    - vbus-supply: regulator for VBUS
> >
>=20
> Oops, looks like I've made a typo there while making the v2. This
> should be, optional for dr_mode =3D=3D host, required for dr_mode =3D=3D =
otg
> instead of the other way around. Can this fixup still be made?

send a patch on top of that, please.

--=20
balbi

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR914fAAoJEIaOsuA1yqRExG8P/iqKO6U//mNBwVYJJC1oSv+p
J8cELTFw/Y/VZosfIVfCBDAsAf8EtRqsL/08H5Rr69YFosFZb9aTuq4ulx80Ce/b
WLadkboObCYWN0CtiFK2OhaSQWrCBQ84YtQ9hMZ8UkD+bXstIswH9WJDxv+Mg1X/
uLeiRHDJmEnUNjAAa9tbXlV0S3CUsbQgWNWrR5rnRGfXfDWDHdx93A6rioqyqBFf
JKyjzmzf8pCNgJVeN3nHUrszASR16h/loQnu2+Z+CHZ0B6IGvQ+H8RHY5ATTMH1m
HHmgJU+0pYwCjosc2/7TDtCj3whzB6AJylqDgdVdiOTM8Vb+tiuvoiJ4MqUgeeq1
0UfE9OOsghqXimcy0IbW8wdsIHjWpHTDN4/3ttVz8tzzWRMEKOyKdaMsxWNBhqJE
7lDU8yQnIafBZvdRzcidMdW1keiWIzd7P8w4Nfa4kXShbBizSbMeHuVXE0YqqamX
o369nAE85VuDiza1uuRw8SyzsYQDtjEt6fISqHdw3D7n8t4gyyvSd2z5fWOE5uca
6q2JgyXLJno+uZcsFzTC5+3quAKNq8PjKPx9r1ZtJjSReGXxiy/m57Sfn5+68vgx
zq0GLtdpmStL1PJ++Vb302I5wQ7yqFJIB7ABmk2IC/Em+0i8gIHNPZGSBxXKryEX
94pMo1ri9QKMm5qxJPB+
=0xw8
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--

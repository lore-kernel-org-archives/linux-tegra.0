From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Tue, 30 Jul 2013 00:23:14 +0300
Message-ID: <20130729212313.GB6901@radagast>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
 <1372422796-23524-3-git-send-email-mperttunen@nvidia.com>
 <51F6893E.6070604@wwwdotorg.org>
 <20130729211932.GA6901@radagast>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130729211932.GA6901@radagast>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 30, 2013 at 12:19:32AM +0300, Felipe Balbi wrote:
> On Mon, Jul 29, 2013 at 09:24:46AM -0600, Stephen Warren wrote:
> > On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> > > Add vbus-supply as an optional property for host mode phy-tegra-usb P=
HYs.
> >=20
> > Felipe, I see that you didn't merge this one patch from this series. Was
> > there a reason for that? At this stage, I would consider it reasonable
> > for DT binding documentation changes to go through the same tree as
> > driver changes.
>=20
> no reason, just missed it. Will apply now.

actually, patch _is_ in my tree:

https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=3Dnext=
&id=3D80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e

commit 80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e
Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Wed Jul 17 10:37:50 2013 +0300

    usb: tegra: Add vbus-supply property for host mode PHYs
   =20
    Document vbus-supply as an optional property for host mode phy-tegra-us=
b PHYs.
   =20
    Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.t=
xt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
index c4c9e9e..59c4854 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
@@ -48,5 +48,5 @@ Optional properties:
       peripheral means it is device controller
       otg means it can operate as either ("on the go")
=20
-Required properties for dr_mode =3D=3D otg:
+VBUS control (required for dr_mode =3D=3D host, optional for dr_mode =3D=
=3D otg):
   - vbus-supply: regulator for VBUS

--=20
balbi

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR9t1BAAoJEIaOsuA1yqREp80P+wfU6snme1Sbb/BNiwR8r+tm
1bO81nhMF2d4NY7v+KtsRUDZySHUsd58ZA4m3s2aYFAKXnrR1vAXJfShufNa1gqJ
LKIqDZEk0mSy6EErpMi9BfERuYI/Sn2Uvlp61St3q/r1K6nAdn7lVDiN5Rao2i7x
qkJuUq33O1DYJoitHYvK6k0tVO84Gb9N7znwVoo5R3V+Cqfnn9ON1JFLu3Y5uogl
1jX5F6umRtbBVhmUMwUfIVaE12PUL1budcKAc2zhTQvj/0RryHyKQAYHqbCz3N67
MjosPdn8tTSbw0E7qkqT6eaQOY4flrVC7iHUDdcwjk8Y3UZYvSalEl5d80HSe+wr
dYnZwdGedVI3wpfV5nEZ7Xd6Rr+SHsL70VtH/fzhUrFr8ZdePe7h+z5zw2gdlgw2
7Sfd/WiKLUmJHzOvG9Bbv5LJtBZzMX5+Jbsx9PgN4lSn4IN+ts1R1ool5e3fpnLR
fqaomA8yB3u47hNoP4uNqKeavjG2bEpTYAvNoUrxuwHOWq7R6PwGKXbD9k9gKcEM
5t1iujiU5HhNlpwqYPOX+vWED4toZZ05Y7/m5fp/OeYI4rUHxPuaKFOr6efttjjO
EtvzMmJ6geVSjUGGXjr+QAtnYtIUCG1+WsJ/bnXqFJMS2A1oy8u3ZR/3fs1BThBO
/sUGoryEgSVPHUrqlaOO
=f5Rr
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--

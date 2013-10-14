From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 25/27] gpu: host1x: Add MIPI pad calibration support
Date: Mon, 14 Oct 2013 15:44:25 +0200
Message-ID: <20131014134424.GA16302@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-26-git-send-email-treding@nvidia.com>
 <52587DAF.9080003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587DAF.9080003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:37:35PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > This driver adds support to perform calibration of the MIPI pads for CSI
> > and DSI.
>=20
> > diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>=20
> > +int tegra_mipi_calibrate(struct device *device)
> ...
> > +	err =3D of_parse_phandle_with_args(device->of_node, "calibrate",
> > +					 "#calibrate-cells", 0, &args);
> ...
> > +static struct of_device_id tegra_mipi_of_match[] =3D {
> > +	{ .compatible =3D "nvidia,tegra114-mipi", },
>=20
> Is the DT binding for that compatible value documented anywhere? I'm not
> sure what #calibrate-cells means; it doesn't seem to be used...

I forgot to add a binding document, but I've complemented my local patch
series with one. The #calibrate-cells defines the number of cells used
for the specifier and should be 1. I suspect that we'll never get to
have more than 32 pads that can be calibrated, but perhaps at some point
data other than a bitmask of the pads will be needed.

Thierry

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/U4AAoJEN0jrNd/PrOh9mIP/01TsmyKTXcp94Pfsfh4r9BR
bX1ZjhuWBls+C46H7HaWt7LyPHUr8ie3WhDrxNq8azjjOhf7t49v2UEtkOpT77WM
bW2DMiIpGN6d0g1p6RL1ozbo+BUAZvLxvwjIU1M5H8qKb0tP/ORgr8KI52kumf58
EEecETWf8ELuLCvtkYhi29NgUgwqngG3KDMm+TFoFRrIltOwSG6FXej4y3AXZVlI
AfcFSJzab18ekDRdsbok/QBna9xyQkX1KxohDZyINgS9LHUgEV2DYFDYbJf21/Y7
+2Hhn+gz8hincXF+drh1yUd15mNdFeWt8jDRtDlSRHQkc/z3PK+DPJLRLQDFLfIM
wIW98j33O0afYNcDTStpMguVc8KpW8+LbJtLWxYNRpjNR9abTrKZ6EkNJEaPD+4Q
V5xWQBXtnXi7yLa+Wl7YNGaXMyKD2rp+4x7NKE4nHjhKlU3txJwU0qFzv0+MVGKx
Y1VdBjs5upibdPGm7cWHDLl22mZAlJ1thQEBjhftGi4pV+UdPgJi/mu1XLgpn5hm
WsbhwtsKoUq59ZiPkgmCOavRrG0ZvgB6j8gscXSMWMMmUighq5WIkiczc+8qZm9R
cW1aVrwYTGH0NFGOGQTmw3vVyK0BvGOnxVQU0K8+oppxNAwEHovE3M3QWbL0zTAk
3yZrbfy05RjWF00k1nL/
=MTn5
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

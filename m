From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix Beaver's PCIe lane configuration
Date: Sat, 22 Jun 2013 12:45:45 +0200
Message-ID: <20130622104545.GA15586@manwe>
References: <1371846232-31163-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371846232-31163-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2013 at 02:23:52PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Beaver's PCIe lane configuration most closely matches x2 x2 x2 rather
> than x4 x1 x1, since clocks 0 and 2 are used, and lanes 0 and 5 are used,
> and the only way those align is with a x2 x2 x2 configuration.

Looking at the schematics again I have to agree. Thanks for catching
this.

> Also, disable root port 1; there's nothing connected to it. Root port 0
> is the on-board PCIe Ethernet, and port 2 is the mini-PCIe slot.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is to be applied to Thierry's WIP PCIe driver branch.

I've applied this to my tegra/next branch and will squash it into the
Beaver patch that's already there.

You mention another fix that might be required for PCIe on Tegra30
(additional write to the PADS_REFCLK_CFG1) register. Did that turn out
to fix communication of the third port?

Thierry

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRxYBYAAoJEN0jrNd/PrOh6E8P/RQqU+vIta4LPFzygkFlFSWN
oei752RUCoYZAydw/mdsFofu0FVZmlNBNlWD1fLpKiLPf2szOeNPer7QF/Eu7Pdl
u3aSBB+ySbx6zeYysHD9xXwEeyfOZOunVE5OZ0VEIyGxAMZgIfBIvNI0jtmlLy+a
EyfOx+EviiJsiApiSFFjrq3CuwnmjzmxK2PHAbuUAabHpAsl+ZA9AEpDgrZ9Eogt
M1C7Ho7zh/bO0bOXMYwx5p3Fd2kxjBj5oT1ghzMg5AMA893kMeZFPvQ0+QPZSXXQ
/YuDQq98TQf6nF8I445ItAXWIX64sGOXWVZRhCJbQmS1tgVRCpgvlsxFgDbEF0b4
QZHQuW3Dt3O2KjfVbMfMO4HkoJajC0gDqAMuSnHdmGuTMbUy28xEwU0KXlYs6WnI
anJ1F9+FUWN0860bvDsahdPBmlnhnEameZD27W06zZ3bL2896PfaMs/EMWpIQ+CU
u1RePqYkr9Yq1ofAFisPYcNU9W06RF7nSvPn6Rj3YDLyt4iy2LvvCOHbKdKOk4bU
cUly6NcvGKy8l37H2IY6Q0gj9Mcs+MuwMX088xqwQpX0plRHQ3F1NVUCYGWY1M7f
L/1hdq/zHRoiwwyZaRxlSiqBFZmWFGiz8SeYVO1Pc4GnZ6/hL3d/fntiaisiMi7H
RSfPrzVn8o25am7BDgXA
=AMgp
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] ASOC: tegra: move AC97 clock handling to the machine
 driver
Date: Tue, 25 Mar 2014 18:54:41 +0000
Message-ID: <20140325185441.GE2269@sirena.org.uk>
References: <1395174649-1493-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m4E4Spob7u7JiHeu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395174649-1493-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--m4E4Spob7u7JiHeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 09:30:49PM +0100, Lucas Stach wrote:
> On Tegra the convention is to have a single machine driver
> that's controlling the whole audio subsystem. This was
> introduced after the AC97 driver was merged and ever since
> AC97 has been broken.

Applied with a reworded commit message, but please in future use subject
lines matching the style for the subsystem - as you have been
specifically told before you should use "ASoC" for ASoC.

> --
> v2:
> - remove redundant clock rate setting
> - defer removal of err_clk_put label to avoid conflict with Stephens
>   dma channel cleanup
> v3:
> - rebased to 3.14-rc1
> - no functional change
> - reword commit message
>=20
> CC: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> CC: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> CC: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
> ---

Stuff like the above should go after the ---, not before it, so it
doesn't end up in the changelog.

--m4E4Spob7u7JiHeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMdDuAAoJELSic+t+oim9veoP/3UhPIDhh2cdGEn7z2/7z+kd
MsHuF4BfeK8EEoUwOpE9ilSN6br5jmgD4GCIvBe0FIdLdZqSKnCDARBY2eUkq0OG
ifSfdbSZth4t/hyDyFpI+LIGRJtbVPxhI7P41Q1KlH3KoVDQqTinJpyfc2vOnK4X
yy8M0RlbBDTAQ2mqI2suV7KkB6sa8szchWnlDGt4FisfBeOvwZ6MTwBeiAo7sAiH
WMOuHypOWv8LSVoliez3XFwEsBtFjiQ1AMuv1e8T10AJ0OKgeXNV273HtKELBnGR
Quza7MK2j0gOPwMjbdbK8p1UDxkgPNA4o2KMcW36O6U9Inos6Nqedr/I20LOpxMH
UVqQVE+LJPcCmZIBK+0kssqUVOYAXPeJUd1eBRjpzWFcExJpBEjXrFYanGzoUYzW
Lrnj74JkrlPEVeCVlWRfllxqyB9d8zAVPXgYwmdaU3nrbqCgmgm0MUrSfGV3Qu5V
WSq/AAkKlMGZbGWwvpr1y2FZ7+YolPxaPl6sU9tZjGTUX8zfKlrD6piRUbFU26Lx
ppP+QvWKK+AaOIti9G1B1+BDGJdDJ546ir+WgET511r1llZ9qVA7Yhn6PxuOedIt
TeE+PmP8hgE97ap1OhRCkt9qS8NiHJmNf4wxeIP829WfP5Ud5OIdQ0x1yjRQlfR8
iMAnVkyhVkj/Lw8lsgXg
=0B8T
-----END PGP SIGNATURE-----

--m4E4Spob7u7JiHeu--

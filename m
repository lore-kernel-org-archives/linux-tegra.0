From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: tps6586x: add support for input supply
Date: Mon, 23 Jul 2012 22:30:35 +0100
Message-ID: <20120723213034.GF12438@opensource.wolfsonmicro.com>
References: <1342187432-18668-1-git-send-email-ldewangan@nvidia.com>
 <1342187432-18668-3-git-send-email-ldewangan@nvidia.com>
 <20120713142229.GM4215@opensource.wolfsonmicro.com>
 <500057A0.1050108@nvidia.com>
 <20120715212114.GI4041@opensource.wolfsonmicro.com>
 <500DBA1F.7050605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <500DBA1F.7050605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2012 at 02:54:55PM -0600, Stephen Warren wrote:
> On 07/15/2012 03:21 PM, Mark Brown wrote:
> > On Fri, Jul 13, 2012 at 10:45:12PM +0530, Laxman Dewangan wrote:

> >> I was thinking that 1/2 should also go through your tree to
> >> avoid any functionality break on existing platform who are using
> >> this regulator.

> > I'd be happy to do that if the ARM people are happy with it; just
> > let me know and resend the patch if you want me to apply it.

> Patch 2/2 really depends on patch 1/2 to avoid git bisect breakage;
> are you able to rebase it to maintain that order when applying it?

No, especially since Linus already merged the regulator changes for 3.6.

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQDcJ0AAoJEBus8iNuMP3dAj0P/jz3hTcFjvngD8m9hIR6G2xP
fC8+v5AczcQNYf9JJKEeDBcVKg7ECLh/t9mpFH2QqshEo7fVd+sGKJdIa+CYHyHh
otgNkg2aGjTOMZsrHhBr0kiOXRdpSwqfL5RGn9SVrFDl1akxrNF4XXJmiksaq9hS
/HnX3V4YlGqp+m3q2ENnyoL7LTB5GX5MZfBgR9qWviFT8RH2FIDbaOOYxXS99IMy
Wm9wbq9s2hM6eK+nKaETPftNYmDYINzQHy4WDA97zFGNtr44HTmli/te3ozQVup6
iJYaUHaGK+9ZT4t5NGe38skzRUKDlXA9BWNycou2Go6TT/I2W7J4tpT48dyZvgUI
tD7gc4qmS62eRZmFso/MACjnKQDQuuwXfKvHAWRUBC3g5DM+3s3r08O5woDdhQXn
zpkViEJpQSJCj7AtrnEjncmganhF+uG1OtT1OwEsoFyKgOvRwFPW2FAvosk8/Vlw
LPciH6o/2ZeDenNudKdM/sXQAewDL9T/5so+VXl6caZ2hlaBIyyx6HtacwzgVU5w
Fm3/gEaqb73zVfXJQTEBbFq414tCGzyf7Tt+JeDRbsMhcJzZAN+pEO90YmjAI1hw
g7oXDcqb/GmSMaKbZuchK2UZd4YUEeIkW8smg6H5CmWovOLzDbhQcZBKElZ7xtbg
eOyYUddQbV57u5O5Osyp
=EVKz
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--

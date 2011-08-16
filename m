From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Check for overflow errors with BUG_ON.
Date: Tue, 16 Aug 2011 09:34:40 +0300
Message-ID: <20110816063439.GB2223@legolas.emea.dhcp.ti.com>
References: <1313434172-18319-1-git-send-email-dianders@chromium.org>
 <1313458336-31456-1-git-send-email-dianders@chromium.org>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313458336-31456-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2011 at 06:32:16PM -0700, Doug Anderson wrote:
> This change doesn't fix any known problems but turns
> on the overflow detection feature of the i2c controller
> in the hopes of flushing out any current (or future)
> bugs in the i2c driver.
>=20
> Inspired by a change on nvidia's git server:
>   http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-2.6.git;a=3Dcommit;h=3D266=
d1b7397284505e55d06254b497cb32be07b69
>=20
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
> This takes Felipe Balbi's suggestion of making the overflow
> error non-fatal.

the WARN() was very nice idea, I was thinking of just returning an error
to the client, but the adition of WARN() will make it really bold ;-)

--=20
balbi

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOSg9/AAoJEAv8Txj19kN12jkIAIdVeYQmxKoZcQTedYVoImCV
YdDBXPLi6q7Sw4/+0czLcOcWCo4GNXdO41uEayjfsgd0rZEzHKODLOos2tXjJDvp
tLHG958miHMPQYL6YKTdrwmw1yafP/QncYC/BMTVw286TJO3dyJfdsThTSfVvjan
VbiTkPkxUgj7RGXiFBbQzdjWFOPHovswzAMtOWCb6J0sMsq6bPbhuTTNdcd4fE4f
0g8CDbnHTHd1vAHivrZQvLCCoJcVOmppPY5ob9CF1UMpG7mtmc+1glW7hyQDXex7
p8IM+4huaRkh38wtDJBmkBDyzlg+S4rowgLwnMs5TqSAkflrMJ7j3kiTMNnRYuI=
=3mdt
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--

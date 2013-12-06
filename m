From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH V2 3/4] Allow overriding environment variables
 during flashing
Date: Fri, 6 Dec 2013 20:57:12 +0100
Message-ID: <20131206195711.GC923@mithrandir>
References: <1386351334-25766-1-git-send-email-swarren@wwwdotorg.org>
 <1386351334-25766-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386351334-25766-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 10:35:34AM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The flashing process resets the U-Boot environment to the built-in
> default. Allow the user to specify some non-default values to be set
> before saving the environment. This can be useful e.g. to set up the
> default boot target:
>=20
> ./tegra-uboot-flasher flash --env boot_targets dhcp beaver
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Don't fail if no --env cmdline options are used.
> * Enhance help text to:
>   - Explicitly mention that the option can be used multiple times.
>     (in --help output only, not the short help)
>   - Say "--env VAR VALUE" not "--env ENV ENV" so the syntax is clear.
> ---
>  tegra-uboot-flasher | 7 +++++++
>  1 file changed, 7 insertions(+)

Looks good:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoiwXAAoJEN0jrNd/PrOhqtQP/RHt4Q3cDTGk/8JFxVE7uMGd
cntOujqVLdvh/WBclKoI5Mn9VpwXEayk4GEHv8BM+joRQ63lkHkyVcu/rpFV4rln
RGN6ON+FZcq8fh2YwLogi9r5I/4aWlRGPnIoQtPR4DHMw83HSrHQdFTx/hiks+qC
HL9m+OJTq/p6BmmVSk/Hx577zkDQgEzMOsdbMzeGvlJYtMxUGYuJBeqFdXATsqP4
rbg6lbpYUVDFggmRDKMfutumcES3Y9sGrowOcEl1p9/VJMhPDzm7px/6z381/tzs
yYGQMgKxPHMmxgwWcpSooQRUrlxd0y41BNu737BP4Xe4ekwUrhUQpVR2EUrQtAOL
ugjibWR7VH0lf2+IMo6b9seGj6n7KJUxcwXIXvyXII6Vczd7GATU0KFQ2NwvFvvA
mXfFAVQUm55jlWSusfew2ihv61K44S6keMI+gy3KLHZuAGsA2cc3/pvnbasBg45c
MnOvQZ6XI63AyH0kStySvR8L/caOTsPDX+pTH6BR4MAv4T0BkZlhn4mc9tCdyoBD
YqslV329r390+rIYt8B0jt0L19l/G8rDLIpDyDnz+UMYRsBtPbbenB+efN07mScE
xZ/gZ2ZMl8K4cWMk2ttXAuwfh3dMoEaaMBM4Ja1z3tFSD/Albq5rS75FpUqabfk6
6NJXzyTj4NfbaxUUAiZP
=7LaV
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--

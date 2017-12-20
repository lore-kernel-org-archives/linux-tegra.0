From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: fix non-debugfs builds
Date: Wed, 20 Dec 2017 19:59:52 +0100
Message-ID: <20171220185952.GC9687@ulmo>
References: <20171218134519.3042726-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171218134519.3042726-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2017 at 02:44:46PM +0100, Arnd Bergmann wrote:
> The new debugfs registration fails to build when CONFIG_DEBUGFS is
> disabled, because the drm_crtc structure is lacking a member in that
> configuration:
>=20
> drivers/gpu/drm/tegra/dc.c: In function 'tegra_dc_late_register':
> drivers/gpu/drm/tegra/dc.c:1204:28: error: 'struct drm_crtc' has no membe=
r named 'debugfs_entry'
>=20
> Without CONFIG_DEBUGFS, the rest of the function already degrades
> into nothing, so we just avoid the one assignment.
>=20
> Fixes: b95800eeef09 ("drm/tegra: dc: Register debugfs in ->late_register(=
)")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I don't think I replied, but I had applied this yesterday, so this
should be fixed in linux-next today.

Thierry

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6sygACgkQ3SOs138+
s6EhRA//a84GAly6tujb+9UI/U83DL04hCtsZkcDoVhzaTqtRE3S1mHu1M6jWTUj
WwnxZRxHtYbGwI7gMMPJ47EyYRoGR9JMlBbHVwyvCsrA7d3ynUtfwznb5rQ1h2Ow
3lA+rOWJZDyuL1WMgB4bRQ6V9SF11uMe2Y6N2+cMJiGQWWDlmrWTa/RmBvHWsdTP
5kqHSMZEyzMvbb878FsEQNJP7+89NIbHr8INYCUDpaZXsR+s2sBBGeKdlBIfpCHf
AFwjXHEsUUkiFlPF6YDdTi+p61MD316cXHNToLebd86bINKeMHrWeiVaN/WHqcaO
BtcStDq5TDrejonF38/JvamD85FTRA6gdgtAuOELqrmqo6DbJtNnWYeXAshJrts6
T4N54y6Oh8OcENyRgoQd3+a3FKLnzouKt4VXENJJeedwv8+A/AWgMYZmUU8aLgnH
J8JJTGlsIEJlDFHet+EuA6kWYxlcMjqz1GO9Fpqvf3FRBFVYzmzBqKbguY0kkWXZ
Cq9SEfW/14hN1zqHNoEzGYprypHK81ipr0OqxgTT3F/xzH81NBMe7YzGfiIf82Rk
PTfPNEY9LbOX1S41/RDmnhURcK84rByruawIEYODTg52LBcZ+SV7KKCcQs6FT2Rq
fd929AfboEG2uWASLRzNdCLwX5Q/tGElIm63c3cCyBSSNj7B/cU=
=62J0
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Date: Wed, 11 Mar 2020 15:37:53 +0100
Message-ID: <20200311143753.GC494173@ulmo>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200227120232.19413-11-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: daniel-/w4YWyX8dFk@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
> Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail) there is no need to check the
> return value of drm_debugfs_create_files(). Therefore, remove the
> return checks and error handling of the drm_debugfs_create_files()
> function from various debugfs init functions in drm/tegra and have
> them return 0 directly.
>=20
> This change also includes removing the use of drm_debugfs_create_files
> as a return value in tegra_debugfs_init() and have the function declared
> as void.
>=20
> Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 11 +----------
>  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
>  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
>  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
>  drivers/gpu/drm/tegra/sor.c  | 11 +----------
>  5 files changed, 8 insertions(+), 44 deletions(-)

Applied, thanks.

Thierry

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5o98AACgkQ3SOs138+
s6HZYhAAkiP6QpzzL7CdD6Z9Ope+DJuC3IiLOgXlUk62gu0rPNgHNHn8qo6QoLN9
lj+yH2lxtBKcNjdbWhbwl7Y0kPcF/NnaIwlNa0DXqeOibQ/25kwTxEUVGLjui5tr
tfuv80lAwAiTBMdkt3j/NYVFAPn593+XIuLTxpmWp1lndf6JJ4q6f7x7oWLKyH2P
4GUNrcGqLjrEvTlL0kSrcnSFt4Lj1+/E/L8S5TduQtnFMJdDX1cRVol9bsFtaYdz
NWKixSEf7MyNXVhSDqAQq6lKd6+MQtjjfA/nBrY2g0dxmlwhKklYcgdsO9RVHnK8
ChFqVsMcu4ekbblHTgZ9aUfsFlR2SsFBGdrXgjXscf95BhK1LeZtkLFHZwSho5jW
25mvVeY0BBCHDzvSdhLBt6c2ib2a3KGTwm0geLuWlEczczQEkyNLYRpESCARrNHx
FGtEQR30sVzRvnkBl+35xthXJ1/d/vzYOkbxjgAgYfBeK/H2NkJQuBxNaolkvTuv
fcQ7mqY71PLwYX/fNtVx9nGxcswa5m1FYxz4NEOykTr9bJIsjyP9gph6nb6zaGNh
mmN74mDvLdyvMZpdOUYgqLkf3bh9I43fECfrpnxkjVRrZhMDDfIVA/I1pw2ChqNQ
CaF+O8yIQIEWeNi/kyamiROf9Pzsyo7ov3RNnk+5t7W34h/+k1k=
=Kgul
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--

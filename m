From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] soc/tegra: fuse: Trivial clean-up of
 tegra_init_revision()
Date: Wed, 22 Apr 2020 00:15:51 +0200
Message-ID: <20200421221551.GC3445172@ulmo>
References: <20200417123949.26288-1-jonathanh@nvidia.com>
 <20200417123949.26288-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417123949.26288-2-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 01:39:49PM +0100, Jon Hunter wrote:
> Clean-up the tegra_init_revision() function by removing the 'rev'
> variable which is not needed and use the newly added helper function
> tegra_get_minor_rev() to get the minor revision.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since V2:
> - None
>=20
> Changes since V1:
> - Added this change in V2 of the series
>=20
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Applied, thanks.

Thierry

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcJcACgkQ3SOs138+
s6Hrew//YSdlL1YIcOWe/mXFbhH6pSu3wJv7nhAtBxWfzbSXsj9iE0VCOoAIe+u2
cBqWWuxWvYN5iO208BCpLp/M3hHHb9FzNg5ymkTWZkKzNebliIdvPH2OzUUgg179
uox5R5ucfNNxs9iVKOpJqLcdjbfjpsllXTQeO5xs6hB5wn4Bh4xzvG6J+/Hv/pGL
6b7fMNsB5N7zSU3F+/fky62hvGZwKVaKptKB00QgA6R4XgcthIi5s8qS6UEss9w4
IJpzJifpyOmBa43/3KPjk/y+BGVqCp/AJuugqzcDdu2ygBMeB1vpPvs21BSxVhg2
I8wdu5IKvPVLLIjdhU9e5rTiZaO1jZGXFxKqhtfJxe6ySSXVDejsu9XEi/TzZNZG
sMa+iLYrrjVdKOZhuLGr29XCuF4cf6gjrPMhpEyS54TUQWZS9uyInGU3WC1xj0tx
8DX9v8Gon43AnJtydm0Io2eoqS7+SPxv/arR3LPSXiMUA/r2BLWevb6HxxlSVZmz
A1fTHx//nkGdN0unTmZWAThg+zqpBOnJ3wFFj+jfW46jmtQripdo5mAMMAoHYuT4
ZzI4ePcS04C86kYTYDgw+rW595hgdJzA9Tkbdrmhmk7q3f4FTwXgQ+aRFkUDpSTd
mwBjDdy03BG6khW7XoG+nzKnG14mOqJ3shuFX5IlL8phEWhBXvc=
=Iitk
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--

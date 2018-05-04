From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: hub: Use state directly
Date: Fri, 4 May 2018 11:38:57 +0200
Message-ID: <20180504093857.GC13459@ulmo>
References: <20180418104019.31344-1-stschake@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180418104019.31344-1-stschake@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Schake <stschake@gmail.com>
Cc: airlied@linux.ie, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2018 at 03:40:19AM -0700, Stefan Schake wrote:
> Using drm_atomic_get_private_obj_state after state has been swapped
> will return old state.
>=20
> Fixes: 0281c4149021 ("drm/tegra: hub: Use private object for global state=
")
> Signed-off-by: Stefan Schake <stschake@gmail.com>
> ---
>  drivers/gpu/drm/tegra/hub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

I've had an almost identical patch in my local tree but never got around
to sending it out for review, sorry. I've applied your patch but made a
tiny change to compress the diff a little (kept the assignment separate
=66rom the variable declaration as it used to be).

Thanks,
Thierry

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsKjEACgkQ3SOs138+
s6E4Zg//S6OVfe3Gc3wGMsTrBo7UpMTc1YBLJlQzKj7TeMdQmZTFMzPKa7PGROQ6
Jiced4zixWVqmujJFkWqEIjG2TNl/81V15m6pdHKj+T2A+qFP4/3vI/1sDZu+2dm
XYOXjVQ1GgHU8qIWvkI7k1he5rmsIIyh+kVwoe+ywSzNvGiL8/6jEZ6Sp0em4cds
OAmP+K5HwukAIYBN/zkc5QuTkF8FQMOyiZgACmzCcUJqF32J8UilHgyhpa+9m6D9
08E7FWcPp/yi6LUmnXc7Y2Ds0C5Aj+74qVR8ibPf+wOPy0x/UAMxDX3fcgnjlYDl
ckILrlcuBlZH7JU5Xl9vEWePNC2rQ0TrUwI8ZMgumfGYdiKHMqjwo0sbGHUI60uK
LmuBeg8fH84vC8b8tT1fLFw3KO22wzNbmURhyGzyphhE/Z51xXDWgfjQkhYxksn7
KFRQEsfPZJW6JRuOmPUMEzaBSbz2CFIRqhIK9UIy/sotfV1wnEF/kanaw/omC3Ih
zDwuP3Z3X9S6sIaiMBzaoJM+BxX2iix1M0vIHUlg4f1DVqR8dIgu4B/nHUgE7kXH
L5EyRwsWdl7q0VJ6VNYuHow7wO9cW/lAn4xBoqZAvhb2aqS27d3yRwsCxAwKXRGq
ppUg34bgaJG1XrD4xQmZ5UEvUE0kc67ZlgQ21us3X57EbO/tEpE=
=SGnE
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 01/16] PM / devfreq: tegra: Fix kHz to Hz conversion
Date: Tue, 4 Jun 2019 12:54:46 +0200
Message-ID: <20190604105446.GA16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:00AM +0300, Dmitry Osipenko wrote:
> The kHz to Hz is incorrectly converted in a few places in the code,
> this results in a wrong frequency being calculated because devfreq core
> uses OPP frequencies that are given in Hz to clamp the rate, while
> tegra-devfreq gives to the core value in kHz and then it also expects to
> receive value in kHz from the core. In a result memory freq is always set
> to a value which is close to ULONG_MAX because of the bug. Hence the EMC
> frequency is always capped to the maximum and the driver doesn't do
> anything useful. This patch was tested on Tegra30 and Tegra124 SoC's, EMC
> frequency scaling works properly now.
>=20
> Cc: <stable@vger.kernel.org> # 4.14+
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2TfQACgkQ3SOs138+
s6GExg/9HsPjT2SjCQvZabaE2o3s+/XY1gquN4JnV0phciJyXkDiCEYstAtLTcwR
K464Jww0SwHI9j28NVkTwfCI5ZCV8PJgjY+5R/NRSW0JidhZS8AaMKkFfCMa8Ubz
8KBWHvn+iRlGR4Lpssr/nWPqk0NLga+exxpzQVQmY7iPZ02yxoC3sNiJmbXHT54F
o7QgAd1qwFST5DQ/yMHzZK27iUhFdupDGkyb2BVh2X0y6q2iseuvoW5at81ZuoVI
TB8Knl5dWItuG/ERGfnfoU8hV5i7RJDzTcnlLh//GSdD4cpRLGFVDbDE7lgnd4vq
DSCu/I4befv91FmHVIgEgI5qmccCzm9sFUrRT3Ga8hGtclm/namJyL8std4Jxh+b
9s7O9EeBAo/ZisfXhlzZnY5mg2Z8dfCxwxbxXhPZE/Mz6/ndmGfVFKsXRIvVBd5f
lDn71dlug/uXWQ5Tudkz/23JQyGW6dbQK14BZPt/2EEygyJnsmJckQuyOYUhy3Ak
xBkemlaQNzBS/ILhs7TVKA/+EFkdS/8Fcow5Kl4RdORdx9aXpbNxPIOMNWqyJYVH
v7Y0DsHPN98oshCFNQ7K0z9XIV6auZrlZ7RCnyfXhCz4NLQcxlrGYGQX6NIafFN8
ZXJgm+e4fuFBdNGBWUeh5STwqInQ4zLEdp9RwywxzH+SUoA6ePg=
=8Afm
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

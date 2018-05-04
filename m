From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/3] drm/tegra: dc: Enable plane scaling filters
Date: Fri, 4 May 2018 17:17:38 +0200
Message-ID: <20180504151738.GD31229@ulmo>
References: <20180504144000.8597-1-digetx@gmail.com>
 <20180504144000.8597-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504144000.8597-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 04, 2018 at 05:39:58PM +0300, Dmitry Osipenko wrote:
[...]
> +static bool tegra_dc_window_can_use_horizontal_filtering(
> +					struct tegra_plane *plane,
> +					const struct tegra_dc_window *window)
[...]
> +static bool tegra_dc_window_can_use_vertical_filtering(
> +					struct tegra_plane *plane,
> +					const struct tegra_dc_window *window)

I made these a little shorter.

Thierry

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrseZIACgkQ3SOs138+
s6EgehAAlYl19y4MhapHvkxjCv4DbKAFpI75Ts8FTbSxq2KKWHZAWegbYAt1O2H0
zrZkv4aSJOJt5gWnKqzlieHD3m4+FhDM6841SVB6z1Z0mfDJmVwXbIeYyaH8mNZn
5/I9WnuYmUdTmXqgUQ/GNUzDGLDN7IbK23/C+TEz81ghnw3sJh2w9zj6B205wf74
+ZyZ01xN19vHIVwegAS2stFIDQldiF/gAKeI3ImgPs8Kz6ud+MBD5OHD3TB6hq5t
xebXCWPHFvXtvetfu3OEt0KN+0xAD4bogKV/QqA3N0OjZLJ+/YlSwSOLjlk3DQI3
YrfHCd0GbI6yRTeRthsWm+L64RaK22DlMXHupng+RMXRbtP3RhVq11oW19nPbO8w
mz/ztgSoaUdyC393KD6JPgDO3IKhaNa1phd+WSXeBBKZbWlu3g0uM28g269PEesl
2ohdCGoBc1poby+CVSDoYB13JZNjxac3avUyWqJUcVeUN7pMyLRpNHACX0Xv9Sza
go4bGHRy+dsC67PObYkH+kbs+aQNBZ3Jda5sxyUOvc75OmicyyH3VatvL/lA2aSe
4r7DQJfpCf6EifWWGiyZB5y8gH8ZyLyZd8FBqcNEWtN8x1vDlW1GSaBYzfjOgnjj
Rit/o++0K4BjTgeyGAs3gtPn91wgTK0J9BLmoAbFqrnYsuIJivQ=
=w2d1
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: enable LCD panel on Ventana
Date: Wed, 8 Jan 2014 16:19:56 +0100
Message-ID: <20140108151953.GF21974@ulmo.nvidia.com>
References: <1389138437-4686-1-git-send-email-swarren@wwwdotorg.org>
 <1389138437-4686-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389138437-4686-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 04:47:17PM -0700, Stephen Warren wrote:
[...]
> @@ -581,6 +604,16 @@
>  		};
>  	};
> =20
> +	panel: panel {
> +		compatible =3D "chungwa,claa101wa01a", "simple-panel";

This also needs "chunghwa" rather than "chungwa". With that fixed:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzWyZAAoJEN0jrNd/PrOhKdUP/Av53hBOIFNTJkk++90aQq1P
oXEKCm69PmMH/+oMliIjV5pVOTJXdRxQz+mK/PIhkl9C3+I9yUQEX0AdczU85R6c
bLAgOOTOqFy0MVPb0sD0vj2L/Lt7BuW7sKWLFUWU0Zq9elHciSUzRwQvynzSDqw0
7H6knNWFGfL/hZubXLDUu7Se5CYFEkAdRk7VuebKzKeaCWwjiNrZ2C3yb1VZG6Pv
XPPlY7dXZHXlEA2hO4V0/zsCkoMJ0p03OsePRodnbJrajJTAQ18otNk/vc8Efiqo
REYDYHiuj1aafMpvAmIDXwXzsXPGvtVNU2DMGfWGWX0o3+DfuAd6BKvZIECc3gr7
Boz8FiDu4cEusBKy4opYwfeTRYgtN7lrFP+TTdJc+LYHvFM/UDOJMH2wIXgI6UbH
kh+kuh/ynr6FpbP1JnCqO9fPeIpZzCkc4MHRDlqvkcRHMPOsZZW0x/Em8tWyrMF9
gC6MOJstLcuQ6w5mCxDvgsk8QvBMmuwfm5MfJ0WPh/M+gWX8SAl/C9knlcwfMweu
YuKzcfZcQ1Xn6ORPZBhHcW8tWXUh7qYtX1wW/IclQeVt9QIyFswtZ/QrJ9YsuxOF
1YDu7QPRU3iHwhf2r2XIu549mklRwMlcCklJoOoO8lCMVCoAAX6ibUjnAEVPLtWP
Eudd/dYpZ6rQSKcPLvD8
=nk9F
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--

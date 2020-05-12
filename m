From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] media: tegra: Make tegra210_video_formats static
Date: Tue, 12 May 2020 22:55:43 +0200
Message-ID: <20200512205543.GC3864641@ulmo>
References: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1589196015-8945-1-git-send-email-zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 07:20:15PM +0800, Samuel Zou wrote:
> Fix the following sparse warning:
>=20
> drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'teg=
ra210_video_formats' was not declared.
>=20
> The tegra210_video_formats has only call site within tegra210.c
> It should be static
>=20
> Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
> Reported-by: Hulk Robot <hulkci-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/staging/media/tegra-video/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl67DU0ACgkQ3SOs138+
s6FvtA//e37GxkMc9E73ef/XZuzCXW0aTZUMH7NhzcWq6QuuXjKXb7wa77NAvMRh
q+n5FaU2nK0cKhI6zdW9qmwF2pN6TKIAXeK5HSFfkUs+COwC8EwZT7REVBtMo3/T
VAxyTWE/oZt6rgG+uPbmI5ahCy3zzsr20Z5+jk9YcdXZT92ZGa/hiDBV294OS/gx
CCG1GXcbQWO98xw8EyZCRYIYfSRLTRVNq1nNjie95z99dJhEZ4/KNxnGBDBI6hzW
zqIyiwSrlijNZvVcWaa+lWJ+ldrlxb54wbPhDRihe5y9moFzyxJevnCvQ8gXcix/
SnxdqHWT++FP/6vaWpwtrwzcLqNg9D28sk1t/tkevBJX9FQ2mP3TZEn6JT0qKTK8
+cqr16CNkC3myhPuznf6P/SdRrAw1gRT58+dwiEvXYeugUVgBQ/d+D1Q8fZlbBW0
Tuq+hUDOSIeIWRNEMxjgwC4fTtUwOYMFvcbFUOO0+dCismX/dcxbhKcNZdxiqd9b
fhoEfRxcJtFHoGAXF/4ThTDM5QXF+CnODkbpupWN8aQmN6lOAckpe9CIXgLlDTqu
MBHhaSksQGsmoZ0h5e536irVvwPnVC35sDB8hx6sqpd5qW/1NTkUWWFEwYV6dk4I
at7p0W9nfOMGz6D3HdMg2s2M8kCDOpSyqSTojBwIUFCPIPHV7vo=
=/sE0
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--

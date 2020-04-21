From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/2] soc/tegra: fuse: Add custom SoC attributes
Date: Wed, 22 Apr 2020 00:15:38 +0200
Message-ID: <20200421221538.GB3445172@ulmo>
References: <20200417123949.26288-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417123949.26288-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 01:39:48PM +0100, Jon Hunter wrote:
> Add a custom SoC attribute for Tegra to expose the HIDREV register
> fields to userspace via the sysfs. This register provides additional
> details about the type of device (eg, silicon, FPGA, etc) as well as
> revision. Exposing this information is useful for identifying the
> exact device revision and device type.
>=20
> For Tegra devices up until Tegra186, the majorrev and minorrev fields of
> the HIDREV register are used to determine the device revision and device
> type. For Tegra194, the majorrev and minorrev fields only determine the
> revision. Starting with Tegra194, there is an additional field,
> pre_si_platform (which occupies bits 20-23), that now determines device
> type. Therefore, for all Tegra devices, add a custom SoC attribute for
> the majorrev and minorrev fields and for Tegra194 add an additional
> attribute for the pre_si_platform field.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since V2:
> - Renamed attributes
> - Fix checkpatch warnings
> - Simplified code by using DEVICE_ATTR_RO
>=20
> Changes since V1:
> - Exported individual fields of the HIDREV register
>=20
>  drivers/soc/tegra/fuse/fuse-tegra.c    | 54 ++++++++++++++++++++++++++
>  drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
>  drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 +++
>  drivers/soc/tegra/fuse/fuse.h          |  8 ++++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 10 +++++
>  5 files changed, 79 insertions(+)

Applied, thanks.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcIoACgkQ3SOs138+
s6HqSQ/8Ce2MbHuw0lLNqNQYqrIExlw4tXEFdJYralJSe4UYsJgrw6YODCCxwL7N
IyMWNAD4w0zw1dK6bIOiwRfI2hx6UzM3W1j2868X/qTvureTJ8k5fGMFqA7kLM7h
5iTNjwtT/IWpBXU0sVO8hQuHHh8PWV9PpgU1ALUWQzekbSuo8Xd8jJzwWyYcqpn9
C9zCxa71Y6+mzEVHoHby0NSBMmhHl7bLcPkGqrFxySTWNLm9XtNVxkd9XXfKd5R9
iMffnZCL0Y2seM/Ug+axHu8hdqU+VXbAHdwxHAI6gSFmzx1kVQdM6iamr8bu0kkj
7wWWf/Pjx5G+y4VKFp2peGW4GIqmOUkJpvp/g1hC7gLztCyZ5mOdCmhfWLLogpG8
hP/nuaHaHADwY6s5YbMfjNCChyuJJMYTjajcpAVcvK6WzWbf8J9A+kI9AlGyOtBn
0cT4T1DxlJc5hf0TfJzsiziEDp0JQk9UhYZvfyxDlgY2HcvfOC1dYGAGs3rkOzOr
muXUkg1MF9p4OrQxoVpxqIQqBQZ5LisbnMg0nfaWC/fMoEIovM4iOlRfzere45Ln
WNAbLB3Wpy3kXHVIbmTTbovAslOpv3+3+pZ5GgOpQkdqK4XLgW3d2F8D/5OFs8JS
lpHYnosUl0zJPdr7RelvHSovvZrl88g+MDSDtO7SZpUjpUCZNss=
=huHJ
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

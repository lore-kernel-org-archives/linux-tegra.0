From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] host1x: mipi: Set MIPI_CAL_BIAS_PAD_CFG1 register
Date: Thu, 7 Aug 2014 10:39:45 +0200
Message-ID: <20140807083944.GB13315@ulmo.nvidia.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-5-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407391907-19488-5-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 02:11:47AM -0400, Sean Paul wrote:
> During calibration, set the "internal reference level for drive
> pull-down" to the value specified in the tegra TRM.
>=20
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/host1x/mipi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index 80578dc..84ed422 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -235,6 +235,8 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *de=
vice)
>  	value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
>  	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> =20
> +	tegra_mipi_writel(device->mipi, 0x20000, MIPI_CAL_BIAS_PAD_CFG1);

Can you add field definitions for this, please?

Thierry

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4ztQAAoJEN0jrNd/PrOhmyAP/3G+mkigBRfhZx+J4Oj9/c1K
inh2yhGBXhn+elqqpjULOPkWid4iftKcb5TeHP29IIJS411cnKz51FlnnENgw76v
xkO0pHYpvXWIDwue04WGzRausTxJmjsdgMf7zAENBhQNHuXeoMAIXh9ghpKsSqfJ
QKEkIis91hLH8sJopMIvV8IZC0duU1wDOug1erg7qUIKHlLCuV6xxe78SO96RLLx
qZUlPik0z2CErIOyRN1mnzv4XD4Y/GP0+XhmIYLHq4Bih+6V4IclPYFasmSHGCOt
VJz9ATOuFjpQScv8cCHM+H/6u+wEKn/Mp4Y42YXkpnO4iri4TAsw1vUW2y65EMg7
TIYNG3ePP7kMqFL+XlBGpDxfnkYuWm+7uoDy+MwY3RspoKyOXY4GCYDiFq0PW6Nr
p7keqtPAs6M2PxkUg5MgQKdwC5KkY2oRHV6noMBjFuiDxGrZm09QhV9T7fermvVB
aW7ytauVvuedF09lcyV8VJPwmFYdUmkecXrIK0H7gi2JPFM+gfObe0cFhTEbQ5l/
ArZ4PTPuyvgNl5pXL/VkkcQaKQa8U/z69L0lusm/yPvd6q6kOhVPcz0dPkHy4aBv
JoyWFOxstlnpUhz7m1kIZcNuvdy5ulmgtGfY/uYWr2ROHu4hWLWutHGgxcpyzhu7
XC4htI8+ST4KTIbVdUEF
=HfF9
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] host1x: mipi: Include clock lanes in mipi calibrate
Date: Thu, 7 Aug 2014 10:34:30 +0200
Message-ID: <20140807083429.GA13315@ulmo.nvidia.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-4-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407391907-19488-4-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 02:11:46AM -0400, Sean Paul wrote:
> When calibrating the mipi phy, also include the clock lanes
> in the calibration.
>=20
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/host1x/mipi.c | 70 +++++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 56 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index 0af2892..80578dc 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -49,10 +49,18 @@
>  #define MIPI_CAL_CONFIG_DSIC		0x10
>  #define MIPI_CAL_CONFIG_DSID		0x11
> =20
> +#define MIPI_CAL_CONFIG_DSIAB_CLK	0x19
> +#define MIPI_CAL_CONFIG_DSICD_CLK	0x1a
> +#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> +#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> +#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> +

These registers don't seem to exist on Tegra114 and earlier. It also
seems like MIPI_CAL_CONFIG_DSIC and MIPI_CAL_CONFIG_DSID no longer exist
on Tegra124 and later. And CSIC and CSID seem to be shared with DSIB
(channel A and B) now.

So I think we'll need something more elaborate than this. It should be
differentiating between SoC revisions to allow checking for valid pad
selection when calibrating.

I'll see if I can find out what's up with the change between Tegra114
and Tegra124 regarding the DSIC and DSID pads. It looks to me like they
were merged to match the DSIA and DSIB controllers, whereas before DSIA
and DSIB were used for controller DSIA and DSIC and DSID were used for
controller DSIB.

Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4zoVAAoJEN0jrNd/PrOhhZAQAI4dGAS3zHIOl0u7VKB19JWO
fCG4AeGn/FEv1p0Ozi4vnTpXC1P2JAz81uTYvy3FPq7sLQeJnoZhMgLp9K86mUhG
QO2ZXf1e97mXFEJLvmQ+t23Zn3VgJBy1vXF9FUsZhF3sXfXtGDlvBsEcms/84y0I
tdUOmyoNvhpjnV4Io7SJs2V8nh0fUVPlx16qFz3pPJbiaZLhYmZWBEPxyuQulEN9
SHU+s0kDxT/Hh02BHquVwy1XMJM/mQKva1k6O97Sun+26gaawXXUoJUdAEWwGE3A
JRcaCpMR6iVJsrA5XslW4QrkYKXt7BC2zLzLqt/lfghvALx8nWRC+eQg2Uz78XxM
+/z99yq1Fb5NUvs9WdIK3aLYp+g5dgGkGZSPIXCJn1WiduyqM0GlOLyeo2PLsuzY
VMiI51ir96vONoOG6kIPS5rzTSZl9ktAlHxfbi9/k87u/EZ8DsOksxkA6lHf/Wi0
Md0t8XB6HOccBTP0AYRapnlW+LbnU1qCVYmSEJUOg/dcYdkSCekK7FGXVYnU75zq
v4reGXld4tOInI7xVqzNtjCbJZWn7oIV6UT8o6W8YEntUVvZfmq8HHmvWqFfcAMw
/mXMXNtoniKO9qzyTQfIHuO8sJZipeZlxdUtGZDIttpuIeILjHnFJNtK5CTRFK/D
hH6816t5sJ9UxlwEwCnv
=Fns3
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 4/4] drm/tegra: add cec-notifier support
Date: Thu, 19 Oct 2017 11:38:11 +0200
Message-ID: <20171019093811.GG9005@ulmo>
References: <20170911122952.33980-1-hverkuil@xs4all.nl>
 <20170911122952.33980-5-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7lMq7vMTJT4tNk0a"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911122952.33980-5-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7lMq7vMTJT4tNk0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2017 at 02:29:52PM +0200, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>=20
> In order to support CEC the HDMI driver has to inform the CEC driver
> whenever the physical address changes. So when the EDID is read the
> CEC driver has to be informed and whenever the hotplug detect goes
> away.
>=20
> This is done through the cec-notifier framework.
>=20
> The link between the HDMI driver and the CEC driver is done through
> the hdmi_phandle in the tegra-cec node in the device tree.
>=20
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig  | 1 +
>  drivers/gpu/drm/tegra/drm.h    | 3 +++
>  drivers/gpu/drm/tegra/hdmi.c   | 9 +++++++++
>  drivers/gpu/drm/tegra/output.c | 6 ++++++
>  4 files changed, 19 insertions(+)

I've applied this to drm/tegra/for-next.

Thanks,
Thierry

--7lMq7vMTJT4tNk0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnocoMACgkQ3SOs138+
s6GqExAAiTqswpXhw3CJpQRU1QAFmyNrdIV6rQjVoSVbu9mWqg4LkUJrKsDq3wux
Y9ZQs6mvsIixjO2WeiLzq7zObYTo88dmMwqEi1+LYWYIAoG/SRZnXM1qb7fIIaQO
JS5w22yz9qe0WOQZvj7W8PEtC+R9hGtaCEOTX80UId9VMHNuu08RKfc9wUf1zT7z
BKz60Pvg+L/VftC9JxFszxtRku3ntnHlrs1rVCgOaAnIkLDrwS/a4aXwK0lClT0D
SuGustGTzgngRZOGJa7XW6XORjfOtgdgJrfg+X5oz3DF51O+hrhIWyQYHhQ9bMAs
YCKgoLu02E+m8ODWKo2SFBWN/OPSM5nA2wxLuJJB/QRjQ2ZDhTB3vCVLrQb2zm30
eqXiDEs8Fo+mmilNyiWLdWh3m2+7y3/TIX70yQWL4cmyFxNkP+LCXkH3YwiLZBGu
s7QmvI0FhxGZUD8fGhtg7PkFj8lO1evV2sLqLI0UAcDFnuHUjOIOquOHCptJh8w3
ZchzkDbJBAVx3ii8Dsk/Ny9sR2bkin9NyhTDdfUwouibQSoZkAoqdcCBzlgsTQou
Cx1Y3zNhGnFUEUxO0lr5kg/n8T80WxERx9Jd3H9p1TCJn0wyWhCtU4/qArmqrsk7
dqFFsaloBHXTgMeAjwSBUAYRTSWNVIXtKXykUpgQctM+ybq4UvY=
=lD6w
-----END PGP SIGNATURE-----

--7lMq7vMTJT4tNk0a--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

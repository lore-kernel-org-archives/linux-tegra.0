From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/7] arm64: tegra: Enable XUSB controller on Tegra210
 Smaug
Date: Wed, 24 Aug 2016 16:57:23 +0200
Message-ID: <20160824145723.GH6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHbokkKX1kTiQeDC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-8-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xHbokkKX1kTiQeDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:22PM +0100, Jon Hunter wrote:
> Enable the XUSB controller on Tegra210 Smaug. The Smaug has a USB Type-C
> connector with one of the USB2.0 lanes and one of the USB3.0 lanes
> populated.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 57 +++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)

Applied, thanks.

Thierry

--xHbokkKX1kTiQeDC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbXTAAoJEN0jrNd/PrOhhtAP/0C9pO/BNu9ueGkzsKi5J/9L
ruOf980DcAnL5IhBCtDkYYjzH9VV5gW6efWTzkAitwEDJlrtN9IMH4yoCoP3iHl/
EXHEGbmPJJExk9uq1NuoxjYfCtPvUc0e3Ii4T3j9B41S9rARrhRMGg3R74REp070
58qPHkM0BRoyzi4v0p37XIfWURmBL8HNJAxldTvTs2IiIhrxiIgQ6YJHlZsDPa3Y
hcI3DFL63GYzjvxTpfbiJbjOQrFtNBJ9CJ8WkK9nqso9y1WcRfQOQWuufulmVYBt
2qCu0B6Ynrsqy7odqUhXMWmf4pWF4PYzTblc0agIULA0pLr9hVJGDxSk8jzPbWO1
izn2RV1YLRd4x1X6kMYKbsgJ0ZbJpjoTmznJuEUljN/LVafq3vXvw5p+xS9kTF/s
InFax5PnV8uiBlJ6YMw7pwMlbqJWJRNMy1Ha/fJioxxkM1VA2UVuHgTFwP0j6ERo
qc3toj4iklgVgApcCOowcaRThQm5Sd4BGoNpnF9XX8FPoGAeN7+HNNKPcw/e3hXJ
uxpOum/yC/6l6fH+erW+m9sf4LFYXmGRsG6PpTI800eOWk19BkVO0sj2UZ7mO4h+
dbs8Vohnuqbs/8tjGwXvr/TAyEBqN7swh0J2+DFGOlRj5f2b0dG5tw6uTrWWYs8p
rv+ByzGz+JYNanBAhmz4
=Sb3T
-----END PGP SIGNATURE-----

--xHbokkKX1kTiQeDC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

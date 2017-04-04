From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 5/6] arm64: tegra: Update the Tegra132 flowctrl
 compatible string
Date: Tue, 4 Apr 2017 16:01:58 +0200
Message-ID: <20170404140158.GH843@ulmo.ba.sec>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
 <1490704978-22906-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490704978-22906-6-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 01:42:57PM +0100, Jon Hunter wrote:
> Update the Tegra132 flowctrl compatible string to include
> "nvidia,tegra132-flowctrl" so it is aligned with the flowctrl binding
> documentation.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-4.12/arm64/dt, thanks.

Thierry

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjp1YACgkQ3SOs138+
s6E6Sg/+JXvYSR92ceCxdSWXRwVo8bL3/3kP+DPwZbxLnDs/LYVMNK3H4CxEHRjI
oyBoAUwgeozgsYRCuWkHLBjnZXc9iYWge1Xq2/psR+9pjVSvUaYq045epiNRLj/U
EBKkv0vZp+JHdR9voX+0pXwZVE86+I2NmOwZcx4Yv8nvHrnuysJQcIRn5pnzPMd6
Pp3oAFfS93unUBbhaOdyWvPqAG8DJ5LUawjAl/6IYxYcSS08taWdagBFdSQewHxs
5JUyDEvS5EJMAFYeD0GjAuIIGfkd3NOZiaEWkxnlzwSisABemtEgnUntQC+c7lPe
2HbYjCPZubMaB6tqlRcyjg0J+D61AvnorFIYpVgA64L27mT6xSz/RAoX5hEPSVQj
ft2sMuEzTC8nAvBvAy8OXD0nhbl9g59TlGRdPHOhv1EHgnaNRIeQtIVi0ANSSZNk
NnaHWfiRDber2rra4SrGcv+EHcKALEgC/jH/7GN6cbkW5bD9aU+MpbIH/QtzL8hq
VDZISDtE4TwomYEeLNAvrXbzzhiDoo1S7zqqH7CQjDlxmA1riVN7ylGvOJxawWIG
rTSq5DJ9GISfP30L/XNJforMzioEhjXIDrCfgu6bqfx6FSqhE+dnCoQoiWexz0cl
RVVYgb5b2SAGr64L324T9wXHeLcesGNCZ8YF7hOIgE024DH/F1E=
=QANU
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--

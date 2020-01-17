From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] usb: gadget: xudc: Remove redundant
 platform_get_irq error message
Date: Fri, 17 Jan 2020 12:44:50 +0100
Message-ID: <20200117114450.GB166525@ulmo>
References: <20200116141433.57056-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200116141433.57056-1-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 10:14:33PM +0800, YueHaibing wrote:
> platform_get_irq() will call dev_err() itself on failure,
> so there is no need for the driver to also do this.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4hnjIACgkQ3SOs138+
s6G+ehAArX6J/MT8QnvA7i1DoizXGjeNN6C9t/2MrckIK9iyek+eMIIPaGfq0eF5
xzbgIC3XSRrjolAepid+edS44UXQU2sRkQsRwAs3JhHS+BJnbSg3m4Ekd8LY3fl4
McsE+Or8JUAhcnd7a5mFsPt6GCWCIe4bfkEycxGCifs9rgcy2kR9ltPlz0oVBsrH
Na5acjzmr5Lm4yu8cpRtKJIFPqnS47/8xrPAsC+5l4PuXRlFumy1jSGQ4bDBw54B
ThddVgBD/flrlbs7C9cV4imrc62gphEZ0fMM1OFD0mI6xxL3dNpVmWEXWb1EJRE1
i2FzxT9Iy8zL/aHtqJ+DbUlhAlUxmwe49LAKHjmdwTtwCxhQFYE9os4silhzgw45
nMIbGoNkS6HyR+OjCs5OgiSljuOXSq1ZG8ZSiUiJGBG8p3m8sdgDjcVKxdUEtIr/
s+idDzZrrA06TEA9qAp++a4oICaX36tIezjGxtRoBA3x40RjSXUvxC+7E+xqqdUt
kw97vMRuDEpkK+xhBd/8Vsoc+GJ/x51ByFwHYTdf31E30jG6vUa3EJtq5j94L4PM
rAaHfYxgFdm7iYLV+F3XR5tLcwTl3UvP+aoY59j6/dSlF20OyAP5tMO6HxEo+MiG
ikVV7exgW/qHv9ENKHDhrDVJMaNXRZOEwprUcUVKSzw4RTq1p6A=
=QX2u
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--

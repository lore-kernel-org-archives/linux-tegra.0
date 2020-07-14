From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: tegra: Populate VBUS for USB3 on Jetson TX2
Date: Tue, 14 Jul 2020 11:19:04 +0200
Message-ID: <20200714091904.GE141356@ulmo>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
 <20200712102506.23686-4-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712102506.23686-4-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:25:06AM +0100, Jon Hunter wrote:
> The VBUS for USB3 connector on the Jetson TX2 is connected to the
> vdd_usb1 supply and although this is populated for the USB2 port
> on the USB3 connector it is not populated for the USB3 port and
> causes the following warning to be seen on boot ...
>=20
>  usb3-0: supply vbus not found, using dummy regulator
>=20
> Fix this by also adding the VBUS supply to the USB3 port.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeIgACgkQ3SOs138+
s6HO2Q//S1t82eIqMY8wElaMo6K1sX8e87Y8KZeSxeZJ/xlX60QK4bLCBCxe1ZVJ
ZSlbS9+qta/I5n3JAv1RFUwQWXRqGB9Vyfjwif54RJaFZN0uwLz2q6uHHda8DhTo
p6YxTREj1lRR2eQiYVI6WTG9orXDaxhUlvCMKcvwNiAf4wkViJaX3/vCk3+vFpEi
/1TF19Us4bQvRcAxAnRpziqA9QFcz+zki9965dtRO830rQZBhlHr61i7hGI8RnwK
IvfKu22iq6Pqtmke/uVOs697GDwNST72DuEX5DZY+KA1X1MH77mmSzhXBkXGYVxI
GnrEnjw/KuuHKAbV6uA4ScKHlklmFjhQF+X7IKjaI9+3M4bAHMFUJBwvWY4wfDRi
5guHPjl3XxMR3/oqrtUcWKSS3IXRpNxfq6m8fzp3mTuRsoNgIBB9fkknM2bnGCN9
QQzs8enkuKq5qE+741CETQMx8+GxmD33VCU5GjjahBK5GGcsvwSaV5TwjC9dP+Pt
9g9lAYWELGE61BvwxwuvxPsgpGIr0Ll2M1WgW0mV2TqmSnkKVn6lujtd6KRt5Q/O
aK0S21yKFD5gyd+LVB10Bu6U6fGSwG3PNRa0F7RWk3NFTQ7r2jmf1AS0x/suz/eI
nAA2nOep8CwkxrbObLgD2KHtAsJzxu7BAxDe//bwnpNr39k2qLs=
=kgGu
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--

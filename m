From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Re-enable Tegra PCIe Host driver
Date: Tue, 14 Apr 2020 16:26:55 +0200
Message-ID: <20200414142655.GF3593749@ulmo>
References: <20200409095530.12004-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200409095530.12004-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:55:30AM +0100, Jon Hunter wrote:
> Commit c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in
> Tegra194") updated the Tegra PCIe Kconfig symbol for building the Tegra
> PCIe host controller driver. Following this change the Tegra PCIe host
> controller driver is no longer built by default and so no works without
> updating the arm64 defconfig. Fix this by updating the Kconfig symbol
> in the arm64 for the Tegra PCIe host controller so that again it is
> built by default.
>=20
> Fixes: c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in T=
egra194")
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Please note that this is needed as a fix for v5.7.
>=20
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyCsACgkQ3SOs138+
s6HnjhAAorO/eH1wOSgRsSF23BCq+30hhKgnRnkyOsrtCHgf/MeYFIAzvcr06pDp
RDijJcmBvSzoNFsdsVDxhzOdYrzh2Nyw2NLSO7kDejN3UHxfsc5qqnQE5MfLsBkf
u1JRxL8KiQY3fOk1ImSfFrhZC8svbWMKgZGtb/xP1Ejx+PKWHpAOnkpt7blT4HqW
oUapgRS+sKD1QlrPLiShBLayktAljR2kI3ZOujqRZtOQ0AGIr3RTpNERveN+alSi
nyEjFfny7HJPgw0SoyDlprrC/XZXVEVLvqOzGVjGird0qMihyuBpI3Y0nKz0ODbY
c1xtFGqfeYXz77nETFl0rjDlBYPrepKZNfyPG34mq9Z5Ihze9eDWo74jU0WjXfT9
P+yr1Y5fom2kcC7T9EvvW26WKIebto2fjW42ogTvoixHKh1A9fcxvqBMTTqlPP8M
aJ5xB4SqaMVtEvXBtlyycexWP+zVaEg4kFZY++hAUhKmhKS1CLLBxlP0v+OIFSfU
2iWRC6zulaN/yppee9aUwOrKEgMw/LuBZ9G9LKlTokOuDMsIphqNQFNmXhMC8jEp
r09W8PTt6xhXlhNmPmyfm+rUAGtVWVgT4g6V+SlU04YPqgaoTNz0kx0Gqz+FlRej
kchihYhNuHEXNdTfVOscJlMHoxY2ESCNzQQ3U4MYDeYZSWehUCc=
=2UgN
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--

From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
Date: Wed, 6 May 2020 01:12:05 +0200
Message-ID: <20200505231205.GA2682073@ulmo>
References: <20200501072756.25348-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200501072756.25348-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Robinson <pbrobinson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 08:27:56AM +0100, Jon Hunter wrote:
> The 'phy-mode' property is currently defined as 'rgmii' for Jetson
> Xavier. This indicates that the RGMII RX and TX delays are set by the
> MAC and the internal delays set by the PHY are not used.
>=20
> If the Marvell PHY driver is enabled, such that it is used and not the
> generic PHY, ethernet failures are seen (DHCP is failing to obtain an
> IP address) and this is caused because the Marvell PHY driver is
> disabling the internal RX and TX delays. For Jetson Xavier the internal
> PHY RX and TX delay should be used and so fix this by setting the
> 'phy-mode' to 'rgmii-id' and not 'rgmii'.
>=20
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Added a Fixes: tag and applied to for-5.8/arm64/dt, thanks.

Thierry

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6x8q4ACgkQ3SOs138+
s6Hj4A//bZzyUQMMk8z/OhSarJzGUzrOqlYlezjQWrmfuCIkygHuWvV/VxPmaHPK
PHCC9sdUBqlv2ZLRSlOxwMDYiZGCI8cht26eZwYSteHvaVm/IbIPs24y/nLf+FDB
GXAN0dGim6OwcwHvJ1UiGzSbmwvp51YIdqTujH8UgQgjfUjHcf5ZQZ95cmXLi6gd
RSSVQ5Pmmk/FG2wYq9y8w/wgBP0NQXegb0wsQ8U4AMP9EetQL1k+L5BlBIEvhCrp
9NHvPovmlyzCPic7qEPD637LNJViCT+It7lE46V2y1FWlKeFdFPwwmzipDwxX6i5
wKGx9x9QMCcg9s50uRRtbSrN81PNUZfR8bE2AITRqrLMF1i1u4wd9ERveLq3qMla
c2WxvcfTOA2/MCHj62Qq+/WglXw31bzm7FbJyjIdjIz5jNM8oK5E15TWJShSc0MN
/DGt0YQkZeoeqlzlyYsr1UMeAi087ToBvxA4KgfIX9kx093kM/YOUIvllqUn3GD7
eqYaoygiMJSQIHLqvHvpPvMLuS3PLBHucJozOjL7E47yzPrkuOZ8rWIQTQZiI4d6
g1Iyt5CSG5ZZ+XJUpTYuVMPdcTnBp0bdo+AmS6U3sVnpwT22Dr6BnsHKYyweci2A
c89pQBxfY3quf7jj9XmPX2d8Zf0nQjDkoqAxQbP12CgD5UCUQr0=
=dj8D
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

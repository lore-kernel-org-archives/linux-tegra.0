From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpu: host1x: Fix bitshift/mask multipliers
Date: Thu, 17 Aug 2017 17:31:28 +0200
Message-ID: <20170817153128.GD30664@ulmo>
References: <20170802095505.27250-1-mperttunen@nvidia.com>
 <20170802095505.27250-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170802095505.27250-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 12:55:05PM +0300, Mikko Perttunen wrote:
> Some parts of Host1x uses BIT_WORD/BIT_MASK/BITS_PER_LONG to calculate
> register or field offsets. This worked fine on ARMv7, but now that
> BITS_PER_LONG is 64 but our registers are still 32-bit things are
> broken.
>=20
> Fix by replacing..
> - BIT_WORD with (x / 32)
> - BIT_MASK with BIT(x % 32)
> - BITS_PER_LONG with 32
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/hw/intr_hw.c   | 24 ++++++++++++------------
>  drivers/gpu/host1x/hw/syncpt_hw.c |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

Thierry

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVttAACgkQ3SOs138+
s6E4ERAAoragALug2PTRcPWbmBA46vKFNqDkpDVff/JmZabnNMeTU5/YqGI/OBwi
yq5YSP0sDWtN81lK4E58n1TTd1zoTzs3xJXX+LpcpkZ4n2UQPaBOsomtuRVk1Y2U
igsoWd62S220tTBShBDUjdP121HrEjvUiiddCwbYekPb9yHNFGcMAyu3ZOFCasjw
cEuEK3mm7VYLMZnDnk419iDRCzae5t6Wd53Jr6SCTDVvPE7jd5w1ZREKJ8cVcJhZ
iHjo2YuXX80rjukvw22IZqvIgI4NHWp+4GmrlDrGgkiW41AQeJqP/4oSeXSNhGtc
n1ztpXlb3eLkkWKv+U+XZapr6lRTNP5YU8kuDBjz6TVeCSwyss4iivJOd4+ALqiW
AGaMzNfG3gP2lcz4jayLz2IXLEDy30Kjb+aOKXVRLc0ZHDeOC4qUnPJQvjP3QYZn
0X+Hv23LTqgvpdg2k3G02iq/zSOcEOPHqe59KjL/m/cjm58UelMLIfh8L0+5fROC
IRNui80LjVMtVm0w9i7iJrITy87iOrRFhPUFab3NuEX0DSiXo6N4AmeyPuwuXeZy
XeKyp2MKFtM4w99HZTi0/sEzJ974MAMA4p1XKh3bdbxBs4oPYu7Si0IVkt641Y11
/RDNpGJfr6sFeyUGRDmaW9NhGr6hToo1damnkyCLTw+fzsogVY0=
=OBL0
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--

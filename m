From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dmaengine: tegra-apb: Remove duplicated residue
 calculation
Date: Mon, 18 Jul 2016 09:17:26 +0200
Message-ID: <20160718071726.GE10785@ulmo.ba.sec>
References: <1467216519-7200-1-git-send-email-jonathanh@nvidia.com>
 <1467216519-7200-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467216519-7200-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 05:08:38PM +0100, Jon Hunter wrote:
> The calculation of the DMA residue for the Tegra APB DMA is duplicated
> in two places in the tegra_dma_tx_status() function. Remove this
> duplicated code by moving calculation to the end of the function and
> only calculating if we found a valid descriptor.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXjIKGAAoJEN0jrNd/PrOhWvIQAKV2YPgBhbRRw5cQT5vEI6Y8
Drg1IVIGrIBllzkaqjp9MpqRmVeFtj027dwCIGI1UsKgto9akIgNzI0G9TWE6/Ss
vlI/XzXq7J2Tqe3haTEkpQY/115s0A+ptFEG4MrGMd/kJwJYYY8BjiKQMnk57eyP
uzJNW8Y9nE3+tfCrivwHAJJMcS62JhCWXJSvv19mK5a+1LJUoQdxnMASBa163h9P
+OAvc1j/eDGpWA8/XsYUnpuvNaWKtehdxG3GSnN6TQ5rA5e9W59I3wGKXT+fiJhW
tZ/VlmllOLohNt2k7YbZ2swNiJ1lGEXBkz6Eh9Z4m+YMXARKnfjGz2h31CttBAMS
rEElg7qvb/nqPtSerDtCwz+IhqvKl1Jwh1sSp769sJZaL/XJ/SHGUaJAz6s1ujHF
vAAJy2/ZC9NuGDgyB0fT+RRlauIPDyDQccIrpFHy0JnFMpIvlVjd8pRXTdSncxUF
WvbwT4ZB02lZ+W+ma0zc1RFLYxvjN/XvrqVd4G9Ppmco+UvOylEORTpV/18E5O6y
eoDzrhr3ctDK2xGagvp89wmd3OpY7rXKlfoKbNvYCo32qiUxRnl+ZXArGSQieAOA
I95vvlxWmmnMOrz/6aQX5lmkWFIWDlvFdgPzsL8xQUr+OwYwbIwNGUOkuI6XE1r6
zeM5RSKlvutYX8iL1R6a
=hKmt
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--

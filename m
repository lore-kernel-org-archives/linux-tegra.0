From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bus/aconnect: Update driver to use of_pm_clk_add_clk
Date: Tue, 16 Aug 2016 12:26:41 +0200
Message-ID: <20160816102641.GB4564@ulmo.ba.sec>
References: <1471342656-8367-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471342656-8367-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 11:17:36AM +0100, Jon Hunter wrote:
> Commit 498b5fdd40dd ("PM / clk: Add support for adding a specific clock
> from device-tree") add a new helper function for adding a clock from
> device-tree to a device. Update the ACONNECT driver to use this new
> function to simplify the driver.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/bus/tegra-aconnect.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)

Applied, thanks.

Thierry

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXsuphAAoJEN0jrNd/PrOhNYcP+waIBma8EovFHKgyxORlSdWt
zgA6zkLk5nNHU6j5ROP7FNFU1jW20qD1W4zys3gBDNxMFOaTsKA9BsN4ylh5NW+L
F1QByqSdGY3EnU4zpsDy/Lc20Jrfk9mA2KwWYguYHMfVshiy0WSMlbckZPmLLUO4
/kAimeeGOk3H1/jVCAGS2vo6eoCRXxFRoxyqmg0pquBLRdYfUCXyJECERy8I/zxC
gaio4a2N1J0ALiOMZMDEwxz5+UWLBqOCpNX6q1v6QS/zmzT7eBhV7hqSdKsinWmE
/qterCT2Bgw0b2QGldsH/iQi7z+lo/Eo14owZhW24fmAEkOcZK1RM676ywoHyD2X
+L8CCCfuScC2GoaB6aZrS4cUXWX81hPm7qHEz0pT+3ZMzMBamFGnBAqUhnA81X89
BJOrWC5YqrYyDutW0vliEVjGbgVt/keNgxWyMWlZhd+y96hkU7ZQrOrStniBePyR
LbpO4nEu3aGpv/OvqveSFSPnD7s3VUt7M2uQxA9CCZnWxSITdCNCiArGxIQl59eR
RYeilYl3++QV4RgtBACMJZmNQjGtK+h5ORNNpEusSK0SUDFux9LdkER18itNWKXY
JWYH8Tg3B3G6b5ixlYUkFiEs6iRWw03zJlVX1K7hxXtm+izJch1wMT+qcjUPpiyN
OHYfgGlHhlOzCouiwaIF
=cLAV
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--

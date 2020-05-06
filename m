From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] memory: tegra20-emc: Poll EMC-CaR handshake
 instead of waiting for interrupt
Date: Wed, 6 May 2020 18:43:59 +0200
Message-ID: <20200506164359.GA2723987@ulmo>
References: <20200319193648.8810-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200319193648.8810-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 10:36:47PM +0300, Dmitry Osipenko wrote:
> The memory clock-rate change could be running on a non-boot CPU, while the
> boot CPU handles the EMC interrupt. This introduces an unnecessary latency
> since boot CPU should handle the interrupt and then notify the sibling CPU
> about clock-rate change completion. In some rare cases boot CPU could be
> in uninterruptible state for a significant time (like in a case of KASAN +
> NFS root), it could get to the point that completion timeouts before boot
> CPU gets a chance to handle interrupt. The solution is to get rid of the
> completion and replace it with interrupt-status polling.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6U8ACgkQ3SOs138+
s6ED2g/+J3reqnVaEM79SjqdTgc+vOxhup58zQ1XpVQu0VUIwSeHVxNbmFkC8g8D
iyY/AhPcTl/8y4XaF2idwwqfm+uRfp3JNV7/8cQ+UqvTlEaEhVfNeOEaHz7KfWos
QfXva6eiLfL+jPI1MSy5I7+mL+Mb/UxT7LbsuKMdLp43kZuwe7i/lz3mbEby7O4z
XZQFYsNqaZmzSTC+nhLIucjYZXv+EvdiJDecePeDOWWnGxjb6LbCmvn1cZh4lY0m
uO4K3h7F9r+4eGJUiDcBACwG72KV9zYkP3G4uJM9RpxX2PJM0IDDrNRIQtyOgcmw
3CtPXi/WJQtJqnAb3J2uiVakqE9zWvLwFPzIk7JyR9peZrekhv0oZOxsD0c2F3tc
ZEEGd6qIitzZra1nduzfw/xiWPFfMXWlTU6SXqVHCgHtEtILF4o1AlYjRi1xXAO5
GbIlSNXTWANpLhH7vzHsOuQpxz8L3KoG8xgAwhhAVCqAEgzKqktdZP148xW6r3nN
wHA7blAZEPkmz7Ag6tbM+EbHVf5f6QbLXcpa2Gp3U3AADXUYykpqbBIYdEapMmzQ
eEJl6BiLjhWvBcNvsGe5QszLftADT+f6BZOzzCj3MXjUG1sn3AP0EppdCQH5dmSt
Amdo4PNmHZj0ObzjAU8zCNsfMJdb/JpY4WOljuIKqSEUHqdLHrE=
=jLxc
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

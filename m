From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/7] arm64: tegra: Enable DPAUX for Tegra210 Smaug
Date: Wed, 24 Aug 2016 16:53:51 +0200
Message-ID: <20160824145351.GF6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-6-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:20PM +0100, Jon Hunter wrote:
> The Tegra210 Smaug uses I2C6 for interfacing to various audio chips.
> I2C6 shares pads with the DPAUX interface and to allow I2C6 to request
> the pads owned by DPAUX, the DPAUX device needs to be enabled. Enable
> DPAUX for Tegra210 Smaug.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thierry

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbT/AAoJEN0jrNd/PrOhzIcQAIH749CYt+QCH65clzihmf5L
umREDAOclti+IBgBAgZmjCjQDKRBWtP8mWA45lJUCgCK+5quK153fFqOdwE4W40m
InJg9NjtikLK+fKSq13jKk6ifAk3rXjYKbZPVUg7gNvbIyzQc+hb+y9YFVUKut0S
Fsl0Bqyk0oc4QmPZwcDSn1zsLKrCWHwuhyGGzihaPQN4rJ923Wkd/g3UnVcDXVE2
GKwwVxUAk8JBtebDef46C63qiz+AHc8KVwUVVr2as8/9Md+YqiO8wLsKKBZbqgbO
lvDwfOlNqVT9qKqAkmdkyMiqjNw+KkarPKzKG916T5Bhon9NbXkcYc1kRiaGkbFH
wBPnb19Z90tjVXJXIfiwbIboE1KQlwtyxrLgRtLinXL29uzRDS96gPqrSP+MNWYg
evH23FEX/xmZbssjBcbE6fR7ZCAUSAvb02wWtzO2njMaQ9DFypp9UQp3/O2I2+vd
QiJbtUiZ3dEvJoFvriHzzR3CaaXq3YMsfkPqL5p3LLntSGL8HGHJbwc3GNvjNWYS
gABhk0++kwaAhsVwYxPwCKCmIvbzKBDWXcT6dyPnTzqCy7NtmNPhWBMguYtEHtU+
Ei4RjIGR6eBE6x7lKEWK+1dNhh1DbuoFdPqrQOq8Ly6xhTSgRhK3c6r4jkwxJw4V
+ew3mkPVcDzCX5GJPmxu
=GfjU
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--

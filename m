From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: fix child-node lookup
Date: Thu, 22 Mar 2018 15:24:32 +0100
Message-ID: <20180322142432.GA5853@ulmo>
References: <20171115094458.31666-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171115094458.31666-1-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2017 at 10:44:58AM +0100, Johan Hovold wrote:
> Fix child-node lookup during probe, which ended up searching the whole
> device tree depth-first starting at the parent rather than just matching
> on its children.
>=20
> To make things worse, the parent pmc node could end up being prematurely
> freed as of_find_node_by_name() drops a reference to its first argument.
>=20
> Fixes: 3568df3d31d6 ("soc: tegra: Add thermal reset (thermtrip) support t=
o PMC")
> Cc: stable <stable@vger.kernel.org>     # 4.0
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqzvJsACgkQ3SOs138+
s6HPrRAApCkkMDOTQ5UGZnElEcAOQmZQFCeoRLNZgLLqA5UxqDm1wxsqnIaZsMG4
GQlmUJ8dtGsUeGsPCy019scvCCNewMdKXk6+mcMiCD2btzGwOlvCPmyH4eF2uL/c
ZcLQi+gJ3q0rqUptxhgbzsyrfly0TI1aVSJkOjLLuoEiqRjMdBc2pa6ZUh9zwWEQ
j39ncI0uH1Ny9KR68LPBX0u1XJtH0Ehk+4mMtKCThNbotJcGPrORGJitV8o0FoWq
X77H1m9TAnvE0FlHFkFvKyanA+bRpuGGg8ywQ3i7FHEwdQVb1M9Vio+tPj6IffBL
3gAmvbJ35VE7i2LXZqK3LXDLGFHmeJjvH/QVKuXwaDxwY1Ee2iiLFeGzKdabC5M/
Xup4QJpul2Qi4M1eGTLAeB2RnnM3kC78Ep1MNRraOLNs8xUxQciEbWSN5yAHKR1D
P/ZaIeh4PDI0ReGe8ujpYPs6dfLAiHKlvK1AI7j8zye+SfdvJZxUZ9Ui+bGhh8yd
Fgm+b+YcjYelldEvwndCsyk07Erb8Vp4RTc4Qk6092d9iXdjsxrWe5Tstm/iKaHX
mhoqk23/k8syd8CF5aWr3BAUDQcjoZI83i7IJhsIs3wcSMQ64S7KxWpFHWa0g15V
UNYrcIEQBStF0ky7Jdeh9mLPnucwVJ7qSqLJaK3O4OA5KqL0CUM=
=nOqv
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

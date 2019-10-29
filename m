From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/2] soc/tegra: pmc: Remove unnecessary memory barrier
Date: Tue, 29 Oct 2019 14:37:24 +0100
Message-ID: <20191029133724.GI508460@ulmo>
References: <20190926191755.27131-1-digetx@gmail.com>
 <20190926191755.27131-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926191755.27131-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 10:17:55PM +0300, Dmitry Osipenko wrote:
> The removed barrier isn't needed because writes/reads are strictly ordered
> and even if PMC had separate ports for writes, it wouldn't matter since
> the hardware logic takes into effect after triggering CPU's power-gating
> and at that point all CPU accesses are guaranteed to be completed. That
> barrier was copied from the old arch/ code during transition to the soc/
> PMC driver and even that the code structure was different back then, the
> barrier didn't have a real useful purpose from the start. Lastly, the
> tegra_pmc_writel() naturally inserts wmb() because it uses writel(),
> and thus this change doesn't actually make any difference in terms of
> interacting with hardware. Hence let's remove the barrier to clean up
> code a tad.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v5: Extended the commit's message.
>=20
> v4: No changes.
>=20
> v3: No changes.
>=20
> v2: New patch that was added after Jon's Hunter pointing that it's better
>     not to change the barrier's placement in the code. In fact the barrier
>     is not needed at all.
>=20
>  drivers/soc/tegra/pmc.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-5.5/soc, thanks.

Thierry

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24QJQACgkQ3SOs138+
s6HNfxAAhvdZb9TVwUyihU77Cp2yuc6tebSSK5Yl0IrOtTn4JKTl8uuFtEK7O3QQ
6MdTr9Ofp7fEtaaVYrO7rLt5u4tAq4l4Ft+bt740yREhbL8Il4dMIsgcFDghLNN4
GACFzwZzf7GwWGQtU3Sea8LiKDVpw8L+yyh6HMERXojFBQLby2Duww3qEWiXOoVd
qMRLaxshIiRk6EhAzIdvSYGOF5KTFClZPbsmaoIovEn7eQy6OgeMSz2OjicFTD8x
9OI0eCxlFGZEdYFe9UXoMzEREPg3b4rX06II+jdxC1cRCylm9GO89TcOxnPLYHK8
hlmjmhsSDwumUbURl08rKtW/GMLhY6QEjq+mpJpouGryusRX5M+0fmUN6A/yWn1j
GD7ZEO8D/TNM2uVEQoh7oGKYCrG6KIC9eXIb4F4UlxlusvRUB1gOO8sNUmc2pMUF
RLZ7fp2h+KJyPOSW7ozAoVF+KFv5+u3C13PzusAqw3OW+LNFrSKUVob5fXRwaJQG
vH06w6+uAhkfSKgnNlc/LyW3xvnDMNrcpjCUGVsD5ORbutLk4l55fhvO+84lgar1
UKyf4VdH6du1HFeemXWipknjnQTTUjjMLNsJmBdZF6CqhydBbjwlZmx1gIjuf2tP
qNqZXljihEpqdomc1/O7mlsdRQAfVvhcNUTestjRCGDgy1Syjgo=
=UCFl
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--

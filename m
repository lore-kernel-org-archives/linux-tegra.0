From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: tegra: Add pinmux for Smaug board
Date: Tue, 12 Apr 2016 17:16:31 +0200
Message-ID: <20160412151631.GD25160@ulmo.ba.sec>
References: <1460411582-7435-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460411582-7435-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 05:53:02PM -0400, Rhyland Klein wrote:
> Add pinmux node for Tegra210 Smaug board.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
>  - Fixed address to align with recent patch:
>    'arm64: tegra: Remove 0, prefix from unit-addresses'
>=20
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1271 +++++++++++++++++++=
++++++
>  1 file changed, 1271 insertions(+)

This didn't apply cleanly because, while it was updated to not add a 0,
prefix to the unit-address itself, it wasn't based on top of the patch
that removed the 0, prefix from the serial@0,70006000 node below it.

No biggie, just bringing it up to let you know that you don't usually
need to bother about these details, I could've just as easily fixed up
your first version when applying.

For the record, applied now.

Thanks,
Thierry

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDRFPAAoJEN0jrNd/PrOh6pIP/jIXpQSqNszLn2cCwvhBjs/K
9kBekWPr01R2A/c6yvoHVUynvFEZwrUSVpsLL/3sRBo8G6liYgLYkoBQcihXxf0L
BSa1khxJpN/j7KrVigHy05D+2Gt3oIaOBHqAWXs0SSQ26AAabWROecyG6D/8yNzE
PgghfBXNVAENZYiJ9VDjeHPA2Fuw4pSa9K0RDKrIqgIxOiigWHQ/8fX5PkHQ10NC
mhqblN3oFLS30GO96nVvCEPQfHxx/cfAuvO+4PJCsb/zuqgK71VB0Fp8P87XDrpz
4vqJxLiZWBI2oXL7Dhjdl1dsvbTrMnJMR2H4PZ8ehf6xiM2+WwUYxi936gxigrMb
sgbHUH7h2GaOxCbllrZFOxZgRaflCI84KTAZ0cdGfxrgQ/FPffa40krvGjL6DnOE
jZQvOwC4wOC863sV3/irKx/7OpA3taFQUgbypejwW0OPwuHptF5obQtxnOi6uy1t
OxfDCq80TCumt1U8oY75VPwx2AYCEc4BCiB1nFge/HiVQS/oLS7pILqVMqm/3gkm
It1wjGvKTe1KbbT1Z85QA/yZ43ceDtwIhzNtMgigzDrntBRqgCHM6MLc1+TBcFFC
ONGkX8BwuL7i4mmqjEhh7xnB0JWxuNGstIzKSSD3u2T+fm6JeE/XlPDc5u4BqCuJ
BcWoQ9EfLDlmsUL8nwHt
=E1/5
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--

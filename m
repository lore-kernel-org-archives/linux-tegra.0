From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: use devm_kstrdup_const()
Date: Tue, 13 Nov 2018 22:11:44 +0100
Message-ID: <20181113211144.GC2724@ulmo>
References: <20181108164610.28361-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108164610.28361-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 08, 2018 at 05:46:10PM +0100, Bartosz Golaszewski wrote:
> Use devm_kstrdup_const() in the tegra-hsp driver. This mostly serves as
> an example of how to use this new routine to shrink driver code.
>=20
> Also use devm_kzalloc() instead of regular kzalloc() to shrink the
> driver even more.
>=20
> Doorbell objects are only removed in the driver's remove callback so
> it's safe to convert all memory allocations to devres.
>=20
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/mailbox/tegra-hsp.c | 41 ++++++++-----------------------------
>  1 file changed, 9 insertions(+), 32 deletions(-)

This looks really nice. I'm currently working on a series of patches to
add shared mailboxes to the HSP driver. Part of that series adds struct
device *dev to struct tegra_hsp, which in turn would simplify this
patch a little.

Looking at some of the changes here it also seems like they would
conflict with my patches in some places. Would you mind if I pick this
patch up into my series and resolve the conflicts there?

Thierry

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvrPg0ACgkQ3SOs138+
s6HYSw/7B272unBtp25D5P+5OMk3akMT270t0lp7jgGUplWyhWbE1PzcbGAJc08Z
Ak66Vdv0Pd2Mp/3lm9fZ/SCnaYNszX9D9Yl+mOBEigjBq0gCU4hW2fTWUDXbGZrb
35uJLKaEuKogrL3RxLLmwiXDo28VDH4B/DwSd5UDQ6NCPBuKdksBT9KWsPgFAVCu
kQ0Ssp/28CokYkHJ6ExZdABXYcAD03xgl+db4Rqw/w0xKYXBYvqP0eXtFdEnZK4T
U8A5A88NPw56+iXttRRpYUR5qEzLmAthuvn0wfkMdiWOQC2+3N233Gcb8v2wr+Vh
/say5alqEZ1mttvdwh3dgVTOcDSotSyeY3DStDmfbpMlF4O/2ysnO/klQiCxskhJ
h2E6VP9t1JaZxcN5Xo9KjwDqsMn4YW4hKPdpDERorN6hyeZQftYhZnjiw0JZuidG
EftrmcvioUXZCgt6Qe31Xm7SvUJCO4DNoh5L7ZzYzu1XhRS30tnUZlpGomBTXR9M
GxspWw+K/4tWomDiByfpY9eGDiQFMHHChy9wVxU849Nm1guSeKmKqWUfwB2Ydnp8
sIyMyyIaOrRa5dKS77BRFXcxYBETrm2p6pG3ORJwW6m1a/nDymJck6hmjhTxbEvd
NNooITJlHhHjARGyIAPuvrv/8UaM/NqvRFXo8QRAGkvvHKhUIds=
=Ct1j
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

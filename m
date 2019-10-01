From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2] soc/tegra: fuse: Add fuse clock check in
 tegra_fuse_readl
Date: Tue, 1 Oct 2019 17:04:12 +0200
Message-ID: <20191001150412.GG3566931@ulmo>
References: <1567508212-1194-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567508212-1194-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 04:26:52PM +0530, Nagarjuna Kristam wrote:
> tegra_fuse_readl() can be called from drivers at any time. If this API is
> called before tegra_fuse_probe(), we end up enabling clock before it is
> registered. Add check for fuse clock in tegra_fuse_readl() and return
> corresponding error if any.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
> 	- Added Null and other error checks for fuse->clk.
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to for-5.5/soc, thanks.

Thierry

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TauwACgkQ3SOs138+
s6EqvQ//QmqQwmW5Ol+MmXGhVIp3l5MIWX0f5l5/D9v1a911yCzm9o9mPKjAlkJy
RA3+8kZJhAGmxE4GFZ/3aV1V32dqrnvNkJXEgagTnQ+kXaIfr2o67DoW5q220ftV
JT7USAUONMWTqEJrR90e+EV668kDD9ZtAcLrn40BBjM+0g0K19g+7vLXAvzuLNTb
CONTgcahroCKIf9x2YG8aUKICAeIbz/JflbaZwLyrV+WBQ8H4mg3RHbd1MPOQIha
sNv6HunEy9nJeP8kcHopFJfikHMNempXIpcB2mlmU/iubTvdvBFDm+POhivPuuqv
RCvopwwzqyxN+jyjj3SolNVAVWwzCbYYI96HBMn2j3jD0+2qCGO0WA/TQVx8IMZS
vBouimwhcWKu8HIHhTj3ZSt59bhIya9jak+1wpfmm9BgX6ifZNB4k082kB336uds
p6TlDKZAoTHVzKmRVC6nYmSMb46OKDVdqzZP9jn2aNPZio2jIhHzQNg83MPuUofQ
3jRXU0JifD15pnIG9zkXXM100k0HdnW+2rwzcVbEQRGsxd9YqQvV8gZWjtAQD9J/
jvzAaF3rcFZM8iMAUaU7VTIc6dzGJlqaqVhAr6q9VuKsrQsNVQFv3j2Z//dVhM8D
jgMlsySTFvNLZQf6K8bruE0yqY/YCG55L7JU7hJFRfdEBkmqTgs=
=XLEa
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--

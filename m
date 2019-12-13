From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to
 I2C_PIO_MODE_PREFERRED_LEN
Date: Fri, 13 Dec 2019 16:12:24 +0100
Message-ID: <20191213151224.GD222809@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191212233428.14648-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:34:27AM +0300, Dmitry Osipenko wrote:
> DMA is preferred for a larger transfers, while PIO is preferred for a
> smaller transfers to avoid unnecessary DMA overhead. There is no strict
> size limitations for the PIO-mode transfers, so let's rename the constant
> for clarity.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

I ran this on the test farm and the results are all green, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqlgACgkQ3SOs138+
s6HWYQ/+Pixr7HSMd237gQrljywWaHn5qJa8HcAhiW/UKmZKDZNHsYSpYCeN8JGe
qHizf5L5PLPgin43IOjvAXd0QzdVUqGNSoZEr/UjoskZTYCLe/KiUvXLa8gTp498
kUEPzgmXC2z8ifixzDpS8cELWl+Qh+ihwXqiGjf223RUlzDzN5m/fpbPqNIBFF9a
YvzcNDzOY8P0xm74UR3aO7B4TsYgUEVJttWbZRjJwHAbG3A0eY1K1CFT5SRGT5O+
vms6FfGwPpw9xNFHV0qfdGDedR6FVC3HxYQ6/dH0j0pqOt9L1kIhNsrlz02SaZbK
/pPBpotoXoqO2Zxzy+izHR/ziTi9lLVs4EFLR9Uoa0JMDnM35dxWn6QA3KtEoXBm
ncPCoOsIzm90QErx5/AO9A2Ny0k85ykogHBWFh3Kl33uG8SjYZHnuHplHGwSRlKv
gYcoxcuQW9ONd/EDpJn0XVCcHsEqdPejYXWL1J7iq2DjvJHvE2S9iefg2aIN68JD
646Hztb7idQVBvdAE+TgL7A3WThw9JfkpexyiQrxbZjoVOoBzCduCouq6us4H5Ry
hNU33u/r9mnsPbR6YBCs78j2pdedu46fPVjmZFEEuwUIX3SDTWtr0e9XtG3U658u
GCBvXxSUIaMUSq0g+NFuj9UN6C/CVuty4f7A8kJf5X0axafkxds=
=0Y5T
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

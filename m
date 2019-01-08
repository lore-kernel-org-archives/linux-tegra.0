From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V4] i2c: tegra: Fix Maximum transfer size
Date: Tue, 8 Jan 2019 20:41:51 +0100
Message-ID: <20190108194151.pdkmxp3m34k5crpf@ninjato>
References: <1546560767-9559-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ta4ucdpp3gpb63o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546560767-9559-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3ta4ucdpp3gpb63o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2019 at 04:12:47PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.
> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>=20
> This patch fixes this payload difference between Tegra194 and prior
> tegra chipsets using separate i2c_adapter_quirks.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Looks good, but doesn't apply. Can you rebase to 5.0-rc1?


--3ta4ucdpp3gpb63o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlw0/P8ACgkQFA3kzBSg
KbbIww/+I/rnCg+P7ofEkUHAUoVDMlqgJnUoxTyyIK9Oq1QAShIbDH7mfFDXm5Yx
iPjZwK/rpxUGNu2qUCSi8KI2WCVfZgZvfZv6tFVj20Yc92E4PVd1ztHcoqXgCYDD
OOhNyTMjdWJGZXOv1te9N5UMfLGnD5H/3u509AbHC7Rdu+/k3yrN8sNmZZ2bbmZM
r2Wy5RgRcGAV+5TSdmgPDM67iKrt8mhxFe/3n2FiUThSsXZjQqS/TN57hDNFLwkW
cTAKojJ8CthHkcXdp3+x0DFkW0CO/bmho2VBCur6ASG9xm7yePPLQ/m5nXw8hWWk
fcolqKORMmaRY89yLWPUIXpDjFRpOw1gL1mRJL8/MkBwRXnTARYOqQhgSJBMa1iS
Gnve28vS3jInDy/usyD6qRBcJyxvE9D/wJXkTC9UcUrcm5eeu76+3QB2TUwwG2Hc
fvi8ehvmg29m9ylSQWWakhvBYKKCSVJs6JV0lmwa1hpaQ0bJukARfwHBGHh1d6Qp
xE5Jcll4yr208A5HxJqjaWIi9fbZF8u/2k+JJR3MB0zrGX1M7ULmG8bsiJ77eUCb
r8hFOk0kiRQkKIOwAhirpnE8UKOvEvyQIvKCKzFE8/c4nIqAoVhGXr26zbrI3Cyl
4b0PN64nQ/Kq+wA+RSm8DpjY24haVcH9gSfAEvEMyrvOhZDAHoE=
=pV27
-----END PGP SIGNATURE-----

--3ta4ucdpp3gpb63o--

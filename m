From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5] i2c: tegra: Fix Maximum transfer size
Date: Thu, 10 Jan 2019 08:59:26 +0100
Message-ID: <20190110075926.GA5213@ulmo>
References: <1546984750-26199-1-git-send-email-skomatineni@nvidia.com>
 <1546984750-26199-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546984750-26199-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 01:59:10PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.
> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>=20
> This patch fixes this payload difference between Tegra194 and prior
> tegra chipsets using separate i2c_adapter_quirks.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlw2+1sACgkQ3SOs138+
s6HGZw/+OgrH0vkohH4q9BiATVC4SuZlLfhPt6G2C+/w2Ziuqh+F9ek1ByxxQRM3
rcP+YO76giKzcUSOnyglp0OVRAY0JLGetrk2ejlynC6g1thykq68rfflLZzEGNlG
auYJcAFLUuDpvpB8cynuSJUtX9S8dj/PUYuIGWEYrupYVSpNGqrWfd8AXhcUdO2N
O0gDtKLvVAtoieFks0xOFqoYxxYIaFndyAw+J/8GsJggKjkF7hPUS8gP9A0dSCVR
p3wumVhB+znWZEHH1Ya37vKIUbzbKQuFqxOY2JKW+7uNMmQ9MrCPRMidbUqhRB+y
DGfBl9J0SW4ng/9/Gce8f7GddXYQFH9E3cgUA1v9RjdcRstvqvnrci4HofATo8a3
TJftImGwgCgAsBzwruYVuotmDYmDX0gz3MWDzaI0ULDx+CR7WVnp+A45WhLefmxv
nvx6iQFhUwPLzVAbStqaLPF4L4aTgJWGZEaWkhwaHsPUs49SzqWHB+HEzZRh+naU
QWMsPS4bU3U1aHo87TIixUdoZysLiWLJxxg2mEIRWU+zM0Dw1K6rEPW0qMhYq4EV
xM+PXBg6zDLPdtGM2w55DfTSYtqBc54kfwY15xbZxkRBtbbs9yQyIsY7e/tvziyn
GSgi4B4A3CD1TTWvaXHtQM9TaMbbvHTvh6OFJPsJZ1xZr+SoE8Q=
=x4d3
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

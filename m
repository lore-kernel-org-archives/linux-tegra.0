From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: tegra: enable multi master mode
Date: Tue, 12 Apr 2016 23:57:45 +0200
Message-ID: <20160412215745.GJ1526@katana>
References: <1457961738-1927-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBdJBemW82xJqIAr"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457961738-1927-1-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gBdJBemW82xJqIAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 06:52:18PM +0530, Shardar Shariff Md wrote:
> Enable multi-master mode in I2C_CNFG reg based on hw features.
> Using single/multi-master mode bit introduced for Tegra210,
> whereas multi-master mode is enabled by default in HW for T124 and
> earlier Tegra SOC. Enabling this bit doesn't explicitly start
> treating the bus has having multiple masters, but will start
> checking for arbitration lost and reporting when it occurs.
>=20
> The Tegra210 I2C controller supports single/multi master mode.
> Add chipdata for Tegra210 and its compatibility string so that
> Tegra210 will select data that enables multi master mode correctly.
>=20
> Do below prerequisites for multi-master bus if "multi-master"
> dt property entry is added.
>  1. Enable 1st level clock always set.
>  2. Disable 2nd level clock gating (slcg which
>     is supported from T124 SOC and later chips)
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

Applied to for-next, thanks!


--gBdJBemW82xJqIAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXDW9ZAAoJEBQN5MwUoCm2iZkP/R8+B77SXgzaBgjlwuldsrHb
fKaAbmqPMrp7VxaT2Z4kL+nfWXnZcbju+LlxBsR6FTgOgCy/F4qG/VCkazH3GKVM
mFqza7BdTnY0gMbqnWmULWdMGKdlomgnp6SOzVPkCqRiB7i3VqUCY7rWOhTn6oGn
zflv/pY/08HhMyVF7SWZdlZ2lVdTcaY1BmykMmG4nDAK5NtHbDGtPXSTIXMNmNB7
n0+huQr2nHAJ1ZmZRNFtPEic/+7kTyR4Ae0BfurarcyWtH/usSlKWFzUwLyHoMTK
AkvWh0qyBZd+0btBVbkPTydQkug1o32vgdtFj8Ptt6lc6S2PMI6KG5+PM/dBR8o0
jzccoEpYztS2214qRGTdMJ3Mmo44H18aUVxPP6hkrmH8yY8sh8uU/VLJfxz7fcUa
WBp5Wm3yJmGghS0upuwodd5VtGezgS0+P612jKmFrj8dF94yQvc/lxOhSURNcRb8
Kc3jhOwNWeNhfekbk92BMy2k2j868BXycFBnYP+dOhOR03qpuN0ixjcQ9KBGSHVM
0oZfF2pEPN4xon3N5Z82Qoi2jG4zRn9H8P8hU3SBX5KD6rWdjE3GMEcYKc52P/k0
pYrip+Kv/sIE3f2EfYmQshqZVydgkwEOZpnQzTcePQFkObziGruBdleyu8vL1vYk
7zrdu8e4y2WtA5R/I2A9
=wL1b
-----END PGP SIGNATURE-----

--gBdJBemW82xJqIAr--

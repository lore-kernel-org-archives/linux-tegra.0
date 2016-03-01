From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] arm64: tegra: Add DT entry for keys used in
 Jetson-TX1
Date: Tue, 1 Mar 2016 15:28:12 +0100
Message-ID: <20160301142812.GB26201@ulmo>
References: <1456751211-14341-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456751211-14341-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 06:36:50PM +0530, Laxman Dewangan wrote:
> Add DT entry for keys used in Jetson-TX p2371-2180. This has
> three keys, POWER, VOLUME-UP and VOLUME-DOWN.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)

I've applied this with a slightly modified commit message and moved the
gpio-keys node into the tegra210-p2597.dtsi file, because the GPIO keys
are part of the P2597 I/O board.

Thanks,
Thierry

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1ab8AAoJEN0jrNd/PrOh4+sP/jsKzjsGBO8hjt2O3SOOeeMu
dwBdFHfnle6S2N+8nwGjraY3tgv05dQRPBlROEqe8/nAeu+bAGNY4Ez4HnMNsO6H
zMw3ZMUWSLIwM48+XQvuLPIQzmNc23ccLL0yp3VYxcHsn7ThwAKLU0a2RcoMaQ1A
1Hv1HPK8/YPEUzTarfPmPozF7ESxNpAE+r77iUyfOUGTG1MVx7kMNGuPN5mdMA8+
H+t08hqdOzwSXvpnonOLyDR8NzhQVt3SXCuORfmy0Np2Bsbyy+Jj2pY4oTVZdrRB
Y3ZocFuJgx5q8CKLH04//xyDI67CAdqmeK0ncRs91IYT3z0r0Ur3sV7ippTpAYEd
P3AlYC7tW73KmBa02EmkCJ00v8idZP5az+AizxZX8gDj7MITxn+h1cSeJopHnmkz
mH9GP/ykgxBbrUGdYRStbeNJXl3C98B1XYSE7kvfymEsL+TeW9MDwpEE35u52mML
s4OOzvuE7ecEvHBOTTCn9kJlXJsvIGKBGTpLvEDuxYXF/d2RX3BC7t5tRKGa9ec5
/XZ/X5EMSHgxK5iMcH/GYUynt5KCCP8bjqe48U3OKpLoIq1u+pgW+py1XuHT8Bxt
GQLnqerpPDkOIMkRolbzDwB/zSlkcRIcZUxFMswOcW7OX8C7o5yInF1kyhZLQJ3Y
hxV7mHMM4emeBrJfbdM+
=d2gL
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

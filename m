From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Tegra HDA support
Date: Wed, 3 Apr 2019 18:43:55 +0200
Message-ID: <20190403164355.GA1837@ulmo>
References: <1551977208-15702-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3201915543052497797=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551977208-15702-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============3201915543052497797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 04:46:48PM +0000, Jon Hunter wrote:
> Enable support for Tegra HDA controller in the ARM64 defconfig which is
> used by Tegra210, Tegra186 and Tegra194. Please note that the Tegra HDA
> controller requires the HDA HDMI/DP codec driver and so enable this as
> well.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-5.2/arm64/defconfig, thanks.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk4ssACgkQ3SOs138+
s6Hn1hAArnHPyU1IjNHe3+do23lOXm9UR2Mzb1REWswcDPNrdvAWCMnuuYa2Fh1W
Dtb97vyYArEy9m3AA8DR83p8lgHDQF9Q8TVVDZ7XBU8xww5Gc0nVPPiDGB0yoIHp
pZJqELxmNQkNpbLSFMQuDjOfKaao5cTJUbhIMNO9boAtgPy4zwo4/1jjZ8KrQXil
4BwI0nL2LuSgRHenjPUFnpQfp03KChqMaVxF7dHE7bqCQKZDH5ttCk6FZrXBEGzk
vGCCtAHMVp9CIyEphGfx5vQ0C+u/egmARA4750evej8eVHZNns20JUso//zlzjdj
CUOirKRi5Hi5QUGWUyJNrCacEXDIb7r0azyCjAc3JK5EBuXA08R5j7sTjb5FOakP
UZlpWGnJNKEGYBmc1LP4PwwD8DlmoArfqsh0Q9T40Bmy1+85cwOZi2dhn+U5lPpO
EZhxvDQy3AvLSwhgH3TpAKL9nn/ghc95DCUmia/OH692vDgPtO93KfPZ+3c5iPZU
q0td7ysVd5i5VF/sw0EK7a3fGZjv5Xd5UnYJyAnXABFZhX2eQq4F096PQa5fp99D
ZJX750JPhXOgbp7obXtSAnMkUdvhAcl7uc0pjacXEHytyLtDUAS/VOLdF4aDRETR
DTJy16dhsbmEoFoOFRlgNr3g3WAw9A+7dyalOFOjcPKVOb+8hGg=
=NQ9U
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============3201915543052497797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3201915543052497797==--

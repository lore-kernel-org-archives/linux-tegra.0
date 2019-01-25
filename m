From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: dts: tegra210: fix register range of apbmisc
Date: Fri, 25 Jan 2019 12:59:47 +0100
Message-ID: <20190125115947.GC12353@ulmo>
References: <20190104071646.15828-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4413789738620697983=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104071646.15828-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============4413789738620697983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2019 at 03:16:44PM +0800, Joseph Lo wrote:
> Fix the register range of apbmisc, that originally inherited from
> Tegra124.
>=20
> Reported-by: Mark Zhang <markz@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-5.1/arm64/dts, thanks.

Thierry

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxK+jIACgkQ3SOs138+
s6GouA/8D/bsNHcnYXiE4VfrWvuS3FLtAXgkmHzZ7d97ANdNpcUER67An301oDk8
2JR3YWhD+a3eH21gSpHH4pDRN8jLtv8SMf+/zKEgahSnG21pFx+vbYxIK99VIFXu
13IIMcZKcTnrEF9lfE6Qn/3t655YEKUr70rLbK3SZsnVeusebH0NAIXQpqKJBG1p
OoWk15+7lbSRLOVGLSOXZmyiyTk4dBJYazA+M6YNfpSkL9h342cLc4UMo8evAdqe
3s5OPfP5m0Pmia+CkFYnhuNAriUyemhrqTP4KMQLQLONZ5dy9yb2tRIXqsrsPRG5
BeTryt4qMPxUS40HX9grPMHASCOey7+jHytYyIiHGLhyLtNGLLW7ryQAZb05OUuq
tO+2d7Gx2Xy5XXuhbwz71znG3LkPDRQbY7aYJbEdtV4UiEAFx1NH76DqazXU0SuC
aHLIERgA4urg/EfFXjpCFNkkMKbBGTAEfaDYHmzl5LJa+FSlt3z496g7m7koRNy7
MApQ4F/GoRPCR65LNtYwD1vHVgJbg696UxVZi0ZgmNT5Uo70hBZpWTALG2ira864
4r9pbgQDLnENjNo/i1D/6Wgbo4kOXFrVS6dNuO1Bdugm+x3VfqV/+Yi8AW86F/nM
+U81t136RVrnoK8g9Ugkq6vA24omPmSShA6zqcHOI8KHSicvGAc=
=FlW5
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--


--===============4413789738620697983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4413789738620697983==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Add HWMON INA3221 support
Date: Fri, 14 Jun 2019 18:01:47 +0200
Message-ID: <20190614160147.GA28409@ulmo>
References: <20190424181010.28950-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1924714368175975404=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190424181010.28950-1-nicoleotsuka@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-tegra@vger.kernel.org, catalin.marinas@arm.com, treding@nvidia.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1924714368175975404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 11:10:10AM -0700, Nicolin Chen wrote:
> Tegra186 board under arm64 is using this device, according to
> its dts file. So this patch enables its driver with a "=3Dm" as
> the other HWMON drivers.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DxOoACgkQ3SOs138+
s6GVwg/+P/AvfzdpZqk+ZPGxa7bpI+hMZJWx608PHZLFziGdVT6L4TCTbkitOnA2
lsrSkOXjfjVBbxe+wz9zHRYjlQuTkeqNJ7qa/q7X0IDXn3L238gOz1Cw34IBu+Uq
GJUlHtzqAIMd4QoISPKUkEn2QxAGDJyxFq9XPOCgxcwwfmLK7J+n0qdfSrX86Azc
T8itykniaIepsFW4T85KUAd+D4ORat7sns5gpWNKqGG5QqCJJDLVURK8pDflqltz
x5EsWdPy7WrPV58CCj8dMKd8xO5FM7qUUlzP3/vQILQiXza9npEa6Okg5tTd1Yo8
Pso2qjA1JsoO2nxMYU1MOohveyuuuk0E31imHNf5Uem5x/ThUPWZQdXi5q5OMKl8
o8miSKjm0IFHE9mAgM/lQ1kGmD2s1eNpl90uObQFcqHeoLT6/yNlIvNLP5Ij7WW2
HtHG14Jbd2Bmax5OY8AFI8DPFqLRAJsyI0fAFFveZ0dSsn4fo08WAwbjRK+Ps0Ue
+94KsuaTg7Ig5aZ9fhStz9LGgw6lUG64gA/DjgQWSP0Q8f1Vr1LgB4T43x2tZ7Id
x95bl3PkZOavjeuGjV5FFV4K+foMkQyUQDHKFx2VimGo4ZH6xv0HNa+X9D4XeHx6
GD4tm6nhf2PQ9H1Oc7Rt/plmwhEm42sN+8DJAPpigq22j3i0bAE=
=eXs8
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--


--===============1924714368175975404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1924714368175975404==--

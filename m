From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] arm64: tegra: Add PWM controllers on Tegra194
Date: Thu, 25 Oct 2018 16:40:54 +0200
Message-ID: <20181025144054.GM21521@ulmo>
References: <20181024153353.15745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6699525163409488535=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181024153353.15745-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6699525163409488535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1rguoi8KZGYj2k4L"
Content-Disposition: inline


--1rguoi8KZGYj2k4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2018 at 05:33:52PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Tegra194 has eight single-channel PWM controllers, one of them in the
> AON partition.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 96 ++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)

Both patches applied to for-4.21/arm64/dt.

Thierry

--1rguoi8KZGYj2k4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR1fYACgkQ3SOs138+
s6FDeA/9GIEt1DfVC9NgnzRM3u3h6wu46jAbhTXB0PyxtuWk2kznvhIBCRhKquIs
+dmbZVddHBP6JlMXiqnWVgosavOesQsKYmiWSAhC+wncl4UELg2kWslmBmm7z+LY
YL7S/lhHFyf583E+rxV38NhSvX8Z6r1qBOxfMwDxq1cLhr9+0xHnPUwZ54HtHw7n
q0+iQWDC46QTeh6gJT86HZz1iwfXd7vtQPz9fSSRZ1YYRO10TNbssA3Kvr2dva0I
iQ0DMIRtAipk1flPEpqFONMxsilnI7Gv0fD/I6dL72YoBAUEqP9DcdgdICZyd44T
spyzgLPOdABfRResK22Kgf6D+xJ1VJ/RjT9+mV6BPW0lQvsh4RHm52nS/tjoDckm
OytWEGduRHEV+qtZhpGj1dnhGAeUTieARfXZUwB7P4rnIo/BClwjRBQegB4zxPEX
dAl8kC63Y50KHolYVXXvDJgHp2ZOOv+9JtBdWnJZ3qnzbSoGdlYcleSmXFwje+Td
89wAnAy3w4vfPWuPitRXf8YSfmKswtt7BuayhKq0hcK/gIvUnbzDyEuQ4YcFgtED
LnbGGb6b6R1qVRV1ortSN7qTFLHYKo1WrmareDESPkI6uxjujHXpcAAD/QGuljWT
6IYCwFRk2CAeSIeF8iVtYxekP66GuMcPJLIExDnfqS0CzISFoC0=
=Qvsb
-----END PGP SIGNATURE-----

--1rguoi8KZGYj2k4L--


--===============6699525163409488535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6699525163409488535==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: tegra186-gpio: Add information for
 Tegra194
Date: Mon, 2 Jul 2018 14:39:35 +0200
Message-ID: <20180702123935.GC13096@ulmo>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8119133304025709128=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620125406.11906-1-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, vbhadram@nvidia.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8119133304025709128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:54:02PM +0300, Mikko Perttunen wrote:
> The Tegra194 GPIO controller is similar to the one in Tegra186.
> Add relevant information to the device tree binding documentation.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt | 4 ++++
>  1 file changed, 4 insertions(+)

I know this is already applied, but for the record:

Acked-by: Thierry Reding <treding@nvidia.com>

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6HQYACgkQ3SOs138+
s6F9Tw/9H3Mor89xhupsUlu4TmM+NKTuZbBd552xTibqkFysbZojZzm1svTSfgo8
K+RxkJBTshzf9z80qJvnPwDJAitP+YkfXtmdqJAuAoQ4m7OBFBSXdNb60fLVLvrz
7KhrisJMvoZma1O4i+QURHM3p9yhgTS9Dx3kfkvs22Ccaq4o+ZCICy0AW2uM2ijd
ac6ngqGViC1Yyxj5lwdroaLTRk/rwamoavZoGYLwbWHVqVgmXxr3jWpBbzULSe5M
QVDSRvgC6G3cM/FbAmlZIGqvEPDogUs7Yh1wdTS9o0H3tDhU8LNGSajxYOs52tij
5EekXBxTDW+UecjiQyDWf6S0r1CIj4+C7HBe06qM7Z9VcOCeMGwltq/benTSajcG
xJjUCM/lCjIl7UkrrNv16JQqBexLNN4K0uMjFqb5vmckT49l0ugtObgfqA+g6gZU
U4Zw2gHlEK0MIa/kp1MxL+tqyJ1Do5N+JWa4yh3UIjzysQ8YaJuaJFUM6B9hLaGt
Yaom5EX+CBoQ9TUH832X9zDMoKr7JeZRJuD5+pOZG251Qb9KFKpqzibJGBDj1RML
BrJDqlkMoAz1zkD1OOyk6vVFjBpY4yPAhqxMQGdl/PhD/3UZ0EEzo6G3TnByvobv
a2WGH6vyPMPzeE/hsMp4sW95UyijycDbnS3KR51N2M4saSFM9UM=
=Nevg
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--


--===============8119133304025709128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8119133304025709128==--

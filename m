From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/5] arm64: tegra: Add GPIO controller on Tegra194
Date: Mon, 2 Jul 2018 15:56:35 +0200
Message-ID: <20180702135635.GJ13096@ulmo>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
 <20180620125406.11906-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7685889824252927107=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620125406.11906-3-mperttunen@nvidia.com>
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


--===============7685889824252927107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9aCKuHbn5v2q3RVc"
Content-Disposition: inline


--9aCKuHbn5v2q3RVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:54:04PM +0300, Mikko Perttunen wrote:
> Add the device tree node for the GPIO controller on Tegra194.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Applied, thanks.

Thierry

--9aCKuHbn5v2q3RVc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAls6LxMACgkQ3SOs138+
s6HzxA//YP7iSfBXu7Q+ptyR7r+9MckbEkoGW3QGZWfLwFzhu9r6nQOgL3VmrInY
l8VFwomrdRM8cijwCF4RSVIPTAhDYaTvibrvjwGHJFmXoJS+j3tf0IfEYSBhCynl
/Xwlxl4iinLi1yGRbTep+0hLyJY6Hn6UThc2aLYQsPwz6q1Qh0xwnhC9Lu5CXZif
YMNLISkgjYt5eesEIVz8sk2YyotCzWo7Jj7/3KWECtDw24Cef0yS1vaYJ62DWEYz
SFeWefy+z1rVTQ3alqtTf+zUwsb0hrT5elZD+JRXYhItXX6O1XNiHjuS+1Tp+Y/s
y0rgFMJsKt34lwrgkaZr9TFeYpE04NQuOxz2TqNRCzg/FK79UDz5IX4/BeQeUnm2
z3975DpL1FnrZaHRAvBNdKhEMXeDRNR4L4gxpn7fbrSVp53BTWxvLkSj8cMbv+yE
xfQF4vxcCOCZBLNOlXIyXTAYo9US2PIosFU3NC9LyOOaF2GP1/GXDoffHvAt3Ui3
30dLeveA2Kc7JTrif0p5iONmc9y3DyX1WZK83YoKbBdOa8wMewQTDQSqiDgQFPot
18YiCWPmvc3B1SV0iNVgd52e+nZdFubXvL4zivyJDZ/fKjf8vdkK+b5KEqu4RxAe
AhiU/gJjPbuw/3Eq4J6kNFy9MFLAzU/+LEXas6BF9IKt2CzcGDk=
=0ZqF
-----END PGP SIGNATURE-----

--9aCKuHbn5v2q3RVc--


--===============7685889824252927107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7685889824252927107==--

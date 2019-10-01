From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Date: Tue, 1 Oct 2019 16:42:55 +0200
Message-ID: <20191001144255.GC3566931@ulmo>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9010272972035134483=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============9010272972035134483==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 12:16:16PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The control back-bone (CBB) starts at physical address 0, so give it a
> unit-address to comply with standard naming practices checked for by the
> device tree compiler.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)

All three patches applied to for-5.5/arm64/dt.

Thierry

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZe8ACgkQ3SOs138+
s6HDfA/7BP/RRUz2uNcWaO6MfcsRZcw/kM1SqLT2nzI1Afne784R7SeHGLR3U7uh
hTFwQWaMN7lnpuN8+slIqsZLXdxZpSi2ZixYRpN1v982pqbe3ZbuyfPELvkkLtmf
fdFF/P+aQZE1mqGywjv/7gaXUZS8mXan0Y5a6No9PIk5/7xqRyRXWdXajiFZuf4N
w0Yg028XRx82BFIU2izhM3UUqtBIFkaEGnxr/+U4hybquf1nLfO7SdyVD52DTlH6
Yke1X4/OOqwjvseZZtSe7hU5ViYYKMInhDHkxKw5J/lyXtlhS1mkcpInvk0oSrhn
x+642n+BCKV8UWY9x25KWPyCjlXr+40itoS7F/3tuihhbQc4wIiejXwnJV2s3sUO
JuJwOqHFujpEPqwyYCpzjL8hla4Xkf2YaLsyesZ6GIszoWa7I77CEky7L+2uoizZ
9qIPnZuWooUDHOt06h1o7ONMnI3jXMIrNz234SIrZv7RQd1Kfp55xMENzwIvsUB5
KjM/sCC2Q/3t8hw5VaF8jv6K6I0hi6If1RD9k1j4kVA33TDgbib1rkB0wcZGaB7F
rnd63GdZIVhXGDgtjXdd+gsxIwNWN/5PZRA9/3gqWxYF2pAdyAiMZ2c9wdx+EznD
p7Hhtx90GpA1aVClyQ2+sKf26KmFczNsfV6neMkG01R+M1TABFg=
=1T99
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--


--===============9010272972035134483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9010272972035134483==--

From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] mfd: tps6586x: add version detection
Date: Mon, 2 Dec 2013 12:21:13 +0000
Message-ID: <20131202122113.GY27568@sirena.org.uk>
References: <cover.1385913227.git.stefan@agner.ch>
 <2d5282f031a16d2ff227694daaabc977440fbd2e.1385913228.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O2v8LnVIcZ+EDjcF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d5282f031a16d2ff227694daaabc977440fbd2e.1385913228.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, dev@lynxeye.de, lee.jones@linaro.org, lgirdwood@gmail.com, kai.poggensee@avionic-design.de, sameo@linux.intel.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--O2v8LnVIcZ+EDjcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 01, 2013 at 04:59:13PM +0100, Stefan Agner wrote:

> +int tps6586x_get_version(struct device *dev)
> +{
> +	struct tps6586x *tps6586x = dev_get_drvdata(dev);
> +
> +	return tps6586x->version;
> +}
> +EXPORT_SYMBOL_GPL(tps6586x_get_version);

May as well make this a static inline in the header.

--O2v8LnVIcZ+EDjcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnHs2AAoJELSic+t+oim97FcP+wTzTbJMrzwNnxGbgu0hyLT7
HwpyhAUmbD+CL1L+l1hYRGpwsztVacrTtX2HfPp9/XEs+5wo5GtlLMSpL+TwWto2
0NHZAVxYzJO9eMC/3+AjJYyGfXlK8XEYaEt3FoBUB6SOMhxataVLVolAl44M9iBG
+MF7Zb4EkdfGlIRgHEf4xxiKizCYBmF8LDppDp50fmmNp3DFrCedyb2Vs6NBD2PX
7rbAEIKWwyNt4DfrXEwrN1oYVe/8o/qmxtTw4cEqYIyw0nuwJOf1l7SZGOkPe63C
XxAbFBekeW9erTsZviwWMmZYR46Oo/DURygXQdN4PT6UD+sGVVPohgXz9h++U8l7
QsiON4WPwAY+YjPAFX0g7k1eBLNEUcMqH5emT58rjETdZWNTmbJ4+qAUpbVFDGQr
bXVJDljSljvt2qB9Wp4FrFjLulHdnTyf9xdkqOK1E9vA9bilWneUxXKMqgRNIzCd
8YDHUC4ZFj2yJFJRurrTh0xDAOUxpkY83MA64GV/8MTpt3+CHfu+vhmXUbup17og
J8Fl/pmBi2gdJDcpDhq8nEIUsrSnkDX6zGai+2El73GYP18lrrGxxNRfeYE0FTdU
wyzH5osNE1GDsuEStJMzv42X9Fm3+7ZxhneG82ugSoRBD9A1jp1EVEQ83r7ggmcS
TQ3AzCbo1Y2UKtd+w7u6
=4lxs
-----END PGP SIGNATURE-----

--O2v8LnVIcZ+EDjcF--

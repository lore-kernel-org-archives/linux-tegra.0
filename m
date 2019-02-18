From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20190215 build: 2 failures 19 warnings (next-20190215)
Date: Mon, 18 Feb 2019 11:32:17 +0000
Message-ID: <20190218113217.GA10794@sirena.org.uk>
References: <E1gukSa-0003kX-JD@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2059302755894988631=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gukSa-0003kX-JD@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <treding@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-tegra@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============2059302755894988631==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 08:51:48PM +0000, Build bot for Mark Brown wrote:

The build failure with mbox_fush() in the tegra-tcu driver that was
initially reported two weeks ago is still present in -next (this report
is from Friday but it's also present today):

> 	arm64-allmodconfig
> ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
>=20
> 	arm-allmodconfig
> ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!

Is there any progress on getting a fix merged?

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxql74ACgkQJNaLcl1U
h9DmWQf+Jwn7t3M0/f1ZRBUbAIw+nDhllLRpfiRToLELVVl8fYmtpxBeNvCeeyJE
nldgoWfQ5jg52ABt352S1DhLKtOn1bKo9vvk2FPe2hRQ4TN/2B/b0X7/FZdmHT6D
yIaDjCqTbWR5qNKLwNWNHPbRY3rewUZIqBKe6q0OAANwO0L3Q6/hZHRPdMvwq3P9
GkqRDyAI5TT7WvwnQ0DkgmkNQqH3r0/sYfw9EB0o7JBVepihX/lVcxKmQJpNfhCn
uP5fCWjwyjd2MGikbmPUzy5hWvYUS9e9Qk3J1VhoEZf0Oxu3qNr6bIgIbpIZyL17
wZsECJXoQ+9Fgo09uy4ptnFPArhDxg==
=1XPq
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--


--===============2059302755894988631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2059302755894988631==--

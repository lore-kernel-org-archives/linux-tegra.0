From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/4] i2c: tegra: implement slave mode
Date: Fri, 24 Jul 2015 11:27:20 +0200
Message-ID: <20150724092720.GA1597@katana>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <1437424546-30405-2-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437424546-30405-2-git-send-email-danindrey@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Danin <danindrey@mail.ru>
Cc: devicetree@vger.kernel.org, devel@linuxdriverproject.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrey,

On Mon, Jul 20, 2015 at 11:35:43PM +0300, Andrey Danin wrote:
> Initialization code is based on NVEC driver.
>=20
> There is a HW bug in AP20 that was also mentioned in kernel sources
> for Toshiba AC100.
>=20
> Signed-off-by: Andrey Danin <danindrey@mail.ru>

Still doesn't work for me and I think I understand why. Do you run your
I2C controller in slave mode only? That might work, but using it in
master/slave mode simultanously won't work yet as I see it:

* After every transfer (as master), clocks get disabled. I assume the IP
  core won't be able to detect its own address then.

* There is this code in tegra_i2c_init():

	if (!i2c_dev->is_dvc) {
		u32 sl_cfg =3D i2c_readl(i2c_dev, I2C_SL_CNFG);
		sl_cfg |=3D I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);

	}

  It probably messes up the slave initialization in tegra_reg_slave().
  At least I see that the slave address gets overwritten when I peek
  the register after boot.

Does that make sense to you?

Thanks,

   Wolfram

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVsgT3AAoJEBQN5MwUoCm28TkQAJ8GtWdUEhjDsXnlwbznCTXw
0ztaEoxnmK1CW3iglVwyMEJAC6d8+V3HAItUZbkP+XBRbmBu1OQPOdZNrT9VfaR/
dqjwMWmYg+VxyQGvjCG4uYRFc8YMHYpam3f4y9Gxi8lxz7MDRgDr1o00c08JIZuf
FsM2aWXO0qSxhO9PxBCsKIE5gsmw/VTt6tW57oNPrgb4KRWaFmcAmXGUDDwUPy1k
R4BwxNMe2wWfAiegGfPDS/vYYveJcNP+Sf3nrNUY4p5hYTVKZsiQdDkIyAYkIiJg
uON8pr8DLWvftjXVzQyRrG4g1i+0xvrtSYJsApJw+UXwcSOoNYWNIWwS4xjbKQCO
Kvvrz8fbrIkwsn/YFgmOQrLOz/coTeFt3JwNUbhXvvC+dgRqzJPyUW5c0oEd9r7f
N7vUKne85chLFOJ7ZNxiGtuJ0Dassn0PP+m4C/e+69MBjyG61OFn5KqLK00SWTJ7
C+8CNYa9nmV0Fh9ed+12VeaqCtXXeg0xOh0oLB0+kRtW2ZH8M5D4JhYnBl/C8ncd
PxRBkfKsO/TqrWVbqnyzND7eWVGpsU+TTFL1k1T4hx0n3pHA6tg2o60VaamFctvO
s/lyoJ/YPhcrF8lhlMOZtungmAJpF0zpQaC9vI1QPUcLe6raaE65ZSRg9runI0je
Epun1jJ9IcWcnOYBR+IE
=bK/2
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Fri, 17 Jul 2015 16:11:40 +0200
Message-ID: <20150717141140.GA9473@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrey Danin <danindrey@mail.ru>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +			//FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
> +			reg = <0xc0000042>;

That should have been 0x40000042, sorry!


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVqQ0cAAoJEBQN5MwUoCm2Cz8P/0eqPbyuGoIwcOFVpzHgrQfK
7WuElj1V2yo3fJUZIFyDNsQXDhT/NvlmkRs20pCsp2TsCi+RO5iwie4ZyToIf9EI
BK4JXn1wXgcIIzGGYL8/Ru48jn6G0S2THcH5pDaJ7fLgXvf2/LPTKRmfyXXuGXZ4
AIrMFB9kML9NzBvCsiA5M29wJozVJGd6UbBhj1NeUAKadeFLwiJHZ6F9e/61dG9R
Xj1R4FnON/3eC/ultqOO33PghSUUNRZBpE+Kv/qw4+PgaN2Z2UxoNp3ScmB9qMTK
+kiV8lIAKGWazfG6R+jqsHqxUaMMUKJQ8emsXmRcVwoSgvbCqKphbalOWo8pLjlo
V0jr1HIvhvpAyMNgSHsSi66xkl15ZAbidJ5Ahs9u9VKFOzqLzeI5/bK9CPunhd7B
JdNxBtI9uAm6bBHY/Tva8CaPM0OuyWc2LFh/12O4dV5v30/u43uy8mY2NIcFgrVQ
AG5Q5QYTVhq5Y4+Tb0ClBC1kXBFYR2DXpdtFYNZZwg/Od72tVDZAMVKrBddAbXd6
9pX7tFOBMYdTOt1S8ZfzuXr2+MzA6xMmOEOnDJ5cU1XuLRrKoAhJWZUu5JbDKoyT
5XDyuE27Hr/Yj4MZ/We+3nU2VvHKW4DNO2iHusdUQOOWPS1crSM6sFobtN5hGoNq
BhvYN2Nz7oKuILDFVeks
=JGv9
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v11 1/5] i2c: tegra: use readl_poll_timeout after
 config_load reg programmed
Date: Thu, 8 Sep 2016 22:37:25 +0200
Message-ID: <20160908203725.GE3166@katana>
References: <1472650124-5702-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472650124-5702-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 06:58:40PM +0530, Shardar Shariff Md wrote:
> After CONFIG_LOAD register is programmed instead of explicitly waiting
> for timeout, use readl_poll_timeout() to check for register value to get
> updated or wait till timeout.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Series applied to for-next, thanks!


--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0cwFAAoJEBQN5MwUoCm2qDkP/jvG8mcn9WTArgfSeMzYM8Cz
881IIoTVqc189vIjWt46rFOlnI8bmyomWB1UJm+vLGp64Jd8bKwhVkVlf/aZI6J0
OKY+ZKtN4OL6HZGT5tnBpEXh7mREtQXWwWDcyxw1HgnzX28GNUgaW2NuJE6oNQ6t
5Ov3ByvZFMzfvXaoIk0gDW9qSq0OJ32q3hFw6/3qopESp/Weg8vaPXRBBlD2M14+
qbAbjWyBk9PIrmbsTptgkx2y8eDz5xPC1WpKfbFUc6a4RpNpEk087eE2s0u5rmJN
1kFSY+QQqRSDDIQo2dbpSNkpUdeiImJfmzuFds5V2OKYYTZbL5H3A79BipF4sug0
yvlabu+CzbsF9yPnUo2ru0/34GgbKfYIIHDJ8MwFJHSgNdQ0XelLPstBRoxKpENz
DBn+ZjbxGxRj44tLFlKF2QHHo1YkU4ORn6n9ian2TNntXYDvQh/nDwvnp0Kr9j1f
2xLtDc0XQyaHQuZ5LpUWhyzxW6qk/XbNu/90PKVRypsNa4teXHtI/fH1ZAR4eObH
zIUHmcvddtgaj/MDBdiOD2m8cA988miE78UPPm6/LTNM142sGFTHLRV/1CXdsKNn
t+JzMd3F7AWi6e07TcgIWr7udWZJwPtHzOvvzy/jcGLyJ76vyt3VJAlX2DF5wRpU
C1JW+15inu5KQZdP0ltK
=H4vK
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--

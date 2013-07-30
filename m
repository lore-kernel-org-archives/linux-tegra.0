From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] Fix switched around host, otg in tegra20-usb-phy
 documentation
Date: Tue, 30 Jul 2013 09:44:12 +0300
Message-ID: <20130730064412.GL9155@radagast>
References: <20130730063303.GJ9155@radagast>
 <1375166324-30521-1-git-send-email-mperttunen@nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xb8pJpF45Qg/t7GZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1375166324-30521-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Xb8pJpF45Qg/t7GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2013 at 09:38:44AM +0300, Mikko Perttunen wrote:
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

return -ENOLOG;

sorry, I can't apply without a commit log. Please mention that the
previous commit had a typo which you're fixing.

--=20
balbi

--Xb8pJpF45Qg/t7GZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR92C8AAoJEIaOsuA1yqREP8QP/3pjXCae9Jwqfb8jP0iTHMzV
qlEspspVIkxEe74tlVw60TxwUwxrlFz/13rXXducIVL3pLNTt+lhnMbtbttxYGWK
T51QpCOk4wQnGfcbo3td/OGeEoA5VlMK75KksscGvydZEcOiAMWFn/0bCsd/GF4Y
XX5wsmewqMfLzrKRV3l/XRvryHC38UNxUnzKgtt4tTCbMxv5R+6djdbmdpkz7TZ5
uvUvZlsksuNtXh5jc6ID/fgHE3qudTRMycUDCxWlrxN7GEOXhNW+QrYoXieg2ZO/
i2LIwAE2kdFqWCIAqJ46gYKi8vQkVfZLngpF244siMXLjTMLUIShh5T2ppMLbvvx
nQLjKGdAwHej/SSSlSNEMYdrIo+2fV5NnPoiLKswsaAqE25cs4RzOTRPO2IW3BUk
tXSrVY0pPWopC48186b82hTa8SR8+CzigF3ktAxx2dD3eCilSgKEppeDi30SV+MB
wpzcWxvaqJjzdeHc6eqpEzElvi6tCmvg2Jgt2Z009UYLF6eI3pHxJpbW9PwksLYq
wDyQs3K++vLUfVvoClZ7C0S3MNw8g/YMpoeLaNqsChojPcldfOE41ETaP658KdW6
4rOHWsWxN7JvxqnWEcVaAykE1Oph0iSSoDlhLkwhGuJZEu2pLeTLsXGAZFVN5o2r
Syem1Jkm5fYC+zSLBwwX
=jOiQ
-----END PGP SIGNATURE-----

--Xb8pJpF45Qg/t7GZ--

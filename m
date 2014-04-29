From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add SD wp-gpios to Dalmore DT
Date: Tue, 29 Apr 2014 16:24:32 +0200
Message-ID: <20140429142431.GC23699@ulmo>
References: <1398711106-22484-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398711106-22484-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 12:51:46PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Dalmore can detect write-protect on the SD card. Add the required
> DT entries to allow this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts | 1 +
>  1 file changed, 1 insertion(+)

This one I can't test, since my A05 Dalmore has a micro SD card which I
don't think can be write-protected.

Thierry

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTX7YfAAoJEN0jrNd/PrOh1sUQAJtEYw25+2reG3BhVE/uKhJB
QIgepTZ2E2Vyo6VmnGcIJ9AyVaN/DdiwegFKGkKABb3/JJBQGA7LMykoWOt5EqLS
QuSFC2UohLE97BmdgdUAdghnKlWEHm2mbSoXyNfU/PC5qB0cJ3+HnlqAJ2NXJDdy
+YphBkSV9/ejRHbtPY9dJYcq118XqKUlv+6jqB5v5H+Ozl3ylUggpp1n5AOMK/3T
BR346rmgXb4wOeQE/Ec3ZbsiFG5TqOsZj+YbOcMWs/6bhoE24qKPbIJbv+Jwc6rL
2tkIJV5fz8GQPY8LEUMoHlIYd8s6akLMXeBksTL1nGBt5BN7u5MqiMvlBT4/jSTS
o5eBUarNQr/6GBzmQwj0SpzEGyjD0bkMTx+zk/t4x1uUeJlMVbi9Ld02PdMfVN/J
oNUYlJwG2VAxMiFkMdRnTGwEGC6qTaqW2JIY/OboGWwEVMqH4hKEZ1tN7LR5KQYd
Gk3besf6Si8NgXaRnyq6iSjFCY1nE2LAkEJqu4leH64m54mQY6Kpq1XLs9baJz/u
IfqN19yzSIw4TMpwM02SpvO4oUAkomguqO/ADLCvtPDP+/hJea61Ph1AZSGHmfD6
JuvpVn3+99rtNYYPGRSAM7w6tuIvODN+d/DMPM7SM88LWUNTAkDe+3rGTatxPmkO
wiqaqDbEns0ex1pX3Pn3
=KvsL
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--

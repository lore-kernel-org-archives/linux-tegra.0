From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 15/16] i2c: i2c-tegra: Drop class based scanning to
 improve bootup time
Date: Thu, 10 Jul 2014 15:43:30 +0200
Message-ID: <20140710134329.GB14961@ulmo>
References: <1404992799-3705-1-git-send-email-wsa@the-dreams.de>
 <1404992799-3705-16-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404992799-3705-16-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 01:46:35PM +0200, Wolfram Sang wrote:
> This driver has been flagged to drop class based instantiation. The remov=
al
> improves boot-up time and is unneeded for embedded controllers. Users hav=
e been
> warned to switch for some time now, so we can actually do the removal. Ke=
ep the
> DEPRECATED flag, so the core can inform users that the behaviour finally
> changed now. After another transition period, this flag can go, too.
>=20
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It looks as though this currently doesn't do anything on !X86 anyway and
I'll trust Mikko's testing, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTvpiBAAoJEN0jrNd/PrOhDb8P/2DQMSn8ZMMHOcqMf1h8sv7S
Ymo+qUhJoood5RKsgXWriAJBs9A5wOS+Kl9+JN/FDMFCs8gGCEb9/ur+QYY5ySps
TR1+RO6rE19IdXzZZpVaL58H5H/oTC9BcadRni3Rd3ZAivOeE4ikW+4VIAX4CpPi
WA0DVIWLhiCqUQEg8CyrGmBaZGbHf2BDuNuvz19HOjrL/R0DeBEnXwk91rjLHpi8
IqeqZQLoAwnF1+RAnbflZeSXFUVtKxb8tf45la2E3scXOax+nAcaJvBKERYj4wWh
3QYTwKKNqHrVFbCUMmi/CTbtFPoYI2yOZkEo1ygISt1Grc5g+c9EsKTVo02+dVWF
uuIQtnY7ao4UROHg2rhUDt0Z5iYvvk6NWkdL3iBDelT+rZn75RrJVC0xOZ6a9et4
K3DiOUaqckBqCCcmuCOMnloZJ7N7H60jukTNP1Uw2oaEoqs/IQU7KEM55818qJsH
0lEhxVW/2aB5PvxEICl3Lwyeqmu2hgQ5Ef8nLXthsqUxamHyPJXEkOI0bm7MgfaQ
OHfrGs+QHPLWaeWz4nzbdwEliwQpjXAuVyCc6HLqomB9saGmC8VvXFSkx1bYqCL5
ufDvmvagQ8+legtUhHwmg3IJLFkXvmEOWM7yslRDSOtnH7fcrSzmNmwkwYg0i7WB
qae1z5Va6b7NyeL/a/Gh
=jyu0
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Mon, 25 Jun 2012 23:26:46 +0100
Message-ID: <20120625222646.GB30406@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <4FE80413.6070001@nvidia.com>
 <4FE87FE3.1080608@wwwdotorg.org>
 <4FE882A5.3080504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE882A5.3080504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 25, 2012 at 08:54:21PM +0530, Laxman Dewangan wrote:

> I had detailed discussion with Mark on  this support and as per him
> (based on my understanding), the input to different regulator is
> from the pin of the chips and so the name should be the
> <pin-name>-supply which should be part of chip-dt binding, not to
> the particular rail.

More specifically, all the supplies for a device (including those that
happen to be inputs for regulators) should be specified in exactly the
same fashion.  This makes the binding more regular and means that users
can just go through the schematic adding the mappings without worrying
about what what the supply happens to be.

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6OWfAAoJEBus8iNuMP3dqsMP/1Qmifp1T802n90xWMZHNDEd
TqeAQ+DZjMIKd0tUPh5rxM+nobF2jGXZuyHZYRVclvoealYNpyLS4iQqqMbVXfL9
abX1vg4b7hI/sOZAvBINl6Iq5i3F+vm0tDCUHzKMKTBZlYDwrmOwjz5pmG0lHOSf
iW5nUauJmRY339j8b7Wapu5KJL9+zu/HK23CQDDqKX076AcLiiX2c49k7fKI/l/K
FD24pwQQi73jZ7l2xjRozySG7p9khaEPom9XjA0KBQPW5YdcVVYLRf55dilCTfi/
EFtlyROtru6jHjYevy9tjbXrpF1ykWAnpQKSxcfZ7klQLr4H4i6hxbnpLiDn61R5
e5O1zbj/aDv9sAoDB4bL5jIp11iyHY5KOM+tCPODFHjO7UoD+qChNis0ngpv/l1x
UCJOfN6zZlFDgA+yTqpT35k/RGfCPJ0PQLer/SaaJOC5tZCFEWlbyCxLmBV9uGzm
LtonBYHWAC4dkGHYkPbrmVpohLPl1shnYKphNqzzkmzjGUzogXu3Gowao8llcDtJ
DHpUYhDbZ/YHxMml4Hc3I++DtIZEReEcIKU8JZLoEbvCADO5m6MZcWKEpglnKFgm
ujkCgn6GhrOAY6mHh/eVlH4rlibqPCPtArDKiTtONK40WWwgafVEVwJrwVrizRCO
xg+W06WywDps/sXMm8w/
=ahtt
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--

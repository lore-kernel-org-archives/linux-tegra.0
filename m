From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator
 tps65911
Date: Fri, 1 Jun 2012 22:04:52 +0100
Message-ID: <20120601210451.GC4258@opensource.wolfsonmicro.com>
References: <1337691917-15040-2-git-send-email-ldewangan@nvidia.com>
 <4FBBC192.7030900@wwwdotorg.org>
 <4FBBC830.2060802@nvidia.com>
 <4FBBCA8F.3050903@wwwdotorg.org>
 <4FBBD33C.8020802@nvidia.com>
 <4FBBDA97.6000006@wwwdotorg.org>
 <4FBBDE06.5080806@nvidia.com>
 <4FC916AC.4060804@wwwdotorg.org>
 <20120601204052.GB4258@opensource.wolfsonmicro.com>
 <4FC92990.5030104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FC92990.5030104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2012 at 02:44:00PM -0600, Stephen Warren wrote:

> Could you expand on "named property" a bit; I'm not quite sure what
> you're getting at - literally a property with name "named" (which
> would be the same as regulator-id under just a different property
> name), or ...?

Just a property where we only care about a name (ie, that the property
is present).

> > Can't we use the right hand side of this?  It appears to just be=20
> > syntactic sugar without any current meaning.

> The stuff to the right of @ is the "unit address" and must match the
> value in the reg property. Using that was the first proposal I had
> above (which I also didn't like as much)

The stuff to the left of the @ is just noise right now, though - it has
no meaning currently.  It's filled in with "regulator" because we need
to put something there AFAICT.

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPySs/AAoJEBus8iNuMP3d0OkP/iMAQxJP2aR01QVDgGwuktjY
Taj7yhRRQ9MQs470xhcpDEMrdGSOUoDETf8JfmIYZCLB5a9mau+l4TztBE37+hcW
kPICVR6YaO6wXYrGG1zS41Y/ONfXABIwthp3l7KnCtqEz2l1O5nFneAySD2aNO0D
yE9UncChrSgukf3pUfl/r0w6LcQsPP7+ABhcxwR0QlYifYkoMqgUg5cRIhgBDort
/rhCOPZuQ0aFV9VLnwSbuWdrpU35WrDrgS8PbdKC2K4JaJxiwxJlx4/HIvMDEq9b
1jmLQ7ltTcWDfG5pCRuJWBFOsAfX+csoT4lyC2W2S7OSkTAn95oQNoo0a2z5cxC0
v6uztqnK3YjjJj45wgKyIiKYfEcPdbGjOS492fpMjrDbCdLKad54y6FkvPryNLpy
+AZbEoQPX1dhf9EWzWDJDToMauh/epLmNrN1bET8qbAU6McwUOh0kXgkizdyKNYs
0pzZor094gzTAU5CsbBdUfUub+UW5VkNkzmzbiFjyzFp+GaxsbEvKShVHRvmrGXv
HX6Hnj++HVBmSHbrtFuboVx71oHv2rYHFKSbvMZ1/6MU5xyLCcZ/yjt3j1y1Un5d
sZNAmbzhX0pVXlOkV/o7qTfvQYPJ3gN77hlfwoD7Aht2l88yDKQ6hjoXA3cpnHAJ
tINZI5SwNZMUI6mNXjS9
=1eLH
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

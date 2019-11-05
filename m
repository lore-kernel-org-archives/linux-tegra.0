From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Date: Tue, 5 Nov 2019 13:24:24 +0000
Message-ID: <20191105132424.GC4500@sirena.co.uk>
References: <20191105125943.34729-1-broonie@kernel.org>
 <20191105131511.GA1609273@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865554082=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191105131511.GA1609273@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0865554082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2019 at 02:15:11PM +0100, Thierry Reding wrote:

> It is in fact optional in this case. This code remains solely for
> backwards compatibility with old DTBs because back at the time the VDD
> supply was associated with the DPAUX block where it should've really
> been associated with the eDP panel.

That should really have some documentation, and in any case would be
better implemented by using the supply_alias feature to remap the supply
to the panel device so that we're using the same code path when actually
managing the regulator either way.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3BeAcACgkQJNaLcl1U
h9DFjwf/RAQXnf6UefNspZqwTvn7CnHYgUtYc+g2j5Kqjfn3g/FDBqWQD13gmWHF
9+AfIWIUlHoWBrvfui7ntXOuaCTGh9s2Y4l1eGvdDob6DivSG8r10hm/jdBmcQTJ
RKfsnDp2+av42ywyLzRQe8rKAv2a/gtLTASRW9jZvkGoXgt58GGQAkjA5KZ/JvRx
wbZxOotjlzahabP8crRinylwFaPrDwlymRWGawY4BlemKyAD1FVpn6KRhvIgtLyd
OFezRot1Z8W2pLZpkC1MfcJlp8Zx0LJvxeUW098KPnqDi4a/TR4IcrEVSVw+uUqM
+HuQhTMXG8LfrVgi+hwGu8fldMXadQ==
=qReC
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

--===============0865554082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0865554082==--

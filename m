From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Fri, 15 Jul 2016 18:18:03 +0200
Message-ID: <4a4d7fd4-7514-c5cb-435b-af34159fc1c4@ramses-pyramidenbau.de>
References: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160714220218.GB4205@mithrandir.ba.sec>
 <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7@ramses-pyramidenbau.de>
 <578908CB.7040802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="flkhN25l8BWcipKte7fGxLOeCMTFBMxOC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <578908CB.7040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--flkhN25l8BWcipKte7fGxLOeCMTFBMxOC
Content-Type: multipart/mixed; boundary="KSQkqfSxWvXGVsjBm6g6LDsdInQlBfjVV"
From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>,
 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <4a4d7fd4-7514-c5cb-435b-af34159fc1c4-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
References: <1468514937-23250-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <20160714220218.GB4205-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
 <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <578908CB.7040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
In-Reply-To: <578908CB.7040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

--KSQkqfSxWvXGVsjBm6g6LDsdInQlBfjVV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/15/2016 06:01 PM, Stephen Warren wrote:
> On 07/15/2016 03:37 AM, Ralf Ramsauer wrote:
>> On 07/15/2016 12:02 AM, Thierry Reding wrote:
>>> On Thu, Jul 14, 2016 at 06:48:57PM +0200, Ralf Ramsauer wrote:
>>>> c90bb7b enabled the high speed UARTs of the Jetson TK1. The address
>>>> specification inside the dts is wrong. Fix it and use the correct
>>>> address.
>>>>
>>>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1
>>>> device tree")
>>>> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
>>>> ---
>>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> These addresses are correct. The 0, prefix was dropped from the unit
>>> address in commit b5896f67ab3c ("ARM: tegra: Remove commas from unit
>>> addresses on Tegra124").
>>>
>>> What's the problem that you're seeing? What's not working for you?
>>
>> I cannot find b5896f67ab3c neither in swarren's tree nor in linux
>> upstream. But there's d0bc5aaf890 in swarren's linux-tegra tree that
>> matches your described changes and was committed on 1st of July. But
>> this patch is not upstream yet, while the other patch is.
>=20
> The fix is in linux-next, and will be in mainline soon I expect.
Ah okay, but I still wonder how my original patch got changed on its
way... The original version on the mailinglist was not buggy.
>=20
> My github linux-tegra.git isn't relevant since it's just my own persona=
l
> dev branch, but for reference, the commit is there since it's based on
> linux-next.
>=20
>> Have a look at mainline tegra124-jetson-tk1.dts, there the addresses a=
re
>> erroneous as they still use the 0, annotation. And I just realised, th=
at
>> somehow, upstream patch c90bb7b slightly differs from my initial patch=

>> [1] on the mailing list.
>=20
> Your patch should probably be CC: stable so that existing kernel
> versions get fixed. That said, I'd argue that since the original patch
> never actually had any effect since it applied to the wrong node, the
> best fix for stable kernels is simply to revert it rather than fixing
> it, to avoid the potential for behaviour changes and regressions.
> Starting with kernel 4.8 (I think), that patch will begin to have actua=
l
> effect.
There is no current existing stable kernel that is affected, as it went
in during the last merge window in 4.6-rc1. So no need for fixing
stable. Maybe it's still possible to fix it as the stabilisation window
is still open and 4.7 is not released yet?

  Ralf
--=20
Ralf Ramsauer
PGP: 0x8F10049B


--KSQkqfSxWvXGVsjBm6g6LDsdInQlBfjVV--

--flkhN25l8BWcipKte7fGxLOeCMTFBMxOC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiQy/AAoJEPovtFKPEASbdNkP/i/W2JrwHpIFmLZ1UimWlu4B
SZDUtSAEOPHJkpkirhCFX1rDpp1QnIsKV9R8JnypB6RD7kvk8RwSeMI8Yyy6B7Xs
hDHmuTt3FlQMWxke2tbvqqkjgx4X9hu7nWMugryOg/DfZj/mVk9RdfQvEdTECmVt
xBLkcaOJeX0wa4St7L5k+lawtq/Gsus95/P2ZXIso5HWzaLtAkDFlCa7XJ+0eEZ9
+nikivoOf/Bqcvn7wPuxDODifG/y89Vpre9zxmxxGOfsnK8OHcEqMqzDUeTCqbSb
Yvf/IhqYOmvNGurlw7mRnVWZX7zH0ko2RhNuYZQPy7ub+rt5sZ7BoYaCm2/cVkKe
VLPaNOE28NrixfQfcODPJqNzLDw6zDbylYxvRZaEjxyfiA6UG6CC1MAi9jdFb+Kz
RjUjSPlGJ23wg9NdLl5iwF4yKj2+ho9s3MBlNwC1II39fE0nI6noarbf0B6CBj6K
Fp7Dhaly3Mg+s7UW/UK5yB4D0JQs+yRUAYB5luQp7RF5hzOnMKufXBj5hvg2hF0d
OK+4LH/dpJtwkBFWb0fwUyyMhRCb05AyEHBqjF2a7f85BxVcNljkK1wyUV4+qoxQ
/CrqZVLj+i/tgYKXsDIHD9s0HQ5VSznL/9TAUsSZNTEiBm7GhDkVEB3Z7zB5XDe7
RxVwKcmSpfHvJ/yE6t2z
=ifJB
-----END PGP SIGNATURE-----

--flkhN25l8BWcipKte7fGxLOeCMTFBMxOC--

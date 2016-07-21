From: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Thu, 21 Jul 2016 14:37:33 +0200
Message-ID: <dc0fb8f4-35cc-11bd-adcc-dce7f9bfee20@ramses-pyramidenbau.de>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160718095802.GA422@ulmo.ba.sec> <6423681.52qkIkgFBQ@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0miabONaNdoV2OUFP4PxWhdMwNSKR3nu7"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6423681.52qkIkgFBQ@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: arm@kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0miabONaNdoV2OUFP4PxWhdMwNSKR3nu7
Content-Type: multipart/mixed; boundary="FVUE1HUn4s8tWKe6HlngjiLrsbev7OjVU"
From: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: arm@kernel.org, Stephen Warren <swarren@wwwdotorg.org>,
 Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Message-ID: <dc0fb8f4-35cc-11bd-adcc-dce7f9bfee20@ramses-pyramidenbau.de>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160718095802.GA422@ulmo.ba.sec> <6423681.52qkIkgFBQ@wuerfel>
In-Reply-To: <6423681.52qkIkgFBQ@wuerfel>

--FVUE1HUn4s8tWKe6HlngjiLrsbev7OjVU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 07/21/2016 02:28 PM, Arnd Bergmann wrote:
> On Monday, July 18, 2016 11:58:02 AM CEST Thierry Reding wrote:
>> On Mon, Jul 18, 2016 at 11:46:48AM +0200, Ralf Ramsauer wrote:
>>> c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merg=
e
>>> quirk, wrong addresses were introduced. Fix it and use the correct
>>> addresses.
>>>
>>> Thierry let me know, that there is another patch (b5896f67ab3c in
>>> linux-next) in preparation which removes all the '0,' prefixes of uni=
t
>>> addresses on Tegra124 and is planned to go upstream in 4.8, so
>>> this patch will get reverted then.
>>>
>>> But for the moment, this patch is necessary to fix current misbehavio=
ur.
>>>
>>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 de=
vice tree")
>>> Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
>>> Acked-by: Thierry Reding <thierry.reding@gmail.com>
>>> Cc: linux-tegra@vger.kernel.org
>>> ---
>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> ARM-SoC maintainers,
>>
>> Just to clarify, this is targetted at v4.7 because the offending patch=

>> was merged in v4.7-rc1. If at all possible it'd be great to get this i=
n,
>> even if this is terribly last minute.
>>
>=20
Arnd,
> I've applied it to the fixes branch, but as Linus is currently offline
> and hasn't pulled the previous set of fixes, I suspect it's not
> going to make it.
thank you very much. If it's not merged in 4.7 then I'll follow up with
a revert patch with stable in Cc.

  Ralf
>=20
> Olof, do you think we should send an amended pull request, or are
> we at the point where nothing gets pulled anyway?
>=20
> 	Arnd
>=20

--=20
Ralf Ramsauer
PGP: 0x8F10049B


--FVUE1HUn4s8tWKe6HlngjiLrsbev7OjVU--

--0miabONaNdoV2OUFP4PxWhdMwNSKR3nu7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXkMISAAoJEPovtFKPEASbNNsQAIeI7+n3IOt/RXQruq6FJ1bg
gqSGBMoq+MDmJvLW8wkTpyHv2/zwcaqUIzVeZb92J+JlT4hYm8EN2J8cZC6EvPc7
2MhDDuc0xk08fteYQ5JY49fZ8CWLYxtyhO64KZLNgv+lFUhdrQG6WI1XPFkk8FSo
Omo3BI6OkivZUnp1OpfsFEeWgZW1vA+9JxbuTnm+FVN8k2fAuXU7fp4RynwRCkMu
wIBZqm1qah+tWHh2y/QjqsLAT33LE7PSzu84pebZGR/KM+OH1olmAa0CDsUlVRcE
Q/moBOB3wxnsrbHHC0YhEDEKeT7oFk6rmCJi6e3wPZuXthltItgblXlP7mHOvs2R
HL/3h/EKtNP9XZEOehC9pEW/YSmusaYyuWEE6R5hGzPY6zvLdgedEw4cvuKaD7pl
1cWfEvjaUkWNDj4ZxkxauPQR9xbKaZyO8f536iIpVpOU0EeybeGyVgvRAyK32bTN
4qYCsS1hkZ3a/4yv65KcQXlo6DlNpxRqo6QGWhN4zQghvTE+oBclQN91h92df4Qq
GuzNMSI7ip6FCLzVy4KAv1nTch6CHK7xh00gMTMawuPj7CFB6H1IjqbxEN2Xb57Z
jQw0knj2+a6j0a2gmvnZOnJi8DcjOivYkwjXT+OQowEb8Xq+HpZQsvVulghs8MIa
sx10m/2N4dCeDHPWG73r
=qE70
-----END PGP SIGNATURE-----

--0miabONaNdoV2OUFP4PxWhdMwNSKR3nu7--

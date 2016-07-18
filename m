From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Mon, 18 Jul 2016 11:25:33 +0200
Message-ID: <64837117-32d6-1f1d-a370-3f20d4368b7b@ramses-pyramidenbau.de>
References: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160714220218.GB4205@mithrandir.ba.sec>
 <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7@ramses-pyramidenbau.de>
 <578908CB.7040802@wwwdotorg.org>
 <4a4d7fd4-7514-c5cb-435b-af34159fc1c4@ramses-pyramidenbau.de>
 <20160718060129.GA10785@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J7Og2EsxjV137cSjLswJBIr6MOK8IaCcO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160718060129.GA10785-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J7Og2EsxjV137cSjLswJBIr6MOK8IaCcO
Content-Type: multipart/mixed; boundary="ittD9STcT7OgjKaOKl0Ts5IrPJwmEG1tj"
From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>,
 Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <64837117-32d6-1f1d-a370-3f20d4368b7b-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
References: <1468514937-23250-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <20160714220218.GB4205-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
 <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <578908CB.7040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
 <4a4d7fd4-7514-c5cb-435b-af34159fc1c4-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <20160718060129.GA10785-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
In-Reply-To: <20160718060129.GA10785-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>

--ittD9STcT7OgjKaOKl0Ts5IrPJwmEG1tj
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 07/18/2016 08:01 AM, Thierry Reding wrote:
> On Fri, Jul 15, 2016 at 06:18:03PM +0200, Ralf Ramsauer wrote:
>> On 07/15/2016 06:01 PM, Stephen Warren wrote:
>>> On 07/15/2016 03:37 AM, Ralf Ramsauer wrote:
>>>> On 07/15/2016 12:02 AM, Thierry Reding wrote:
>>>>> On Thu, Jul 14, 2016 at 06:48:57PM +0200, Ralf Ramsauer wrote:
>>>>>> c90bb7b enabled the high speed UARTs of the Jetson TK1. The addres=
s
>>>>>> specification inside the dts is wrong. Fix it and use the correct
>>>>>> address.
>>>>>>
>>>>>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1=

>>>>>> device tree")
>>>>>> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
>>>>>> ---
>>>>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> These addresses are correct. The 0, prefix was dropped from the uni=
t
>>>>> address in commit b5896f67ab3c ("ARM: tegra: Remove commas from uni=
t
>>>>> addresses on Tegra124").
>>>>>
>>>>> What's the problem that you're seeing? What's not working for you?
>>>>
>>>> I cannot find b5896f67ab3c neither in swarren's tree nor in linux
>>>> upstream. But there's d0bc5aaf890 in swarren's linux-tegra tree that=

>>>> matches your described changes and was committed on 1st of July. But=

>>>> this patch is not upstream yet, while the other patch is.
>>>
>>> The fix is in linux-next, and will be in mainline soon I expect.
>> Ah okay, but I still wonder how my original patch got changed on its
>> way... The original version on the mailinglist was not buggy.
>=20
> It's most likely my fault. My recollection is that we used to have an
> earlier patch that removed all 0, prefixes from unit addresses and what=

> happens is probably that I applied your patch on top, adjusted it to
> omit the 0, prefix and then we noticed that removing the 0, prefix does=

> not work for the GPU (because U-Boot looks it up by node name to enable=

> it), so the patch that removes the 0, prefix was dropped and I forgot
> to adjust your patch to compensate.
Ok, i see.
>=20
>>> My github linux-tegra.git isn't relevant since it's just my own perso=
nal
>>> dev branch, but for reference, the commit is there since it's based o=
n
>>> linux-next.
>>>
>>>> Have a look at mainline tegra124-jetson-tk1.dts, there the addresses=
 are
>>>> erroneous as they still use the 0, annotation. And I just realised, =
that
>>>> somehow, upstream patch c90bb7b slightly differs from my initial pat=
ch
>>>> [1] on the mailing list.
>>>
>>> Your patch should probably be CC: stable so that existing kernel
>>> versions get fixed. That said, I'd argue that since the original patc=
h
>>> never actually had any effect since it applied to the wrong node, the=

>>> best fix for stable kernels is simply to revert it rather than fixing=

>>> it, to avoid the potential for behaviour changes and regressions.
>>> Starting with kernel 4.8 (I think), that patch will begin to have act=
ual
>>> effect.
>> There is no current existing stable kernel that is affected, as it wen=
t
>> in during the last merge window in 4.6-rc1. So no need for fixing
>> stable. Maybe it's still possible to fix it as the stabilisation windo=
w
>> is still open and 4.7 is not released yet?
>=20
> Unfortunately a patch to remove the 0, prefix from all nodes except the=

> GPU was now merged into the arm-soc tree, which means that if we try to=

> get this into v4.7, then we'll have to make sure to patch up the unit
> address again for v4.8.
>=20
> I have no objections to doing that, so feel free to add my Acked-by and=

> resend this to arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org When you do, please keep linux-tegra in
> Cc so that we can track it, and maybe mention that you want this to go
> into v4.7 and how this came about to be, so that the arm-soc maintainer=
s
> won't be surprised when the patch to revert this shows up in a couple o=
f
> days for v4.8.
Alright, I'll prepare it and add a RESEND as well as your Acked-by.
Thank you.
>=20
> Can you take care of sending out the second patch as well? Probably bes=
t
> to send it the same way as this, with a mention that it's targetted at
> v4.8 and a revert of this one.
Yep, I'll take care of it. I'm tracking this patch since January in any
case :-)

  Ralf
>=20
> Thanks,
> Thierry
>=20

--=20
Ralf Ramsauer
PGP: 0x8F10049B


--ittD9STcT7OgjKaOKl0Ts5IrPJwmEG1tj--

--J7Og2EsxjV137cSjLswJBIr6MOK8IaCcO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXjKCQAAoJEPovtFKPEASbY5cP/RK7OSpMiCQmp8iw72e3bEjR
TsQpBDHQxgn6fuj/oLD6+kuqC2gRykaHuPh6dKeRjOJRZtQLMQO7AxDQn34Zmjrg
YVPOsrFrIW/qI1k6uXzIvEeh1aZjQpWC47CX+zcRVO9FwsfFhiY0ibjULttbjJw+
JetrPFYRnEb4kXH6Po117RbKRDwIAXJMqrDOBUbqFmHYfJuMQZ0FcsRpSiFS8ouw
hefmhKG0mKmUB4Z4js/ujADhf2cVe3YUhA3dUy2zMMyohoQYm2LWe8SI3O1sAdwh
78KGJ6AGrNq+EctC70Nn+WKXeZA9ct0NDdeytCxUC5JIE396aTH56alMguKgYHDU
y9xfWe3Ax/8B60Tc0Prf7yxbZPV1rZz3vE27aArhumypGBpRFPEtyhSzzbFis8qa
cP+sibDHao6CVPR2CDNMiv4OLlgZc6EjFzI7J4/p4sMuRJzrGeXONZ+AKuhnJh/E
SreL0aBTgm2v2zDBM4dtUIHA21f1zZSoeRmOJ9kMOboHqnV3iTP1f5maS1jleu3n
21a+V2o4GPtgt1xRPBQxTF3ZuZA92DIXcHfJK+XMRbFtaKP1j2tbdRoS+fTYABS9
gKTto1T6+XTR3zXuV6/guUpDXNlTbHbsmMeliK3s75s/vfBY4xy4A/J9WxdILa6Q
pjJHVs4QgF+V8Q9NGnHx
=u2pH
-----END PGP SIGNATURE-----

--J7Og2EsxjV137cSjLswJBIr6MOK8IaCcO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

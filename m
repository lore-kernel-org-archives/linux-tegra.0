From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Fri, 15 Jul 2016 11:37:30 +0200
Message-ID: <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7@ramses-pyramidenbau.de>
References: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160714220218.GB4205@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eePsHBHt3tWownKvTdhXCrscJnk5MlnKN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160714220218.GB4205-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eePsHBHt3tWownKvTdhXCrscJnk5MlnKN
Content-Type: multipart/mixed; boundary="mxlXKMc93qqdwB06cT6Tv0KBIqkrsVH09"
From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>,
 Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Message-ID: <8a8ccb29-ba73-f29f-2b57-5c1d91e13bf7-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
References: <1468514937-23250-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
 <20160714220218.GB4205-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>
In-Reply-To: <20160714220218.GB4205-+E7KM1FDEuO2P7RxrfNFTMXXUOn6P5/W@public.gmane.org>

--mxlXKMc93qqdwB06cT6Tv0KBIqkrsVH09
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/15/2016 12:02 AM, Thierry Reding wrote:
> On Thu, Jul 14, 2016 at 06:48:57PM +0200, Ralf Ramsauer wrote:
>> c90bb7b enabled the high speed UARTs of the Jetson TK1. The address
>> specification inside the dts is wrong. Fix it and use the correct
>> address.
>>
>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 dev=
ice tree")
>> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> These addresses are correct. The 0, prefix was dropped from the unit
> address in commit b5896f67ab3c ("ARM: tegra: Remove commas from unit
> addresses on Tegra124").
>=20
> What's the problem that you're seeing? What's not working for you?
I cannot find b5896f67ab3c neither in swarren's tree nor in linux
upstream. But there's d0bc5aaf890 in swarren's linux-tegra tree that
matches your described changes and was committed on 1st of July. But
this patch is not upstream yet, while the other patch is.

Have a look at mainline tegra124-jetson-tk1.dts, there the addresses are
erroneous as they still use the 0, annotation. And I just realised, that
somehow, upstream patch c90bb7b slightly differs from my initial patch
[1] on the mailing list.

  Ralf

[1] http://permalink.gmane.org/gmane.linux.ports.tegra/24779
>=20
> Thierry
>=20

--=20
Ralf Ramsauer
PGP: 0x8F10049B


--mxlXKMc93qqdwB06cT6Tv0KBIqkrsVH09--

--eePsHBHt3tWownKvTdhXCrscJnk5MlnKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiK7fAAoJEPovtFKPEASbn2UP/1hA5FDoOgFMqOAzr1fTlD6a
aHGTt4FJIinlzTkaCN2BysXZqYNC8ivimBw2X5lxtbCHF+JQKO9Bye1w8wyU6dy3
dXaL0mknh/5TyBHlpGUJrKMTuwqp8yfn5mf+5LFBgiWeXxySbZnLybI9dJ2Fg21t
MA8vEqwHJ37eZXWkIal0O8dLbF3DaQfWtC0TVeVWoL6IeVZmVRe8V9HnYEyySJH3
4zjYiamJW9OcF5gz+QZcsQJNs8jwMwCYUdYp2OrZNFvcX3AImjPdd1tksZbyBZCO
9zR7JhjGmF26/kYh85+T2L2WCrhEygsFsv25t6k+LtaqDhsFipPMjMfgDCR5YMW+
vCJAMGElBghCSHZIsRZQxf9geQ/1QIzwosvfjdR++W7Bfa9QEIlfjjfOWO+Wva6m
R4Iw9h4cwf5uRh9SOtK38L9zs+76Cp5QxpmKw+iYUECagTF+nz28sl4ckpzOl8Us
u/ZnZR2W7LvL8YkbY9caKXirTS7JxvpTS3IHUN+QnRkjrphchP61b4hllBq9wjC1
vwo27zVQjWJgUEwecLnaDP0dR5OanaogPXMDr5b5r5DOOp0/woe4o7P74Fww5Ygr
ilnXhxa3fmJcamQWbQTQIpha3EGyIsSIS28VPUUP4j6agl8a7jC3XPBUobXttxnv
dLNIyQhXaMDiJNf3QeUd
=N7R0
-----END PGP SIGNATURE-----

--eePsHBHt3tWownKvTdhXCrscJnk5MlnKN--

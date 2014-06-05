From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] of: Add NVIDIA Tegra XUSB pad controller binding
Date: Thu, 05 Jun 2014 16:57:11 -0600
Message-ID: <5390F5C7.5070301@wwwdotorg.org>
References: <1401894990-30092-1-git-send-email-thierry.reding@gmail.com> <1401894990-30092-2-git-send-email-thierry.reding@gmail.com> <53909F31.4050603@wwwdotorg.org> <20140605220833.GA28817@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Pkt1FkuIKMqMg0rRt6J2mfxrRb13DSu3c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140605220833.GA28817@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Pkt1FkuIKMqMg0rRt6J2mfxrRb13DSu3c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/05/2014 04:08 PM, Thierry Reding wrote:
> On Thu, Jun 05, 2014 at 10:47:45AM -0600, Stephen Warren wrote:
>> On 06/04/2014 09:16 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> This patch adds the device tree binding documentation for the XUSB pa=
d
>>> controller found on NVIDIA Tegra SoCs. It exposes both pinmuxing and =
PHY
>>> capabilities.
>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra12=
4-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a124-xusb-padctl.txt
>>
>>> +- #phy-cells: Should be 1. The specifier is the index of the PHY to =
reference.
>>> +  Possible values are:
>>> +  - 0: PCIe
>>> +  - 1: SATA
>>
>> Those values are defined in
>> include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h. I personally conside=
r
>> the <dt-bindings/> header files to be part of the binding itself, rath=
er
>> than being derived from the binding. As such, I'd suggest the followin=
g
>> changes:
>>
>> * Make this patch 1 not patch 2
>> * Move pinctrl-tegra-xusb.h into this patch.
>> * Remove the list of values above, and replace it with the text "See
>> <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the set of valid values=
".
>=20
> I remember discussions where people explicitly said that relying on the=

> symbolic names in the DT bindings was a mistake because it would mean
> that everyone would need to have access to a mechanism similar to what
> we have in the Linux kernel (and that the header files would always nee=
d
> to be shipped with the DT bindings).

The entire point of the headers is so that the binding definitions and
code using them can't get out of sync. In my opinion, the headers *are*
part of the bindings, so of course anyone either reading DT bindings, or
parsing DT, must have the headers, and hence the headers must be bundled
with the DT files or with the bindings wherever they go.


--Pkt1FkuIKMqMg0rRt6J2mfxrRb13DSu3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTkPXHAAoJEJuNpwkmVCGczZgP/1UMgpmOSc+Wc4lu7V2FBINe
chgGWejm/sdvWSEQ1vk9Uwf4wcrwy/z1eCW14tLaRxMvwm7ZSRMp29NngXUaegb4
AVfTih6pH2/FYmvduAFmCEFFDGgFa8s3CkWis5qxg/J1NbhmojjVU6Na3tE2ueO1
fCHHWRzTkaNu9PL+jUlb2Zn9swKSgYlGFE74XJkYXXvK49W7S9Tjq8VS7/gAJ3AZ
4U0JQoo7tUtTlQQ9Sd9nvsw5JsEaK5Nhsb7wTwzB9wlOkAl+9yXzo1ChaY7F/E//
/pJrCpSxdGGHefHM0OygWLWGokTNP2hh1JBOj2Sfn/Dk+qEQtR6YfJTu0uu3b31m
0WHZ/3LyGMzX2a96N05xSaE/vo+1ysz65FkwaicnBBFOZXjhfikWiqomOEgTbG9G
7J/OBf8UZPm63Nt4oD0I72rrGoeuzi5ohkTWGCdFJ3Rdqdn2HqkfsosqyHOydW52
4gev36hcxgHNjSV0Yxrh5djUjAE55tPHOlv4ZeVHWTvm1b7IuQQ9KyRvYdlxHkZS
Syksxu8SeDv5+qyYew5a4/oxw8W8vQRJ7XFkbzAyx/gFC9+yfrn9iDidNFyTBYRc
MdUKVf1US79VCeBUqtY775EFJ6kJYBGvb7MvY+O2YdTCYPfIdN8su4duD7NZZCOo
f5gOFSnCOrR8/6pJO+N1
=lXuH
-----END PGP SIGNATURE-----

--Pkt1FkuIKMqMg0rRt6J2mfxrRb13DSu3c--

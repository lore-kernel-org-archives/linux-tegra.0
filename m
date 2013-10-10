From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v7 1/5] ARM: add basic support for Trusted Foundations
Date: Thu, 10 Oct 2013 07:18:01 +0200
Message-ID: <52563889.8030703@monstr.eu>
References: <1380904635-18113-1-git-send-email-acourbot@nvidia.com> <1380904635-18113-2-git-send-email-acourbot@nvidia.com> <5253BF8E.4050802@monstr.eu> <CAOesGMjtHBft71nJUEc7K+2UA_LiWBOVWpbYvJDOnF=NLepLLw@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="g2DatHx7rW6Dm2NftIPR77cQH5tc8ShBl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjtHBft71nJUEc7K+2UA_LiWBOVWpbYvJDOnF=NLepLLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g2DatHx7rW6Dm2NftIPR77cQH5tc8ShBl
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10/10/2013 01:45 AM, Olof Johansson wrote:
> On Tue, Oct 8, 2013 at 1:17 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>> Hi,
>>
>> On 10/04/2013 06:37 PM, Alexandre Courbot wrote:
>>> Trusted Foundations is a TrustZone-based secure monitor for ARM that
>>> can be invoked using the same SMC-based API on all supported
>>> platforms. This patch adds initial basic support for Trusted
>>> Foundations using the ARM firmware API. Current features are limited
>>> to the ability to boot secondary processors.
>>>
>>> Note: The API followed by Trusted Foundations does *not* follow the S=
MC
>>> calling conventions. It has nothing to do with PSCI neither and is on=
ly
>>> relevant to devices that use Trusted Foundations (like most Tegra-bas=
ed
>>> retail devices).
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  .../arm/firmware/tl,trusted-foundations.txt        | 17 +++++
>>>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>>>  arch/arm/Kconfig                                   |  2 +
>>>  arch/arm/Makefile                                  |  1 +
>>>  arch/arm/firmware/Kconfig                          | 28 ++++++++
>>>  arch/arm/firmware/Makefile                         |  1 +
>>>  arch/arm/firmware/trusted_foundations.c            | 77 ++++++++++++=
++++++++++
>>>  arch/arm/include/asm/trusted_foundations.h         | 64 ++++++++++++=
++++++
>>>  8 files changed, 191 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/firmware/tl=
,trusted-foundations.txt
>>>  create mode 100644 arch/arm/firmware/Kconfig
>>>  create mode 100644 arch/arm/firmware/Makefile
>>>  create mode 100644 arch/arm/firmware/trusted_foundations.c
>>>  create mode 100644 arch/arm/include/asm/trusted_foundations.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/firmware/tl,truste=
d-foundations.txt b/Documentation/devicetree/bindings/arm/firmware/tl,tru=
sted-foundations.txt
>>> new file mode 100644
>>> index 0000000..3954bbd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/firmware/tl,trusted-found=
ations.txt
>>> @@ -0,0 +1,17 @@
>>> +Trusted Foundations
>>> +
>>> +Boards that use the Trusted Foundations secure monitor can signal it=
s
>>> +presence by declaring a node compatible with "tl,trusted-foundations=
"
>>> +under the root node.
>>> +
>>> +Required properties:
>>> +- compatible : "tl,trusted-foundations"
>>> +- version-major : major version number of Trusted Foundations firmwa=
re
>>> +- version-minor: minor version number of Trusted Foundations firmwar=
e
>>> +
>>> +Example:
>>> +     firmware {
>>> +             compatible =3D "tl,trusted-foundations";
>>> +             version-major =3D <2>;
>>> +             version-minor =3D <8>;
>>> +     };
>>
>> This is just another example how to add sw description to dts.
>> I have briefly looked at tegra20.dtsi and there are IPs like timer, in=
tc, etc
>> which are in the DTS without any bus.
>>
>> Add this firmware node to the root is just +1 case to this mess
>> but IMHO will be good to have specific DT part which will be used for
>> this sw setting which are coming to DTS all the time.
>>
>> Grant, Rob: Where is the proper location for these type of description=
?
>=20
> Usually we've been using the /firmware hierarchy for these kind of thin=
gs.
>=20
> Chrome OS uses /firmware/chromeos for some of the information passing
> from FW to the OS.
>=20
> You might want a separate node under /firmware for this, since this is
> "just" the secure runtime portion of things, there might be need to
> add things for/from the bootloader too.

Is this documented somewhere? I mean that firmware node should be used fo=
r this.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--g2DatHx7rW6Dm2NftIPR77cQH5tc8ShBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlJWOIkACgkQykllyylKDCH2MwCcCezJnLxjbmIdcLbMS2kGzTb1
3kkAoIU+V3v4SQNHRUY/TzMviF46lWYS
=ArXv
-----END PGP SIGNATURE-----

--g2DatHx7rW6Dm2NftIPR77cQH5tc8ShBl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

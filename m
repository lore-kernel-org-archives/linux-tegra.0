From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add PCIe-related pins to the Jetson TK1 pinmux
 tables
Date: Wed, 27 Aug 2014 15:29:19 +0200
Message-ID: <53FDDD2F.20503@suse.de>
References: <1408742308-18004-1-git-send-email-swarren@wwwdotorg.org> <53FB10B8.3010408@suse.de> <53FB160F.6000700@nvidia.com> <53FB27AB.8010608@nvidia.com> <53FD0980.2010803@suse.de> <20140827055247.GC15640@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="2hprvJkwmRwgdGPQWQDFHm5UmswIx2sir"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827055247.GC15640@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2hprvJkwmRwgdGPQWQDFHm5UmswIx2sir
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 27.08.2014 07:52, schrieb Thierry Reding:
> On Wed, Aug 27, 2014 at 12:26:08AM +0200, Andreas F=C3=A4rber wrote:
>> Am 25.08.2014 14:10, schrieb Mikko Perttunen:
>>> On 25/08/14 13:55, Mikko Perttunen wrote:
>>>> On 25/08/14 13:32, Andreas F=C3=A4rber wrote:
>>>>> Am 22.08.2014 23:18, schrieb Stephen Warren:
>>>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>>
>>>>>> This pinmux tables currently omit any configuration for PCIe clk_r=
eq,
>>>>>> wake, and rst pins, which in turn causes intermittent failures in
>>>>>> U-Boot's PCIe support. Import an updated version of the pinmux tab=
les
>>>>>> which rectifies this.
>>>>>>
>>>>>> (While I'm still hoping to remove the pinmux tables from DTs for
>>>>>> Tegra124+ devices, while they're still here, they may as well be
>>>>>> complete and correct).
>>>>>>
>>>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>> ---
>>>>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 35
>>>>>> +++++++++++++++++++++++++++++++
>>>>>>   1 file changed, 35 insertions(+)
>>>>>
>>>>> I've tested this patch on both -rc1 and yesterday's torvalds/linux.=
git
>>>>> with tegra_defconfig: Both with or without this patch I get empty l=
spci
>>>>> output.
>>>>>
>>>>> There doesn't seem to be a tegra/linux.git for-next branch based on=
 -rc1
>>>>> yet - are patches from other subsystem trees needed to get the on-b=
oard
>>>>> Ethernet detected or maybe some config option?
>>>>
>>>> git://gitorious.org/thierryreding/linux.git staging/pci
>>>
>>> .. and apparently the device tree patches are in staging/tegra.
>>
>> Thanks for the URLs. I tested yesterday's staging/master, but booting
>> from SD seemed broked, sdhci-tegra probe kept deferring. Is that a kno=
wn
>> issue?
>=20
> Yes, this is a known issue. The root is that currently there's no way t=
o
> allow deferred probing if an IOMMU hasn't been probed, so a driver need=
s
> to continue without IOMMU support even if the IOMMU would come up later=

> in the boot process. The staging/iommu branch contains a patch to fix i=
t
> but it looks as if that won't be merged.
>=20
> I've since removed the code that registers the Tegra SMMU with the code=

> that I introduced but haven't removed the registry patch yet, which wil=
l
> cause the SMMU never to show up and therefore indefinitely deferring
> probe. You can easily solve this by removing the iommus property from
> the sdhci nodes in DTS or by removing the calls to iommu_attach() and
> iommu_detach() from the SDHCI driver (reverting "mmc: sdhci-tegra: Add
> IOMMU support").
>=20
> I'll see if I can find the time today to fix up the branches.

No hurry! I switched to testing the newly updated for-next branch, which
works fine so far (been using a USB Ethernet adapter).

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--2hprvJkwmRwgdGPQWQDFHm5UmswIx2sir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT/d0vAAoJEPou0S0+fgE/7VsP+QGZgUv1JYm35B52Uw+LRKU1
FL/UCiBqaKXESubWecUJTmhMZl1kHfs4x9GKy92Y3TQNljClulaRP8BYKqyeTD2h
s6F/l5HiQ1dC5HfMGozRPdd6Z4wbq535sfeqybb9OoSmn3a9txCRlnvt90v4HbB7
mVx1TNDnJPjyxPz0XFA1qZGjMud57B+MXMOmHA5pdvqdHxqUL+7DS7+xR1DNW4RA
O5BJwmgy7+r3POxEN53aNt24O/Ng7q6Z0A8yMSGYlbbg72N35dTqpGIH7D7gO6+S
xHemuvWSH5yE+ykb5P1PJfg+3C4NPvnGF9YIYebfFluyc9LGf2sWL7WcpCOSqVj/
PbGl/d0rPdeua7gvE+MvD5rlEq0jVP8z5e1LHMMrFEjlq0iOTjLDeBF6BmUfcwJW
iAYCPFbJbHOi9z5LP5aWbKpGIaXF0fZFtfyAgBtYeZi+VA1THcC86PtFXPqZJ84e
BJIYSqkv+EqgV9xhNCK6CTWh48OvJMaxAqxqehd1K0WF3LqvyzLUlHgNm3fbjCu7
5cF2YNSpry+vlCHSKyo0c1z7DrncDmtqCIn9FM/wH33AA+rTZDGcGRURyhd8zlke
KIXV4VdaEe3hZ0F+7gtovBTEupJcAyK9sBvCZscFyoikH7uh8UyMdLCbX4jTb0D7
gIogAEmkLcecbK6P8n3c
=hvtj
-----END PGP SIGNATURE-----

--2hprvJkwmRwgdGPQWQDFHm5UmswIx2sir--

Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C52C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 22:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E4082067C
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 22:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgHUWut (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 18:50:49 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:34224 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgHUWum (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 18:50:42 -0400
X-Greylist: delayed 581 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Aug 2020 18:50:41 EDT
Received: from [10.129.98.47] (unknown [216.228.117.191])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id E5F5B1C022E;
        Fri, 21 Aug 2020 16:40:58 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at avon.wwwdotorg.org
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Tom Rini <trini@konsulko.com>, Peter Geis <pgwipeout@gmail.com>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
 <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
 <20200821210451.GE20605@bill-the-cat>
 <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
 <20200821213923.GF20605@bill-the-cat>
From:   Stephen Warren <swarren@wwwdotorg.org>
Autocrypt: addr=swarren@wwwdotorg.org; prefer-encrypt=mutual; keydata=
 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 YdVt
Message-ID: <8e3d7a19-ab9a-0611-06c1-a3757400c496@wwwdotorg.org>
Date:   Fri, 21 Aug 2020 16:40:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821213923.GF20605@bill-the-cat>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="sb1p2JcVMAgnXblsiw1LUZwwypGRXDxnh"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sb1p2JcVMAgnXblsiw1LUZwwypGRXDxnh
Content-Type: multipart/mixed; boundary="O6TPJhOUgywFxw6reJESL6FaUveaoXzui"

--O6TPJhOUgywFxw6reJESL6FaUveaoXzui
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 8/21/20 3:39 PM, Tom Rini wrote:
> On Fri, Aug 21, 2020 at 05:30:54PM -0400, Peter Geis wrote:
>> On Fri, Aug 21, 2020 at 5:04 PM Tom Rini <trini@konsulko.com> wrote:
>>>
>>> On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
>>>> On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrot=
e:
>>>>>
>>>>> On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.or=
g> wrote:
>>>>>>
>>>>>> On 7/3/20 6:32 AM, Peter Geis wrote:
>>>>>>> Good Morning,
>>>>>>>
>>>>>>> I am attempting to expand on the work for chainloading U-Boot on =
the
>>>>>>> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device =
from fastboot.
>>>>>>> I have so far been unsuccessful at getting any output from U-Boot=

>>>>>>> through this method.
>>>>>>
>>>>>> I assume that fastboot executes the loaded code on the main CPU no=
t on
>>>>>> the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running=
 on
>>>>>> the AVP though; you would have to disable SPL to make this all wor=
k, and
>>>>>> perhaps fix U-Boot to work without SPL present. I'm not sure what,=
 if
>>>>>> any, changes would be required to support that.
>>>>>>
>>>>>> For background, see:
>>>>>> https://http.download.nvidia.com/tegra-public-appnotes/index.html
>>>>>
>>>>> Apologies for the resend, I realized I didn't reply to the list.
>>>>>
>>>>> I admit I'm still extremely new to U-Boot, but this is the way I
>>>>> understand the boot flow.
>>>>> ROM does extremely low level init, then loads U-boot SPL.
>>>>> U-Boot SPL does basic init, ram, cpu and required peripherals, then=

>>>>> loads U-Boot.bin.
>>>>> U-Boot.bin is U-Boot proper, with the full interface.
>>>>>
>>>>> By loading U-Boot.bin as the nyan instructions indicated, I'm
>>>>> bypassing the SPL code as if it was already complete.
>>>>> The issue I have is I'm not sure what modifications were done to th=
e
>>>>> T124 code to allow nyan to do this.
>>>>> I've compared the nyan configs to the cardhu configs and I don't se=
e
>>>>> anything that sticks out to me.
>>>>> I've also dug through the nyan git log and I don't see anything tha=
t
>>>>> was specifically changed to allow chainloading on T124.
>>>>>
>>>>> I also am unsure of where fastboot is loading the kernel in order t=
o
>>>>> set the text base correctly.
>>>>
>>>> For anyone interested, I succeeded at chainloading u-boot on the Ouy=
a.
>>>
>>> Nice work.
>>>
>>>> The Linux Kernel with low level debugging enabled in the decompresso=
r
>>>> will print the load address.
>>>>
>>>> Jumping to kernel at:4861 ms
>>>>
>>>> C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
>>>> Uncompressing Linux...
>>>>
>>>> So by setting the u-boot text base to 0x80A00000 u-boot now executes=
,
>>>> but it would then immediately silently reboot.
>>>> Turns out I needed to define the console in the device-tree, which
>>>> isn't defined in the u-boot tegra30-cardhu.dts.
>>>> It would then freeze at relocation time, as it was trying to overwri=
te
>>>> the trustzone ram space.
>>>> #define CONFIG_PRAM 2048 solves that issue.
>>>>
>>>> I'd like to know if u-boot can read the reserved-memory device-tree
>>>> node and use it instead of CONFIG_PRAM?
>>>
>>> Honestly, this is what CONFIG_PRAM is for.  We could possibly add
>>> something to get this from device-tree, but we might need to do that
>>> early enough that it becomes a tricky thing to do.
>>
>> Thank you, that makes sense.
>>
>>>
>>>> Otherwise the only issue it seems to have it is does not read the
>>>> nvidia proprietary partition table.
>>>> Is there a way to force u-boot to read the backup gpt table similar =
to
>>>> the android kernel's method?
>>>
>>> Some tangential experiments the other day and I saw that U-Boot would=

>>> read the backup GPT if it's at the expected place.  But that might be=

>>> only after you do something like "part list mmc 0", so there might in=

>>> turn be places that we need to be a bit more robust in our checking.
>>
>> Unfortunately running <part list mmc 0> returns "## Unknown partition
>> table type 0"
>>
>> This is the result of the gpt guid command:
>> Tegra30 (Ouya) # gpt guid mmc 0
>> GUID Partition Table Header signature is wrong: 0x1000 !=3D 0x54524150=
20494645
>> find_valid_gpt: *** ERROR: Invalid GPT ***
>> find_valid_gpt: ***        Using Backup GPT ***
>> 00000000-0000-0000-0000-000000000000
>> success!

That message makes it appear as if it did find the backup GPT? But
presumably it didn't actually do so, since an all-zeroes UUID isn't
likely correct.

Does this device even have any GPT? IIRC some of the earlier Tegra
systems *only* had a TegraPT, and not any valid GPT. Perhaps that we
Tegra20 or earlier, and we'd fixed that by Tegra30? Or perhaps this
issue only applied to the eMMC boot HW partitions/region, not the main
data region.

>> The backup GPT is a valid GPT, and linux will pull the partition table=

>> from it if forced to look there.
>> The android kernel handled this by adding "gpt gpt_sector=3D15073279" =
to
>> the command line.
>=20
> Ah, interesting.  And where is that sector in relation to where the
> backup should be?  I'm not sure off-hand how easy it would be to make
> backup location easy to run-time configure, but if it's lba - 2 instead=

> of lba - 1 or something, we could add a build-time "also check.." thing=
,
> if it's a consistent offset, and probably is.  Similarly, we could add
> something kinda ugly to allow overriding GPT_PRIMARY_PARTITION_TABLE_LB=
A
> with where that is instead.
>=20
> Other-otherwise, I know there's patches in progress to support "tegra
> partition table" for Linux and doing that for U-Boot could be handy and=

> fix this problem as well?
>=20



--O6TPJhOUgywFxw6reJESL6FaUveaoXzui--

--sb1p2JcVMAgnXblsiw1LUZwwypGRXDxnh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE5nev2dzN5qWYjKsOm42nCSZUIZwFAl9ATXgACgkQm42nCSZU
IZxumhAAh1fV84hVyIfl7jYXv7lZzqJrO90OQ/HzFCnrwJUqlYc7cgVUKPVNBo5/
JUYMBwA9uCGLWeuKcgbYMcs5jp0A7PcRscmCkki4aGmp5APuZC4QUvPMIXolyaqW
rICagCpT3z64o+ZdD4Q9vY1p1tpNk3Z58heVTPtHytUHC4WgyXl1BOikVjjqIMJO
qdNXI1zpJkotJAIizSFx0vLR9Sbqa+aWRpKdTfBZQIOYP7eux+oiOlwRcw/pd48v
h2ODEfrjSh97SvfvPmaLztl+Yu1C/4HrBAzfLTM69PB1nx48NaOBIIZ9NJTtObgi
eJt0QZFTSk7GYBIWi2nfev2UWmJSRkBDfbpeFsA+uDL3vzvV4oVN/bqhMfr61iNL
miT6jOOAwC8RwFRaS37SRPvhiKlcaeJibQxO+jC1MDPKr3oD9QIVzrWrNV/c1QMv
xlvsmqoclNPJgzyEPXrBhfgD8ZSuUdA5keYh5xvuLsM9BJibCFpqxsiyPJzepd9n
/rl3DVWP5Nb+GBCc/aZLJQY2W4SU4LFR1yrIzAZBBXPT0jTLARdhgXWeuR3l6VsH
WZXBk/YhDUoxFqFH8Oc7j76XT2V6IWuXEXshBlMDn5hZL6a/3GlpqKVnwVRZaZR8
mRCyac37sWXRCnUjlBGPknMAJ8jou7MLSsbTehjDhore2VI6B0o=
=NS04
-----END PGP SIGNATURE-----

--sb1p2JcVMAgnXblsiw1LUZwwypGRXDxnh--

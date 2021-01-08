Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFDCC43333
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24CFE221F5
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbhAHLeX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 06:34:23 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16493 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAHLeT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 06:34:19 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ff843120001>; Fri, 08 Jan 2021 03:33:38 -0800
Received: from [10.26.72.150] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 8 Jan
 2021 11:33:33 +0000
Subject: Re: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sameer Pujar <spujar@nvidia.com>, Peter Geis <pgwipeout@gmail.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Prashant Gaikwad" <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohan Kumar <mkumard@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Ion Agorria <ion@agorria.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
 <20201225012025.507803-3-pgwipeout@gmail.com>
 <0c3665b2-bac6-546a-bdd4-0ab7a90adf7c@nvidia.com>
 <CAMdYzYraT5AXzyscN3Pa+0FWZwHFsD-4ZwbA80kNxgtn7Y1PXw@mail.gmail.com>
 <b3a3ede2-22d5-b13d-f245-7c3b40ea411a@nvidia.com>
 <a2c5c1d4-500b-6dad-d4ab-339154624c43@nvidia.com>
Message-ID: <18f44f67-ba81-98d6-67d9-c6ddbb3c9302@nvidia.com>
Date:   Fri, 8 Jan 2021 11:33:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a2c5c1d4-500b-6dad-d4ab-339154624c43@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610105618; bh=E2T06x4spWYNF2pWJ3DV1KaBnD+2MtnlPvmF7IoJDAA=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=HNx7oyBTuCOKaDcKlAYfoNqMi3K8AqdYOh13qQ9jY66wuomGM+ECLZq2pay8AJMQI
         AndHThEOXUqONBPEAA2+DjPOln6xTxqGn/h6BkIzvzgLxy4MKET6EnPfNU3DOdkuoO
         /g4sJbjPNAaAbJbD344Ozu0iLSK0w+OFyORjbhhuuKLZU5NMtOly2Y49hjhJGwuUWn
         eKWVMlM9gl4pOCDMlalNnuOJPTx0PP1CCpwNtaxkTyf1yzXHCLRHqpxue1S35rvyss
         uzP6eN73+n+Hn5r65yXlv3+uXmM/K5ziyK1g03/DS+lPZuN5CPxObUxcP2lhk55oPj
         L5VHv/U7u0lYA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 08/01/2021 10:54, Jon Hunter wrote:
>=20
> On 08/01/2021 08:00, Sameer Pujar wrote:
>=20
> ...
>=20
>>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>>>> Tested-by: Ion Agorria <ion@agorria.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 sound/pci/hda/hda_tegra.c | 3 +--
>>>>> =C2=A0=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>>>>> index 70164d1428d4..f8d61e677a09 100644
>>>>> --- a/sound/pci/hda/hda_tegra.c
>>>>> +++ b/sound/pci/hda/hda_tegra.c
>>>>> @@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx
>>>>> *chip, struct platform_device *pdev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in pow=
ers of 2, next available ratio is 16 which can be
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * used a=
s a limiting factor here.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (of_device_is_compatible(np,=
 "nvidia,tegra194-hda"))
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chip->bus.core.sdo_limit =3D 16;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->bus.core.sdo_limit =3D 16=
;
>>>> Future Tegra chips address this problem and hence cannot be enforced b=
y
>>>> default. May be we can have like below:
>>>>
>>>> if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>>>> chip->bus.core.sdo_limit =3D 16;
>>>>
>>> It will need to be a bit more complicated than that, since the
>>> tegra186 and tegra210 device trees have "nvidia,tegra30-hda" as a
>>> fallback.
>>> Looking at the generation map, tegra30-hda can be the fallback for the
>>> broken implementation and tegra210-hda can be the fallback for the
>>> working implementation.
>>> Does that work for you?
>>
>> As per above explanation, it is fine to apply the workaround for
>> Tegra210/186 as well. So it simplifies things for all existing chips.
>=20
>=20
> FYI ... we now have minimal support for Tegra234 in upstream that should
> not require this. Given that the Tegra234 device-tree does not include
> support for HDA yet, I think it is fine to apply this as-is. However,
> once we do add support for Tegra234 HDA, then we should ensure that this
> is not applied. So that said ...
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>


Sorry I was chatting with Sameer offline and we think if we just switch
the test to the following then this will take care of Tegra234 when we
add it ...

    if (of_device_is_compatible(np, "nvidia,tegra30-hda"))

Peter, would you be able to send a V2 with this?

Thanks!
Jon

--=20
nvpublic

Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21682C43461
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 21:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C112222207
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 21:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jXwHAB91"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgIKVkK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 17:40:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19617 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgIKVkJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 17:40:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5bee8b0001>; Fri, 11 Sep 2020 14:39:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 11 Sep 2020 14:40:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 11 Sep 2020 14:40:08 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 21:40:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Sep 2020 21:40:08 +0000
Received: from [172.17.173.69] (Not Verified[172.17.173.69]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121) (using TLS: TLSv1.2, AES128-SHA)
        id <B5f5beeb80000>; Fri, 11 Sep 2020 14:40:08 -0700
Subject: Re: [PATCH] arm64: tegra: Wrong hsp_aon reg property size
To:     Mikko Perttunen <cyndis@kapsi.fi>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mperttunen@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20200910070950.12941-1-dipenp@nvidia.com>
 <bcf4c638-164a-1465-a0d4-17c64cbe0576@kapsi.fi>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <4401476f-87ba-9f45-d21b-dcba4f08cddc@nvidia.com>
Date:   Fri, 11 Sep 2020 14:40:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bcf4c638-164a-1465-a0d4-17c64cbe0576@kapsi.fi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599860363; bh=qxmr+mqSXm47fHsUQMqRK0buTbeuRZMvhIUniKNv1JI=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
         Content-Language:Content-Transfer-Encoding;
        b=jXwHAB91zCvLVeAAiFdntP2/W48fYI1ugO+BdMQ+lG/LTMQSvks51Un+zoYiMyq+u
         UxmIR92SNdnV5fOMjRLRft3W3f1HqJN69LYglce2pOU7lX+xl5zZ8dFG3eXD3etC37
         EKijntM8lPVF+cJguHIzXKy9dV0qZrl2rMcxdI/JNdaB+IIqeIcbOcrP4SZpDM5skF
         WPPGGbT5cHMluZfB8YbIEu9pwC/Z8caONgi3smulD1V6Hp+f8HglxjoaXgElBwLTEo
         yRM34UBX+wVUDbfI1coAQqryTeM0+Dbx4oGr/2n/P1zwNOEOtXLyR+7zuL/nKNsw5D
         ZCGiApNoqtHfw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/10/20 1:27 AM, Mikko Perttunen wrote:
> On 9/10/20 10:09 AM, Dipen Patel wrote:
>> The hsp_aon node reg property size 0xa0000 will overlap with other
>> resources. This patch fixes that wrong value with correct size 0x90000.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>
>> Fixes: a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")
>=20
> I think there shouldn't be a newline between Signed-off-by and Fixes; oth=
erwise,
>=20
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
>

Ok, will fix it in next version.
=20
>> ---
>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/=
dts/nvidia/tegra194.dtsi
>> index e9c90f0f44ff..93438d2b9469 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> @@ -1161,7 +1161,7 @@
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hsp_aon: h=
sp@c150000 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 compatible =3D "nvidia,tegra194-hsp", "nvidia,tegra186-hsp";
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x0c150000 0xa0000>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x0c150000 0x90000>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts =3D <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
>>

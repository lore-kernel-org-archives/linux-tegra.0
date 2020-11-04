Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2C2C2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 19:12:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B63F206E3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 19:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fsauGQVw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbgKDTML (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:12:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15585 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgKDTMK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 14:12:10 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa2fd0c0003>; Wed, 04 Nov 2020 11:12:12 -0800
Received: from [10.26.45.122] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 19:12:09 +0000
Subject: Re: [PATCH V2] drm/tegra: sor: Don't warn on probe deferral
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     David Airlie <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20201104092328.659169-1-jonathanh@nvidia.com>
 <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e0c87fcc-5fe3-d2ba-0a58-41c670ac5e0a@nvidia.com>
Date:   Wed, 4 Nov 2020 19:12:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604517132; bh=wcT9OxMA6Jtc1260i+qV3pzxBsKsC87iufbCazK1OME=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=fsauGQVwL1kTXSdvsFTI+tIep5GjGhoLlaF/tuMeUczl1r7KLsR0d7J7Dr4uCImnF
         pM6v6GtXbwIy8hq4Z5BcUyB2CnN8iDXR0HkKEpGcg7ER0ATcU4VSF43nWH2ysq+UNB
         zNdV7ZIsWe9yIfkaNyzokf87MR18OoyX/oAsLcrm3Ey+oR5arWrxN+n38+D+ZhvjnK
         bEMo224vD5PbaSWd5snewQyltkLT3N5R50BXMP8Ml2C2XHzEOk7nD/eFa94l2RqoS8
         uwlWGVOI+i0+XNbQMPFj4pg8/xQsedzw6qEVXN0V27T2x6d3yR5pNCcaIOG4FeCIdz
         LppHoAS6XgMbA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 04/11/2020 10:49, Dmitry Osipenko wrote:
> 04.11.2020 12:23, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Deferred probe is an expected return value for tegra_output_probe().
>> Given that the driver deals with it properly, there's no need to output
>> a warning that may potentially confuse users.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>
>> Changes since V1:
>> - This time, I actually validated it!
>>
>>  drivers/gpu/drm/tegra/sor.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
>> index e88a17c2937f..898a80ca37fa 100644
>> --- a/drivers/gpu/drm/tegra/sor.c
>> +++ b/drivers/gpu/drm/tegra/sor.c
>> @@ -3764,10 +3764,9 @@ static int tegra_sor_probe(struct platform_device=
 *pdev)
>>  		return err;
>> =20
>>  	err =3D tegra_output_probe(&sor->output);
>> -	if (err < 0) {
>> -		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
>> -		return err;
>> -	}
>> +	if (err < 0)
>> +		return dev_err_probe(&pdev->dev, err,
>> +				     "failed to probe output: %d\n", err);
>=20
> Hello Jon,
>=20
> There is no need to duplicate the error code in the message [1]. Perhaps
> worth making a v3? :)
Indeed! Thanks for catching. Trying to do to many things at the same
time. I should have learned by now!

Jon

--=20
nvpublic

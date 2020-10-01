Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51173C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F002E208A9
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="VnZsQ/Dt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgJATo4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 15:44:56 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18229 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgJATo4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 15:44:56 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7631ab0001>; Thu, 01 Oct 2020 12:44:43 -0700
Received: from [10.26.45.122] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 19:44:47 +0000
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        "Sameer Pujar" <spujar@nvidia.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <20201001190733.GD23339@qmqm.qmqm.pl>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <85fe1be4-7b67-da99-06a5-28089f662a1d@nvidia.com>
Date:   Thu, 1 Oct 2020 20:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001190733.GD23339@qmqm.qmqm.pl>
Content-Type: text/plain; charset="iso-8859-2"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601581483; bh=SzR9+Kg5ALQEhT+jW9ABsLDoFclETsOIFF0nIoKFTsA=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=VnZsQ/DtIwGXa9gGozOJfBdr/CWcgyy5AB1KaSPWc6HwRB/SLJvflJHSIqwv9WeLD
         DSm4YmBMmwFzpkqawyiIW8cTP8upzOJsLvd3GcOE+kI6+MEzAVNL9EuDX7ysk1qla2
         T/xWi2lo63yvxPkwDRSlnNV+xiykixQD62CYiG5LaQnzwzIuShDTylG/ciZZqbFPzG
         nwZuFqNQQzZV40S1nILc37TJJpze9P7fAyI8vjEbHf1y8onAKOY/OcCbIw46p+kIMR
         KaGuBnlzYFcZivHzgfCEhY4JYfXnv7sb5JszTw7DsgfQpwbTDIDxFlzRd7Xcdu4H0W
         /bK8u789odIBg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/10/2020 20:07, Micha=B3 Miros=B3aw wrote:
> On Thu, Oct 01, 2020 at 11:03:04PM +0530, Sameer Pujar wrote:
>> Add Tegra audio machine driver which is based on generic audio graph car=
d
>> driver. It re-uses most of the common stuff from audio graph driver and
>> uses the same DT binding. Required Tegra specific customizations are don=
e
>> in the driver.
> [...]
>> +	switch (srate) {
>> +	case 11025:
>> +	case 22050:
>> +	case 44100:
>> +	case 88200:
>> +	case 176400:
>> +		plla_out0_rate =3D chip_data->plla_out0_rates[x11_RATE];
>> +		plla_rate =3D chip_data->plla_rates[x11_RATE];
>> +		break;
>> +	case 8000:
>> +	case 16000:
>> +	case 32000:
>> +	case 48000:
>> +	case 96000:
>> +	case 192000:
> [...]
>=20
> Do you really need to enumerate the frequencies? Wouldn't just checking
> srate % 11025 be enough to divide the set in two? Or just calculating
> the PLLA base rate by multiplying?


This is quite common among other ASoC drivers from what I can see. The
PLL rate does not scale with the srate, we just use a different PLL rate
depending on if the srate is 11025 Hz or 8000 Hz based. I don't see any
need to change the above.

Cheers
Jon

--=20
nvpublic

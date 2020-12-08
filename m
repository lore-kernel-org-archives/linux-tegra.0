Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBB4C4361B
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 03:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D8E4239EB
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 03:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgLHDzf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Dec 2020 22:55:35 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6817 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgLHDzf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Dec 2020 22:55:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcef90e0004>; Mon, 07 Dec 2020 19:54:54 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 03:54:51 +0000
Subject: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
To:     Mark Brown <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
        <sharadg@nvidia.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
Date:   Tue, 8 Dec 2020 09:24:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207123131.GB5694@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607399694; bh=57K2arrOkrJycwF/NemnQ2nVOm/DzL8o8jMnlSRtwvI=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=SqDXS5tEn21GY7pYzotCi6w+Aay3/ODcWDWFr9ajMXtspjiBxj905ymiwC6mZrh07
         U0PAJio4KsGhKpaiSAqSJ1A4M6dTRq2Oo02szHGWVkXWfm/pY1V31R/vWic5h+mayT
         07v/9KAx1px26e3tLqMYdRkHWwbrsnDPHXzLV9HR50dB8hLFOz2cif/2F+HDZpsIyH
         R4WjVNtpBnusnLuIXG9K0GufcDjVph3MrOwy3L950iysmgvu53VtHxH3tQpjpHO5YZ
         pmrc8tGM9N98rtARkuHAa8Dd0f9vec7Gks10E8QYs6HKpc5sRiwnR6zpiwomm4Wdn8
         3Oc2KaL66t1LA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>> [1/3] ASoC: dt-bindings: tegra: Add graph bindings
>>>         (no commit info)
>>> [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
>>>         (no commit info)
>>> [3/3] ASoC: tegra: Add audio graph based card driver
>>>         (no commit info)
>> I don't see above patches in linux-next yet. Should I wait some more time
>> for this to appear?
> No, this was sent by a b4 bug - notice the "no commit info" there, they
> weren't applied.

Oh I see! I guess review would be still pending then.

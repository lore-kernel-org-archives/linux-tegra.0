Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4811C4167B
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 14:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2F3223A6A
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Dec 2020 14:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbgLHOtI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Dec 2020 09:49:08 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3883 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbgLHOtI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Dec 2020 09:49:08 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcf923c0000>; Tue, 08 Dec 2020 06:48:28 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 14:48:24 +0000
Subject: Re: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
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
 <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
 <20201208121312.GB6686@sirena.org.uk>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <a6ecb66e-db25-dcfa-4a70-d9b2fad75cd9@nvidia.com>
Date:   Tue, 8 Dec 2020 20:18:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208121312.GB6686@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607438908; bh=dyvnc0MmI74AElyJHGT+49gBQdAAzpK9ZrjPVG7orQk=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=DsrT4YBllGyINM0Ec6xRs09oDm2LV9RIFeIKyWvSkr6J2K+KAe7yUXCmqCd/DWKUX
         BVd+59fyvUZOhxlrcr66ogVnuv/6Cn0dT8NYy9NH2q8V5DF8wCVzQd0z//znj5xrs1
         UAq/YiDQzxRAIJsetEndNVkDPVqaPFJriLXP8R9//2PIbmm4qEwwfEZyb+KqeSTrWf
         PsGFvNCebs/lB/NqeXwrWGu3jBBoE1eGPhHMTL85+VCJZJCZUXN5iFOwK/srsxVNlh
         ZKc4ipjo4L8JdgUyc8nlcZoH27U/07ccaWR8StxT1Uq47TlY1anlHcqPHOqespFlWu
         4RBNqXZgiMpXg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>> No, this was sent by a b4 bug - notice the "no commit info" there, they
>>> weren't applied.
>> Oh I see! I guess review would be still pending then.
> I don't seem to have them in my backlog so either there was feedback
> from someone else I was expecting to see addressed or some other issue.

I am pretty sure that it is not because of any outstanding comments, 
because I got none on v6 and previous v5 feedback was taken care. May be 
this is because of the doc dependency I listed in the cover letter?

[Sorry I had to resend this reply. I accidentally replied from my 
personal email earlier and many people/DLs were missing on that]

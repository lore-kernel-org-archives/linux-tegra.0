Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B34C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 15:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC45C64DFA
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 15:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhA1PI2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 10:08:28 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11666 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbhA1PEI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 10:04:08 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6012d2400000>; Thu, 28 Jan 2021 07:03:28 -0800
Received: from [10.26.73.116] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 15:03:24 +0000
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Saravana Kannan <saravanak@google.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com>
 <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
 <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com>
 <CAGETcx_1x7LFprsEM+-X8Y42-sbajBav5Bik4U=s4Z5XCSZtUg@mail.gmail.com>
 <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com>
Message-ID: <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
Date:   Thu, 28 Jan 2021 15:03:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611846208; bh=xyVB/nXmGqUdKAurlytAs4Ivga7O+JRNlwLBfje94Ik=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=JCa4Snojg2M2xuT8hrJ5OITwTtTwVwvCbBTiUPNEHk06ADPCS3Y6ymFxjU5pUqZmr
         qqvUbPaq98TqvG59ORl1ejijao6OywKJjENLEEC+/o1x7MKDNtHpEIpjyCeeq6/Gu1
         doz4wGc+hQQR48Lz7E96oJ/ftj7i1xinxIe5++TUiJu7iH/v+j6dcCehe1apNiN2Bx
         ldumRsA5OuYiA2GJkYkaim2Rr4Kbz8NZDsv+HyJy0CsLiLb2HVtmhotEQ9+g5HH/P+
         2qjKYk+lezLKvBPaTBymUccWzypSh+nCYS5RJatDDGb4PAwutGr2U+NmB9c/pTfRFi
         cPaDSCiB3Yqsw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/01/2021 16:56, Jon Hunter wrote:
> 
> On 14/01/2021 16:47, Saravana Kannan wrote:
> 
> ...
> 
>>> Yes this is the warning shown here [0] and this is coming from
>>> the 'Generic PHY stmmac-0:00' device.
>>
>> Can you print the supplier and consumer device when this warning is
>> happening and let me know? That'd help too. I'm guessing the phy is
>> the consumer.
> 
> 
> Sorry I should have included that. I added a print to dump this on
> another build but failed to include here.
> 
> WARNING KERN Generic PHY stmmac-0:00: supplier 2200000.gpio (status 1)
> 
> The status is the link->status and looks like the supplier is the
> gpio controller. I have verified that the gpio controller is probed
> before this successfully.
> 
>> So the warning itself isn't a problem -- it's not breaking anything or
>> leaking memory or anything like that. But the device link is jumping
>> states in an incorrect manner. With enough context of this code (why
>> the device_bind_driver() is being called directly instead of going
>> through the normal probe path), it should be easy to fix (I'll just
>> need to fix up the device link state).
> 
> Correct, the board seems to boot fine, we just get this warning.


Have you had chance to look at this further?

The following does appear to avoid the warning, but I am not sure if
this is the correct thing to do ...

index 9179825ff646..095aba84f7c2 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -456,6 +456,10 @@ int device_bind_driver(struct device *dev)
 {
        int ret;

+       ret = device_links_check_suppliers(dev);
+       if (ret)
+               return ret;
+
        ret = driver_sysfs_add(dev);
        if (!ret)
                driver_bound(dev);


Cheers
Jon

-- 
nvpublic

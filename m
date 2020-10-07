Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F101C47095
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 16:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF529216C4
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 16:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgJGQPP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:15:15 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:60852 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbgJGQPM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 12:15:12 -0400
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 12:15:11 EDT
Received: from [10.2.53.20] (searspoint.nvidia.com [216.228.112.21])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 8304E1C0575;
        Wed,  7 Oct 2020 10:08:11 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at avon.wwwdotorg.org
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
To:     Dmitry Osipenko <digetx@gmail.com>, Bob Ham <rah@settrans.net>,
        Stefan Agner <stefan@agner.ch>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Rusak <lorusak@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
 <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net>
 <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Autocrypt: addr=swarren@wwwdotorg.org; prefer-encrypt=mutual; keydata=
 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 YdVt
Message-ID: <f12c1ad2-d180-8981-c3bf-db8ab6afbbaa@wwwdotorg.org>
Date:   Wed, 7 Oct 2020 10:08:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/7/20 7:53 AM, Dmitry Osipenko wrote:
> 07.10.2020 16:36, Bob Ham пишет:
>> Hi all,
>>
>> The Bluetooth controller driver sent to linux-input by Lukas Rusak
>> (CC'd) is a bit of a concern.  Here is the original driver:
>>
>> https://github.com/ouya/ouya_1_1-kernel/blob/master/drivers/hid/hid-ouya.c
>>
>> and you can see that there is no SPDX header, no license information and
>> no MODULE_LICENSE declaration.  I'd previously noticed this as a
>> possible cause for concern in upstreaming the driver.
>>
>> Meanwhile, Lukas's driver is clearly derived from the Ouya Inc. driver
>> and even retains the Ouya Inc. copyright notice line.  However, Lukas's
>> driver now has a MODULE_LICENSE("GPL") declaration added.
>>
>> Lukas, did you get clear permission to license the driver as GPL?
>>
>> Alternatively, kernel developers with greater legal or Ouya knowledge,
>> is this actually a concern or is it nothing to worry about?
> 
> Hello Bob,
> 
> That can't be a problem because:
> 
> 1. Ouya Inc. doesn't exists anymore.
> 
> 2. If code was officially published, then this implies that it can be
> derived.
> 
> 3. Ouya's driver uses kernel symbols that are explicitly marked as
> GPL-only, see hid_open_report for example. Hence Ouya's driver inherents
> the GPL license.
> 
> 4. Lukas's patch doesn't remind the original code at all.
> 
> 5. In practice nobody cares about legal much if money aren't involved.
> Even if it happened that driver was 100% violating some copyrights, then
> it either won't be accepted to upstream or will be removed by request
> from the copyrights holder.

This definitely isn't the correct attitude to copyright.

The facts[1] that Ouya published the code and that it used GPL-only
symbols certainly does imply that they *should* have published under GPL
or a compatible license, but doesn't mean that they definitely did. The
only way to know that for sure is for there to be evidence in the file
content or git history, such as license headers or Signed-off-by lines.

When someone writes Signed-off-by in their code submission, which is
required to contribute to upstream Linux, they are stating/warranting
certain things about the code they're submitting. One aspect is that
they definitely have the rights to submit the code under the given
license. Without evidence to this effect, or having written the code
themselves, nobody can state/warrant this. Take a look at the following
link to see what you're stating/warranting when writing Signed-off-by in
a code submission:

https://developercertificate.org/

[1] I haven't checked the facts.

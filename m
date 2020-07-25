Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14140C433DF
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 13:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2FB020674
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 13:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDnBclCS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgGYNCt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 09:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgGYNCt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 09:02:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A53BC0619D3
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jul 2020 06:02:49 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so6911236pgq.1
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jul 2020 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+lT1b8FHzn13Ortp4emIfBhBIZYZ4Hm4WQjsh8eooy8=;
        b=RDnBclCSUxks3lRF+bnx+3HNF7fihYPbXBmZrmfe3VxrGQtfKhYuskBBUtWI/C0LOh
         8uSFRXdDYnmEOCdHi7p7HeGxV3eukpvGr8+czRADYxMBRwZBPG/ZDdKdfK3fyr00awHM
         7Njh//26eBG1lYqxat2x5xFKgUC14Di2dQ6CVYKlbH4Bz8TKp0NNw5d7q2ls4u9GwYgV
         R6/bFEdyUGL1L8wJA3XGrl/QrTIZNH100yrJOi03ULsYQKTzOhgR6gxqwpmg1LihG84T
         N4xBdFD9OIfUk563skj9ciedYzzFaXQkvHO7LU7MR5Xm1CEvsl6u226l/+QOlFTWpnL4
         j2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+lT1b8FHzn13Ortp4emIfBhBIZYZ4Hm4WQjsh8eooy8=;
        b=JVGAC5C12YiuU7umgiILqj9Z7RndP9s5/0f0hs4OHvEYtV7U2nrMrIa9+vH6tczGkd
         Co3r/bKn9QW6F5LMWjBhxljvcYAEgqUBfrpRYSWalO1C4xxAVfjUzH1t3aLkzDmehh0D
         4h2/26hCZOgnSjKfMjp2qaU3XIKmq7qV7vjLPqsvpJ7swXURqg4dseTESizEQYdyl+CX
         nmCfmr9NZpUT/CHBWgCPhcS6qkbmk4N58DG1Ar/VC8IDDyrNy02UeHKgCktUZl5Nci/R
         YpAkMD1S6yJIHxGESlYAeP2XWGpKBiS4zbmcPV11UjVrk9g71OwqvK+HnpXuH6ySVlvg
         Dm+g==
X-Gm-Message-State: AOAM531vEIvRQy8dVp91iKigho5mVhs6C1Q8r26owgbBlyqYwEhE+h5i
        Dt7bntDJ6RXnWsAo2zZyt+o=
X-Google-Smtp-Source: ABdhPJxcFg74YhKDZYnajXwmmWmMExVaeAcdT15zlytdc3/9JmAA6JvNbgwNXepq2MRbodRvUQCXZw==
X-Received: by 2002:a62:1782:: with SMTP id 124mr12553011pfx.204.1595682168708;
        Sat, 25 Jul 2020 06:02:48 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id p187sm9044294pfb.22.2020.07.25.06.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 06:02:47 -0700 (PDT)
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
 <20200725120146.GB26689@qmqm.qmqm.pl>
 <5597e949-b93c-9133-efdb-9714637f9ebc@gmail.com>
 <20200725125054.GB18633@qmqm.qmqm.pl>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <1a717bdc-a321-04a8-0a0e-3cff887ff380@gmail.com>
Date:   Sat, 25 Jul 2020 18:32:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200725125054.GB18633@qmqm.qmqm.pl>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/20 6:20 pm, Micha³ Miros³aw wrote:
> On Sat, Jul 25, 2020 at 06:01:19PM +0530, Rohit K Bharadwaj wrote:
>> On 25/07/20 5:31 pm, Micha³ Miros³aw wrote:
>>> On Sat, Jul 25, 2020 at 11:59:39AM +0530, Rohit K Bharadwaj wrote:
>>>> changed usage of slave (which is deprecated) to secondary without breaking the driver
>>>
>>> The relevant I2C and SMBus standards use master/slave terminology. Why are
>>> you changing the names to something unfamiliar?
>>>
>>> If the reason are the recent coding-style changes, then please note they
>>> are about avoiding introducing *NEW* uses of the specific words and not
>>> about blindly replacing existing occurrences.
>>
>> I'm really sorry sir, I didn't knew about this, yes the reason for my change is according to the script checkpatch.pl to suit the coding style, I would try to fix some other coding style related issues if this patch seems to be a bad idea.
> 
> I didn't know checkpatch does this (it doesn't in current Linus' master
> tree).  I can see there is a commit in next adding this, but seems that
> it uses a test far from the original coding-style wording...
> 
> Best Regards
> Micha³ Miros³aw
> 
yes sir, in the linux-next tree, when I ran the script on this file it showed me it had style issues and the usage of slave is deprecated and it suggested me to replace it with secondary or target. and hence I made this patch, please do let me know if this patch can be acceptable or not.

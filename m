Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4514C49EA7
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 18:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EEEB6191B
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 18:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFYShE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 14:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhFYShE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 14:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624646083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w3d5QmgQTedbMfqNV9W2ZCvpWHRikHJ8lDKHWRxFQVI=;
        b=ieQ+zzjZKMgmop+ZWl2j7wJFBnQg9dJJHj3uKVxKebPWk7mWWsQErCb1nkGpXCMz+PnT5L
        j7G+l8prXgDj/NKcodgB2/IlQHtTZPGLdGy5fMWrl8vwKFcCt9DN+NdtmowDPo0QNN5jHo
        XoIPZ5+WP0IGPztZ6+UIQI9igb5Kkw0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-jDvGVXDnPTWjmt4T-MbtgQ-1; Fri, 25 Jun 2021 14:34:41 -0400
X-MC-Unique: jDvGVXDnPTWjmt4T-MbtgQ-1
Received: by mail-wr1-f69.google.com with SMTP id l13-20020adfe9cd0000b0290119a0645c8fso3651417wrn.8
        for <linux-tegra@vger.kernel.org>; Fri, 25 Jun 2021 11:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w3d5QmgQTedbMfqNV9W2ZCvpWHRikHJ8lDKHWRxFQVI=;
        b=FyIyEf12h70YpbxkGlt0cMESGcTN8gf9yLfexvyD1Eq0Fc0gJz9dS5OqyTCNu8kod1
         AfWs+5cPfvsm+ylqqOjW4z3hTnqkWs9/6cKMf+2DEtUckhEVEq/puSqcQe1vtYd0MUbr
         tmb8pr8CI4ypZ8rPKwMPAJTD+PNwXxB+Vib2m9MZGuwfsek5fZO9SbcO46Sq2AwBo8io
         xnwfRVcKQnEn83bV2jvnJcVkRnRmLoPL1eb8hp4DrnzlTxdVKlH1Rm3QqsknokQqkq29
         8T1AnNuIi6UYreq0J9mle563XtmQCv8RSjEOLH6WWK0jjEh3M0Ak6pkhuRKTUMkejvIP
         nzcw==
X-Gm-Message-State: AOAM530PrOhWtESmKjv14h5TWz47sHh12i7uJu9IVjLsuCf0g+/U6Y6c
        royXPQuG4U57iD969eBbXgQ4/Lx8aOpucLHG48yotjgKAzDa3FC34HOrwMHJaJq5QsH4yusDtp1
        I4CqovUt80kVsPjrTZCMtXMOOk065xzAIcOR5ahnYf2+nPIx3m1Qfp/ae1wKQ1MhkbqgshOEfgg
        ==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr12558783wrw.399.1624646080449;
        Fri, 25 Jun 2021 11:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxv71Y5qNrtRBtagkA7o6lXh3Ty2kHfWVl115v2RJg/5J5ugMGjArkWAQ76YYJB8G51G3pgA==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr12558747wrw.399.1624646080189;
        Fri, 25 Jun 2021 11:34:40 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id z4sm6834597wrs.56.2021.06.25.11.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 11:34:39 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: rockchip: Avoid accessing PCIe registers with
 clocks gated
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        rfi@lists.rocketboards.org, Jingoo Han <jingoohan1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20210625143235.GA3624355@bjorn-Precision-5520>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <fa7ee574-89a7-330c-40ae-717142924cfa@redhat.com>
Date:   Fri, 25 Jun 2021 20:34:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625143235.GA3624355@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/25/21 4:32 PM, Bjorn Helgaas wrote:
> On Fri, Jun 25, 2021 at 09:09:36AM +0200, Javier Martinez Canillas wrote:
>> On 6/25/21 12:40 AM, Bjorn Helgaas wrote:
> 
>>> I think this is also an issue with the following other drivers.  They all
>>> set the handler to something that uses an IRQ domain before they
>>> actually initialize the domain:
>>
>> Yes, I agreed with your assessment and also noticed that others drivers have
>> similar issues. I just don't have any of those platforms to try to reproduce
>> the bugs and test a fix.
> 
> Even if you don't have other platforms for testing, I'm thrilled when
> folks point out issues with them and (given time and inclination) post
> patches for them.
> 
> I'd much rather fix *all* instances of the problem than just one, even
> if we can't test them all.  Frequently driver maintainers will review
> and test patches for their hardware even if we can't.
>

Ok. I'll try to make some time next week to look at these drivers then
and post at least RFC/RFT patches for people with available hardware to
test the changes.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering


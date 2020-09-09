Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16E5C433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F18215A4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="FVhqr7Uw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgIIIlI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgIIIlH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:41:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660C0C061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yoGI2txn64gsAVVnDofePE+LRxZjRbFKYHuVddNt/tg=; b=FVhqr7Uwcz9R5pFfUpreqPH5RQ
        79+aVCLV0r41wYvm22Uc+EkqzNo2AFGECxGD7Cu633DcxfNP1AdvDM4nWK/ez8grB83MTU1EX08PR
        RACBsjalyxUx/rjdUz3xgfXtp5sZI1kVhfM+mqDAFJ34mDRsbFYgOx8I2pXvbAyqX47HyK+Rulf8k
        GSJg2u8B+fCGllQMIW0rHgD3lgKguSoph0AnzZG4Wt2ieNZTrCpqbzAd09dnp0hI9ysMl8UBFxXLy
        uhFFV4eE8R2nGYxmGpdWUwCAS9JVguATklG1bVFm9BTmUm7GZD4ISNxvRnHJKwoOF51a7ugZenC0S
        oizxc9qg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvf4-000086-CE; Wed, 09 Sep 2020 11:41:02 +0300
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <81c4020b-38d5-b94b-5919-b988341aee72@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:40:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/9/20 2:36 AM, Dmitry Osipenko wrote:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> Hi all,
>>
>> here's a second revision of the Host1x/TegraDRM UAPI proposal,
>> hopefully with most issues from v1 resolved, and also with
>> an implementation. There are still open issues with the
>> implementation:
> Could you please clarify the current status of the DMA heaps. Are we
> still going to use DMA heaps?
> 

Sorry, should have mentioned the status in the cover letter. I sent an 
email to dri-devel about how DMA heaps should be used -- I believe the 
conclusion was that it's not entirely clear, but dma-bufs should only be 
used for buffers shared between engines. So for the time being, we 
should still implement GEM for intra-TegraDRM buffers. There seems to be 
some planning ongoing to see if the different subsystem allocators can 
be unified (see dma-buf heaps talk from linux plumbers conference), but 
for now we should go for GEM.

Mikko

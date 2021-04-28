Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC085C43460
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C20AB61422
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhD1F6H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Apr 2021 01:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhD1F6H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Apr 2021 01:58:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF36C061574;
        Tue, 27 Apr 2021 22:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gStYSvuQf5xLgfwjGhGEB1zmF5MfP133ZkkVrNYE9Hs=; b=khCQ4yUc3JAzqtW5QKgK/cXgoB
        2T/sg5cvEk92FkndHRhB37tsG7YqEtFaeqx6lOildEG5kZnMEYPnrWW6RiSCQyQaNYveQbs749juy
        QYIvTOZCy+Sla9BciUMl/bJo1PPnW+bo/R69WYMvCqZ9PMUWZB/b78oYbeSKOZvWZjW8L2PTvfyqb
        rvfzmCa9Uzc0q6LVfi1iRQGTVzfHN4/5Ctt8J5yS0TZccTOpLsVerVZq35p+Q5fGAwIKWxhhG3zM/
        +C0ZQzDXEkM+QJHAfjnY+v6rRHC4gG7FnLQjYJMdDMjB3RHssHRcTIuNVSPf8BofiwDb4sNVVbs8e
        2KV6Egeg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lbdCB-0001NY-TY; Wed, 28 Apr 2021 08:57:11 +0300
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <b6d323e1-2e90-b031-60a0-3460644ea7a0@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <ea842576-8967-03b5-6d6c-9e655d11b46b@kapsi.fi>
Date:   Wed, 28 Apr 2021 08:57:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b6d323e1-2e90-b031-60a0-3460644ea7a0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/28/21 8:51 AM, Dmitry Osipenko wrote:
> 23.04.2021 19:32, Thierry Reding пишет:
>> Note that there will be no new releases of the bootloader for earlier
>> devices, so adding support for these new DT bindings will not be
>> practical. The bootloaders on those devices do pass information about
>> the active framebuffer via the kernel command-line, so we may want to
>> add code to create reserved regions in the IOMMU based on that.
> 
> Since this change requires a bootloader update anyways, why it's not
> possible to fix the bootloader properly, making it to stop all the DMA
> activity before jumping into kernel?
> 

That is not desirable, as then we couldn't have seamless 
bootloader-kernel boot splash transition.

Mikko

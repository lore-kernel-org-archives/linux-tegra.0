Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728B5C2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 23:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A33220872
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 23:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBCWUH9y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbgKXXNq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 18:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732432AbgKXXNp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 18:13:45 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A1BC0613D6;
        Tue, 24 Nov 2020 15:13:45 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id k5so105630plt.6;
        Tue, 24 Nov 2020 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6HZ3PXI07xuXCb1u+0sxHyo9e4nW+5uowdj70oCCuBQ=;
        b=fBCWUH9yp0JVY9KxVwFeRHryKJZSDVHuhLlnDdvwsQrs6gyQx0/kVvV4TBuDFHGHO6
         ipwq6pAa+eKeBVDCTlw+vVqahU9dXn3HnG6P6GLQZDWC+YGStBXFo7anckfkOqI0jP4X
         OgL+E45KQwgQUneFLTxI2i/c50aGxKXnM/8brc0nl0+MUAeyg0AptQvMh5oH73DM6NdX
         oBTrudRcmLzIhSWsehO0VhgudxggXLZgzTg1sUP77s+pt7S7hToCUri+mZT7gV2mT1cZ
         dr8CHTO2fNOj+CwsbxII28Wj/RaDgKLhHqiIGGRMbeUhBT52XpGK5Jk+QMSWdUyHoO+l
         1BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6HZ3PXI07xuXCb1u+0sxHyo9e4nW+5uowdj70oCCuBQ=;
        b=keDv/gjmeddnz4JSHRof60k3T+NZ+O1r7OY7KdybRkPf9ossLUXJL9TVUk5ROtBY/h
         nKilwH9LxlyiY+Bl8ADRVF6B6xujiTdAp/SRTt6oA5/akk8WcShhRRz8QjGiNsuHMz3n
         z1AfoZQfEy+PylpIDM7q3WMQBqAl5CMzo6+2lAIlUI3BlHZGY1tzKPvKRhXTiAnkk1Mx
         SYeZPnR8GfKSTo5FBcwev0ihrLeb5nAQ6pFf1bCyFBZALBoeUPTziVJHXLM99pQZAD5l
         fXM8haqB0hXQzWxfiOjEaB9dfMbdU7JjVgIjsGD43M7B9ElE9sCXrxzu4ZUueouysunX
         5r5Q==
X-Gm-Message-State: AOAM531zKcao5lV7PQXXAVMBIgF/7OWd89TfIOxPgPVsQg2dqyrP72nR
        0P2ckrmEFAqM7m60rvUOqXJdp82En8XJtg==
X-Google-Smtp-Source: ABdhPJzzb0uF6PYJKfyKmVPNhZ+rW1fV2YpSEtzwFwyogY8RxQZe9lFs38IgZmv8nkYLDgu/C9lIeg==
X-Received: by 2002:a17:902:9a4c:b029:d6:1f21:8021 with SMTP id x12-20020a1709029a4cb02900d61f218021mr554435plv.58.1606259624726;
        Tue, 24 Nov 2020 15:13:44 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id g31sm220237pgl.34.2020.11.24.15.13.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 15:13:44 -0800 (PST)
Date:   Tue, 24 Nov 2020 15:12:16 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>, Will Deacon <will@kernel.org>
Cc:     joro@8bytes.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com
Subject: Re: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Message-ID: <20201124231215.GA32405@Asurada-Nvidia>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
 <20201124212100.GA32108@Asurada-Nvidia>
 <68237d7c-12f7-3053-2e79-75b7e95f0af3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68237d7c-12f7-3053-2e79-75b7e95f0af3@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 25, 2020 at 02:05:14AM +0300, Dmitry Osipenko wrote:
> 25.11.2020 00:21, Nicolin Chen пишет:
> > Hi Joerg,
> > 
> > These five patches were acked by Thierry and acked-n-tested by
> > Dmitry a while ago. Would it be possible for you to apply them?
> > 
> > Thanks!
> 
> Hi,
> 
> You probably should try to ping Will Deacon.
> 
> https://lkml.org/lkml/2020/11/17/243

Thank you, Dmitry.
--

Will, would it be possible for you to take these changes?

I sent them on Nov 11 to the following lists:
linux-kernel@vger.kernel.org
iommu@lists.linux-foundation.org

If you need me to resend it again by adding you in To line,
please kindly let me know.

Thanks

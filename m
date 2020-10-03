Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D974BC41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A962205F4
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:16:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5oILGSq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgJCOQY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgJCOQY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:16:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E55C0613D0;
        Sat,  3 Oct 2020 07:16:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so5460601lfr.4;
        Sat, 03 Oct 2020 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DEerz5rhU/ckz065kjRvk0JGwS2l91T/B4gVGoCe4pI=;
        b=e5oILGSqKqJSAxFLuiDNAy/BpDOlt8bywuJzHxLtjXCKeAPIeJ5iMamAr/cgV+rIhA
         vYi7ANkE+lX7E8EjZ4cisFpSOyhVCAw+45dyOA0F/i+WIye875XxvzHSJzXd+thrzVBu
         HHGzS+8Epj2N1g7bpw4wv8DSO+wsVKY3HpStvCfNOB1QnpUSU/g1OL/yq9Vc1WTgIfbo
         7NsanE+T9b6azfX9fz01xGooT56QueYTE3thM2u/qOewx3GXKuQTy0Y/DzxONOv2tKeb
         9zyAZhOUZkLBlOLRjTOCK4H/rf9+MbsaiAI6bqz2ZKll4IXCudNm9u/mCqJ7Op98JzHc
         lvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DEerz5rhU/ckz065kjRvk0JGwS2l91T/B4gVGoCe4pI=;
        b=YCcwlXDFuWhbBkVYaQY8t/7CB50P1MY+wGlqnyjG1uPvd6c4tLwatZ7sGYLxWcAf86
         UOMlSnuBSD3FZB2Vyf+nlDmienYU1Om+p049omj/FFvhJqKjAxPyuxmGMz6Td0AIs0Zc
         Mox1d4XOrAJHt2mSsbniZD2zxXc4RRBJsrvz2MtkC/KKJDeOzyK18URX1VirRoFUGYHh
         4YKQ2FRyeaiy0Az1ju/fRVNPh5z8vy8iTFNyxlS+lIP8cY7D7Ap9muZmrnm/JQbpaTQS
         4zTZxm6zMjRDPSQjoHRkuqztdOUz+xF68GtnuUJ05XtlOfKuvSL9JDF/VbmWdWgcwxsL
         +cSw==
X-Gm-Message-State: AOAM533Di3NPgKi2PYy2hjaEb9/t9EjxIMiJR9w7ouV/T2zJMfqYWXhA
        34DyeQbKSXi35j1Ind2XS5UJb718Ukg=
X-Google-Smtp-Source: ABdhPJw014yQfHnsOd2flACWZ4nmC6T+bcz5iCrHEo0QLhleYJSseH0mrTtFGnkREbI3iqojD50OcQ==
X-Received: by 2002:ac2:4148:: with SMTP id c8mr2398321lfi.278.1601734581951;
        Sat, 03 Oct 2020 07:16:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id l129sm1582110lfd.191.2020.10.03.07.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:16:21 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b028e6a-de6a-6ca1-79c7-5b9c6e86c021@gmail.com>
Date:   Sat, 3 Oct 2020 17:16:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2020 09:59, Nicolin Chen пишет:
> This patch simply adds support for PCI devices.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Small nit: yours s-b tag always should be the last line of the commit
message because you're "signing up" words that were written by you.

Tested-by: Dmitry Osipenko <digetx@gmail.com>

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD47C7EE45
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jun 2023 16:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjFHQh1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jun 2023 12:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbjFHQhZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jun 2023 12:37:25 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059893582
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jun 2023 09:37:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30aebe2602fso620119f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jun 2023 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242193; x=1688834193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pNk68q+7zbdsdarhOc+d50LsIq76Wg69t1sctQMCkk=;
        b=I4zPN/XyXF6tAEtmOw3JMdhaa022PkhD/0L6zcaPeLBcHjFHFFw3jnOoXK7CLiOLli
         D1yf1anJkU/I/Z/H/TDfcx7i49o0Dy5cwGkWau6Ll47kinCr+/zaByFfH3+3B2lKh9aa
         zYwZMt/XMuPebEaDxbvq7irvFybsHlisf04lh90463kInMXaRMntJrbEW59JyXJzpZVJ
         kxxMmrTrH4Sf2t3iWBDhK2WXVf6dcTzccUu934qeQPh3dCFnX5HMe40F6eUjtl5tWwfW
         xnd9pwWKV3chZVqFeulLe2OIFPIsWHSJsWizgZZyvgZQvob2OamUTNvvFEIWxuACYzeu
         4dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242193; x=1688834193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pNk68q+7zbdsdarhOc+d50LsIq76Wg69t1sctQMCkk=;
        b=BGpB8MZujHrN3mjoVUyQxSZPPtGE0fjm2LKRp+47wcoesHcdT+bHRtb94TY0Zo1GOO
         4T0m+1IAZWL6/TrLKIrGpvF+7ItsNZ3JzYLHXmSUdpgdD+3nYYdr84KLzIo7M68A4mVC
         JoOxQFOiGBZ2a4wlq6gT5cHwzxuaLXx4xGVfjlFXiHRfZ1TCXP2fgK3/QoVdCgZBYR7B
         M4PczldCSumBj2OPFf+x4MYgstnC28KEG57DC5sE4gSX7M7E7lc0bi///fN1Xbgiuzh2
         bkxV4FZnooT3AAlVVmK60ZLS1iXX1LrIYFrFIiM/eIL19JRQ6sNG15MEZFsWiCg8fjgm
         3bcA==
X-Gm-Message-State: AC+VfDwDTwORNvoEywRwldihRxXD+LFkLIn9b7ZkLxKThUrx4jDatmgE
        ZgNBt1fBwLwjbq0VJYWbEuuv3/e3rrY=
X-Google-Smtp-Source: ACHHUZ6Ug//+wNn6L8gge7CGSp0qzkRd5HcSINhbnS5jCJ7ryeOJuslmAfv+8T3RbUo8T6snxrwZ5A==
X-Received: by 2002:adf:f909:0:b0:30e:5959:8492 with SMTP id b9-20020adff909000000b0030e59598492mr4291832wrr.30.1686242192792;
        Thu, 08 Jun 2023 09:36:32 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b0030aded83385sm2077084wrv.27.2023.06.08.09.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:36:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Bharat Nihalani <bnihalani@nvidia.com>,
        Kartik <kkartik@nvidia.com>
Subject: Re: (subset) [PATCH 1/3] soc/tegra: pmc: Use debugfs_initialized()
Date:   Thu,  8 Jun 2023 18:36:30 +0200
Message-Id: <168624214854.1815116.18246475419826142015.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606153608.94289-1-jonathanh@nvidia.com>
References: <20230606153608.94289-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 Jun 2023 16:36:06 +0100, Jon Hunter wrote:
> From: Bharat Nihalani <bnihalani@nvidia.com>
> 
> The kernel command line parameter debugfs=off can be used to dynamically
> disable debugfs support at boot time. However, the Tegra PMC driver will
> always attempt to register debugfs entries if CONFIG_DEBUG_FS is
> enabled. Therefore, if CONFIG_DEBUG_FS is enabled but the user sets
> debugfs=off, then probing the PMC driver will fail.
> 
> [...]

Applied, thanks!

[2/3] soc/tegra: pmc: Add AON SW Wake support for Tegra234
      commit: c3a1c97c72601f8c00678f0ebafb574ec6e26d54
[3/3] soc/tegra: fuse: Fix Tegra234 fuse size
      commit: e180cf836433185d0674ade52f8db911d89f6422

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

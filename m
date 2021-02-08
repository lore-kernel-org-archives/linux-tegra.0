Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8951AC433E0
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 17:18:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A24964E6E
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 17:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbhBHRSI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:18:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234058AbhBHRRp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Feb 2021 12:17:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E511364DB2;
        Mon,  8 Feb 2021 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612804625;
        bh=4j1v1HgCxEVymgzA25pFBVOP2/CDjNgpZhGATI90qjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f+35AhWlSk9Uv97fDRnnwsI3JXQL2rwakBqKaEt3Zuwk9cXtSmD5bhLxzaWS+R31e
         H1Y2lDieoLr9VP6c1/KpPPxIJM7qJ98ZH780Zz0eRFe9hO/MGO1RfP5ENncXCeaQBq
         SGO5YoIRBnxzbT6JyrHShXMgitHp9y9hYS/jaxe0gLhCv1o83+XsAcFoPXzC0MFc0H
         pCRx/FfKllzn0dTZcfTYE+wGDIoCXxUkXD/mgdZaYO1dKzERzH5gtaiyT2VBMszi0i
         3Daefoa2sZMY0Zxek+QJLfH4P5kneM40OCWMo2N+TKDYzAJ3qvJu+8Ra8tswYJ9LH2
         6gNfMppFf5OtQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com
Subject: Re: (subset) [PATCH v2] memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Mon,  8 Feb 2021 18:16:53 +0100
Message-Id: <161280460935.4459.17967204892240344113.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1612684970-125948-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1612684970-125948-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 7 Feb 2021 16:02:50 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> drivers/memory/tegra/tegra186-emc.c:158:0-23: WARNING:
> tegra186_emc_debug_max_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.
> 
> drivers/memory/tegra/tegra186-emc.c:128:0-23: WARNING:
> tegra186_emc_debug_min_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.

Applied, thanks!

[1/1] memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
      commit: 321b36c79c431957c8c599a9f9640096c305cd03

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7BCEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 15:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjGUPUX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjGUPTe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 11:19:34 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A3D3AB4;
        Fri, 21 Jul 2023 08:19:22 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-521dc8ae899so2386244a12.3;
        Fri, 21 Jul 2023 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689952760; x=1690557560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPMtGh6qm0UzJvqJJKtJbrUql9CBCXViAKzVFviy6qc=;
        b=HwyuNbRWBYLnsixcU+YMikz4FecfFcK5mvr2XcScmte9B09uXLhAHbNN171qQJBIlB
         Ig10e7zBiMHCjDE6IbpofA53P/ycd2BESj+fe41t+sp9koD/mRDRlY86aXRYk/zOBK3+
         xnadoV6UQviq5AUWZf+dxJYMH081iJ4QPizwVZuUQ6PCiGYAY3HIGDb4jbfdaUbR07h0
         tGgW7VV3a5M9a955Tl7uvau3/jbWPgTMunLMkEexdYNEbWzjK+hmI/jMPIXQ8tZ4zu3c
         xn42t/zPpUl9sKeFflt5vZoYgy7U1u4WL+/mCphXh9P9YzbWbHHawl2CxfKpuGZL8uYM
         7QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952760; x=1690557560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPMtGh6qm0UzJvqJJKtJbrUql9CBCXViAKzVFviy6qc=;
        b=HZMv7D9WStCgS8zFdNbPvXJ6LBuPv+YygLqx+BMJFOEnFLXuU81H6CNk9d0ZY9mCyl
         +fcyLM+MIHfhVc4IBkXBlQAK6KQDw4y0dv1ajR8PD9eiyx1voo05zBJ/vY1zX51XUN/+
         B/i4QFypZSedtrsvdBttJg5QnLDsRdmAtx11gOoqFS5COi3KR45qtFqRKUsemqhpt3+9
         2QrtuvRnvE4Z2qm9RS1FtcD/2QNEYMV//QMO6k+6FvHBiok1XByRDINXVxhqWmhLCHJh
         Zyvqjy10+b8AUQa4DGOtIEtssdM/tS0iAXg38rhlI59N+FLcOAi1/DqDPjzSC7Oa8RMk
         EAbw==
X-Gm-Message-State: ABy/qLZIpHcNoIgytPyyEo0Py5eFq01PsLN7QVpV51uwOJT/yxUi9D3i
        3CLAnLGtJBRLBbpSVqQzmq0GZbyl+a0=
X-Google-Smtp-Source: APBJJlEUEai2WVVmThSNQtdpg97Y62coDzJW354nrfDAdnb2OG/eMOVfYYXzLZEpB7akf3gT4ehL4g==
X-Received: by 2002:a50:ee17:0:b0:51d:98d0:3049 with SMTP id g23-20020a50ee17000000b0051d98d03049mr1708575eds.21.1689952760341;
        Fri, 21 Jul 2023 08:19:20 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h2-20020aa7c602000000b0051e2a4edfd5sm2226844edq.21.2023.07.21.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:19:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Shubhi Garg <shgarg@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Add PCIe and DP 3.3V supplies
Date:   Fri, 21 Jul 2023 17:19:18 +0200
Message-ID: <168995275289.3655268.14541352228230086583.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230531085052.3082394-1-shgarg@nvidia.com>
References: <20230531085052.3082394-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 31 May 2023 08:50:52 +0000, Shubhi Garg wrote:
> Add the 3.3V supplies for PCIe C1 controller and Display Port controller
> for the NVIDIA IGX Orin platform.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Add PCIe and DP 3.3V supplies
      commit: 84ea422262387d050ed46e896371da79fc31e7f9

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

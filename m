Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F361EC47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 07:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D160F613BC
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 07:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhFJHYY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 03:24:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40761 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhFJHYX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 03:24:23 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrF1H-00006T-6x
        for linux-tegra@vger.kernel.org; Thu, 10 Jun 2021 07:22:27 +0000
Received: by mail-wm1-f71.google.com with SMTP id n21-20020a7bcbd50000b02901a2ee0826aeso3441882wmi.7
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 00:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VadSajW5H4JLmd3wkcDKHmTiiBiDnefV2rMQY04z28=;
        b=nq299363wr8NPqGHGss02hMBwrWEbXzVK6GV25VOMZyrugHRlJpTp9xwwi4WCGwtnI
         nJ5nMPalVYSsgfECggjAbdErcd67pxQjO8HXuM5sRS+gBZWzXxSnaWN9KMxJdcdgoyrb
         34V2pYMJpbVUt4+q/AUqXRKxFw9HSR7Cd993rvjA/pr368U3zswJfP+Tu9PFuxAAGHOh
         9JOkzMVDZHXsfBtnonJkul67VgN1HsS+95gP+5LA6l+rJw0L/nwu1y5xGsNf+4wYhcTD
         Bg1uVmoVUFFDL0/lBI6G5wp4T1KX4Zx2d137XuFXWGit/idfmeMZYobPoFDmZXvOQaMh
         NFVw==
X-Gm-Message-State: AOAM531mZEJYrQsvAWT9BqwPeYuBDj7GvuQYOCHFSA1dz0YdAQdckyeJ
        Rg3gJTbbgSYNmalCJaISEOhd+qv7053d/N2ouzc59E+dIPreuLTgWBvY2AyAG9fLi+6XwnLpFEH
        BI/1LYq7pcLe+xRZurWVUQupfutag5XKZHFJ9Vqkf
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr3674104wrr.71.1623309745468;
        Thu, 10 Jun 2021 00:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYKqp7/tU/D0jmZXC6cq5GMH3PaAT2LB5mizmzqtiooFKKcoD4gXmpsPoaVVfOWirvKR1XqA==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr3674072wrr.71.1623309745252;
        Thu, 10 Jun 2021 00:22:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id j11sm2024658wmq.4.2021.06.10.00.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:22:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nathan Chancellor <nathan@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Delete dead debugfs checking code
Date:   Thu, 10 Jun 2021 09:22:16 +0200
Message-Id: <162330973162.9991.7770026774132794997.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YMCQDTSyG8UuQoh0@mwanda>
References: <YMCQDTSyG8UuQoh0@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 9 Jun 2021 12:55:25 +0300, Dan Carpenter wrote:
> The debugfs_create_dir() function does not return NULL, it returns error
> pointers.  But in normal situations like this where the caller is not
> dereferencing "emc->debugfs.root" then we are not supposed to check the
> return.  So instead of fixing these checks, we should delete them.

Applied, thanks!

[1/1] memory: tegra: Delete dead debugfs checking code
      commit: c7c65703260c88a3e4d7387b2d03023c3625c6d4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

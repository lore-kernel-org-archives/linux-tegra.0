Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D55C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Nov 2022 10:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiKJKU1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Nov 2022 05:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiKJKU0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Nov 2022 05:20:26 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C539FE4
        for <linux-tegra@vger.kernel.org>; Thu, 10 Nov 2022 02:20:25 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a67so2310712edf.12
        for <linux-tegra@vger.kernel.org>; Thu, 10 Nov 2022 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT1sp5IPFlqAEGyaQKXIUIsFWQxK+jocZJELwyh5E0w=;
        b=pBqPySRnHpyjJKe+ZBXagkUziKZPW/TImdx+vl4OfGoT9HVFMB3g5FYzMChNCzMIQO
         xdtitKR4yHXxwO653Swmltzv5EnaKy70V4153yGyy89JVmGY/7fXk8JhBdG+8sdWUy3U
         UW7mZHQLmSi+AENdVeIF5Qj/sqd8q9pqtl2b4cDGbMoy1ykuNhiOi5eKUcviKfOTzmO/
         5l0wn//FrUB0W1AV5VaVDRGug+fm+A74IYCk3CK37EFs8BEXwTiNmZQR9slMlwbUiixx
         h3h3G6nhzerbiu9HruFtykqs2Mu8VJ1/xFoTYVrX/i/FukGpJFRReo24grB1RwGLoZa2
         SBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT1sp5IPFlqAEGyaQKXIUIsFWQxK+jocZJELwyh5E0w=;
        b=1AD//eHqUn8tDknLojNwReald58w8vwCztomOPzHZM9qaN2srNAYBrpD52gVpLbZ5X
         rJ13LrjF3iu5T8mlNCD5h2JBWjfH7v5sbOCucQhoaHAEjU67uByr5PHEVjGWvfB91ULN
         kYwZXA0qa3KAfnHEgedWR51rTiKBHGe8Ka/k+5bNqs0vs9P01WIZkyR/BN0RZnBPx/UE
         c2SCKE6xH9yBH1Xn5LVEmSzi3kCpC6IUVDVmC/mN4atFn+RKJLmVMR3/JpOwh8xocDAq
         y5CkG2jxRUtepdQ8ZMGjhB72tgrP4MBnpRNSXxDo3jZhbgIsa+Ia0yoKrpV911sip/xQ
         A4yA==
X-Gm-Message-State: ACrzQf3mMvMRYs8eEaNA8oc41yz0LOEhkeHUtM9Y4Wt+DBaAxUuHxHCY
        X41IlbBLLW0a+idlLiz9AHsXDut8qFU=
X-Google-Smtp-Source: AMsMyM7AM8HzOXBUhXvmNiVy48+7gon51CuVPmNToIk8pMMTZ49w9wO6yapdghVw78ZOaSpXDkqWUg==
X-Received: by 2002:a05:6402:3512:b0:461:bcf0:86dc with SMTP id b18-20020a056402351200b00461bcf086dcmr2073597edd.368.1668075623499;
        Thu, 10 Nov 2022 02:20:23 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o17-20020a170906601100b0073d83f80b05sm7047991ejj.94.2022.11.10.02.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:20:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
Cc:     linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        iommu@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] gpu: host1x: Avoid trying to use GART on Tegra20
Date:   Thu, 10 Nov 2022 11:20:18 +0100
Message-Id: <166807557587.2565903.17395326570545995355.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
References: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Thu, 20 Oct 2022 15:23:40 +0100, Robin Murphy wrote:
> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> bus") quite some time ago, the GART driver has effectively disabled
> itself to avoid issues with the GPU driver expecting it to work in ways
> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> IOMMU device registration") that bodge no longer works, but really the
> GPU driver should be responsible for its own behaviour anyway. Make the
> workaround explicit.
> 
> [...]

Applied, thanks!

[1/1] gpu: host1x: Avoid trying to use GART on Tegra20
      commit: c8899b7129927d96d2a948a0d969ab13b9f1dad1

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

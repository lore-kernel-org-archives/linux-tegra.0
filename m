Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56D0C761AF
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 12:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjDDMTx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 08:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbjDDMTZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 08:19:25 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3857440C1
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 05:14:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so129748007edd.5
        for <linux-tegra@vger.kernel.org>; Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghmTYqJOyZOn2MTihV4T6tw9iNwJh1T6pNKtc6GlOxE=;
        b=h1PzQUMXt2Uk/Ldc2XTLIZtB3WPQOEdRjphdDOBgAEcm1KmHS76fpTq5BoiDONEemN
         mBisOKtJ8ujURSQl5crnW6uhdg3juvp/K9EysVzMQ9nUO6H5kxdkq6ZY0Fi9LhrgBpC4
         c8E5273o0S9gIzLnlWjV/z2CbRntYc4r0Xr+Aa1T47YEgCnjPkZD9AKFv3F/vAZdJLHb
         9AXxhgMCsrDibV+Bz7Tt+Ic/a8QU9bsmhvrpL1e+y6H6mT6YJRsRL6LNQuQxxUf+Z3Mx
         uoDrk5agmiPHcZ6RyPcdrRFk8TxNjwVeU7jRj699oW3TBJCHeAg9+D7u8qimvVdFQ/+0
         nrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghmTYqJOyZOn2MTihV4T6tw9iNwJh1T6pNKtc6GlOxE=;
        b=YNlHji39OgXKQw+plqSIKBESpmoU0AlsTsB/NsAnuf7PusuTtWRaHL488Ts54so6yd
         1qmj38HTsVP2H3PCullf3zryRMFloX1F4d6gX9qj5PpW7Xwf8Z/E2vK8hXUxUiweoMh5
         dHxeQy3g8Y/hPHBakzdk1qZfry+eC6MV48VGGHFDCFUihuQKL9b8T8oC+zi3pnIkpVJM
         1SbY4xDT5r5SNHtZ40pWf7JbMY3zAfzzRVSt/XB3VL+tJmq/Nz3d+bHxR9Hv/DlbakCF
         GVW31ajWTnCGpZSE1rVU4/+zaSpDaBtzdc3YcIN7Lk3DtOGu7rjaCh/c5UfU0o67u4c0
         BvqQ==
X-Gm-Message-State: AAQBX9eS6mZlvdctZjur8TKcODY0OAScDlsQb1/x44i/FFNIGmwUqsiK
        m5zOdNfGfpdDtc/kIVUSxbj0SG3l2uA=
X-Google-Smtp-Source: AKy350ZfGorSMIPnJg72IcXpSjnoQ7lSIoJ5Al8iPen06Hp6G0tNLsCirKTEXy26ryySRml3WIgiVw==
X-Received: by 2002:a17:906:13c2:b0:8b1:fc1a:7d21 with SMTP id g2-20020a17090613c200b008b1fc1a7d21mr1724192ejc.5.1680610494608;
        Tue, 04 Apr 2023 05:14:54 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709060b1900b0093e39b921c8sm5850341ejg.164.2023.04.04.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:14:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, thierry.reding@gmail.com
Subject: Re: [PATCH] drm/tegra: allow compile test on !ARM v2
Date:   Tue,  4 Apr 2023 14:14:45 +0200
Message-Id: <168061024447.2054665.2842597656281966346.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322103915.376533-1-christian.koenig@amd.com>
References: <20230322103915.376533-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Wed, 22 Mar 2023 11:39:15 +0100, Christian König wrote:
> This compile tests on x86 just perfectly fine.
> 
> v2: fix missing include complained by kernel test robot
> 
> 

Applied, thanks!

[1/1] drm/tegra: allow compile test on !ARM v2
      commit: 224718f4e59442e205524c7307815f09148f051b

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

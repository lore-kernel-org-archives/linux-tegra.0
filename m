Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D79C47082
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 09:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5C4961249
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 09:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhEaJDx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 05:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEaJDw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 05:03:52 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E02C061574
        for <linux-tegra@vger.kernel.org>; Mon, 31 May 2021 02:02:12 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x8so10107233wrq.9
        for <linux-tegra@vger.kernel.org>; Mon, 31 May 2021 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7rJplqz1B4mRiJ2dwI16PchKlluJ50WrZ1kh7PRVcNM=;
        b=aKNnojQsHm5Q3sD8Wo2gfxUH7swgBb4Bj0od5iCRSO8CM3Nxx2KbzkaeRqxduWqJAX
         jrMzdo7iu0nGGpvdTiGrI1CNo3XfXKBOIwYt/4Dl4mUegiB0JGN6CtCBHiu+avkWmDmk
         03zwXdkNrNwg3JCSkBilIEJtPF+IkfYDNJVTfLh1Go9e7ZCmoY9H5ZKxErp6s36IQ61U
         kvGC9Hz77AkQgnhW80bUUQy+fziEX69/rcSlf5ISJPtRuqvdmD087BuM3k57m5GeyMVa
         Hr+6qlcwef9pTriNBZ0z5xZG9+oxtCcvR466P2I3aOw+WbznindftPNsU+2CcSqXbqoS
         gDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rJplqz1B4mRiJ2dwI16PchKlluJ50WrZ1kh7PRVcNM=;
        b=jZyyZWQXeHANSBSmwwjRnZ7hG+HqElUMCoB3oIYeimmogdWQ8a/JXjqDcBq+FYjFQG
         9+CVv/EsgF2xAfUMUSNI67DF2TRximtLifeD5ngXntaKLMUhtT135WzKpd5rJh3lNYEg
         oi57FsKP4b32hqpNu6QGe5M/XmSGoygpealeFxNwUdodevKGfiv3sxH467x0Nvca8pD3
         KulaDP7a2/MyofjwAppQHgE6FbCsivu4jcFj1a+jg4rmXiT7uZFVgXFnwPsiQyYDV5ZG
         XJ8UOKwhigUHNbCF42ze1XCORuOOHKAoKw0RqiiWM0COf1+SCCsM5N0AoQawh+XrLp/x
         BvGA==
X-Gm-Message-State: AOAM530ghjSKJqsHXHiPOa3KQm/J9+gOc5EVfwcFsc+KEUY+zuboosve
        lMb5HWCRWm+4ftyyLAa62Mw=
X-Google-Smtp-Source: ABdhPJwlR3gPlkmEtFNoXZ53E3/8KCC8B/9daZ0DN9jGxvzNDIv6mRFag2NXf8DL4r7zxGRSdAJLtg==
X-Received: by 2002:a05:6000:1147:: with SMTP id d7mr21577790wrx.302.1622451731364;
        Mon, 31 May 2021 02:02:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k11sm22383677wmj.1.2021.05.31.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 02:02:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
Date:   Mon, 31 May 2021 11:03:44 +0200
Message-Id: <162245181129.52988.11893553794139124150.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530195506.19124-1-digetx@gmail.com>
References: <20210530195506.19124-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Sun, 30 May 2021 22:55:06 +0300, Dmitry Osipenko wrote:
> The format modifier is 64bit, while DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
> uses BIT() macro that is 32bit on ARM32.
> 
> The (modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) doesn't work as
> expected on ARM32 and tegra_fb_get_tiling() fails for the tiled formats
> on 32bit Tegra because modifier mask isn't applied properly. Use the
> BIT_ULL() macro to fix this trouble.

Applied, thanks!

[1/1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
      commit: cdbbb5978467469a2ee2311ef0efc407f8c0bfea

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

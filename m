Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04C3C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 08:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACA3B6109E
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 08:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhITIgA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Sep 2021 04:36:00 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51676
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235887AbhITIf6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Sep 2021 04:35:58 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 083EB3F338
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632126871;
        bh=QOuDhjEYBpbLsCkja2E5kIg84mTo7Mp3bww45iwZuuc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=g6JzfbbWEYxZz5ei2fucQV+VI0c0khFzhk07yLSYQtm8jvpeLkcnqhpOd1nahbCBz
         c/gOVi6jRd3aDRVkdbJIPOcgs5rLbl/9jgTyMwD0+sgvwlTKpMvpbPSpWuaCHlvUoR
         lsvy5EttoMxjdNiGKHjoJVnKdxSE8pkgQVvXVwI/fLhf1B+QwoiYU0Mzqw9sNp/17Z
         VaKKApmuLrO54yen2Uu5aW+hpwxdc/EXRP3LR569TozsIPKFMxlUv6qrG4qajLZJyj
         nTIxn0fA9z03PY0QfRC9J3zBl2nkF7ulK4wNkjdTgzzXQ67p3zF7Zwwgqt7n4g2boG
         gk4Dui88ZIcFg==
Received: by mail-wr1-f72.google.com with SMTP id z2-20020a5d4c82000000b0015b140e0562so5562431wrs.7
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 01:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QOuDhjEYBpbLsCkja2E5kIg84mTo7Mp3bww45iwZuuc=;
        b=p94bAjeipK6cJp+8iJ8oILQTez+51oP9bwsP2a6IKrIEWntMXyrN7ggBPzSlEhXn4v
         pRtdW9LJoiZzHGphaOzmygXA8Ziz7Njsaa96UvqHufMsvMSLXml6/2yvQ5aczddBW2B7
         5pXPEaypmlppeGT6RoDBlf3RnCRFBKqnr+4tR+Hd3ZfekWFAOSStvj4FgOryL7wiba1Z
         4/vzvhg91Hpm5Lw/C2kP8r8qfEWSy+zFunTmYSRqC5UbeS3lcicQgq991Xu10UFH4ArV
         afHqQC2y5XwN1VK+GeWg5hhnHIXhNGROjrvgNrS6uaI+w3QzmrW+JHfjTP9ca5NELUYI
         2ikg==
X-Gm-Message-State: AOAM530b01l07s2ysapSM3XFcheu3W3DvFe+lm/EwhIHQkCcqkkaYqtH
        G09wqyNLftX8tVks487d522VuCcuRxSXAXUZqISbYNVqQGmRGJBK73zkVWz6lND2nOwWEn3TvkB
        Ywsqsf4zq1Spvveyer2V0GVFPj1KjKJBsm9nmF3PP
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr28624764wmh.139.1632126870728;
        Mon, 20 Sep 2021 01:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/Z8xXI2Qq35LGBSF3xaoKtEJihngmysxU/0sHU8yCajr8fdzEoTawRUZVVBarprNDrWcgkA==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr28624744wmh.139.1632126870473;
        Mon, 20 Sep 2021 01:34:30 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id v188sm4658891wme.38.2021.09.20.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 01:34:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] memory: tegra: Remove interconnect state syncing hack
Date:   Mon, 20 Sep 2021 10:34:26 +0200
Message-Id: <163212685894.112070.3043725946674605837.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210912183009.6400-1-digetx@gmail.com>
References: <20210912183009.6400-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 12 Sep 2021 21:30:09 +0300, Dmitry Osipenko wrote:
> State syncing works properly now, previously the sync callback was never
> invoked. Apparently it was fixed in drivers core, so let's remove the
> hack. The state won't be synced until all consumer drivers of devices
> that reference memory controller in a device-tree are probed, i.e. keeping
> bandwidth at maximum until both display and devfreq drivers are probed.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Remove interconnect state syncing hack
      commit: 77b14c9d05bd72d6a3f11b4982591d6cb0090ffe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

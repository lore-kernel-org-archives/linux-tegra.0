Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97303C77B6E
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 12:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbjDDMU1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 08:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234837AbjDDMT1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 08:19:27 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3274A40E0;
        Tue,  4 Apr 2023 05:15:23 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id i5so129916225eda.0;
        Tue, 04 Apr 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNeLO/yfrx5qZBUcRPTS1m46W0sJKNmgtcjlVQfqLK0=;
        b=MX1GkM/k7Wvv4kVwPD5iJTZypvDu1JvY7Br3/Lx9HxZylVr1cdixaKy7MpHGbtJl68
         oueFBklE/kvlMwon1iZdQBFezLnc0xc4gZ8cPRAH2FY+HertVLVg4N8mj4RDL09bDWwo
         JNAeA74R31LQ1hcpJRbFW6cI/rHB6EswvmmJhJKO+59GHnDVuZhzMy1j5lWDv4wpAlhy
         bjqnGqkVFwRV+pEPjBVhE1x+0AO5SiSo/p68IHQRs6fkqElP6NBBrhdIF19tOkiqzyT8
         WXUsInRs3BZ42NgZOz05MV3EfMBEXGdF8C4ewdjsJixVJztB5ePxwUCjgXzU+9L87gtS
         D4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNeLO/yfrx5qZBUcRPTS1m46W0sJKNmgtcjlVQfqLK0=;
        b=HFpmlr75rh15rNHhORvKSwDGm4MRd3v//L1lDxxaElMUTlgSwuRm09LBmD6KZvphRR
         TsGaVF/epWAwGYKkdvAtDNXYqQFlD7sX9+3YXK951/cGAPiEEroddldHvVHFl6PjBK9f
         ZZE/O5BScS6lOsHtZNLHIfAwyTC2VJF5mgZ+AQtyQUx09Hz4HK9ULz8BX5ooKMjHTYV2
         Nn/ImOvwYU/AxOcUiIqjgag2rqrkNN1KZEPVpTOoHCOWHQotelbV/5hFwwJ6oTOXNmkj
         gXkmKu1vY/B+xvpEgf2hJhD0us9mJZU/uw5qMeizVCbV/l1pLZ05uAgHZjZdKEl2eYCl
         NxYw==
X-Gm-Message-State: AAQBX9cnGDeo+W0YtwwhaKtaSLB8YmHW/Tjcs8tuy9LuJpXLQZr2bzfB
        jlucVQYZXiAHiknQldFUwek=
X-Google-Smtp-Source: AKy350bQ71nVxPcoRSh43ab4cRnZtZe6Ur+WJgNdzEfCmeG2QbKWF6iZ7ySINe5NarE8PgKOKCIgVQ==
X-Received: by 2002:a05:6402:1204:b0:4ac:b528:5727 with SMTP id c4-20020a056402120400b004acb5285727mr2477500edw.1.1680610521704;
        Tue, 04 Apr 2023 05:15:21 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i24-20020a508718000000b005024aff3bb5sm5809772edb.80.2023.04.04.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:15:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     dri-devel@lists.freedesktop.org, airlied@linux.ie,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, robh+dt@kernel.org, arnd@arndb.de,
        sam@ravnborg.org, daniel@ffwll.ch
Subject: Re: (subset) [PATCH v2 RESEND 2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
Date:   Tue,  4 Apr 2023 14:15:20 +0200
Message-Id: <168061050774.2055282.2696750809957075732.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20221128162851.110611-2-diogo.ivo@tecnico.ulisboa.pt>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt> <20221128162851.110611-2-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Mon, 28 Nov 2022 16:28:49 +0000, Diogo Ivo wrote:
> In cases where the DSI module is left on by the bootloader
> some panels may fail to initialize if the enable register is not cleared
> before the panel's initialization sequence is sent, so clear it if that
> is the case.
> 
> 

Applied, thanks!

[2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
      commit: 588ed52d31ab37c5ac86816911f6428d2de265a6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

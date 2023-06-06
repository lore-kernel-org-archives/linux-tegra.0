Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A261C7EE31
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 13:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbjFFNDp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237745AbjFFNDo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 09:03:44 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF88410C3;
        Tue,  6 Jun 2023 06:03:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1b66a8fd5so48719801fa.0;
        Tue, 06 Jun 2023 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686056620; x=1688648620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdODkH7Tzwxzse5RHfJ8oPMVo+b4RAflsc6QqGYYYko=;
        b=CkQevDbkwxdmD/Uz4jnsPvgu6XqBsi93lBOoHn5ViBmVkiFDjex0kih25p1LdfTkdJ
         q7Uu7FT9P7t3gUZVGZOKR0KUwD7iJNOdqrSpr5EilrbX64V7jfzfb8qUA1NeIy0+WobV
         KL4xoMZsAl5/PiteheEgliQVtTCmEB1CxbkhPYIQdzloR83oSpB3E+S4KtEUzlELXeOL
         K1oFp1GY6V8/sy6SDrvFQco4dZc5ygK1PnzndKRZfTDR0FFc6JKxwbYDk1IxM6zj0x7Y
         ZRDGX5bKH9ykEaLyme4EgWqRznxmdl6hSjHhY+SI+j980He1hCmblU83lN8BliJf1lMu
         O5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056620; x=1688648620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdODkH7Tzwxzse5RHfJ8oPMVo+b4RAflsc6QqGYYYko=;
        b=gxApzkvluGQZCRLeNPGF5L8Y/mzAWT0fgBpSiBjct4FKH49JkyXC3/rTRf6iO+SdAP
         YpRGeQB0i8Q3lNk5eezkxJHl9EBsHmyp4kRjcMk/yrbZZOBpQdZssqcyVa1K4Fm/TAuu
         YeDiMA3z640IVaumZRgw/iKyxgpw4NBhVd629bw1cZpYL9kPxKCG5jo9DeqA7vJA4FCL
         vIjx+6TCvbCH3r7P7q/LiZ8lQlpYggdz2DblvRCOGoOm1Zkdz3rKD1NMNLfWXnLcRx2y
         kieCuQGeNFu15mahiKn2u766sVE4ZF6JP0/+qm/wuvns2qwXcB8aX6O1vjxmMWjF8mpr
         7aSw==
X-Gm-Message-State: AC+VfDx+VhqkBMkDVGuMK5LAJH5GcSzxbYUBL8PAdyrzDlUxfVbHXwaK
        9tzSH/0im/wgFEA9BWG5gTg=
X-Google-Smtp-Source: ACHHUZ4sxCC0WdIdOs/u71gU4mtYqBRsqlmFePCiqPj5uBDqjubTWioKwkSOxtsCGdafJpdp3D66rg==
X-Received: by 2002:a05:651c:8a:b0:2ad:a9c0:1236 with SMTP id 10-20020a05651c008a00b002ada9c01236mr1137357ljq.6.1686056619647;
        Tue, 06 Jun 2023 06:03:39 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e26-20020a2e985a000000b002ad1ba6ee36sm1796177ljj.140.2023.06.06.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:03:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: gpio: Remove FSI domain ports on Tegra234
Date:   Tue,  6 Jun 2023 15:03:33 +0200
Message-Id: <168605652833.2915879.6545121290981220193.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530105108.1292681-1-thierry.reding@gmail.com>
References: <20230530105108.1292681-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Tue, 30 May 2023 12:51:08 +0200, Thierry Reding wrote:
> Ports S, T, U and V are in a separate controller that is part of the FSI
> domain. Remove their definitions from the MAIN controller definitions to
> get rid of the confusion.
> 
> This technically breaks ABI compatibility with old device trees. However
> it doesn't cause issues in practice. The GPIO pins impacted by this are
> used for non-critical functionality.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Remove FSI domain ports on Tegra234
      commit: 12382ad05110b569d95d29c637e16bbeb115acca

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

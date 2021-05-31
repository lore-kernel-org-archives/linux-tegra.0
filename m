Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602E9C47080
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 13:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FA9D6143F
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 13:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhEaN01 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhEaNYV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 09:24:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D926C061379;
        Mon, 31 May 2021 06:19:20 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so8878448wmk.0;
        Mon, 31 May 2021 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zvbEIu2BV93FiMImPaqnswLQvA4SrNnXdSGRLdpJ0Bk=;
        b=gX1I0aHJf1uJyiOaDgIFaMyPs7TD4ai+rzboXtb1MgKyprcQoUBbP7eGjsfd+/SUet
         6nHhA0puYgKlDQa+6fjK8IUy84+mhHpXuA8XxCi+x4JkYiIqJ4VslP9duTR6OOwDdIAd
         vhcrJvjBOeezqb69tprlxC+OH5qH9L3xCm0wAoIQbAk+P9zRX5FMxwVtm+1vyXJYhR4F
         VirveP2J/Zyq2QRuBH56uzFgSLVCMySe37Y2e4CgaSKAC3LAWGlfGGzzjEmdpntEV6Gn
         YrrLbQvUgs/3BL2D80EPemTnU0B4EVe3ztaFdaXThv1YAF9r2rA9A9QsDvakUMHXeR4i
         /5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zvbEIu2BV93FiMImPaqnswLQvA4SrNnXdSGRLdpJ0Bk=;
        b=TT7Qxwt9IsxCcCzXkjSUwbamRjcKTSenZtsVvA9DDDB75kj7dPDiPb4i8gbWM8fQ3f
         deUkFmmBi0X63GYKoydrHjZTEjWgKvC2X5WJ69nRW8DGrkn4uu3ogm5wZA9mJlNs2nvl
         CuodUOVDrslNKnmy+WMDeY3LePm4jYWsaS16UOPjIcvbPgLO9Z2lfnPizQJbZA+/pidK
         yW/QVVY7kHHAGEFdItZWQIrdBuFe7FwbMS4/hg2Yfn7eFOnTg5MJc4W6goCOTyPdVnaN
         9fpNwHatTyeS8tgNqEEW8MseUs1yUVAM1mc1fiVxaUUhrw8HsOR+IdYGEqwEcm+3VpnN
         1wPw==
X-Gm-Message-State: AOAM531VgOSfeNWNY/WFaiu0GjZdo0usooIKFbA48ymmx6scybIKEVj8
        zv6yY9g0jT1Iv1MiQGvoHbI=
X-Google-Smtp-Source: ABdhPJwaz2rpB7ZomQrsmibZA+4vBuZ4jr9GT8H64wpNHDiHWt3l8SxJ7G7VN/Z0wnkF9YE6gL/hdA==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr25632250wmb.158.1622467159031;
        Mon, 31 May 2021 06:19:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c206sm23167296wmf.12.2021.05.31.06.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:19:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/9] Couple improvements for Tegra clk driver
Date:   Mon, 31 May 2021 15:20:53 +0200
Message-Id: <162246723913.166961.16518962041830449812.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Sun, 16 May 2021 19:30:32 +0300, Dmitry Osipenko wrote:
> This series fixes couple minor standalone problems of the Tegra clk
> driver and adds new features.
> 
> Changelog:
> 
> v8: - Replaced division with a shift, which was suggested by Michał Mirosław
>       in a comment to "Handle thermal DIV2 CPU frequency throttling" v7 patch.
>       Cortex A9 CPUs don't have hardware divider and shifting is a minor
>       improvement here, nevertheless it's good to have it.
> 
> [...]

Applied, thanks!

[9/9] dt-bindings: clock: tegra: Convert to schema
      commit: c4a41429951890d0bf7c1ef49b1fa1c8dfb1a034

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

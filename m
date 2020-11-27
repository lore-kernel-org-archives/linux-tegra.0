Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F94C64E7A
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 663ED20B1F
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTX5yluJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbgK0Onq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Onp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:45 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3ECC0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:45 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 3so3016341wmg.4
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E66e82fRjbScow6xJT3yXxFBjbOJVfEEhjtAQriMYH0=;
        b=qTX5yluJTR+gjG559VMKxKyB4azDDrCkoBv4QeHOuvJsl/hdRLroqXxdcgFbibuPQW
         sDsJqJ+hJjMYrtAXOTioDlimkwRtePMOgDvGCl34gekXWxAoqWam3/2sKhVlX7gnGPPy
         KA3KrUR89Fp1YBPuIwTL3C8fi4RRjWLt3YCgpw4T5jCSuot8hbarevvjzRODRC3TdY8K
         blnaKCZZ2joawr1sOBCOPPYf0ZDA1xp3iaJSYgpre+6pQ+yiTuv6fM0JD2jxZg0ePlQx
         /16fnLAn7Jkl9ARJN1XhGAz5XPSuxth8aof5YY/1R1jKFRbYzn1xDUgH2oM0gbY2GcxT
         WYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E66e82fRjbScow6xJT3yXxFBjbOJVfEEhjtAQriMYH0=;
        b=BhW/5axe6fqBEX14EbhlN43iliQRbdMVdUWiJQoNAfWNJyvU+0SUOXM5NDSC5473TU
         wjI0vNSUkkIVF9KcWDiBR4gUxspDCoHOjyXhHog1KdiovKo3zLcHzHu5i+SwIFJDts3F
         AXPgLmtbeOJoXBiHne49HLuQPseaztTeHUgs0uMTPPHDslPtGmykm4m2CppAS2x+y31F
         DSnXu4mAsygZqSPBNT1ESLTpaLvvlrzFI2+vRF/rYEebYTVjuxFjpchuEX8E41O2WKwP
         ZdMtIp//WG7Wvwkuzmqv0C4N82eX0MX0apeWULFS/r5/LJrV26emRwyfb3atruSh7x6V
         amzg==
X-Gm-Message-State: AOAM530Dnzpm1PV82/Tib26xJLAkKKoUYwruABOKuUDH9Jul+7gtcFSG
        G7Q3NqhgcVHlhJsJ1qGcTBY=
X-Google-Smtp-Source: ABdhPJxHL8Adqw3W9Pc3nfQUhEt5UkMZSbh7wTnVWWyn5qeMtorPwq0+Qy62YalbVE+PugUEqqWylQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr5521494wmo.92.1606488224183;
        Fri, 27 Nov 2020 06:43:44 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i11sm15366030wrm.1.2020.11.27.06.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:42 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:29 +0100
Message-Id: <20201127144329.124891-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm64-defconfig

for you to fetch changes up to 35552c7cb672d2cfd6c4aa2e28b15fdd12315555:

  arm64: defconfig: Enable Tegra234 support (2020-11-18 11:51:53 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.11-rc1

The Tegra234 VDK support that was introduced in v5.10-rc1 is now enabled
by default.

----------------------------------------------------------------
Thierry Reding (1):
      arm64: defconfig: Enable Tegra234 support

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

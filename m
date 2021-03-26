Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3F8C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0085D61A32
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhCZRql (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCZRqa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 13:46:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE687C0613AA;
        Fri, 26 Mar 2021 10:46:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b7so9669178ejv.1;
        Fri, 26 Mar 2021 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eOMEIN65UO+Tayc9sPJ9YykHycySwb6Ld2gDH5Hp8rk=;
        b=Xn8fLclcrAVzoto0VmknyvWmlLVVOayhgI1T8PBpqPJrb+rIO6yMS/6rY4Tm2FnR47
         frFMsD1LQDLIdBYvHyOYmRMFtvCODQYnCuIsi3CkkuVN7e3S+Gm8VQw4s1ohWk7KAxCm
         gW9TuptGYjtczTdIDslvnIOSUz6YGIhUSErZUNb8kVSycROksxOaB1lNfgVig/nJ5Q5D
         HoUdo1fd8mp2nYvjN6NSY3tJOZH+ZlRCYMcF5E4hN7twgYzLbES6eKdHaKAL4jMtZUhf
         0TvkNO1k3wJIzKYTVSxZLThC1H/xWaCr5g/pyiHgWc/Tih5mrhw9eA1qf33lILfJBTiP
         QyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOMEIN65UO+Tayc9sPJ9YykHycySwb6Ld2gDH5Hp8rk=;
        b=El2VYPw91ylvqrukxLheo0MkUz1gj1jKKvWs3vHvzOUxgRhE/b23b16672E+tBYMdU
         mawdmh88xC0ELcUl77gRqi6L+VgpUg9vJWt9i2ktYG3EEhLrriNtaP1hruu02mBO0A4r
         FUvxtSKo7PbOb8PYFdrIMFFC0Befw3HFNyjDUuIo9Xe9cUnlVg0kgZQCdS33i/At6sgx
         Bknkd3AjE92qVmH1TZ2k9pqKoForm4g1ZULJNy3rF27ZLM29DKW3yJHoC2b+ufoU2TM2
         Y/nSYFAIvDmNY9OJ+1dkSENVVSv3tFM0+jWCg7ty+JZwqnx7/pR4wq4cHmbj0Mq/NAQx
         Z5Bg==
X-Gm-Message-State: AOAM530gpFfkdee/MuSeeEgjS80cwTt6HAeaCa/IGZE5ePFN2m2uyS02
        Fjr4pJRjnO4yXU8peFy37ZuBHWYw0+k=
X-Google-Smtp-Source: ABdhPJxl++TTE7mxycXhsUN5y2xAPUJJA2WukfhEdiMsNQhSZGQqLoD60kP06lVzl+8HKNCszVCrsw==
X-Received: by 2002:a17:906:1c41:: with SMTP id l1mr16564561ejg.299.1616780788572;
        Fri, 26 Mar 2021 10:46:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gr16sm4167831ejb.44.2021.03.26.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:46:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] arm64: tegra: Add "reg" property for TCU on Tegra194
Date:   Fri, 26 Mar 2021 18:46:41 +0100
Message-Id: <20210326174641.1612738-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326174641.1612738-1-thierry.reding@gmail.com>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Technically the TCU doesn't have any registers but works with two
mailboxes that serve as RX and TX FIFOs. However, if used as early
console via /chosen/stdout-path, the earlycon code will want to use
the "reg" property to initialize the I/O memory base address that
will in turn be used to access the TX FIFO.

Add the "reg" property to the TCU device tree node to make earlycon
support work out of the box.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index db68d53f5de0..f9fc481f90c7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2537,8 +2537,10 @@ sound {
 		assigned-clock-rates = <258000000>;
 	};
 
-	tcu: tcu {
+	tcu: tcu@c168000 {
 		compatible = "nvidia,tegra194-tcu";
+		/* TX mailbox for use with earlycon */
+		reg = <0x0 0x0c168000 0x0 0x4>;
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_RX(0)>,
 		         <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_TX(1)>;
 		mbox-names = "rx", "tx";
-- 
2.30.2


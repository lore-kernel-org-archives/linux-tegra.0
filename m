Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A4C07E9B
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC3D960FE6
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhGKXrq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbhGKXrm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:42 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAAAC061786;
        Sun, 11 Jul 2021 16:44:54 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id c5so7640507qvu.11;
        Sun, 11 Jul 2021 16:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azI3FQ3xogYeBpKzbdZ5/OFpcQojNSQseR7pUsqw9jA=;
        b=MH1dSYkvBIgUHtZPuMkmRfXI6AnLkLqHE4nScjVTra9wOk0I1FSiUcwdKorpzZZ3QZ
         hqFhYGXXUyOCxF5qsMkhWVXg1ZzSp3efolJFCIhbn2B0FeO6lm1nA6yRUwtaQiGSQ6m3
         FBHUNS5JoswDZu9iPMpM25L3Nq1r2cWQ+WjbhyGidV+wcn0yM/qdis9F4E6QifEmQhwr
         qc5fM/eutf2faPPpqzhiX4yhExRBYqcSRinvu8jDPgmOA8Lnc5XmwyUgrmmYHwWYJY9+
         0b3rn88lXyRLpLue8XYJLqWJYXHZCdi130NdeHieVF1uxLDBVoKu+CSw7pQ/ImXoS6ph
         lv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azI3FQ3xogYeBpKzbdZ5/OFpcQojNSQseR7pUsqw9jA=;
        b=OTvpEYtUTrAN7g0C5k/GI2BIJs8fe0BfHnyejvN7avJNwQc6kJ/+QORnVO4wysTEiQ
         lBJ9QnW5KNF7KBg6qsCXCJGz8gp90ylB9zdMeOeYKp8zH0vg+4CT7AOkhukwnILgUU6K
         sGa4G3dC8EM5ipNnJqOOJWIoXIqD0ISEvZ3yYHzO1N95jAbwh8BDPeo+igylOa/NlITZ
         RYiaPI5c8hPMJtyzpp2qV5gT3yYn9zTV2N90kDtEv/45sRKBc+oaQP+lWrn1SFNxdzWY
         IGnqtuquMdfHjUMVh12cpamAtKS2ir6KnQl2dUwq2/Q+VxeujsgqG/tB1S1RznHyYa+U
         3g/w==
X-Gm-Message-State: AOAM533VBX6GIFvbG/qOKnAwgg+oSnVsSeqyY1Pzf2QJrAvwwkbEPapY
        BJdHJWt7XO/NSU0LhHU8jvQ=
X-Google-Smtp-Source: ABdhPJxk5vgODKNyvnS4oFSN+8UHfzjXWrtlieSbnfIrwmy0mrywn4toWlYpgsDbG/lmoLUjVJ6fRg==
X-Received: by 2002:a05:6214:10c8:: with SMTP id r8mr48130480qvs.28.1626047093453;
        Sun, 11 Jul 2021 16:44:53 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 10/13] ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature sensor
Date:   Mon, 12 Jul 2021 02:44:00 +0300
Message-Id: <20210711234403.24691-11-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LM90 temperature sensor should use edge-triggered interrupt because
LM90 hardware doesn't deassert interrupt line until temperature is back
to normal state, which results in interrupt storm. Correct the interrupt
trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 414cd1cafa7f..35ab296408e1 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1427,7 +1427,7 @@ temperature-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 		};
 
 		eeprom@56 {
-- 
2.32.0


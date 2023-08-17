Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F51ECD62D
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 00:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356416AbjHQX7m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 19:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356414AbjHQX7T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 19:59:19 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13833A9F
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-564b6276941so306351a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316754; x=1692921554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
        b=HTrrZZ+wk74qL34Op1mlB1taurJkAnd7YsB6DcuhqPFWoY5BxKedYKyw/BVOzmxMFL
         g30Pe4HkwYC69jPPfY81Upl2joAkDOLn7binq7aylyfOpUoPLa28nnHt6eNCAsaiaXSS
         hUbFj7PjofegYErrFt2HTzB8fTUTdKU6OagXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316754; x=1692921554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
        b=ftlC67BgUdveqgrQYSkoDwbrrc93HeUlWuAMgGG6mazJYA71a9kYgRhUuwgiCoR6t3
         sntad7eSGjzijxlrzihndLlZs2Z0hOTgz55L3UXY6Wni0LqHNuf2/LkAVisMcJ/y88nx
         Cgxo0mbok1+22UuHsmOGJzOmhcB6K22/hxRCzexOcLkXL9dmCij4au3YMAdsjvH2HjDw
         ieUUIiKsP75xmkyjW7jldiTaUWRFktE2a13iOv+NP0wO0PSSIM8j+/h8ev/ldZ2IkIj+
         EmaMpc/qUfPfuYzbGeuc1kWaW4O8UfLtXLcz1HMwQ1jrt1XCenxkOmhGZwKU+Opf1Fyc
         ZGBA==
X-Gm-Message-State: AOJu0YxcrJ/3xrcderc6x7cyrD6fAAQI+CgeyKbzIOIVCvIH5JPQG5Yd
        fx9AD0ay1snJlb8Wozn1P2EiSg==
X-Google-Smtp-Source: AGHT+IGtcgNnZbWaCWdSXzGTxx8lAj3NvRd0lG+maqih7++bsMmfpiz36E56uky5QKHaPXs/1RnBBg==
X-Received: by 2002:a05:6a20:3250:b0:122:c6c4:36b1 with SMTP id hm16-20020a056a20325000b00122c6c436b1mr1292709pzc.4.1692316754444;
        Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a22-20020a62e216000000b006875df4773fsm307299pfi.163.2023.08.17.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 15/21] dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
Date:   Thu, 17 Aug 2023 16:58:52 -0700
Message-Id: <20230817235859.49846-15-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=keescook@chromium.org;
 h=from:subject; bh=IvCoDTUmPGIj+7qEwbz1ZUwbMaX1EfMB2pX6XS9uHHE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBfmj3qZYeUoE3VYSBxcgFtgqsG+6voaDsG
 dN7+tvlUR2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jg8fEACt1MzmrcCipsy/0n1aAT9hBbqUq5idN/BI2c3yHNHVpnIRI5GN1j7hOdImkZfcRTcOTFJ
 VUxhWitSM/ypDtTnX8pInDcpcIu9N4U+Uv2olN0raAq3sK4EZcADL/p0aPckt7B1JZjlIPD9F1Z
 OG+WAsV238be/ceJ4BkyWHI9QjMdcsxyLXZvv8kYFGxNbR+Q2BH33KwV39nvO/xtBtaxxMFkmMJ
 3n8JUfQRVVjQmXT3b8UWREZN2S9RD7HaXr3QOVGM4KYaWc5vOPA410mtWrNpBmBUWLkcFraCJql
 BLUul3gf5WgSXSKOSBrzDFIkO9KIYxiRJ4HNItT5cRlbzW/IzY+cWiUwd0d0Z1HuLq2ualRyuM4
 sJgnDenKCrbgN6BrNEzBLFutAuzp0x9KxrorooWOaCnulXSBpCQDM/L2DCoK6EsmSBAF7qEDp27
 MOaEZlijjaJ4OMM0jgxuVCco5wpR9YTOPyPeESqX7QZUoCyGDBPVqPMg5SyBDL+5rStUEsW4riP
 jGHKZiuI0eaNMNa5VdHILPKgR/qXNZM6uNcfF9qgsUicTfY1ov8F+2CVIYB8e1Ka/Di+zeUra6o
 gyFd6zhW5eFnGFR90vPU3Gq/JAQmPESBS4YarQhrVCMJGZkllIB/I5nzaP9nIPCfsM9hTkcg81S asDsoiP0g9COZRQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct tegra_dma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/tegra186-gpc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 33b101001100..5e3d5f5d1e20 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -221,7 +221,7 @@ struct tegra_dma_desc {
 	unsigned int sg_count;
 	struct virt_dma_desc vd;
 	struct tegra_dma_channel *tdc;
-	struct tegra_dma_sg_req sg_req[];
+	struct tegra_dma_sg_req sg_req[] __counted_by(sg_count);
 };
 
 /*
-- 
2.34.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DDBECD621
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 00:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356439AbjHQX7j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 19:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356384AbjHQX7O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 19:59:14 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1C63AAB
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc63ef9959so3064785ad.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316748; x=1692921548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbk9gosnKIp08S/xYiEcOv0NGE11Fcq8+yFR6hKeZl4=;
        b=We5THsrSooRnKlLqw9tsvHDOMpwbaNmF0BBfWlEdqKx2whcvHUB3/3Nxnbv8kankrP
         ngzJvZ78BmFun5D8FTqUK7yECWGDuNSs8nnYSt+szp/HVdj0Hz8U3/CANZnqoK34MCCe
         MA70pdExv7wbfRu11mRB3fe0J8dGqfcEDgzTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316748; x=1692921548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qbk9gosnKIp08S/xYiEcOv0NGE11Fcq8+yFR6hKeZl4=;
        b=DGfU1ov6ca7hC2+1S0IipxMxoZcAcnBx+p7lQ8XEfgGxtKmd/uABi+nHa7iyE3O4je
         7KFoCagwIPo6lk4wlZWLMnuTdgRpSVaHJjCigH7HwUqmpS9YxvPM8tTGy3CtqIQKrEm9
         IwTqnNXFE3L0nEcZ551K6jwbsns7+W0YF1QOo/+W7X+GdlF3I4hSQBjuD++wE6HCSJkh
         Zuzi+rxpFRfXbyP2d+aJj+Gu7CWywidz1KnhWTJdcpREyieJcrGVR22JYL3sx/dhobO7
         nekpgeobNg1ofcxktBxxWE9Zt8V8Nc7mU9GTY11RvWrYm6pDD+QRGuGX1cKqH0fHWJcG
         EXGw==
X-Gm-Message-State: AOJu0YzkLVSa/mHcK3s8V21KzDZjZUOcKLoaexi7OHKqxoTz8bSxFMmE
        Qzb3OtwJfQPvryZAJfa24t3UcQ==
X-Google-Smtp-Source: AGHT+IFYtfKiEi65BafAB2jOWU0NC4RgSIrq5NI/UmYeQhLAwxzE2a0uXe3xVhrjkkkWcuKL9BkieQ==
X-Received: by 2002:a17:903:32c7:b0:1bc:2d43:c747 with SMTP id i7-20020a17090332c700b001bc2d43c747mr1132580plr.38.1692316748627;
        Thu, 17 Aug 2023 16:59:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001b06c106844sm329849plk.151.2023.08.17.16.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        dmaengine@vger.kernel.org, Hector Martin <marcan@marcan.st>,
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
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 10/21] dmaengine: sprd: Annotate struct sprd_dma_dev with __counted_by
Date:   Thu, 17 Aug 2023 16:58:47 -0700
Message-Id: <20230817235859.49846-10-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=keescook@chromium.org;
 h=from:subject; bh=CkATBvf5Eu9BpZa9tpHWppJbisXYFVKIBdsrzK5V8yw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRANeKobCkjcxAIpRUeN++tkJMAFPhdDrI+y
 Set5Q0bJ4iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JtchD/9IeFdJIfhD70qMFzTh17aMHZHHEP8s1InFpgPNODtO4bqhp0Limusj01mwZljKb0D++Wt
 tj3VZ+n4u2wcw5NhCdPA2L0vPBIWHn2fhR9TPF3/hUP4jnvqxSptXhDXWcUXo4BXNUwM0F3h4ZJ
 LkvOOxbe7pis6HoDHp6i+dyNNYT1XuqVP2CX/9ppLiZwTTIyT1cZfQz62Q17kTp/j8kI6l3NF2W
 bR5x/idI3KcznCWZn3tY9MjzGvkyj170ybOxwM32psy/JHlpUricZwSTv2hiilfk47q2BqgvohY
 g1kL4/JGAjM/0WvjYhX8tA+tLGk4mfmYLDQwVjG1E7lXJnOx1uZ9ulk989VGZnHFsJUf5F/AMYB
 JvDnm1/uX5IOYdvs+MpL4BDtDX5t493UcQSyISCNbtlnrdR3A5BO9I0M5W/azRl+/IrHnNHkXAw
 krk34gifRsHYNue2eis71TJmxibjclezk6B7jWoxvw3gfHoUEukq7EBVfCkvrAmLjXC1bbpaEJb
 1M0vTO5nOwBXw2SMBRTdFjNk41oeZ+K+3y33mlh+Vxmh0G2AhUOJeeMTVuj3oRbS8F9Rfr+ksMP
 ECv/fLPFeXhWd9tmWsMsyEYmuNaDcmt6SUMT6Y9/iQiRBzhMtRAjzAzyFj8jwTp9gpx+xwU3TDW Zu1vaS8NrxfvhnA==
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

As found with Coccinelle[1], add __counted_by for struct sprd_dma_dev.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sprd-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 168aa0bd73a0..07871dcc4593 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -212,7 +212,7 @@ struct sprd_dma_dev {
 	struct clk		*ashb_clk;
 	int			irq;
 	u32			total_chns;
-	struct sprd_dma_chn	channels[];
+	struct sprd_dma_chn	channels[] __counted_by(total_chns);
 };
 
 static void sprd_dma_free_desc(struct virt_dma_desc *vd);
-- 
2.34.1


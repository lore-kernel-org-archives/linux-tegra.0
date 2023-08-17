Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D99FC7113D
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 00:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356366AbjHQX7g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 19:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356344AbjHQX7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 19:59:06 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE3C2710
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bda9207132so3206945ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 16:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316743; x=1692921543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgDb9t+7/ejCIiWITvPkmc45oRJcq4Tq1gnklL5DwBg=;
        b=gp5ssm6W/crP68h3PR6YM9N4hoSOFMia50leGRcJIpv3QxHc6K310MAhVMKiQN1vDe
         6XDvd9L8P+GICLL/SzUn2hZV/7zDwXYCIUEdy/5QgtrcPF4oVEj2zncjy5Ta/55q102+
         Y8N2W6Lec4dl6oqMoxwLRmjsr5L5N4lSXR44I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316743; x=1692921543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgDb9t+7/ejCIiWITvPkmc45oRJcq4Tq1gnklL5DwBg=;
        b=HXYooE1tdDO1mMdVU6st8nP801g2TcIJUw5cIa3L05ZEAbmxMxunCJ/of0XPLh8KK3
         iTA7GO0FqaleMbHOGR6HB1qIb3xPQBvsFrgc6Ehh6Dx4PmrD8F5k6/PihB4fHIIJFDYr
         +VjWuPSU5rVlugLv1jceqs22E0mlGgLxbVtRZcnSPNe3jxKDMwOd3xheh2XgIjhv1JWV
         w2802VOWfUMtT5o7qGgOWIyrw0vy6SjjMfRX6IypXZoEJ8hJUEgXK2P6TXi1Wqj8RVAY
         qCvXF5espoMR7Vj0abpGypXKjfTqbIt2NCKxTGhqQipVUpUgdTFQwbJmBYReLVDICuTn
         RGKw==
X-Gm-Message-State: AOJu0YxC/QYBMHzn7xWdARHNDE6rbP8ng4Bz4gHjJInEcRdJju7h6kTV
        v5dDEWT2lZaiIftEwTeE3/od8g==
X-Google-Smtp-Source: AGHT+IGnJcGGJIwJmhxr7GHTyyaiBOKpy+5C/lr0+vOgplwlQIG+JS98pD0vaUYU/SWQGiIph5zitQ==
X-Received: by 2002:a17:902:d4d1:b0:1b8:b285:ec96 with SMTP id o17-20020a170902d4d100b001b8b285ec96mr993739plg.23.1692316742870;
        Thu, 17 Aug 2023 16:59:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090282cb00b001bdccf6b8c9sm328924plz.127.2023.08.17.16.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:00 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, dmaengine@vger.kernel.org,
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
Subject: [PATCH 04/21] dmaengine: fsl-edma: Annotate struct fsl_edma_desc with __counted_by
Date:   Thu, 17 Aug 2023 16:58:41 -0700
Message-Id: <20230817235859.49846-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=keescook@chromium.org;
 h=from:subject; bh=CxJ6MlIzuwlOlN/Wrdkn0iEmj9pF0KihHoSm4sK1AQE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRAH0qG/vBOg6d32PmSGBdb9FgPWdM34DlOY
 S6MQjJa8MGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QAAKCRCJcvTf3G3A
 JgDZD/9pmP2TVIj071pr/xyHiGbK3XGACh35BOwyOSmVR32o10zeAaScACc5sA6JTyKBQTeKMqM
 OiU4/RZCPyvSJ0+kn5zx2xTD8Dzs0e6sPsgp0KoFhIJ0ciF59IeIY+ePM4obTxE+zseomTocI/B
 W3+Ccb+Ddpe40TBBUBbJb2OSdNTtsddC0S1DRENhjNP9y2GvGsfSvtNzGdzB9rmHIU3Kwr618mM
 NA0wObwXuPTIEeX1xnhdfs/LfndxHJmjmqJAl4iTNb7D3oeBdjGSsu9NId4YHZ4ppQhiOZdJfyS
 76y+ro95077WLAcguuIC2xyGXXYx01zuI4SkbekZwd8auA4mkoihxp7rwOdkyJptdvFkM4+w125
 x90bm3CuSEoIANeW3jAR2no9RBaql2zJYd+OY4tF+F+fTMqKLOZjJHLFzYPkQ1+R6/faM/uzzDY
 k6mmbIxde8euFh4pyyZkmcTDcAqDpdnGFMI7Gs1VZR9vmxoZdekc1ylAZ9Q1ztm2dh2jQJZ0N6f
 2XhWo5IWTNM6QO1XDsK7nVgV7vMJEsg+j5we0S5O1zmc+/K+iRP039YBM7uJ/DQJr9RSYPqQZHx
 BOmrjRKeWSh2e+AFUzg3zrlrhsjmsHxK9Pf6E7T50+IjMLog/S6Sx1o7acTHEdQsFZdvK5LJfFF jzaIXT9gT9yvVig==
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

As found with Coccinelle[1], add __counted_by for struct fsl_edma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/fsl-edma-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 004ec4a6bc86..fdbc79787643 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -135,7 +135,7 @@ struct fsl_edma_desc {
 	bool				iscyclic;
 	enum dma_transfer_direction	dirn;
 	unsigned int			n_tcds;
-	struct fsl_edma_sw_tcd		tcd[];
+	struct fsl_edma_sw_tcd		tcd[] __counted_by(n_tcds);
 };
 
 enum edma_version {
-- 
2.34.1


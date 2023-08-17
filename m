Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFCCC71140
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 00:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356594AbjHRAJr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 20:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356576AbjHRAJR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 20:09:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B7C3A8D
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 17:08:53 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6887bc25e6bso276244b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692317318; x=1692922118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC/8wS4E+U+x06AU4gX4E6qCdkVp40klqA0jeKErXPo=;
        b=g704C2h6GYIxjInJTKA/FnY6+rfPDG5j1XzFWY5B/q4Ve69EQ5ifrmXqKSZ4yJlVuC
         L1vrGlTrSLu4FzGxH0VjiIND5KbGMWcP+/CLN9EaNQHLa9z8y+mjmq0xZ5FvA5J+d8bH
         AvOOEN5NAMFEHzMWe9HkuB026ROd2q2yDrwMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692317318; x=1692922118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC/8wS4E+U+x06AU4gX4E6qCdkVp40klqA0jeKErXPo=;
        b=XkehBU0FhseTeduEN8O2PAygfNxhtIfz6Fruy646czMq5Jlud5iWK3X4kXiFRpnlnC
         3he+LrZA/ynk9P3nkLPiu5nBK8s7hzje8/vbMVyxZPLStP8l8wEhjun2ZOuteoBN54WC
         cMyjB5cNgZm9alccJMdlGEOMMqXebjRVv+x9F1RBUg3TJVP3jdzGD0Q/brmyTllGc2M8
         kSrV+8Alaa53rE5R2yVppvPilDiHmfVm0vX3sRVRsRYe6sCz9H+4T+ZQNv0pVnHuBdiq
         xbMluaKmryXXjEN2XsjWUgzsOK+Td7783BbO9fRDsd8CSIRH4byzHbqO4aPlinDXrcSH
         f4uA==
X-Gm-Message-State: AOJu0Yxj5Z5kcrJirlfzEOLkXVtW368C5mn3ycEZniA1ULEApIZHLdE6
        zDG5nj5zLAU1qkv5Rk2vb65r/Q==
X-Google-Smtp-Source: AGHT+IF8+0sOvpzh2S++9Gld77ion3LJ0vBuHR01Sdz45qfUXSxfnCpMtZxXVIqRA118ewYlXUkYRw==
X-Received: by 2002:a05:6a00:1ac9:b0:688:6d56:521e with SMTP id f9-20020a056a001ac900b006886d56521emr1317235pfv.33.1692317318596;
        Thu, 17 Aug 2023 17:08:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g24-20020a62e318000000b0068890a249a7sm320566pfh.21.2023.08.17.17.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        dmaengine@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
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
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 21/21] dmaengine: usb-dmac: Annotate struct usb_dmac_desc with __counted_by
Date:   Thu, 17 Aug 2023 16:58:58 -0700
Message-Id: <20230817235859.49846-21-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=keescook@chromium.org;
 h=from:subject; bh=4hPk4/3zaGHWUOFawsMJcft57ZMEf+1nR8QKiVCA4No=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBx2JZWreayfOXQj+zy3mCR8g7RE9H3jYXD
 QMZ4dudGRKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jp9HD/9n5ghwAXv8nh4Qxc3XxAqZYeaVe7x9jiT60JfcdraN+/WY5bCHGWqSG+fEhFggmfo5FzD
 6GTpkvqX4ivg0We7ceDtG9SqkhPKEwBoWXm5kM3ufbbJwiEqbpLxXE6rGBWN3mdgA5blDa8bbWc
 KLb++Nzd5KDDkGXg/axNw6uWdNsFTdjs2mEYp5W1xlwxEi0epibZy0UbOMb6nxKlJkjNhczwCqq
 IWq1Bw/Ae3nCP438KrwWZnn/JF2WlRIPvE8xs/0SKRCj98Z+48u05ACIA9QHLOxZndnbvgxOl8M
 foh7xCqYg5eM/WEPWppoyzbLHGJSV9/qaPNMwP2jrQwvmcnXBAHldywCU4ph8Qwg6sZVGPDToXo
 XCxB37cp4A3dlZMKY7xLwUfHC3SuDR+QdUzRIoDvEXkp1TyCKi++OiBC0uTaKct2ByLXJPSVQR+
 uy3fKNevuOa90s32XtmeSp7MXKeob7Q9/OCUebWEjkp99oIw0wOYS+1w2IzcA6sN2HpB5BF7cZZ
 4UAMrAMw7McvG4xOSA/GpJYEWADYtQ5vLhrRp6Y8iZ0oJ7Edber817/7F6PO9r2jFJfXsuJhDG3
 ouohBYPImYbsHXqZvi2GsrhhdFI0GpWJ+WKPDAuoIZdvIq1pl5K5No6qWy49KQhB8FH+nfUe9ye H7z7nLEZJUAVhhQ==
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

As found with Coccinelle[1], add __counted_by for struct usb_dmac_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yu Kuai <yukuai3@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jordy Zomer <jordy@pwning.systems>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index b14cf350b669..4cfcd23e3268 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -57,7 +57,7 @@ struct usb_dmac_desc {
 	u32 residue;
 	struct list_head node;
 	dma_cookie_t done_cookie;
-	struct usb_dmac_sg sg[];
+	struct usb_dmac_sg sg[] __counted_by(sg_allocated_len);
 };
 
 #define to_usb_dmac_desc(vd)	container_of(vd, struct usb_dmac_desc, vd)
-- 
2.34.1


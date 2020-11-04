Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A18C2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034A620657
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDUmwxxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731500AbgKDTgj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731480AbgKDTgi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 14:36:38 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF034C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 11:36:36 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p1so4163593wrf.12
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
        b=mDUmwxxsTe07lHZdCK2NULBQOzn4QryCvAiJRBiNod0SQqJoH9VRDVYsjyFYKGVo/W
         reE/6DdkeQRZ5mln/8ZmhUKS1Roow+CuhxYEGWCbHlGiH6Qvhf2OzHgt7m1ca/RB6IfC
         1Z/XDwPlOsKdZWNpKBMdu/7ai2sBwVtTD3IVxbySNMGnN2mYL5XCqTeOJDO84TsaAUgR
         y4+ySv4XxyVtAkylZ1TZa2e5KfXHwqh1NYm4Q5nd7bi3EBSwCAabLS+uoRknth3lyNIL
         4C639ZtdSlM3cWtK32QsZklz9nt/+PfSD/KdhAz8FygBldRS4KP1oWuJo4VC0x5CKunJ
         1MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
        b=jVC0xM+5wVPCcwdZHX2ylwcJQZemfGqi1qrNq8tAgcd52xp+EdyYSQkPQ+SeRVQ5LV
         5id/xIaScK9I66lPdJKGqToyZF9HGNuGQDDkWI2pUzbe+QNLzxnY5xY1kWbOHcg6EgZS
         5cZ5GQgKaXaP0fB53KwxbqTXSIdWd8jvmPHV/zLNckk6duinKXsPo/rnypzBNzXO4fFe
         voC7kJ0gy5fKJFS/3LJTB9ulOkqdgpaagCYym4AsKd4j0DpgOWdD4I0ORF0iNElnN0Gj
         zDVSJ+AL0ZlzQWwCBYBgkB8v6T+/w3JN1hcFCDWoTzn0NL6co/ri0ybi7n47QMxP6stS
         g/aw==
X-Gm-Message-State: AOAM531cPPNwpzNSy3v1taX1Hw5qfGI19cbMpe/gf1rMRJAotNVyPlqv
        CzO307kW9Uif6FQEMwdqqY2yfA==
X-Google-Smtp-Source: ABdhPJwj69pglo5oKTGjibnfQaOnqOYeg+zi78YMRNFefrSr4xnzdjafE2tVb3anObZuT+KBZ5gsIg==
X-Received: by 2002:adf:de89:: with SMTP id w9mr33569428wrl.212.1604518595494;
        Wed, 04 Nov 2020 11:36:35 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:36:34 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 24/36] tty: serial: serial-tegra: Struct headers should start with 'struct <name>'
Date:   Wed,  4 Nov 2020 19:35:37 +0000
Message-Id: <20201104193549.4026187-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/tty/serial/serial-tegra.c:85: warning: cannot understand function prototype: 'struct tegra_uart_chip_data '

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/serial-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index bd13014a1c537..c363ee0470f45 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -75,7 +75,7 @@
 #define TEGRA_UART_FCR_IIR_FIFO_EN		0x40
 
 /**
- * tegra_uart_chip_data: SOC specific data.
+ * struct tegra_uart_chip_data: SOC specific data.
  *
  * @tx_fifo_full_status: Status flag available for checking tx fifo full.
  * @allow_txfifo_reset_fifo_mode: allow_tx fifo reset with fifo mode or not.
-- 
2.25.1


Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A475BC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiGKPkr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiGKPkp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:40:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C51357C5
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:40 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o4so7553908wrh.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ez9+tjVgr9xPqmbVh6v+qKgZ5GQQjYM0LVlLWfjutJs=;
        b=JD5XMAOHWrsVkWSLdsWZUqKoqjXpza6DqI0JMspe9IxEC9XBRtg19sHw0aTM3YR2z/
         e7MXm4BMfigtA+jY6mhOQF2wYOXn2eoULMJ5lonySUhrGPrMNW7BQvkctIdaOqc6VLr+
         CpK++yYbEXM3SQX7dgnsXVAKhIWow/foWvvJtPp/x5aV9XnM5dQVM1ZVsuNPt+1Vbl1q
         RpJIRVqXpljY+JXkkV1ghLfisqn9Y7roruQ5o19SrsGXQqSNQzAc33HfvjObxypRleeB
         ht1jgJE4PptPBpWX36ZFIMRB5MdANl6Usz7Rjp8qvpEhH/ZFFPbq/pRxDfP4vcwkF0j1
         N0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ez9+tjVgr9xPqmbVh6v+qKgZ5GQQjYM0LVlLWfjutJs=;
        b=FOAlma70CmgGsM3ZT3to9GLbUgoGLiwjSHeq/rE7hE+C5a1HHHFtwMnIL+3QhlV4nW
         DwoX0DsCkeXCYSZOX2ij+QcR7vhliPFMenhwESxBX8WfLBdPPcL31GtTlDS1A4eBC4Zv
         7GOFtSxtOZraH3K6H5aD63EAfluecYvU7UoOixr325nkzROta7+zfh91MqPZJ30trE8f
         Zjr0wrLVF/gVnOVmFU5jt5VU8XAWtDSSiSrb7wDA5nl0lPCSmrrIyqML1YDo9UeC2Tnz
         PB2RXCd0qmobYbFqpmQn8t5xxQhED+aq/cxRNVsnEx3fjasNUypcKGzUxPYIicnkZUW9
         QTjw==
X-Gm-Message-State: AJIora8WBJcawjI82YdNhKy1VUiCRkRcoDP6RIxnVuEaxWS1oOUcJDu+
        czlX/L3MJqfJMK5VUKyhMXg=
X-Google-Smtp-Source: AGRyM1v2Lwn8k/6H6KzX8TdTfHsnUve19NS2WHE5hrP9R/YpJXpoaZsbnOR/RIYJKxLOP5/Qj95F+A==
X-Received: by 2002:a05:6000:2a4:b0:21d:8646:37f6 with SMTP id l4-20020a05600002a400b0021d864637f6mr16832102wry.661.1657554038723;
        Mon, 11 Jul 2022 08:40:38 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c410900b003a02cbf862esm6955667wmi.13.2022.07.11.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:40:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Marc Zyngier <maz@kernel.org>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] soc/tegra: pmc: Add USB port wake events for Tegra194
Date:   Mon, 11 Jul 2022 17:40:31 +0200
Message-Id: <20220711154031.689715-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711154031.689715-1-thierry.reding@gmail.com>
References: <20220711154031.689715-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 supports waking up from suspend when activity is detected on
any of the USB ports. Add these wake events so that the system can be
woken on such activity.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 48286bc59f46..03d614acd521 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3776,6 +3776,13 @@ static const struct tegra_wake_event tegra194_wake_events[] = {
 	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_SIMPLE("usb3-port-0", 76),
+	TEGRA_WAKE_SIMPLE("usb3-port-1", 77),
+	TEGRA_WAKE_SIMPLE("usb3-port-2-3", 78),
+	TEGRA_WAKE_SIMPLE("usb2-port-0", 79),
+	TEGRA_WAKE_SIMPLE("usb2-port-1", 80),
+	TEGRA_WAKE_SIMPLE("usb2-port-2", 81),
+	TEGRA_WAKE_SIMPLE("usb2-port-3", 82),
 };
 
 static const struct tegra_pmc_soc tegra194_pmc_soc = {
-- 
2.36.1


Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FD9C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2867613D1
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhDTQww (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbhDTQwr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E169C06138B
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id i3so20235357edt.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDfMA32K8B/LtJSaunzwoynUsIRgjcTgoByJmgfN0pY=;
        b=lgC25Ykt24vcXs7bGWFRXyYqBdZpwGPVLNWm69bEebfDQMsNJH8fozwOCA2UwavIP5
         juOCA39ugoX2PT/f7HET7veXmfeH4gpYm8y5HOYoMR5/Us+eJXvvNZoktGbAYIfC0woF
         q9IMORGDtaSLYMkwXABwTnJ/+B+/5u3nj1C4Py8/U6SRbdQW2ojqt9qhGW+eyn8QTUvz
         ki32ISwg2tmIThTdCJ25Agyk4Ab+Xcow10teAoepqWFz/5vD/0B7jclqZJhu1xjkCxjX
         B8+xAUSviVtHRw0tsaLpttaL/8/MqJnfzoRXmN1oPclg3jk0G7NimD5Vlh+ra0ONbEEW
         nkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDfMA32K8B/LtJSaunzwoynUsIRgjcTgoByJmgfN0pY=;
        b=VAhJQ4M8RPkqf9f/12pn90aEsG0eJDk7Bw3C/AtJfmuSvPevnsU54LgrpZRuU+S6gM
         A8VoGiLnPdlts+ANONNtSEUp+HB46v3i8h8YNaEfXZ/g0U97yuwjH4xsm8PVWFdhx6iy
         c2KfWB9dzGBELUjgmtUSxL4CVrlkSox/S1tqH4fY6CXuyg56iJkRMnTb886WHphEc5rs
         TkHCC8T+SaesLAvCICaAm5L+KnA1cZsqheil/VvId1IV3AuIVgAbTui71KHHM48Fvvce
         Yaotzr1h1byCdRZKo+kb1nSPrY6PO2my/ojoHAiwgHTHjgtVz5wa3jY4+ltCVNZaSALv
         jucg==
X-Gm-Message-State: AOAM531xrxVq7Hly7uOjE+SQOKVVH2V7TCPotOkfNjIfe/R0PhxTVu6k
        TKT83ob2DPG2iCGDArx2lRbHB52/o1c=
X-Google-Smtp-Source: ABdhPJx4S636/iptFyBGo1+zdo40ImqTa6aoJ4Cl5IS+S7byQafv91kNwr/jg5vQzOlTCzrqIG/y6A==
X-Received: by 2002:a05:6402:1907:: with SMTP id e7mr16167791edz.313.1618937533969;
        Tue, 20 Apr 2021 09:52:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g11sm16880443edw.37.2021.04.20.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:52:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/10] memory: tegra: Add memory client IDs to tables
Date:   Tue, 20 Apr 2021 18:52:37 +0200
Message-Id: <20210420165237.3523732-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory client IDs will subsequently be used to program override SIDs
for the given clients depending on the device tree configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 205 ++++++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 20efbbea587b..2f6ef46c33a4 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -79,6 +79,7 @@ static const struct tegra_mc_ops tegra186_mc_ops = {
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 static const struct tegra_mc_client tegra186_mc_clients[] = {
 	{
+		.id = TEGRA186_MEMORY_CLIENT_PTCR,
 		.name = "ptcr",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
@@ -88,6 +89,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AFIR,
 		.name = "afir",
 		.sid = TEGRA186_SID_AFI,
 		.regs = {
@@ -97,6 +99,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_HDAR,
 		.name = "hdar",
 		.sid = TEGRA186_SID_HDA,
 		.regs = {
@@ -106,6 +109,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_HOST1XDMAR,
 		.name = "host1xdmar",
 		.sid = TEGRA186_SID_HOST1X,
 		.regs = {
@@ -115,6 +119,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVENCSRD,
 		.name = "nvencsrd",
 		.sid = TEGRA186_SID_NVENC,
 		.regs = {
@@ -124,6 +129,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SATAR,
 		.name = "satar",
 		.sid = TEGRA186_SID_SATA,
 		.regs = {
@@ -133,6 +139,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_MPCORER,
 		.name = "mpcorer",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
@@ -142,6 +149,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVENCSWR,
 		.name = "nvencswr",
 		.sid = TEGRA186_SID_NVENC,
 		.regs = {
@@ -151,6 +159,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AFIW,
 		.name = "afiw",
 		.sid = TEGRA186_SID_AFI,
 		.regs = {
@@ -160,6 +169,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_HDAW,
 		.name = "hdaw",
 		.sid = TEGRA186_SID_HDA,
 		.regs = {
@@ -169,6 +179,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_MPCOREW,
 		.name = "mpcorew",
 		.sid = TEGRA186_SID_PASSTHROUGH,
 		.regs = {
@@ -178,6 +189,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SATAW,
 		.name = "sataw",
 		.sid = TEGRA186_SID_SATA,
 		.regs = {
@@ -187,6 +199,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_ISPRA,
 		.name = "ispra",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
@@ -196,6 +209,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_ISPWA,
 		.name = "ispwa",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
@@ -205,6 +219,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_ISPWB,
 		.name = "ispwb",
 		.sid = TEGRA186_SID_ISP,
 		.regs = {
@@ -214,6 +229,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_XUSB_HOSTR,
 		.name = "xusb_hostr",
 		.sid = TEGRA186_SID_XUSB_HOST,
 		.regs = {
@@ -223,6 +239,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_XUSB_HOSTW,
 		.name = "xusb_hostw",
 		.sid = TEGRA186_SID_XUSB_HOST,
 		.regs = {
@@ -232,6 +249,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_XUSB_DEVR,
 		.name = "xusb_devr",
 		.sid = TEGRA186_SID_XUSB_DEV,
 		.regs = {
@@ -241,6 +259,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_XUSB_DEVW,
 		.name = "xusb_devw",
 		.sid = TEGRA186_SID_XUSB_DEV,
 		.regs = {
@@ -250,6 +269,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_TSECSRD,
 		.name = "tsecsrd",
 		.sid = TEGRA186_SID_TSEC,
 		.regs = {
@@ -259,6 +279,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_TSECSWR,
 		.name = "tsecswr",
 		.sid = TEGRA186_SID_TSEC,
 		.regs = {
@@ -268,6 +289,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_GPUSRD,
 		.name = "gpusrd",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
@@ -277,6 +299,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_GPUSWR,
 		.name = "gpuswr",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
@@ -286,6 +309,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCRA,
 		.name = "sdmmcra",
 		.sid = TEGRA186_SID_SDMMC1,
 		.regs = {
@@ -295,6 +319,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCRAA,
 		.name = "sdmmcraa",
 		.sid = TEGRA186_SID_SDMMC2,
 		.regs = {
@@ -304,6 +329,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCR,
 		.name = "sdmmcr",
 		.sid = TEGRA186_SID_SDMMC3,
 		.regs = {
@@ -313,6 +339,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCRAB,
 		.name = "sdmmcrab",
 		.sid = TEGRA186_SID_SDMMC4,
 		.regs = {
@@ -322,6 +349,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCWA,
 		.name = "sdmmcwa",
 		.sid = TEGRA186_SID_SDMMC1,
 		.regs = {
@@ -331,6 +359,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCWAA,
 		.name = "sdmmcwaa",
 		.sid = TEGRA186_SID_SDMMC2,
 		.regs = {
@@ -340,6 +369,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCW,
 		.name = "sdmmcw",
 		.sid = TEGRA186_SID_SDMMC3,
 		.regs = {
@@ -349,6 +379,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SDMMCWAB,
 		.name = "sdmmcwab",
 		.sid = TEGRA186_SID_SDMMC4,
 		.regs = {
@@ -358,6 +389,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_VICSRD,
 		.name = "vicsrd",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
@@ -367,6 +399,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_VICSWR,
 		.name = "vicswr",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
@@ -376,6 +409,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_VIW,
 		.name = "viw",
 		.sid = TEGRA186_SID_VI,
 		.regs = {
@@ -385,6 +419,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVDECSRD,
 		.name = "nvdecsrd",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
@@ -394,6 +429,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVDECSWR,
 		.name = "nvdecswr",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
@@ -403,6 +439,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_APER,
 		.name = "aper",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
@@ -412,6 +449,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_APEW,
 		.name = "apew",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
@@ -421,6 +459,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVJPGSRD,
 		.name = "nvjpgsrd",
 		.sid = TEGRA186_SID_NVJPG,
 		.regs = {
@@ -430,6 +469,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVJPGSWR,
 		.name = "nvjpgswr",
 		.sid = TEGRA186_SID_NVJPG,
 		.regs = {
@@ -439,6 +479,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SESRD,
 		.name = "sesrd",
 		.sid = TEGRA186_SID_SE,
 		.regs = {
@@ -448,6 +489,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SESWR,
 		.name = "seswr",
 		.sid = TEGRA186_SID_SE,
 		.regs = {
@@ -457,6 +499,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_ETRR,
 		.name = "etrr",
 		.sid = TEGRA186_SID_ETR,
 		.regs = {
@@ -466,6 +509,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_ETRW,
 		.name = "etrw",
 		.sid = TEGRA186_SID_ETR,
 		.regs = {
@@ -475,6 +519,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_TSECSRDB,
 		.name = "tsecsrdb",
 		.sid = TEGRA186_SID_TSECB,
 		.regs = {
@@ -484,6 +529,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_TSECSWRB,
 		.name = "tsecswrb",
 		.sid = TEGRA186_SID_TSECB,
 		.regs = {
@@ -493,6 +539,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_GPUSRD2,
 		.name = "gpusrd2",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
@@ -502,6 +549,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_GPUSWR2,
 		.name = "gpuswr2",
 		.sid = TEGRA186_SID_GPU,
 		.regs = {
@@ -511,6 +559,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AXISR,
 		.name = "axisr",
 		.sid = TEGRA186_SID_GPCDMA_0,
 		.regs = {
@@ -520,6 +569,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AXISW,
 		.name = "axisw",
 		.sid = TEGRA186_SID_GPCDMA_0,
 		.regs = {
@@ -529,6 +579,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_EQOSR,
 		.name = "eqosr",
 		.sid = TEGRA186_SID_EQOS,
 		.regs = {
@@ -538,6 +589,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_EQOSW,
 		.name = "eqosw",
 		.sid = TEGRA186_SID_EQOS,
 		.regs = {
@@ -547,6 +599,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_UFSHCR,
 		.name = "ufshcr",
 		.sid = TEGRA186_SID_UFSHC,
 		.regs = {
@@ -556,6 +609,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_UFSHCW,
 		.name = "ufshcw",
 		.sid = TEGRA186_SID_UFSHC,
 		.regs = {
@@ -565,6 +619,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVDISPLAYR,
 		.name = "nvdisplayr",
 		.sid = TEGRA186_SID_NVDISPLAY,
 		.regs = {
@@ -574,6 +629,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_BPMPR,
 		.name = "bpmpr",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
@@ -583,6 +639,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_BPMPW,
 		.name = "bpmpw",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
@@ -592,6 +649,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_BPMPDMAR,
 		.name = "bpmpdmar",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
@@ -601,6 +659,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_BPMPDMAW,
 		.name = "bpmpdmaw",
 		.sid = TEGRA186_SID_BPMP,
 		.regs = {
@@ -610,6 +669,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AONR,
 		.name = "aonr",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
@@ -619,6 +679,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AONW,
 		.name = "aonw",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
@@ -628,6 +689,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AONDMAR,
 		.name = "aondmar",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
@@ -637,6 +699,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_AONDMAW,
 		.name = "aondmaw",
 		.sid = TEGRA186_SID_AON,
 		.regs = {
@@ -646,6 +709,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SCER,
 		.name = "scer",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
@@ -655,6 +719,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SCEW,
 		.name = "scew",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
@@ -664,6 +729,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SCEDMAR,
 		.name = "scedmar",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
@@ -673,6 +739,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_SCEDMAW,
 		.name = "scedmaw",
 		.sid = TEGRA186_SID_SCE,
 		.regs = {
@@ -682,6 +749,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_APEDMAR,
 		.name = "apedmar",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
@@ -691,6 +759,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_APEDMAW,
 		.name = "apedmaw",
 		.sid = TEGRA186_SID_APE,
 		.regs = {
@@ -700,6 +769,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVDISPLAYR1,
 		.name = "nvdisplayr1",
 		.sid = TEGRA186_SID_NVDISPLAY,
 		.regs = {
@@ -709,6 +779,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_VICSRD1,
 		.name = "vicsrd1",
 		.sid = TEGRA186_SID_VIC,
 		.regs = {
@@ -718,6 +789,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA186_MEMORY_CLIENT_NVDECSRD1,
 		.name = "nvdecsrd1",
 		.sid = TEGRA186_SID_NVDEC,
 		.regs = {
@@ -740,6 +812,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
 static const struct tegra_mc_client tegra194_mc_clients[] = {
 	{
+		.id = TEGRA194_MEMORY_CLIENT_PTCR,
 		.name = "ptcr",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -749,6 +822,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU7R,
 		.name = "miu7r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -758,6 +832,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU7W,
 		.name = "miu7w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -767,6 +842,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HDAR,
 		.name = "hdar",
 		.sid = TEGRA194_SID_HDA,
 		.regs = {
@@ -776,6 +852,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HOST1XDMAR,
 		.name = "host1xdmar",
 		.sid = TEGRA194_SID_HOST1X,
 		.regs = {
@@ -785,6 +862,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD,
 		.name = "nvencsrd",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
@@ -794,6 +872,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SATAR,
 		.name = "satar",
 		.sid = TEGRA194_SID_SATA,
 		.regs = {
@@ -803,6 +882,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MPCORER,
 		.name = "mpcorer",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -812,6 +892,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSWR,
 		.name = "nvencswr",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
@@ -821,6 +902,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HDAW,
 		.name = "hdaw",
 		.sid = TEGRA194_SID_HDA,
 		.regs = {
@@ -830,6 +912,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MPCOREW,
 		.name = "mpcorew",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -839,6 +922,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SATAW,
 		.name = "sataw",
 		.sid = TEGRA194_SID_SATA,
 		.regs = {
@@ -848,6 +932,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPRA,
 		.name = "ispra",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
@@ -857,6 +942,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPFALR,
 		.name = "ispfalr",
 		.sid = TEGRA194_SID_ISP_FALCON,
 		.regs = {
@@ -866,6 +952,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPWA,
 		.name = "ispwa",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
@@ -875,6 +962,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPWB,
 		.name = "ispwb",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
@@ -884,6 +972,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTR,
 		.name = "xusb_hostr",
 		.sid = TEGRA194_SID_XUSB_HOST,
 		.regs = {
@@ -893,6 +982,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTW,
 		.name = "xusb_hostw",
 		.sid = TEGRA194_SID_XUSB_HOST,
 		.regs = {
@@ -902,6 +992,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVR,
 		.name = "xusb_devr",
 		.sid = TEGRA194_SID_XUSB_DEV,
 		.regs = {
@@ -911,6 +1002,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVW,
 		.name = "xusb_devw",
 		.sid = TEGRA194_SID_XUSB_DEV,
 		.regs = {
@@ -920,6 +1012,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCRA,
 		.name = "sdmmcra",
 		.sid = TEGRA194_SID_SDMMC1,
 		.regs = {
@@ -929,6 +1022,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCR,
 		.name = "sdmmcr",
 		.sid = TEGRA194_SID_SDMMC3,
 		.regs = {
@@ -938,6 +1032,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCRAB,
 		.name = "sdmmcrab",
 		.sid = TEGRA194_SID_SDMMC4,
 		.regs = {
@@ -947,6 +1042,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCWA,
 		.name = "sdmmcwa",
 		.sid = TEGRA194_SID_SDMMC1,
 		.regs = {
@@ -956,6 +1052,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCW,
 		.name = "sdmmcw",
 		.sid = TEGRA194_SID_SDMMC3,
 		.regs = {
@@ -965,6 +1062,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCWAB,
 		.name = "sdmmcwab",
 		.sid = TEGRA194_SID_SDMMC4,
 		.regs = {
@@ -974,6 +1072,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSRD,
 		.name = "vicsrd",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
@@ -983,6 +1082,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSWR,
 		.name = "vicswr",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
@@ -992,6 +1092,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIW,
 		.name = "viw",
 		.sid = TEGRA194_SID_VI,
 		.regs = {
@@ -1001,6 +1102,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD,
 		.name = "nvdecsrd",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
@@ -1010,6 +1112,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSWR,
 		.name = "nvdecswr",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
@@ -1019,6 +1122,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APER,
 		.name = "aper",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
@@ -1028,6 +1132,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEW,
 		.name = "apew",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
@@ -1037,6 +1142,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVJPGSRD,
 		.name = "nvjpgsrd",
 		.sid = TEGRA194_SID_NVJPG,
 		.regs = {
@@ -1046,6 +1152,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVJPGSWR,
 		.name = "nvjpgswr",
 		.sid = TEGRA194_SID_NVJPG,
 		.regs = {
@@ -1056,6 +1163,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 		},
 	}, {
 		.name = "axiapr",
+		.id = TEGRA194_MEMORY_CLIENT_AXIAPR,
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
 			.sid = {
@@ -1064,6 +1172,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXIAPW,
 		.name = "axiapw",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -1073,6 +1182,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ETRR,
 		.name = "etrr",
 		.sid = TEGRA194_SID_ETR,
 		.regs = {
@@ -1082,6 +1192,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ETRW,
 		.name = "etrw",
 		.sid = TEGRA194_SID_ETR,
 		.regs = {
@@ -1091,6 +1202,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXISR,
 		.name = "axisr",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -1100,6 +1212,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXISW,
 		.name = "axisw",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -1109,6 +1222,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_EQOSR,
 		.name = "eqosr",
 		.sid = TEGRA194_SID_EQOS,
 		.regs = {
@@ -1119,6 +1233,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 		},
 	}, {
 		.name = "eqosw",
+		.id = TEGRA194_MEMORY_CLIENT_EQOSW,
 		.sid = TEGRA194_SID_EQOS,
 		.regs = {
 			.sid = {
@@ -1127,6 +1242,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_UFSHCR,
 		.name = "ufshcr",
 		.sid = TEGRA194_SID_UFSHC,
 		.regs = {
@@ -1136,6 +1252,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_UFSHCW,
 		.name = "ufshcw",
 		.sid = TEGRA194_SID_UFSHC,
 		.regs = {
@@ -1145,6 +1262,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR,
 		.name = "nvdisplayr",
 		.sid = TEGRA194_SID_NVDISPLAY,
 		.regs = {
@@ -1154,6 +1272,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPR,
 		.name = "bpmpr",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
@@ -1163,6 +1282,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPW,
 		.name = "bpmpw",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
@@ -1172,6 +1292,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAR,
 		.name = "bpmpdmar",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
@@ -1181,6 +1302,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAW,
 		.name = "bpmpdmaw",
 		.sid = TEGRA194_SID_BPMP,
 		.regs = {
@@ -1190,6 +1312,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONR,
 		.name = "aonr",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
@@ -1199,6 +1322,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONW,
 		.name = "aonw",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
@@ -1208,6 +1332,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONDMAR,
 		.name = "aondmar",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
@@ -1217,6 +1342,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONDMAW,
 		.name = "aondmaw",
 		.sid = TEGRA194_SID_AON,
 		.regs = {
@@ -1226,6 +1352,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCER,
 		.name = "scer",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
@@ -1235,6 +1362,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEW,
 		.name = "scew",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
@@ -1244,6 +1372,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEDMAR,
 		.name = "scedmar",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
@@ -1253,6 +1382,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEDMAW,
 		.name = "scedmaw",
 		.sid = TEGRA194_SID_SCE,
 		.regs = {
@@ -1262,6 +1392,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEDMAR,
 		.name = "apedmar",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
@@ -1271,6 +1402,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEDMAW,
 		.name = "apedmaw",
 		.sid = TEGRA194_SID_APE,
 		.regs = {
@@ -1280,6 +1412,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR1,
 		.name = "nvdisplayr1",
 		.sid = TEGRA194_SID_NVDISPLAY,
 		.regs = {
@@ -1289,6 +1422,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSRD1,
 		.name = "vicsrd1",
 		.sid = TEGRA194_SID_VIC,
 		.regs = {
@@ -1298,6 +1432,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD1,
 		.name = "nvdecsrd1",
 		.sid = TEGRA194_SID_NVDEC,
 		.regs = {
@@ -1307,6 +1442,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU0R,
 		.name = "miu0r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1317,6 +1453,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 		},
 	}, {
 		.name = "miu0w",
+		.id = TEGRA194_MEMORY_CLIENT_MIU0W,
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
 			.sid = {
@@ -1325,6 +1462,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU1R,
 		.name = "miu1r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1334,6 +1472,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU1W,
 		.name = "miu1w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1343,6 +1482,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU2R,
 		.name = "miu2r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1352,6 +1492,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU2W,
 		.name = "miu2w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1361,6 +1502,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU3R,
 		.name = "miu3r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1370,6 +1512,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU3W,
 		.name = "miu3w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1379,6 +1522,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU4R,
 		.name = "miu4r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1388,6 +1532,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU4W,
 		.name = "miu4w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1397,6 +1542,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DPMUR,
 		.name = "dpmur",
 		.sid = TEGRA194_SID_PASSTHROUGH,
 		.regs = {
@@ -1406,6 +1552,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIFALR,
 		.name = "vifalr",
 		.sid = TEGRA194_SID_VI_FALCON,
 		.regs = {
@@ -1415,6 +1562,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIFALW,
 		.name = "vifalw",
 		.sid = TEGRA194_SID_VI_FALCON,
 		.regs = {
@@ -1424,6 +1572,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA,
 		.name = "dla0rda",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
@@ -1433,6 +1582,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0FALRDB,
 		.name = "dla0falrdb",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
@@ -1442,6 +1592,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0WRA,
 		.name = "dla0wra",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
@@ -1451,6 +1602,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0FALWRB,
 		.name = "dla0falwrb",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
@@ -1460,6 +1612,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA,
 		.name = "dla1rda",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
@@ -1469,6 +1622,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1FALRDB,
 		.name = "dla1falrdb",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
@@ -1478,6 +1632,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1WRA,
 		.name = "dla1wra",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
@@ -1487,6 +1642,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1FALWRB,
 		.name = "dla1falwrb",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
@@ -1496,6 +1652,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA,
 		.name = "pva0rda",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1505,6 +1662,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB,
 		.name = "pva0rdb",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1514,6 +1672,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDC,
 		.name = "pva0rdc",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1523,6 +1682,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRA,
 		.name = "pva0wra",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1532,6 +1692,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRB,
 		.name = "pva0wrb",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1541,6 +1702,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRC,
 		.name = "pva0wrc",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1550,6 +1712,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA,
 		.name = "pva1rda",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1559,6 +1722,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB,
 		.name = "pva1rdb",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1568,6 +1732,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDC,
 		.name = "pva1rdc",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1577,6 +1742,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRA,
 		.name = "pva1wra",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1586,6 +1752,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRB,
 		.name = "pva1wrb",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1595,6 +1762,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRC,
 		.name = "pva1wrc",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1604,6 +1772,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCER,
 		.name = "rcer",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
@@ -1613,6 +1782,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEW,
 		.name = "rcew",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
@@ -1622,6 +1792,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEDMAR,
 		.name = "rcedmar",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
@@ -1631,6 +1802,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEDMAW,
 		.name = "rcedmaw",
 		.sid = TEGRA194_SID_RCE,
 		.regs = {
@@ -1640,6 +1812,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD,
 		.name = "nvenc1srd",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
@@ -1649,6 +1822,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SWR,
 		.name = "nvenc1swr",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
@@ -1658,6 +1832,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0R,
 		.name = "pcie0r",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
@@ -1667,6 +1842,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0W,
 		.name = "pcie0w",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
@@ -1676,6 +1852,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE1R,
 		.name = "pcie1r",
 		.sid = TEGRA194_SID_PCIE1,
 		.regs = {
@@ -1685,6 +1862,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE1W,
 		.name = "pcie1w",
 		.sid = TEGRA194_SID_PCIE1,
 		.regs = {
@@ -1694,6 +1872,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE2AR,
 		.name = "pcie2ar",
 		.sid = TEGRA194_SID_PCIE2,
 		.regs = {
@@ -1703,6 +1882,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE2AW,
 		.name = "pcie2aw",
 		.sid = TEGRA194_SID_PCIE2,
 		.regs = {
@@ -1712,6 +1892,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE3R,
 		.name = "pcie3r",
 		.sid = TEGRA194_SID_PCIE3,
 		.regs = {
@@ -1721,6 +1902,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE3W,
 		.name = "pcie3w",
 		.sid = TEGRA194_SID_PCIE3,
 		.regs = {
@@ -1730,6 +1912,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE4R,
 		.name = "pcie4r",
 		.sid = TEGRA194_SID_PCIE4,
 		.regs = {
@@ -1739,6 +1922,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE4W,
 		.name = "pcie4w",
 		.sid = TEGRA194_SID_PCIE4,
 		.regs = {
@@ -1748,6 +1932,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5R,
 		.name = "pcie5r",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
@@ -1757,6 +1942,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5W,
 		.name = "pcie5w",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
@@ -1766,6 +1952,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPFALW,
 		.name = "ispfalw",
 		.sid = TEGRA194_SID_ISP_FALCON,
 		.regs = {
@@ -1775,6 +1962,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA1,
 		.name = "dla0rda1",
 		.sid = TEGRA194_SID_NVDLA0,
 		.regs = {
@@ -1784,6 +1972,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA1,
 		.name = "dla1rda1",
 		.sid = TEGRA194_SID_NVDLA1,
 		.regs = {
@@ -1793,6 +1982,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA1,
 		.name = "pva0rda1",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1802,6 +1992,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB1,
 		.name = "pva0rdb1",
 		.sid = TEGRA194_SID_PVA0,
 		.regs = {
@@ -1811,6 +2002,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA1,
 		.name = "pva1rda1",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1820,6 +2012,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB1,
 		.name = "pva1rdb1",
 		.sid = TEGRA194_SID_PVA1,
 		.regs = {
@@ -1829,6 +2022,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5R1,
 		.name = "pcie5r1",
 		.sid = TEGRA194_SID_PCIE5,
 		.regs = {
@@ -1838,6 +2032,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD1,
 		.name = "nvencsrd1",
 		.sid = TEGRA194_SID_NVENC,
 		.regs = {
@@ -1847,6 +2042,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD1,
 		.name = "nvenc1srd1",
 		.sid = TEGRA194_SID_NVENC1,
 		.regs = {
@@ -1856,6 +2052,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPRA1,
 		.name = "ispra1",
 		.sid = TEGRA194_SID_ISP,
 		.regs = {
@@ -1865,6 +2062,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0R1,
 		.name = "pcie0r1",
 		.sid = TEGRA194_SID_PCIE0,
 		.regs = {
@@ -1874,6 +2072,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD,
 		.name = "nvdec1srd",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
@@ -1883,6 +2082,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD1,
 		.name = "nvdec1srd1",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
@@ -1892,6 +2092,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SWR,
 		.name = "nvdec1swr",
 		.sid = TEGRA194_SID_NVDEC1,
 		.regs = {
@@ -1901,6 +2102,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU5R,
 		.name = "miu5r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1910,6 +2112,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU5W,
 		.name = "miu5w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1919,6 +2122,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU6R,
 		.name = "miu6r",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
@@ -1928,6 +2132,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 			},
 		},
 	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU6W,
 		.name = "miu6w",
 		.sid = TEGRA194_SID_MIU,
 		.regs = {
-- 
2.30.2


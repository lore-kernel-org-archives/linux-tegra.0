Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DFCC433E7
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89D220872
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihe7WbOt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgJHApE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 20:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbgJHAow (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 20:44:52 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15970C0613D3;
        Wed,  7 Oct 2020 17:44:52 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g9so2763821pgh.8;
        Wed, 07 Oct 2020 17:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wDcnx4o46kavjub3gbCMWwLMubPVR9TvAn/9VACrPZs=;
        b=ihe7WbOt8l+H8LWSBf9ZgygRdgpdcZVisOKcqp1nnBRreE/rPsZpO0PPY/psfAd49D
         1kXlWaU1dZHDuQ3T/bZEoV/LRAwgACkdtMbLjbwJj8t6fcmIkqaz7WkOGEJn5CMd07id
         aY287+r7pgXi+90dwuT6aQKn18VF+kEfVhwS6xkqjTmbjVTEzwd38P5CGHEQKzOxZOjW
         V2oUnfseiZfVAw0iVqXyC3c8NVW7YagbH9Qyhd0e9C8a+87aOrrx9mEgqZsjxCwhpLAH
         G1R1U7MO4a7HBvg3BaXPE5gruAW51d90GmbxbMyoehgHQv2VChSWUJ7xx0/MgW9cwK8X
         slHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wDcnx4o46kavjub3gbCMWwLMubPVR9TvAn/9VACrPZs=;
        b=hT4LguzQw/pfQq8AsYqsOhzXXHbUiDlCA0v41Ozz+w9ErBIfGS9T0sGlKRPNbZmMnp
         HbA5vWp34aBom6u2len2PGVws6+2cmG/r8M+BJ6tvFCWFWET63jfX5EjT3cJp7fpwds4
         Zhl2BguzPv3j+koV9fabPVVzTuH3m5mY682cOFjhjIINedvSEQpJNJUcPvumGZKHjD+p
         YnY683oK+tMc0P8QI44bbLjeM9n55pgmav5OMSlUKEbz0mKMknF+MpK/i1y5273f9K3d
         1BNiNsfsRNUPuP+g5qPob1zccO1KtvjOZ+ZYa+Fiz536rGCXmD4rdn4RhKpAolNvamb1
         lSAQ==
X-Gm-Message-State: AOAM532Z+YCG1WiiuG/QkkLZuQG2k8jMh8tzL+SEKboNuF6gDOmEFyu6
        68z3bv8pT2I5n3o7DUywbW4H9mhKAlc=
X-Google-Smtp-Source: ABdhPJzcDRVdif0xyZWFdDhYgdGmpRIjOMB409WV3Zds6A3po0jgkdPW7kMqYy50mSKoj0wEIHnktA==
X-Received: by 2002:a17:90a:c28d:: with SMTP id f13mr5069450pjt.145.1602117891610;
        Wed, 07 Oct 2020 17:44:51 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z6sm4939922pfg.12.2020.10.07.17.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 17:44:51 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Date:   Wed,  7 Oct 2020 17:37:45 -0700
Message-Id: <20201008003746.25659-5-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008003746.25659-1-nicoleotsuka@gmail.com>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

According to Tegra X1 TRM, there are missing swgroups in the
tegra210_swgroups list. So this patch adds them in bindings.

Note that the TEGRA_SWGROUP_GPU (in list) should be actually
TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
TEGRA_SWGROUP_GPU (in list) as it is.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
index c226cba9e077..f9fcb18a6d9b 100644
--- a/include/dt-bindings/memory/tegra210-mc.h
+++ b/include/dt-bindings/memory/tegra210-mc.h
@@ -33,6 +33,16 @@
 #define TEGRA_SWGROUP_AXIAP	28
 #define TEGRA_SWGROUP_ETR	29
 #define TEGRA_SWGROUP_TSECB	30
+#define TEGRA_SWGROUP_NV	31
+#define TEGRA_SWGROUP_NV2	32
+#define TEGRA_SWGROUP_PPCS1	33
+#define TEGRA_SWGROUP_DC1	34
+#define TEGRA_SWGROUP_PPCS2	35
+#define TEGRA_SWGROUP_HC1	36
+#define TEGRA_SWGROUP_SE1	37
+#define TEGRA_SWGROUP_TSEC1	38
+#define TEGRA_SWGROUP_TSECB1	39
+#define TEGRA_SWGROUP_NVDEC1	40
 
 #define TEGRA210_MC_RESET_AFI		0
 #define TEGRA210_MC_RESET_AVPC		1
-- 
2.17.1


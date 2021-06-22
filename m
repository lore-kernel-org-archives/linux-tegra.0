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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A214C2B9F4
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 13:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E6A461370
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 13:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhFVNom (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 09:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhFVNom (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 09:44:42 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA63C061574;
        Tue, 22 Jun 2021 06:42:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n20so23721913edv.8;
        Tue, 22 Jun 2021 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYbyIihRvo72ig9gf4wBfLcqKtLrAdcnI5ji/ZLlHA0=;
        b=cz/qeC3hhIw6O72ATzXg8SJFas4+uG7NerP9nsBN1hqKF49s2j+/tRrsXQQwlu0g8B
         3/IxtlrisFzly4q418bZx9bWVbaCQvXSpybETrznd36f/jqLp6Idg+FolubhzR5d7hGV
         mb1Fnr1Vu3JyCWq6D6IahilNZ//ngMQKpQiJwtdNnHJtYA/DhXoNWmA4+7sS3f+mkTho
         bGHNlqWKFBXukAvdwTBYJ9xuEsuqtE4nvLhY9enY3Sm6fduWQ9dq7Jf6m61RP+ocsSCS
         ElwvcCtSafGqxCIV36r1kr9O5DOHQ2dcnPue9WX+/RyxniDkYZMGqwKE9RDmpXBM6nbT
         2NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYbyIihRvo72ig9gf4wBfLcqKtLrAdcnI5ji/ZLlHA0=;
        b=c+4sIGaNycxmI9IKlwr/AdhT9wWMJyGM8TmctqQwLAM/oxWjz6G/qTOZS3gKmaSDuk
         6fXYudRUxuk2KF+rlfNtMOaB8OvsM+ljDLIpHNvG/edMGl28bmwnTAP4soaQ08JWlrbW
         Sse6n1onF9jc2MLzbamAjrQ83tP57oSq5tHatctUeyl6+gDm9FB8MuYq2GPc1kduNcnO
         /HeyNtp5RQDAlYwv9vfjZ703I04U6gSpqr0bhZ1ol1Y0Tuno4YpOLPT4wkKSHDYC4dCb
         0XZDJYTkHUZCCAH081UmY4ARXFcsbBO9Ouksm0MyD69qMCVuVqNNVRBB+dY2LHd3u52B
         qiQA==
X-Gm-Message-State: AOAM533MUeqQPhY2TT0/VXSxJX/XHfeJgjf7iJtQEzbK+OYvwjvpLAvT
        GB5HaFMhCkT18SnSc9mXSlM=
X-Google-Smtp-Source: ABdhPJwnizRCabvI0mSiesvRo3MpO3nMO5cL683gtSg8a7tEyYyLLY7pm/WXZzFs8FrDmKTErwT1eA==
X-Received: by 2002:aa7:c845:: with SMTP id g5mr5131917edt.306.1624369344211;
        Tue, 22 Jun 2021 06:42:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b25sm12386888edv.9.2021.06.22.06.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:42:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra: Fix compatible string for Tegra132 CPUs
Date:   Tue, 22 Jun 2021 15:44:22 +0200
Message-Id: <20210622134422.3869451-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The documented compatible string for the CPUs found on Tegra132 is
"nvidia,tegra132-denver", rather than the previously used compatible
string "nvidia,denver".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 89ba63dbf1cb..1c3a5c3dfc57 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1227,13 +1227,13 @@ cpus {
 
 		cpu@0 {
 			device_type = "cpu";
-			compatible = "nvidia,denver";
+			compatible = "nvidia,tegra132-denver";
 			reg = <0>;
 		};
 
 		cpu@1 {
 			device_type = "cpu";
-			compatible = "nvidia,denver";
+			compatible = "nvidia,tegra132-denver";
 			reg = <1>;
 		};
 	};
-- 
2.32.0


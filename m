Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CA2C7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 10:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239190AbjFIKzy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238927AbjFIKzw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 06:55:52 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732E5180
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 03:55:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5162d2373cdso2917014a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686308148; x=1688900148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewcOZHLOfcwvAfgEPzjGqtfipYsz68y0rOHqk/Ev6Xs=;
        b=lOR51KSyvXC/7/C08Ezdp74EeKGcvQR+bUmKExdovK6gIA3ayA1JgGMnmRzj7fhr4q
         l0zVukf4R3gfYU4jn5Hn731SDyv/RXGlOMtsqYa1/+chQYJivWBqWa+PWr0BZ+J0Szra
         BZwGEmNC1mguZInpcBDtGn4UhCDDw5V7vU4/2jCP8J2MLZsBG7FQ9SjeBjJZEi1dKZ/g
         n23YALn75ndkr8eLqPfNXaZTX8dUWb0qdXQ28i/oNO3JyI7WFgYtml9SbHNtz//ZXsLC
         PsljOsiTb0IM5sCU+CMdFhM763UxsccxZmG9rwNVWMibiby4jwyW0bwLZVsR665qDmwR
         t3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686308148; x=1688900148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewcOZHLOfcwvAfgEPzjGqtfipYsz68y0rOHqk/Ev6Xs=;
        b=Sa3aYjd6aegbbWri9Qp+aGxwTXtFAEEza5UZU9reBfsu72eXzlHOlpQ+CNHgtE6Dj4
         kq7ySzD6Rzv0pLrGcXuCC8ExddKiwacD18T1PNTdhdmYTuONc8iR8cpN//x8ez7LU3Uq
         qKPjZ3z4RZxGZrEGzdmHgoDHPE7bZtKvddbdZn/VjLWD6QvZt1SUbo91D4R/QCUD6cDh
         B0BIV3b9joCO+9B5nAiNYDU1zUur0jg6uKuABeq1foq3bGEcyOoaPy/uCgZTToHt7MYV
         b6aZByow4kwttNfEEalRgCsvKoqXXtfMWMiXOjigWVWoyaH8AJHmWQUvIzrV7LeS2p+E
         975g==
X-Gm-Message-State: AC+VfDwHJeL1P+SBpY5LTNmkFyRNcv2aA6HKrwjc9pjghCQY50LOtWed
        L56hGyWNNQb8LU1PIHCDKbXhIsLFAsc=
X-Google-Smtp-Source: ACHHUZ4RWeQP0dGOy6T8jurg+bch8SCnnkYUyiDcFtB8ycE1rpZwGWk4RnnTYmxHbXD8DAhVRs6aGQ==
X-Received: by 2002:a17:907:1c23:b0:965:7fba:6bcf with SMTP id nc35-20020a1709071c2300b009657fba6bcfmr1597978ejc.67.1686308147760;
        Fri, 09 Jun 2023 03:55:47 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ks27-20020a170906f85b00b00977eec5bb2csm1135210ejb.156.2023.06.09.03.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:55:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Shubhi Garg <shgarg@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] arm64: tegra: Sort properties more logically
Date:   Fri,  9 Jun 2023 12:55:42 +0200
Message-Id: <20230609105543.3730161-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

We typically sort the "compatible" property first because it defines
what the remainder of the properties can be. For the sound node on the
Jetson AGX Orin this wasn't done, so fix that up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index ac64dac287de..e499010fc673 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2345,9 +2345,8 @@ serial {
 	};
 
 	sound {
-		status = "okay";
-
 		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
 
 		dais = /* ADMAIF (FE) Ports */
 		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
-- 
2.40.1


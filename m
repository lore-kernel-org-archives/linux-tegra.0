Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67378C678D5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Feb 2023 17:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbjBURyW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Feb 2023 12:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbjBURyS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Feb 2023 12:54:18 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF8D2E808;
        Tue, 21 Feb 2023 09:54:18 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id g1so20319483edz.7;
        Tue, 21 Feb 2023 09:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70ZWc+aPECVoIOGnXpdYWCEvBu+S9xi4hcK/1o5dA1g=;
        b=JOGIEPFq1yRpU/rqPhtBfp9JfeCK080f4wNqaLEkIMT1B4SrfCNuSrrNG9nOrxftTj
         /LUTSaPaTe0PobDLxgP7xq4eZRBGeBYbWh9zeZhxUi1gWq+kuGEIW+P18zw4/x9cmKju
         Frtnut9JbsnWEZ2V81p1MrqiYoZz8n7MMCWCeuh7kjFCOvekaJC2WjVHLbDvUKeGnHb5
         85Gwfs1bkkTd6LdnQXDcSueAXkqFLcxKyeMCoXVejc93SuZGKgCO4UUEqvL7hT+2bU/U
         MqK0NEZvJAgRbGWVlOX1fsiLmxQXrRshmflw1EUlOMgPu3dBfMhvUNn5xEonMafaxcgX
         JdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70ZWc+aPECVoIOGnXpdYWCEvBu+S9xi4hcK/1o5dA1g=;
        b=Bhtr1epD5g8AVWNVlNPw/WKrnbd4GElcXH42N4LU9rD0+nn9ozsulzj4rp1zV/Hevp
         eKdD8QJI03BlV6b3U85PWXcg2VcyS7FaCsswj5UJkU4CQKzIXe64xd3jMMqT8RtLM02t
         LYu41EdNXgSGfaT2YfrRbFoDx+st9Mcy5YBT5iOlJ4KKSLWnpeqmgVAG9F6l/zkpgkgV
         OXhoU/7kih9yMKc4KDOmpYWW7t2MvwWxBSBeOD1VedPd9zEroM2+O8wPOVsz6MFIHx5U
         6f5ES6QipIIa7Phi54PoxCL69kOuM4krEpfF0gbBWiMdl9IxupJj0qKJyw6ukVcQM8I9
         eopw==
X-Gm-Message-State: AO0yUKUeEEfIjtdZz0q8we53dHhGMoQ/pd7asMn0QyL6qXP+K7P3V6U5
        ZUVyEQlSy/4jaG11mJ+DYzc=
X-Google-Smtp-Source: AK7set9bxb3sBTZ9HPPrWtJiiXj59V8Z1egn6LrKygIQ/IOgX0VSCyUgoHV1CA0dXa/DnMRFW2tO7w==
X-Received: by 2002:a17:907:c284:b0:8b3:1e35:8f22 with SMTP id tk4-20020a170907c28400b008b31e358f22mr17258018ejc.58.1677002056593;
        Tue, 21 Feb 2023 09:54:16 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906660300b008e493b7bb61sm236357ejp.153.2023.02.21.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 09:54:16 -0800 (PST)
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] ARM: tegra: asus-tf101: fix accelerometer mount matrix
Date:   Tue, 21 Feb 2023 19:53:47 +0200
Message-Id: <20230221175348.15681-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221175348.15681-1-clamor95@gmail.com>
References: <20230221175348.15681-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Accelerometer mount matrix used in tf101 downstream is inverted.
This new matrix was generated on actual device using calibration
script, like on other transformers.

Tested-by: Robert Eckelmann <longnoserob@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index c39ddb462ad0..588845965f99 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -577,9 +577,9 @@ accelerometer@f {
 					vdd-supply = <&vdd_1v8_sys>;
 					vddio-supply = <&vdd_1v8_sys>;
 
-					mount-matrix =	 "1",  "0",  "0",
-							 "0",  "1",  "0",
-							 "0",  "0",  "1";
+					mount-matrix =	"-1",  "0",  "0",
+							 "0", "-1",  "0",
+							 "0",  "0", "-1";
 				};
 			};
 		};
-- 
2.37.2


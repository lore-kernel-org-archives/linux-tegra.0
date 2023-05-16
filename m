Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232BAC7EE26
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 09:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjEPJ7K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 05:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbjEPJ7I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 05:59:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9B4A9;
        Tue, 16 May 2023 02:58:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so5360631a12.1;
        Tue, 16 May 2023 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231136; x=1686823136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ecQ1QAqy83fZynVMHk7cyWuqrbymjbMcfmdwdWKmeY=;
        b=eLrf4c8BHHJYBcXGcxBTt/o2nba9NVj9vyA0o652x9PAiROWY/TLTwqa6rHYUeSNJg
         dVKG9DCRCAUnTbQJZ9xRDVXZ2JsEOMbt8ivlGedbWQL/xvVWgA8gNhlFIKBByx6ljZI/
         07z9OnJl915MfdgwKrl4azJJo8DcXId1dYLDcBjzFhZX2vsNATQ+j8xEHFKPBOwruQ5o
         yD3betbHLEnqjwy/fgm84FvbzGTkv6iuos3HSp0vucRi/rpVveQq9Dt6HY5L9Imx1c3A
         Jg9o+MdyKSXkRxxk3s6bTMkimLX1BMkunOPQQJmQEhfRhuOCJWXcmTBhHhqf/5R9BB+/
         urxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231136; x=1686823136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ecQ1QAqy83fZynVMHk7cyWuqrbymjbMcfmdwdWKmeY=;
        b=jDxrm8pXEtV2GuXqzylkbCdsJ5cyvagA3fbQaz10zJla7d2ImvvIOxTVw1qNQmfEkq
         1HMP9gnMlA2vazklKhpw9RX8UYfEMAOBmOLz596rhYixdltMYcyofFSRUcOkD5A78BrD
         bY6T3jFziCPowwYnGLLi4dfLFbVzhVctywlvwRjgdAohUs8ZT/3/eMO5wwWHI9mIigtl
         9cLziTFm1cqLyyUeo7eZl34O/hPQc3P0II1rMXVpGQeDISO3OnF1OaZMOvhbWK6RAJBq
         wvJtfRfTk5hI0ervtLjpP9D4um7Q+zRJK0NRMYOH3bxVGiH/GVzF0UYPPfrW77A5mR0n
         ZSmA==
X-Gm-Message-State: AC+VfDyWN2SVLiErXcs8JS3dUevRBQab8RC+b9pJHDpcr8BxrlDQs/sW
        wiV8T3Rz7v04KOGlY1XE2Nc=
X-Google-Smtp-Source: ACHHUZ7kzm/UqFeComGzRRYzbR9QqRtilwCBNu4ft8bnFVzO6waNjN/xMDdwjaGXeFPgO5mMZdveqw==
X-Received: by 2002:a17:907:318a:b0:965:ddb1:99d3 with SMTP id xe10-20020a170907318a00b00965ddb199d3mr28310469ejb.14.1684231136179;
        Tue, 16 May 2023 02:58:56 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b0096557203071sm10730657ejc.217.2023.05.16.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:58:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: tegra: Document Jetson Orin Nano
Date:   Tue, 16 May 2023 11:58:48 +0200
Message-Id: <20230516095850.2426604-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516095850.2426604-1-thierry.reding@gmail.com>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
Document the corresponding compatible strings for these devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop compatible strings for additional SKUs

 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0340a369b5e1..0be74eea8303 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -227,5 +227,9 @@ properties:
           - const: nvidia,p3768-0000+p3767-0000
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin Nano
+        items:
+          - const: nvidia,p3767-0005
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.1


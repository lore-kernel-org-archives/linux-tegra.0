Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3362C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF7C460F5B
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbhKLMIp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbhKLMIi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EC3C06120C;
        Fri, 12 Nov 2021 04:05:47 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u18so15103839wrg.5;
        Fri, 12 Nov 2021 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVtKvey8nwC6Xti4V5jEtPduQkBHhon/IBbDQhsJqHw=;
        b=IQOH4qUXUsyvvbmfJeQJKJNhld+LycJAr/rYlR2JRyM48i1tDZg7oyyyXIuVQqrZY3
         KLtvpET5GHoIPxOAMokVbKvOjNDfJIBuVjgy2ONfJezQxuy6WTjQTeejFz2udvQVBrsv
         xINoqwtxoO9HNPn46q1+m5ykVEok3lmCg9Y6rhqxPTGoPglBd1IIONmgkYKCDMa8W/d5
         sv0VnKygRKXF1aonXE+R2yEO7Eijcn0bVAN5NsGD5wVwkSn5z5iEZIFNC3ifmxJ0mCqO
         4Urcy23PkK4S7rHOOI6MfAROYXYpHy4GnPw1/+zz3EGNTAOZ0qmb0uLmYnGRFTalrsup
         j3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVtKvey8nwC6Xti4V5jEtPduQkBHhon/IBbDQhsJqHw=;
        b=aVSCr3FkMLsqnjgrzGDOM1MgxVTbRt/H+mod+8PcnrcES4WJBaEf43MS/MkZV0qHxs
         nQfr4P5NFzGL0ZV8M04aR+mDutdFoQ50bstA+GNN+2ppnr1AUOFjd+p8D5N3prPm+bsA
         4HG/bvTm5FBjvmCO1xH/fAfHzleYWn4VcXzc09t7P+P9mXWAUHobObim8UMkCNdmeFXJ
         BN/gEvp1qYIGDE2DkxIupp2WdxKiKS1r/aaQYtllw5RYYH6EoQq51gFkK5BnG2SEP7zW
         sQmyFtVjB1ILhEYFx7mgf6K0xWOgcPhbBei/Zno9sXks8SFxFL+MX1Z9cW4IFTvHWlBn
         JLgw==
X-Gm-Message-State: AOAM531QDekQNEwRyjqS0HXMqFai2fAmgBGuMFMdWTXNO1mhaX4KI7ic
        CMaoK/QiThWP348lYZzDT/o=
X-Google-Smtp-Source: ABdhPJyIzqZwuMAELVkGH78oLdobRUYPWE3CXKEuFNHiegx3Q3qNmCnV0TNSDL+QnfscQ8k8k7S5yA==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr17675749wrd.373.1636718746185;
        Fri, 12 Nov 2021 04:05:46 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h3sm5363514wrv.69.2021.11.12.04.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 08/15] dt-bindings: fuse: tegra: Document Tegra234 FUSE
Date:   Fri, 12 Nov 2021 13:05:11 +0100
Message-Id: <20211112120518.3679793-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the FUSE block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
index 9389be60c198..dbf3b554bf63 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -21,6 +21,7 @@ properties:
           - nvidia,tegra210-efuse
           - nvidia,tegra186-efuse
           - nvidia,tegra194-efuse
+          - nvidia,tegra234-efuse
 
       - items:
           - const: nvidia,tegra132-efuse
-- 
2.33.1


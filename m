Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D3FC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B00160F5B
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbhKLMIg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhKLMId (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:33 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B09C061203;
        Fri, 12 Nov 2021 04:05:42 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d24so15176078wra.0;
        Fri, 12 Nov 2021 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5JANWom7AYj/J0cNTKPeI6vK9cck6pYyt8KHv8XRaM=;
        b=SzavajTM766wqR4bNyamkOYE101BPquSEvUTCZ1dYc8HCJYvnpXZCecgsy90jbrim4
         +a/ko+c2wUMlrSoY74JMlizDbmpBIHkQNXKBiTx6ebkIe3mYsHdMjhq+XWBci85IvHsI
         c6InMkeMUuux2NfyGaHxTGPHMIvru0T1Of6ua11aWULzikZgrCtuVo1B9N4HZkVHWgDB
         9zmt8pJx2Nc/G+aTWwwA5YEb27iFgzgqMZoUvZHHaJgq7dyesJ2hJPYTqKz+ErrqmcGI
         +ktFSCX1p/sYaOzgo1+ECtkpI3IobpSP/q4V1uccnXGfTnrvYwQ/cWHBgGopHGjqBXL/
         x2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5JANWom7AYj/J0cNTKPeI6vK9cck6pYyt8KHv8XRaM=;
        b=rYLvQ5q9W7Tif9Cxlx0qi34OnL4LU80t7E9ouURgpwDuWrR5nZoxXI9Uj9jZvFXDf1
         hUyGTS9vXGprn62n8/sIwVG/YlGT4ZikNBjoW5KvT5STs1f0Mqgswrdnvef22EuPloBk
         1SIvIfskW7CKDbcVO4orHwdWKZXzkcGKxfwPr0Gg1gxBLwt6GMpQde+3JNFkeIxEHyeL
         91RV7B/+rjr883ygIgrGyrpyZU/4Fl7K+hIEPQkZaamrocjZW5ypcuWBsFpchoalT0k5
         HkCdJxU/Px/Dv8rJPppxmSm4+VCM3rU7EJZI8aIGsHUGlXUe2+XQzJbVJJFaJeEEspUX
         RYOA==
X-Gm-Message-State: AOAM5326RwqKBwmbkjgnzStBD2VrkX7Z9ke73sD2npdvJEq0Xxz9WSeI
        pV+qTT+oPqAIMklDeP+TDJM=
X-Google-Smtp-Source: ABdhPJy5CwKZ+d8GorhfPK4Quri55fCqMowyeyZRieA3MSshADVuKQCo2M+XlhandV52dkqD7M8AIQ==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr18100153wru.182.1636718740775;
        Fri, 12 Nov 2021 04:05:40 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w10sm5217154wrq.88.2021.11.12.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:39 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 06/15] dt-bindings: rtc: tegra: Document Tegra234 RTC
Date:   Fri, 12 Nov 2021 13:05:09 +0100
Message-Id: <20211112120518.3679793-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the RTC block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
index a96154882161..f2d33ab23966 100644
--- a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -27,6 +27,7 @@ properties:
               - nvidia,tegra210-rtc
               - nvidia,tegra186-rtc
               - nvidia,tegra194-rtc
+              - nvidia,tegra234-rtc
           - const: nvidia,tegra20-rtc
 
   reg:
-- 
2.33.1


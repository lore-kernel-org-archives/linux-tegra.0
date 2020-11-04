Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E74C388F7
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB7082236F
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGKjwHVW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgKDONE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKDONE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:04 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E05C061A4A
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:03 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id e27so4451376lfn.7
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BYtDhpoRn51YFdIv0zS8Dj0qo9ZNgzqyOUTAvACjEik=;
        b=iGKjwHVWzIViSTgNQqXdumDFDnfMJFhEknKZASz9UVClLZlF+ZJyByzixRZ+SIM29k
         K+26eOlhbSrECVfal47YuOvGjwlpIhE+JUvE8UjcNsTUmmzzsKGBZ5ExE2M4KMqwW4HJ
         dr9GYQI76n39zwv0GOMOQhr8eZFGNzBciRrPM62BbdFF5arv+Pd14bxYhWup5YDPbhQx
         cQDb705y8oc+CBL56LJh9Fh505dpClz4Al/xOruimaSLLPfOjW47xn40JNndjyLdIKR8
         AG93pQ9AwdOKR3HDqonf/5jgTSa4L2qjZ9+r3v6OABAVzS78hRhshd0EnLk/WSvM31ci
         AwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYtDhpoRn51YFdIv0zS8Dj0qo9ZNgzqyOUTAvACjEik=;
        b=gsvhDYZ7pQCyI8dYPs8yFeNZzd4WqE3l+Q01stUydAWQqY9vxObTO0Y3i9E4zbd6Cl
         XpR/pOFostQi2dViIskMcHt9A09Zw1Ayi1CZqestvHCVXJSeTNNyb+XDk//tHhUNuLc/
         LOgePZb65/eHCxVM4lkXqZtnI8K9SR5Y/qgFk/yQsUL9O49RCpu6LjwqJByziKEHTmUw
         HPtX1upmQT1QfQif/lWjHkYEHTyjgkayK19XN/KeRdCW9z1sJY7ZatctNYJD830tMgZU
         80GvKQaKZ1NQrTOuKTyYkiKcJT2RKalp9/kIJWfwq+ONUw+zGkaTN3f4SdsnSR1fKVtX
         a85g==
X-Gm-Message-State: AOAM532coYc6WggWw2qSJxwWN95LHhekzhGw4B9VVLnjxKoMecW+wJJK
        J1G1HBkHmQszND+EGdIDUXXUR3MNKQg=
X-Google-Smtp-Source: ABdhPJzcUeU/L6Fw9zcFPGfGOrxvIVxEfV7yWpUDUhGIx8mobUAcPD4SvZURlN+VUQzUl9vaV5jiPg==
X-Received: by 2002:a19:641b:: with SMTP id y27mr10807866lfb.325.1604499182287;
        Wed, 04 Nov 2020 06:13:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/8] ARM: tegra: acer-a500: Correct thermal zone names
Date:   Wed,  4 Nov 2020 17:12:44 +0300
Message-Id: <20201104141251.25834-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename thermal zones in order fix dt_binding_check warning telling that
names do not match the expected pattern.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 575898e8c785..8e3e79b734b0 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1063,14 +1063,14 @@ sound {
 	};
 
 	thermal-zones {
-		nct1008-local {
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <0>; /* milliseconds */
 
 			thermal-sensors = <&nct1008 0>;
 		};
 
-		nct1008-remote {
+		cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-- 
2.27.0


Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CB6C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245100AbiBQTUT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:20:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQTUS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:20:18 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D4C3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:03 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id vz16so9734223ejb.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XBkEDduZe/ZtTx/BeXpyaFmCWzs5FU1gOArRkAKedR8=;
        b=F2l/oGi+nQlxVdFRVgd9XL/3yx9TBNcz/lvUkLI4NiGgnAC72OqzO+L4UoiGdRvgHu
         cnMMnRT7/s5jWe3fBZn0Za89tMRMrSjDICDSyHklppEePGJSC8hdEu/Xl3xH+8ufhjr/
         arc0fdg88bpU4MitbShf5l/q9GykPuvxc2TXoK6inXetdGtBBRosNnWaZCfmWxhLXGEy
         WsXjs5Eu31WEMXKrdyP8GW2LY52PYrcl6MDgs5qsoIsa5MiB342KKzSV30pT7JDrSGDr
         ZMiXESDpIQCMUr7jMJzHTDf8U7+eOB+vDA9JBYK09EOon0JNCRYaQUVjzrHFb0Z/AuVf
         JDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBkEDduZe/ZtTx/BeXpyaFmCWzs5FU1gOArRkAKedR8=;
        b=KnLwqyccf/EJ7xtPspj7ev8Aw57PUnVyZoRsWx0lUpYJjmgxvnAhQ5w2MDDlAl0LQn
         yGUXibj6ckM7QCwfqx238EQTYF7sg1bNNvamzgPAoBxoktQtfPcl5ij9QyTdgnhyJzB3
         tJSeQb+jZY5sbeNVDwLevfOwvtSrgaCzhJzqh8SedoFxYQoARWJ4WkzHyWfdD50eGX5u
         qcdsGcEfbAleBMkyN4P8IvWTv0w9amesHeC30pVgEH6vv/5dSSr60D4UewTJIgJ7TnhW
         +Gh3zk9xS7eFr1p/DOYbSP2injQ5kitJh9z1MEGtqnZ7MmC/Ttdwp5bf1r7m+O8PgrtD
         Watw==
X-Gm-Message-State: AOAM533AdUk9EKnWNxItE4wL9nx7LDCBFJvpUOtp8e9UYz/zITeZlnHC
        l4TDQW2Vk49KQUgSGB2N5LbT5dtaCfk=
X-Google-Smtp-Source: ABdhPJx2td4mgRhyrDK8SRXceTyvdHGUqU/xbOa3XaIh8uRA8i9MMIFMwijj//esg2sDsDHQLvGabA==
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id s6-20020a170906284600b006ce21cd5398mr3675591ejc.49.1645125601608;
        Thu, 17 Feb 2022 11:20:01 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id bn15sm1481040ejb.93.2022.02.17.11.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:20:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 10/25] tegra: Include private.h in list of source files
Date:   Thu, 17 Feb 2022 20:19:16 +0100
Message-Id: <20220217191931.2534836-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This makes sure that the proper dependencies are created and that the
file is distributed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra/meson.build b/tegra/meson.build
index 7585c8b5bf9d..53724d2107f5 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -20,7 +20,12 @@
 
 libdrm_tegra = library(
   'drm_tegra',
-  [files('tegra.c'), config_file],
+  [
+    files(
+      'private.h', 'tegra.c'
+    ),
+    config_file
+  ],
   include_directories : [inc_root, inc_drm],
   link_with : libdrm,
   dependencies : [dep_pthread_stubs, dep_atomic_ops],
-- 
2.35.1


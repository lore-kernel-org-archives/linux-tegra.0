Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CD9C433FE
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D032361439
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhJCAha (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 20:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhJCAh0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 20:37:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CB5C0613EC;
        Sat,  2 Oct 2021 17:35:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g193-20020a1c20ca000000b0030d55f1d984so3549481wmg.3;
        Sat, 02 Oct 2021 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytSrPE+NR12lrZWB6vcJD04bouRj97mzjhJl6l3sCao=;
        b=l8Yx0um3jmeASydaOyWXo2hWvJnHCW5Fk90mu1ak954R+wf2fOeLZdlGH5QkU6XaBn
         0GSpem9dKA3o1X4BbCTaE3GIQUV/GxpY9NK5VNtz6US6Lq8gFyB9gKoMI3iWtrhPrjX5
         DVaULvISJDUvPYSo/nPWA7qh9a17g9lil0Mj2G8cBVORNtM3U76faN19ApEbjQLL9KW4
         FDF9RJJVWGasjtjR5aWEvnOssjtR6gCLNspQCp47lSQnEbdAnI3ZuU9Np5n8la/VOvnQ
         doyJFh/0Ef+GE6enIEKyrL2gu5alGieRLgV2yhg8V/PykPtI4yzmz6mGr/vws0e06w8p
         O1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytSrPE+NR12lrZWB6vcJD04bouRj97mzjhJl6l3sCao=;
        b=j5mat2hUgOtD6487DFJeFB7qGtoxiRtj8EzMvPvEkE5E6UkVu5s/vqcNZGQSNdlg25
         5lcyCM1k6NBRb9dH9tvGyN34L/zhxqS/lOUS4Qa0eURb+i5muREhv2viI6RAEtaRgwK1
         5aHdD+zByT6i+u1iMZzbsOW1J48ZgHg58O+DOFzIy1OS2CuIoeGg6hoFt1syriSzGcp7
         9yC1rdllg3Z5Gl1O15ovD4dBrKuQnQ7pyAEmpmnvOVQ4zM6WQ9RBUQAFWjWeWZyUln/D
         bgmWK4Phnq6T4lvUIL8j82HG1Yd8EI9Eq50Is0oKUZVdw2mYzPqa+Fr92QvcgnMHatn9
         DY3w==
X-Gm-Message-State: AOAM531ukr2PgZNSV6mzOTSe2tWjoWOxasF7SIdTGjO2CeE6aUJJiJdq
        tDyKxg+Cl0ux2j7K22MzXvXGah4WUoE=
X-Google-Smtp-Source: ABdhPJw4MeKesqh9+tkoGdVYZPTdgPqTW0+f8g+Xekhi2lgf4v1p5LB64/D5bRsygEbkkR5ZvifZrQ==
X-Received: by 2002:a7b:c30c:: with SMTP id k12mr11442924wmj.38.1633221339010;
        Sat, 02 Oct 2021 17:35:39 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id m21sm10981445wmq.37.2021.10.02.17.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 17:35:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/4] memory: Add LPDDR2 configuration helpers
Date:   Sun,  3 Oct 2021 03:35:08 +0300
Message-Id: <20211003003509.28241-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003003509.28241-1-digetx@gmail.com>
References: <20211003003509.28241-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add helpers for reading and parsing standard LPDDR2 properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/jedec_ddr.h      | 21 +++++++++++++++++
 drivers/memory/jedec_ddr_data.c | 42 +++++++++++++++++++++++++++++++++
 drivers/memory/of_memory.c      | 34 ++++++++++++++++++++++++++
 drivers/memory/of_memory.h      |  9 +++++++
 4 files changed, 106 insertions(+)

diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
index e59ccbd982d0..14cef272559e 100644
--- a/drivers/memory/jedec_ddr.h
+++ b/drivers/memory/jedec_ddr.h
@@ -230,4 +230,25 @@ struct lpddr3_min_tck {
 	u32 tMRD;
 };
 
+union lpddr2_basic_config4 {
+	u32 value;
+
+	struct {
+		unsigned int arch_type : 2;
+		unsigned int density : 4;
+		unsigned int io_width : 2;
+	} __packed;
+};
+
+struct lpddr2_configuration {
+	int arch_type;
+	int density;
+	int io_width;
+	int manufacturer_id;
+	int revision_id1;
+	int revision_id2;
+};
+
+const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id);
+
 #endif /* __JEDEC_DDR_H */
diff --git a/drivers/memory/jedec_ddr_data.c b/drivers/memory/jedec_ddr_data.c
index ed601d813175..1f214716ac45 100644
--- a/drivers/memory/jedec_ddr_data.c
+++ b/drivers/memory/jedec_ddr_data.c
@@ -7,6 +7,7 @@
  * Aneesh V <aneesh@ti.com>
  */
 
+#include <dt-bindings/memory/lpddr2.h>
 #include <linux/export.h>
 
 #include "jedec_ddr.h"
@@ -131,3 +132,44 @@ const struct lpddr2_min_tck lpddr2_jedec_min_tck = {
 	.tFAW		= 8
 };
 EXPORT_SYMBOL_GPL(lpddr2_jedec_min_tck);
+
+const char *lpddr2_jedec_manufacturer(unsigned int manufacturer_id)
+{
+	switch (manufacturer_id) {
+	case LPDDR2_MANID_SAMSUNG:
+		return "Samsung";
+	case LPDDR2_MANID_QIMONDA:
+		return "Qimonda";
+	case LPDDR2_MANID_ELPIDA:
+		return "Elpida";
+	case LPDDR2_MANID_ETRON:
+		return "Etron";
+	case LPDDR2_MANID_NANYA:
+		return "Nanya";
+	case LPDDR2_MANID_HYNIX:
+		return "Hynix";
+	case LPDDR2_MANID_MOSEL:
+		return "Mosel";
+	case LPDDR2_MANID_WINBOND:
+		return "Winbond";
+	case LPDDR2_MANID_ESMT:
+		return "ESMT";
+	case LPDDR2_MANID_SPANSION:
+		return "Spansion";
+	case LPDDR2_MANID_SST:
+		return "SST";
+	case LPDDR2_MANID_ZMOS:
+		return "ZMOS";
+	case LPDDR2_MANID_INTEL:
+		return "Intel";
+	case LPDDR2_MANID_NUMONYX:
+		return "Numonyx";
+	case LPDDR2_MANID_MICRON:
+		return "Micron";
+	default:
+		break;
+	}
+
+	return "invalid";
+}
+EXPORT_SYMBOL_GPL(lpddr2_jedec_manufacturer);
diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index d9f5437d3bce..8aa777f2a090 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -298,3 +298,37 @@ const struct lpddr3_timings
 	return NULL;
 }
 EXPORT_SYMBOL(of_lpddr3_get_ddr_timings);
+
+/**
+ * of_lpddr2_get_config() - extracts the lpddr2 chip configuration.
+ * @np: Pointer to device tree node containing configuration
+ * @conf: Configuration updated by this function
+ *
+ * Populates lpddr2_configuration structure by extracting data from device
+ * tree node. Returns 0 on success or error code on failure. If property
+ * is missing in device-tree, then the corresponding @conf value is set to
+ * -ENOENT.
+ */
+int of_lpddr2_get_config(struct device_node *np,
+			 struct lpddr2_configuration *conf)
+{
+	int err, ret = -ENOENT;
+
+#define OF_LPDDR2_READ_U32(prop, dtprop) \
+	err = of_property_read_u32(np, dtprop, &conf->prop); \
+	if (err) \
+		conf->prop = -ENOENT; \
+	else \
+		ret = 0
+
+	/* at least one property should be parsed */
+	OF_LPDDR2_READ_U32(manufacturer_id, "jedec,lpddr2-manufacturer-id");
+	OF_LPDDR2_READ_U32(revision_id1, "jedec,lpddr2-revision-id1");
+	OF_LPDDR2_READ_U32(revision_id2, "jedec,lpddr2-revision-id2");
+	OF_LPDDR2_READ_U32(io_width, "jedec,lpddr2-io-width-bits");
+	OF_LPDDR2_READ_U32(density, "jedec,lpddr2-density-mbits");
+	OF_LPDDR2_READ_U32(arch_type, "jedec,lpddr2-type");
+
+	return ret;
+}
+EXPORT_SYMBOL(of_lpddr2_get_config);
diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
index 4a99b232ab0a..95eccc251b04 100644
--- a/drivers/memory/of_memory.h
+++ b/drivers/memory/of_memory.h
@@ -20,6 +20,9 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 const struct lpddr3_timings *
 of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
 			  struct device *dev, u32 device_type, u32 *nr_frequencies);
+
+int of_lpddr2_get_config(struct device_node *np,
+			 struct lpddr2_configuration *conf);
 #else
 static inline const struct lpddr2_min_tck
 	*of_get_min_tck(struct device_node *np, struct device *dev)
@@ -46,6 +49,12 @@ static inline const struct lpddr3_timings
 {
 	return NULL;
 }
+
+static int of_lpddr2_get_config(struct device_node *np,
+				struct lpddr2_configuration *conf)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_OF && CONFIG_DDR */
 
 #endif /* __LINUX_MEMORY_OF_REG_ */
-- 
2.32.0


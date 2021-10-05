Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E07C4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BABC611C5
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236934AbhJEXEB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbhJEXDD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:03:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67572C061764;
        Tue,  5 Oct 2021 16:01:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x27so2372379lfu.5;
        Tue, 05 Oct 2021 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGJmhCD7lj4pf2QQibega1UVnHWQYId3KWk/FyGD5bA=;
        b=jkdIfW5LRJv52b+SJ0wsh7Rou+yHzWk1hOrs65GTw4XRO+zutCnmhcCg3/cHuSgqMI
         hPADvc/Z+9Z7gmQOz7v3ayp/XllhiXZPa/AOuOWwdZm3HGZ6WRn0aUmROzKLk/tCVNAZ
         OfxyZIp4siAezqKMo5KrW81qG1snO1V533xNXaDkdhF3KaRJ2niuOWGb9tDC83fdXS7o
         YxOx5aJoGiw4KxvXy1qeMPDJ7lllSaQskiu7xI6lYgSZLpasNp2/sCan2FuV3il0MxRx
         JjDPD8Wz23wnECpKUWSOvfSUKeQdLDirLJqxIXPukfhuAKdp7oZaJxjJTMzNLzcDyfMH
         r8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGJmhCD7lj4pf2QQibega1UVnHWQYId3KWk/FyGD5bA=;
        b=wu/hCGAAymwLiN5JpmiUNt34rfCS6Vc80SevRug1Afj2upXjyoeOpT3eZZt+LCVjXT
         POBIKEGR+3bG76LB+E0/A8RUPqzgP0i28pv/tBro2ksJCDSPutPSrYe06h1vI6gLUEuU
         kMxrUqwaUStIxf/J1xESEnwsP+qVqrbUKTdAbQvDMAi0PGgbyM4repJmbt/SP2DykIGy
         Og2x/wOD3azLE8LpKf+tsaqacwpNPUey0a2aT3U22HnigLbGTO6XyKPzvH3I5+gs6MRr
         wfWPFUKMw2DpxYVLFNGojRP37B+s7PMGBrX3Bk2wOpq7g/oDWsMO6Fg6EzZnjltBXPoF
         o5Vw==
X-Gm-Message-State: AOAM533HDvct+FdDvOhjq6xZ9kYSFM1ojpbje0F+EJonz7qPNxkHDKCV
        YoJ5QABBnl7nsUsEk1CmR3M=
X-Google-Smtp-Source: ABdhPJyVSmvab0EZvr1/wYutnboHPirETRv/XA5MVgplnS8lDmH0/j4CW3G4SpZvCzxZ/FhxFogdNg==
X-Received: by 2002:a05:6512:1102:: with SMTP id l2mr5933441lfg.181.1633474870796;
        Tue, 05 Oct 2021 16:01:10 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 6/7] memory: Add LPDDR2 configuration helpers
Date:   Wed,  6 Oct 2021 02:00:08 +0300
Message-Id: <20211005230009.3635-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add common helpers for reading and parsing standard LPDDR2 configuration
properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/jedec_ddr.h      | 46 +++++++++++++++++
 drivers/memory/jedec_ddr_data.c | 41 +++++++++++++++
 drivers/memory/of_memory.c      | 88 +++++++++++++++++++++++++++++++++
 drivers/memory/of_memory.h      |  9 ++++
 4 files changed, 184 insertions(+)

diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
index e59ccbd982d0..6bc617ee2e5c 100644
--- a/drivers/memory/jedec_ddr.h
+++ b/drivers/memory/jedec_ddr.h
@@ -112,6 +112,26 @@
 #define NUM_DDR_ADDR_TABLE_ENTRIES			11
 #define NUM_DDR_TIMING_TABLE_ENTRIES			4
 
+#define LPDDR2_MANID_SAMSUNG		1
+#define LPDDR2_MANID_QIMONDA		2
+#define LPDDR2_MANID_ELPIDA		3
+#define LPDDR2_MANID_ETRON		4
+#define LPDDR2_MANID_NANYA		5
+#define LPDDR2_MANID_HYNIX		6
+#define LPDDR2_MANID_MOSEL		7
+#define LPDDR2_MANID_WINBOND		8
+#define LPDDR2_MANID_ESMT		9
+#define LPDDR2_MANID_SPANSION		11
+#define LPDDR2_MANID_SST		12
+#define LPDDR2_MANID_ZMOS		13
+#define LPDDR2_MANID_INTEL		14
+#define LPDDR2_MANID_NUMONYX		254
+#define LPDDR2_MANID_MICRON		255
+
+#define LPDDR2_TYPE_S4			0
+#define LPDDR2_TYPE_S2			1
+#define LPDDR2_TYPE_NVM			2
+
 /* Structure for DDR addressing info from the JEDEC spec */
 struct lpddr2_addressing {
 	u32 num_banks;
@@ -170,6 +190,32 @@ extern const struct lpddr2_timings
 	lpddr2_jedec_timings[NUM_DDR_TIMING_TABLE_ENTRIES];
 extern const struct lpddr2_min_tck lpddr2_jedec_min_tck;
 
+/* Structure of MR8 */
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
+/*
+ * Structure for information about LPDDR2 chip. All parameters are matching
+ * raw values of mode register bitfields or negative if info unavailable.
+ */
+struct lpddr2_info {
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
 /*
  * Structure for timings for LPDDR3 based on LPDDR2 plus additional fields.
  * All parameters are in pico seconds(ps) excluding max_freq, min_freq which
diff --git a/drivers/memory/jedec_ddr_data.c b/drivers/memory/jedec_ddr_data.c
index ed601d813175..2cca4fa188f9 100644
--- a/drivers/memory/jedec_ddr_data.c
+++ b/drivers/memory/jedec_ddr_data.c
@@ -131,3 +131,44 @@ const struct lpddr2_min_tck lpddr2_jedec_min_tck = {
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
index d9f5437d3bce..60ecd52680a8 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -298,3 +298,91 @@ const struct lpddr3_timings
 	return NULL;
 }
 EXPORT_SYMBOL(of_lpddr3_get_ddr_timings);
+
+/**
+ * of_lpddr2_get_info() - extracts information about the lpddr2 chip.
+ * @np: Pointer to device tree node containing lpddr2 info
+ * @dev: Device requesting info
+ *
+ * Populates lpddr2_info structure by extracting data from device
+ * tree node. Returns pointer to populated structure. If error
+ * happened while populating, returns NULL. If property is missing
+ * in a device-tree, then the corresponding value is set to -ENOENT.
+ */
+const struct lpddr2_info
+*of_lpddr2_get_info(struct device_node *np, struct device *dev)
+{
+	struct lpddr2_info *ret_info, info = {};
+	struct property *prop;
+	const char *cp;
+	int err;
+
+	err = of_property_read_u32(np, "revision-id1", &info.revision_id1);
+	if (err)
+		info.revision_id1 = -ENOENT;
+
+	err = of_property_read_u32(np, "revision-id2", &info.revision_id2);
+	if (err)
+		info.revision_id2 = -ENOENT;
+
+	err = of_property_read_u32(np, "io-width", &info.io_width);
+	if (err)
+		return NULL;
+
+	info.io_width = 32 / info.io_width - 1;
+
+	err = of_property_read_u32(np, "density", &info.density);
+	if (err)
+		return NULL;
+
+	info.density = ffs(info.density) - 7;
+
+	if (of_device_is_compatible(np, "jedec,lpddr2-s4"))
+		info.arch_type = LPDDR2_TYPE_S4;
+	else if (of_device_is_compatible(np, "jedec,lpddr2-s2"))
+		info.arch_type = LPDDR2_TYPE_S2;
+	else if (of_device_is_compatible(np, "jedec,lpddr2-nvm"))
+		info.arch_type = LPDDR2_TYPE_NVM;
+	else
+		return NULL;
+
+	prop = of_find_property(np, "compatible", NULL);
+	for (cp = of_prop_next_string(prop, NULL); cp;
+	     cp = of_prop_next_string(prop, cp)) {
+
+#define OF_LPDDR2_COMPAT(compat, ID) \
+		/* legacy Elpida compatible starts with a capital letter */ \
+		if (!strncasecmp(cp, compat ",", strlen(compat ","))) { \
+			info.manufacturer_id = LPDDR2_MANID_##ID; \
+			break; \
+		}
+
+		OF_LPDDR2_COMPAT("samsung", SAMSUNG)
+		OF_LPDDR2_COMPAT("qimonda", QIMONDA)
+		OF_LPDDR2_COMPAT("etron", ETRON)
+		OF_LPDDR2_COMPAT("nanya", NANYA)
+		OF_LPDDR2_COMPAT("hynix", HYNIX)
+		OF_LPDDR2_COMPAT("mosel", MOSEL)
+		OF_LPDDR2_COMPAT("winbond", WINBOND)
+		OF_LPDDR2_COMPAT("esmt", ESMT)
+		OF_LPDDR2_COMPAT("spansion", SPANSION)
+		OF_LPDDR2_COMPAT("sst", SST)
+		OF_LPDDR2_COMPAT("zmos", ZMOS)
+		OF_LPDDR2_COMPAT("intel", INTEL)
+		OF_LPDDR2_COMPAT("numonyx", NUMONYX)
+		OF_LPDDR2_COMPAT("micron", MICRON)
+		OF_LPDDR2_COMPAT("elpida", ELPIDA)
+
+#undef OF_LPDDR2_COMPAT
+	}
+
+	if (!info.manufacturer_id)
+		info.manufacturer_id = -ENOENT;
+
+	ret_info = devm_kzalloc(dev, sizeof(*ret_info), GFP_KERNEL);
+	if (ret_info)
+		*ret_info = info;
+
+	return ret_info;
+}
+EXPORT_SYMBOL(of_lpddr2_get_info);
diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
index 4a99b232ab0a..1c4e47fede8a 100644
--- a/drivers/memory/of_memory.h
+++ b/drivers/memory/of_memory.h
@@ -20,6 +20,9 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 const struct lpddr3_timings *
 of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
 			  struct device *dev, u32 device_type, u32 *nr_frequencies);
+
+const struct lpddr2_info *of_lpddr2_get_info(struct device_node *np,
+					     struct device *dev);
 #else
 static inline const struct lpddr2_min_tck
 	*of_get_min_tck(struct device_node *np, struct device *dev)
@@ -46,6 +49,12 @@ static inline const struct lpddr3_timings
 {
 	return NULL;
 }
+
+static inline const struct lpddr2_info
+	*of_lpddr2_get_info(struct device_node *np, struct device *dev)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF && CONFIG_DDR */
 
 #endif /* __LINUX_MEMORY_OF_REG_ */
-- 
2.32.0


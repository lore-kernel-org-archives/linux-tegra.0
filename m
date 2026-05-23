Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D9365A07
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525049; cv=none; b=BHKPEcf6baBB0vEdO5f9976wnKclMjQst/khblijDsJ8BuYKlVERrkijeYze5Kra4Xi4Kkd6JqZrDg3I1SGaxGEwTm99bFQoMvoFsjQBblqNiG7wUde0WHh2AAn5N7SRv2d/BB+1zcmfpssVSlw4g1EBv6ghxhMYcLfk4RhETag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525049; c=relaxed/simple;
	bh=O4o9ol0z9p1ozuLH8y297KGzgYwC2IgBRXVV6czRJHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvOeOgHj+ZrDp4pVKFDcG0quXEDySRHZL1H4ldM69NadZsgK5K/XCrO7zRCARZEqDDqQny+aD6muE96Xh69r1jcPNl2r+kcMJk9YWFAhPLqvoNUd9xqMiYDnhTdB5x90okK/nW9K7E0Rrb2NfA1zSCqLFv2erhbTYv2ZzbeOyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imnVYIMh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imnVYIMh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so5353071a12.2
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525046; x=1780129846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=imnVYIMhBy80+n7Te9lWyG3Wzocdx/9S3tLruB550EhYCV7vdCLl3PxPqaWxqFBIif
         8zSzmZJNXVGN4nl1AvL1qfzzW7mFxt1jzmKAELjnhYDomx4NAyKpxtj4HygbSVD+dIkB
         omInIBLYdW4t+mCSCmAsiReu8LQ+EbKwV0/T4Pxn+N+ACD3UZ7Bmwns83CLVbXtRlK7s
         1B3unh30uHX/yvuQDfOw8ddYGp/ROIu+v4DBbRKpZRROBte5CUYv9zZBnD1C34qbUzwH
         4R7e8DfybL1GNBFT4ihZbtbnQhHXPtXtNT7MprS/F9vl7fpYx43K1nb4VFuPMba9DzSf
         sCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525046; x=1780129846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWj8ptSzNBKrFt1mxoQKUyY2RzDOkBP4g8UuTE+1+DQ=;
        b=Fou8emfE3zBkPnGXF8pmJX4d76X1gtcwMfU49EuwYvYaXK+BqFr+3XztptXgvx82uW
         FDdb0QrraKhdVb4r87a2R/AUHHu222gyeC2b/Tu155XINMKjQ5wr97DzXVRS3M4S4DZe
         meL6ZVSUNdlYVnPFLiclbX5Vm5h+TPFp+zepasVQANxoeXTra05blhRzkr4A3L1ByC8N
         +hlKZiu64glKo3SLlG6DYpn+CYT7aXvL4ny9Gge5ggNZfTkM0ydH4gJOvt66XG+NWR41
         psFxTwhfe6UKH3xwgu18UkuUx8yryQk02cPqPaNSJFoH7pJEIWt5AO13+kQcagKZp4LC
         NpCw==
X-Forwarded-Encrypted: i=1; AFNElJ/HWpWVOs8Z31MOQwohs5KQDaz/g2srFSuE770LNdURfl2Incz+AaQQK1UT4cxAk1776MLBPwcIoqpTuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYcqvxpNlmup7RYZv1EpYPFisUcnzOwc7V7qN3ViiptRBNc1F4
	iCvMvl86qc57q17jFtK/NB7Z2FTsYtCAh5IzKjABjOC2/ieyEgP+n+s9
X-Gm-Gg: Acq92OFZeNeEiHrQpcBSyJ4ECKHj9e2w8EdaGt1H+zPD0CBoiEZ9mw/Io1vVq8wDnxA
	KYlpu/frn9dnbBq6JviyN/AlkdA9COroOU2VnTr2ZGCWWM/3jqtEtaSvy8hS0lsCrhayYU/k5wk
	U3MvLps5LU/sK/5JVCJIBzNAAG0glOk9Xg5oJ6Zv7r9mELZwDX8aUHm7qCOAM2XC3et4B+J2kmH
	ezi4IuHqJs4cm5GuHfLhD6p5N39q6ZrNvk8wIE7belspaddqdu1omiusycxvXTSlz9OpUTlQm0/
	KdNyzgAPSajYZBrSZT8ONKFQpHudF6bRTEH5CVXrILZ4GNaLPc2c72P/J+M3juWRix3xHVAo2dG
	AnCFp7QEqpRJY9Fx6HyuLM0z10+Gxz5FBpK4ZBRIlIuOu9IuMoVWW2gV3bFBL0KuhPZDcBYSPxe
	S6p24FPjJL/y23xRXrkQlT8uY=
X-Received: by 2002:a05:6402:3719:b0:687:285d:44a8 with SMTP id 4fb4d7f45d1cf-6889c453fa1mr3595245a12.14.1779525045838;
        Sat, 23 May 2026 01:30:45 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] usb: chipidea: tegra: Expose tegra_usb structure
Date: Sat, 23 May 2026 11:30:12 +0300
Message-ID: <20260523083013.46372-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_usb structure is platform data of USB controller and is required
for proper controller malipulation if its init/deinit is externally
controlled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 13 +------------
 include/linux/usb/tegra_usb_phy.h    | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index a19cb3b33bf3..109c4afdee4a 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -16,6 +16,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
 #include <linux/usb/phy.h>
+#include <linux/usb/tegra_usb_phy.h>
 
 #include <soc/tegra/common.h>
 
@@ -23,18 +24,6 @@
 
 #include "ci.h"
 
-struct tegra_usb {
-	struct ci_hdrc_platform_data data;
-	struct platform_device *dev;
-
-	const struct tegra_usb_soc_info *soc;
-	struct usb_phy *phy;
-	struct clk *clk;
-
-	bool needs_double_reset;
-	bool externally_controlled;
-};
-
 struct tegra_usb_soc_info {
 	unsigned long flags;
 	unsigned int txfifothresh;
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de..ba74b7ebfba0 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/usb/chipidea.h>
 #include <linux/usb/otg.h>
 
 struct gpio_desc;
@@ -62,6 +63,20 @@ enum tegra_usb_phy_port_speed {
 	TEGRA_USB_PHY_PORT_SPEED_HIGH,
 };
 
+struct tegra_usb_soc_info;
+
+struct tegra_usb {
+	struct ci_hdrc_platform_data data;
+	struct platform_device *dev;
+
+	const struct tegra_usb_soc_info *soc;
+	struct usb_phy *phy;
+	struct clk *clk;
+
+	bool needs_double_reset;
+	bool externally_controlled;
+};
+
 struct tegra_xtal_freq;
 
 struct tegra_usb_phy {
-- 
2.51.0


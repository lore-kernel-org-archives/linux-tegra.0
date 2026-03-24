Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7440DFBC
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317462; cv=none; b=kNgqHGp+I4sb/yw3iPgSfIWsKLx7tZjshYRNhMzHXAA8xehftTveYI6aMKwb5sYC4ub7mcrWTjhJR44CXDDvy03oE1gshm1o43Amy5ZUbtR9BJ/XqbSKNuCqST1X+lJr986bhNmwWgi0mUzzIXDOwIg9JH7xEPGoJYrUPJQY5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317462; c=relaxed/simple;
	bh=I/V99haVL9JoBdH26cf+SF6eGZu4bFba7hgTA+LWCOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2Xahw61BP8Sdv8ObsbqvHWXCwJDaQplJzdRLtrOKNjCuTbRO/m48kjehMUbdD+UYxR7lv9dOaDaxXdewvDkD1fje3+AOt03sYyLV71eqJaQubBZzYv0v5+JmEgX8kVcxfZte4zpZxO7YhigzXdllfG8DVoBUIHHlHO6yaCZSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+zBCcdG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+zBCcdG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so271297a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317460; x=1774922260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIXrKDA73NF+pZizlSPKEVnOH0GBazyacpmOOa1fU90=;
        b=Z+zBCcdGkMFJPJ+mQpFnzPTzLL1T55BmFW8k791Ui9HIz1nEab61r90qHky0IBMtO3
         vmkZu6K3+UyOa2Dh9Tax/CxabARLtVEQEU7xYnMXZz1QWs7UWMFZTIved1TSwhNmB4xt
         zc64GslY+f+3xur5rpqvQLBEPHqNe50tJo+Popal7MNO+tW6UYch2QzG8FJReAxrubUM
         AJV26ELNJfLBnpzkLHFgKIUgdNYXVo9+YOivHMVde0nnMLrrW8CFYL8t+tHcO/b/ADEB
         LHF/clm/XTa+CiUAw4ghX06uyo2nTDvatQJF4lVHQZWEvHwyhQCTCX1HWYnfTIedeCEF
         YbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317460; x=1774922260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIXrKDA73NF+pZizlSPKEVnOH0GBazyacpmOOa1fU90=;
        b=ic9t6CgerKDZRX7IOU8jne2WWC+QFrVr45EAYIoDrOkBiVEgrywbUyw6yxb5GpQtNV
         BV81+GXlbUWtIzwDz+SWKZXyGp0RW4lYkAoYsrwuPxq4DZFghe/jziV67ZkMZON4SD6t
         UOchuFJzTZJIQiYArG0hqD4DlWNW8QLmjHqcMZsP1zqeRvPOqjbrTudZ6tvwSIKcXywD
         Gwiu/4TX6Mt4pLZB1CsBhENUnczR+vZt5eLAr/U7+mKYsgiZyHtDDqsLc0KUHEV78Ff6
         rTlOagj32wJ0O0eXXD/LXwBWm181rRPQGRxH9fFeEYHZPoNn16ny6LvhHVIIY/tlK6Se
         E/ww==
X-Gm-Message-State: AOJu0YzZwdstqSez6p8r0p9TTqhi8p4ptWb5q+zMmFoy184QIOhf4Lsj
	vxYtPJxzJ5tS+ELm0faZjDo6IWSNAdNr/EOgFHucQlB1ryPViz51Us9fcqPBfg==
X-Gm-Gg: ATEYQzwC2+g9KScYz2dEtOWeH0nZKuSvt9Fxq708EVpH2MwDK+VLowvM1xBW62CXItO
	MWH8qaYVfJYSkDpKlNmAp1wKtFOb0vHX4dsj5/IJjJKDwqKz+5+4O5cPQw6f1/HR3SmWokYMTzH
	IcncWRsnoVgYx3a0ZqqvBzSSaErUh0w2KQY1npqmaBjlZUlRM+cwoB+nT5h71GhMSPVFvhgEWWo
	1J/K1rBBxu1JXC5OjojPV9D3Tcq47svwUNsrsMuBL1RH2kLSm6P+PhWT3D0U24wjsVbbgpt4tIq
	tYpATLkl/X0EDNZ8nwAcSfcJZgAtXBAtJaKkz4AwnjZ+9a7JhowwvO3E0tHqClUutYK6uWBEasF
	3snUfhFYLXJrZz4o/V+lZNN7S15GMBL4K7ZBECwljhEDY3Tm4j/nSfuilDBbd1pu1yuNKoaf+dQ
	RcroZYEPvYooXhHVdrPBrigVXgwTd3vEfDtz15nKFi5brj+B2oRTeT8+s=
X-Received: by 2002:a17:902:e551:b0:2ae:ceeb:fa5f with SMTP id d9443c01a7336-2b08276a3b9mr131483105ad.28.1774317460022;
        Mon, 23 Mar 2026 18:57:40 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm127922615ad.55.2026.03.23.18.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:57:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] firmware/tegra: add COMPILE_TEST
Date: Mon, 23 Mar 2026 18:57:22 -0700
Message-ID: <20260324015722.12507-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this driver specifically, there's no arch specific stuff needed.

Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
CLK_TEGRA_BPMP also depends on TEGRA_BPMP.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: also build the tegra clk stuff.
 drivers/clk/Makefile           | 2 +-
 drivers/firmware/tegra/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 760d9643705f..334d5c522394 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)		+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-y					+= tegra/
 obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f..ae21f460807d 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra firmware driver"

 config TEGRA_IVC
 	bool "Tegra IVC protocol" if COMPILE_TEST
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
@@ -13,7 +13,7 @@ config TEGRA_IVC

 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
+	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
--
2.53.0


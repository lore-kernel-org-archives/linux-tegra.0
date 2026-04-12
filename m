Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE337FF48
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027172; cv=none; b=kODELcQuTk+Tj5l5L3uC8v6sQCmoFF6SduI0empg03XCw6HWZ5Bg/Dbl+Mngmql2Rn84ny+h0NkP2WpdicyvfifOisazRKG8iUAyCJDkbIM+ZBPKp+aizgTWZZGLwYnboSL0mPYOJA2w4c22gg65G3cUO63uM2UarSwzuEYgYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027172; c=relaxed/simple;
	bh=V3bsKhIGaACHg6eM2xcGs/HQit58c7w+q2E2j1CAkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OliD1Iwa58KBHaJHiKb0AIGSVcS0my0L2dlRnPvx1aJPNbJnyzBTmR1nVYA1O25FQAjFtbvmtT0zlwEcOjYMaJWUJUhrIArlXw6+hNbUlvbubfhLFpAXC7R+UY19iltaLyj0VtoWK/CswKV4HyIoGzRlac0J7e4DFJjI8jKGiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgPxzRch; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgPxzRch"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso532079466b.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027169; x=1776631969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsyBN8eqgGgLu6vT6sEQv8tzWdzbqq6eDTPaal4nWic=;
        b=hgPxzRchTAuPXQGf+g7xsJUR487jBlBPP+t988slnWuQPcc/3AexiH5o7vut8s2wJA
         HO7RAukpTJapG4GeoTOYyP0TS6t7B/wZ7Z/fXbx6klaIazKM3CxV/6GUkfqD30f0Nqob
         HmIvJLMbpUDYK5oEkH7D/bQ5qhHkGvfJ6I/VFk3IBXCsJithZcO/YmYRNx9lhxTR/G7D
         WWshUNwzuK6KomO1qBGSM6Kt5zu/++lQsY+s63J8/fWwADaYPPXdQgwpDgNgJKk8ql2l
         c/OOqdR08MB6rObv6PDMvpVBjZIt1DeiS8uKx7SWJRFCJJokZNWOt2WIxKGXUTqYdn83
         9LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027169; x=1776631969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsyBN8eqgGgLu6vT6sEQv8tzWdzbqq6eDTPaal4nWic=;
        b=JEgGnGuvn/gfmNkz+ejEmiHNkDErHnNsbEmjiygmZEH5IT4V2aHDW9nCKhv+DviC/y
         6vaKypconJG6HAwETmz8LPOGaDd+L4Wjqe+zNLmDg1l+1BlNAAVxS0eqTkBLd07yFBcc
         iEz61TZs3PfEto/zN03MDVDEKgIcuM3LQlNaRlzkAOZJXOsCejrK68iCtapXY4UyRIFi
         nvM40OqNq5E7eOM/VYTDxZv1twR6kfXiPtS52IcNZIUeSIRhdE25bxUDxgH2wod1T/63
         Ss7hQ28+1hTSo/6tc9PQ/m+Gl9vkvwUPYkFZRIf4QKMK95SG0q+0/KvJBh7Ljgvnz0lo
         bw+Q==
X-Gm-Message-State: AOJu0Yw3p7iutsKRyfKNJgxeiShmnE68hgXBT1h6V498jqKxmqd+K//K
	XBr/qb/xKacL1iA+G0FRbHmu9EC96O728r0TB0dE/F0aY/wN6Dafoj/t9rnWv1wAnwg=
X-Gm-Gg: AeBDietMhUT58oekWYLynh5LnP1hm9rf/L4I1S8CXwEysfNis9DG1TAIAkUFRDilqdM
	Ivrt/F8Kd5g54zOCNp5Cbg5t9fdnzoFcx+KDH0hNo0XeU3eum2aUDPxPW1o7aCV3ADkQ83QGvD6
	DtiRqf/4MuZQLmzYpHvGXIcmO3tum/KwZWwayTGbORHUpIrAtWw2Oh2qva5GxS/gwMgVDzkzGRB
	94XP2emOkwdF+TpRKwBdBP1XCBEDDrDL0uUIj03styS3XoTGqImUKEZ/fiLvnOwqcCXcmSVV0CN
	EDOAwQBPwdh4OQcDLPM46gtFFUhmJ3f+531kLh76EOyyZ3onWhgs1HTVrmnj/Lla1a+3VMdt3Oa
	zFkSxR1cmPRPBgMQ2CBvtVnWaf6cS7JPdFU1exsAQpxilOlLBPJj0oe/gmzB0phMDNdBsM7l1s9
	34KdtSm+S5GFR9ig5uLGZDyEyd1xfX5UT1VIkKWp39u/XqIx2hY3jMq1eblPb6hF7BY/WGCNA1Y
	qEjOU8lBgXkg1mco7aL6MyPTtRQkhyjb5Wc0OnLM7WDfmkx2SYAQY7g7fRHM8ayHDvNZej4cvDt
	vi47KA==
X-Received: by 2002:a17:907:a603:b0:b97:c5e2:d7c9 with SMTP id a640c23a62f3a-b9d729bd51dmr596748166b.44.1776027168505;
        Sun, 12 Apr 2026 13:52:48 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd78f6sm263126266b.26.2026.04.12.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:47 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in tegra_nvec_remove()
Date: Sun, 12 Apr 2026 22:51:17 +0200
Message-ID: <20260412205117.387125-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412205117.387125-1-hossu.alexandru@gmail.com>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove() function unconditionally sets pm_power_off to NULL regardless
of whether this driver instance was the one that set it. There is even a
FIXME comment acknowledging this. Additionally, nvec_power_handle is never
cleared on removal, leaving a dangling pointer to freed device data.

Fix both issues: check that pm_power_off still points to nvec_power_off
before clearing it, and also clear nvec_power_handle at the same time.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 75877038847f..9fe9b7a3491d 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -907,8 +907,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+	if (pm_power_off == nvec_power_off) {
+		pm_power_off = NULL;
+		nvec_power_handle = NULL;
+	}
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.53.0


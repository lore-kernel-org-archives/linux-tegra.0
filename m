Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794FA344044
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110614; cv=none; b=S1HiE1xjIC80Xr5NzHn95mdCGoHxY55IpOwGFuyfHGsdCKiWS7gsfdpL/2LA+AQ7CvApQzb3sCGBGlGbnHZYYe3mlQPnjlRWRhEqKL5+/ZaXPniCpHwR1sW7WdKhuo3REy0seVytjRE/n2RECNPJnsUUu6Nef4F+M29eY1EgM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110614; c=relaxed/simple;
	bh=RK80ZR7zAHH9D/WmR/NT9hIJNikhZi7aebHrs+pDa/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHCiUGM3/+WQXuThZpkJuUJ92/mZD8egfVZIKluRqPA5KI4+2HKedjxyoZdgY/1mrvgUnC6lL+L8CrIfML20uRl2Z5fD826u/hk2UQI0sZtzUzUKCg38PTj4VwtJEWjM9NBCD9sPtiOOWE534RlTMo4XHHIBWKif0v47Pz1LL7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe2bvTC6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe2bvTC6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so904553566b.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776110612; x=1776715412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNtc76u4jCO4flvAdHAjEbdUTCZm4fC6HRp33lJMzlE=;
        b=fe2bvTC6eqnYe4SDkbtcrQBp4Ud4pXr+uXz/XPkNkSpbclckERb/Cx0SAJ+yMyhmLa
         g+OqC3HncuKkRMepAl/gw8sJXfiKsW+ampZwImp0ha/l8PKF1E/pX9jk6j/veCJolQF/
         SEWTddMQWMqigMxieQs2vIBHbxk6TZVPaIf/82r70Id3MGIykUsDzikutyaKrhMTLkxM
         jPb1OowuKx2FSfjvpe+Fv1dluQvMtJdmIY9PVrAGUcT5h4nC6hH23qnKC2Sq0rXnQfAH
         QUE+nB/Eq2Asgcv7MkOH+zOUlJDracIV5VEsx/biy1G0Q9Hxp0RFdmQhvDXiGjie6ggQ
         nYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776110612; x=1776715412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNtc76u4jCO4flvAdHAjEbdUTCZm4fC6HRp33lJMzlE=;
        b=b9ORkbIznCU/+k4WOHOcN10haQZ71KK5tActYwEyrFV2+MlNQqw9Ojy/g/W2/pxiC+
         hFaMyMzhmgq/+ZxAGrYI9if4qZbZtZpX0bAcp3CU5Cr9DcazU+pPSJAu2HoXC7jejAvr
         kOdIb4Q3ILdGIzqO6nxpDmzM4F3I0xvRPqxWvdQBWUYlmbtIJRlhdjs3DhzQ0YD+84RQ
         i98nomfWHnSz7+XaA/4hL7VW4LKxDEWTH2uy38CSxwqib6ecQjDwcF66gyRsZfwFok7k
         YCYziB0fveHIznk/umDSP3QuSevdvBZd+F824WxzixEA46T60/2IX+PRlaLuE1hBKWXn
         QhYA==
X-Forwarded-Encrypted: i=1; AFNElJ8kKEOR0wpkjtU83o4gC3Ke0pF5EFvMAsgM3wneWJt8GAQ3/HdxRPhqaAG/an31ejJRT7Mg48b9fT8LWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWr/TIcgP/LsRM0X0msx79dVjKIW02HAVBzYnfPNS9qNAis5wC
	7PEmRFvR6B6Bo3PufGrTfqZ7VSY163wROc85ihSgzeB3UgAZ24vMgOtG
X-Gm-Gg: AeBDieu+37OVj3/P1ZqoOrGaD9hO9MQ3HikRV09jvNhNghM/XgwB7urlfJcjsbqiTU9
	SVoNPq0jiS0LwrFPtvqcn9/yU6XXlfNpNtw2riS60QUlATVjtysiRTTiNDXj2xG7tbmVuZGU+dh
	uMztiQ+yBiMcEwNMvpBhcBPmpkpavd/wcG7xFECv87TrWIlu3Mb/FnhQwYceZZ1Jh4JQuZvQPOs
	TVUYtNqiqDw1zbcyep5U7KybglCIzPjE0TgF3YxuqBMuGcMc3qkw1xqhihzpLIIg+qjzcwsIN/S
	1ed2UMdFmxx1aF+lP29ISyDhCwWlFboOJCmM8Gj7UZraGFZpcyDO5YmM1ZiIF7D+7IbfyQPHKYe
	VFL0VUeXApv7LocBPmA309ofbJpKavH86f7Nj5kFcjg9mxv6Zxj/FEy9bqJe0vFH3IDredPNAxG
	em83Sw1naFvyaixWHXeq+5/7nE/nOh0Q/T0eYF7SSXT5WEclBO9HohujDXzdTz3yUL5SQ22dp1r
	/c/7l3zXWZE4OaYX44zZQ0CEs4Y1FMxi2yzZnw5vtD/iklm/h+R842ddf3ghkO7P8nKKikaNUnd
	IezPhg==
X-Received: by 2002:a17:907:c80e:b0:b96:f863:deba with SMTP id a640c23a62f3a-b9d7298089dmr856237066b.32.1776110611361;
        Mon, 13 Apr 2026 13:03:31 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm339842166b.20.2026.04.13.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 13:03:30 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	linux-tegra@vger.kernel.org,
	marvin24@gmx.de,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] staging: nvec: fix unconditional pm_power_off teardown
Date: Mon, 13 Apr 2026 22:02:03 +0200
Message-ID: <20260413200203.726726-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413151236.612404-1-hossu.alexandru@gmail.com>
References: <20260413151236.612404-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_nvec_remove() unconditionally sets pm_power_off = NULL, even if
nvec was not the one that registered it. This breaks any other driver
that may have set pm_power_off to its own handler.

Replace the unconditional assignment with a guarded check so that
pm_power_off is only cleared if nvec was the one that set it.

Also remove the stale FIXME comment, as the guard addresses exactly
what it was asking for.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v3:
 - Drop incorrect Fixes tag

v2:
 - Drop nvec_power_handle = NULL; after pm_power_off is cleared,
   nvec_power_off() is unreachable via pm_power_off so there is no
   dangling-pointer risk (Dan Carpenter)

 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 2a3499dd4d63..88c416ee0381 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -906,8 +906,8 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+	if (pm_power_off == nvec_power_off)
+		pm_power_off = NULL;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.53.0


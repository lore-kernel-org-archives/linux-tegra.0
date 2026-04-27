Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DBC37BE7D
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277959; cv=none; b=R73oogs2OPp5zzpqn7x+xddd1eSwAyxo7bzk35x/5pjTgSfEQoMZUl5C+Pi9IocPNpelRWT+Avdz0ry0X4AEnvEAo9/lY9C3pYBBptuaLdimHneaXobIqCezIfo7rr85Co9KQFvUWpV9R1B/IvbznZi16AOrrdmtfvvjV3sNDRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277959; c=relaxed/simple;
	bh=kA12S5ceLFq7aTYPKmMulJyt/Aty2VxK8Ge3SmlcZxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFAceQsURNqiL4a/Zpg2HaW/LRoLL0JOtB3MdbwO1QIqedw6mw+RXda66iL63ptx4MUOxnBOLRwat6aSyqn86Qa0V99y9Ga/aXK0lJwxKgBlBfGI77gcI75OirFSNtpKgD7RBAH5LjFu7yvARh2hzrXa7/0Ni9mbq3soq+IHpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOUhTCno; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOUhTCno"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44509921fbcso308986f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277956; x=1777882756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKuYbRG/YW/8TeEIKBYjuEmOZ3fK4A9BxisB2qvbDhg=;
        b=BOUhTCnoyMFnVqNbKkAWZ1WRXsoj3tRc0SZy6VB0Au1xxza3V47hQCEQx/DWWuXxJI
         aUufsx/jcGIBbxxABkfaOQdb2NpfYPf2BWyble2Dz7IgEius5Xir0xLFU4+06FQFXvfK
         iyALkDTIVcvrz1KcCfVHdfxaiDZEhBgZZg9jCwLarhM5T952QWGq1NnJ4o6fjtHuxulw
         7WojWKF4CIO/6HG5ALXOAJ5qbkQv2OeqOrt/n2a8l5zgUEHWSo1hA0O4xTS1/8vnhGob
         J8oN14rTN1tvcfmh1AGGfOOmIIbe5K02HTkqe70JUj7Eozu3CZnbG0YkKlzNQt6LqXau
         xAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277956; x=1777882756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKuYbRG/YW/8TeEIKBYjuEmOZ3fK4A9BxisB2qvbDhg=;
        b=I7w/2eKR+pL+oWSprX3QdcwzL6WSfdMwIhzbNvTlpHIEt6PFFuX7dqkahAlD3qPQvw
         2sUKdr2B9cdcjGSDDM9TbAloF1rbNpwUcG9ZYnbc2ryeUWPNm35rJk5PqGgmivaAnJHp
         X7AR46Gq9WJNvoa6KaC3Esq112UnQroI5YWEf9wlwbLnhrsIZhxcrhNQoudeYlMTLYas
         odl3q1peRXIwKQY1DA9jsh0iZTzn8BSGdsPvpvBfJbDcB0LbPnPPmg5L2JQ7toAfG7r+
         rOl7OtUmJkW+/Q1Z03pw7ApjaSeUJRsegoZWEs2/i13dMVxTEVVhvShhkPFIIswl8fGp
         6Nvg==
X-Forwarded-Encrypted: i=1; AFNElJ8afe11izC+GxACkh879dSyLHpJtQZSgCM/lQn+1dBfZ+hOdJhYO4ws/bIeUWjjcCsbDzWDFWgyMqenKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa5Pcp8O3VGPy6QdRgCbyOav+9240A+8mS7DmGLggDteqRNnci
	dvR2+RCasE8Bd0eE9NmsNlCB+wXp6kyWO7rDTbps+fsoJU3mXsGuro6S
X-Gm-Gg: AeBDievizURP6B9zU3lfOqpNT/1Pzq7Cj5xI/qq10coHuDcRXFOmQtYUt+uiI3Hi6v5
	QV/P2ILH8RXdDNWYZJ32WgR9dJ0NwlxHYFHU6H8MaqTPTmrfG1X48zQfg8EYLfB1x1em4ZFp5t9
	tdg3w+8pHYzgj/mGf7MM+5z1I92fMr92nIZP1IZoiiK8gWoyWaOBePZDLFDxjE2xiqUUnQxG6mm
	OqV5NV4886r6+S7mTSXjOQv4sFoMe+8L9EN8+YOOhwfsZh4y7P9T6fubkuNx+6NeQPOURH7YBsx
	Wao/RKkunRPAU7idiAOBn7MhpxLWIXzVUBuDLfiGeGIbSutVO1M7iz0PVCB7gWizhg4hz8OqZYF
	3nEWgerCb2YVWT5H4TQvWr6iuebmuEjoV7282l7mTnG6sRp/G8fol99swcSL2eHhYok0PvYKBjq
	/a49YBJ9Os12ZN3m5TXTUFaRDeivvditRrq6JN0DvcbEOtViU+rlckamvKnsg+vGlPtogQTdr2Q
	7FKl6bUHWKTT7ejOfkJ4omSTl72tQiBxFSJuAheYQiEvlYctS85c7EiOOH4PL4JcZPIhxU=
X-Received: by 2002:a05:6000:2dc4:b0:441:37b5:c2f6 with SMTP id ffacd0b85a97d-44137b5c365mr14126935f8f.23.1777277956084;
        Mon, 27 Apr 2026 01:19:16 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:15 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 2/2] staging: nvec: fix unconditional pm_power_off teardown
Date: Mon, 27 Apr 2026 10:17:13 +0200
Message-ID: <20260427081713.3401874-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
References: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
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

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
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


Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C0421EE6
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094066; cv=none; b=fOnpPQx27Rp0QVDS9wcB17J92dMeJy49XlzWL4Tj/ktjaDMuXkUU7EXMsR9hKMxH/8LUvNMDNnQ9Pd/gk/58dANeb+hdNL6skPDsfgpwg87kSBUsXEwBDoOfLQi9SUOW5NVFWILWmQjdfgt49XQYuCwtVnL0Li+QMv19gz0m2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094066; c=relaxed/simple;
	bh=WB8mKaj25z21xwbnEE/HxdHj7S3zxp2nI+xpfcf3wdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLr7XRMLJ02DBr7ZztFmoib4K7GeHt1MgFvOxVK/oK210//Q1uZqxgyQKzW2TMONXFK4TL+iD85MUXLedUzjgLCyI8+fpCfF/7/B8yCrMg+PatvPX2xLktEUy1ElM8GBG2Q6Asgsro9UI7E5bgHydWynfAoo6ps0molM7VarQpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiG1b+0Z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiG1b+0Z"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a13d1c6f25so3268122e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 15:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094062; x=1773698862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATIXLe26QAR/R7sQs77BbHbXBqtJJOMvXotTHn05fZM=;
        b=MiG1b+0ZK+HfUMrQuMlNeLGvVkujip5LOvDre6htc9vBeFXZ9NLvNC3MYmFFF9ydhQ
         5MO/nPD6JZF7eoHB5ghO2bRSg4ufMPydXuCuXxAH1E/ojIbNHmDg/+jIXiU8rTGQm5rD
         Q2zZf7COC+J1AHHj0vK1foRFHW6ljq0kfSYZ9IvlZlwYAR1zKNWL48mYJwCnzTgJ7G+2
         83Ra/nkDrojnJhXSz0kFFjNEzbMiuYYQTSMldiOGUXljS3T7TLwwZtOfxWi0AwdbSvHQ
         eOV582MvfGW7HhGf0Nkkfsm8o5wBQZhqDIyMnA/Av8Cc3m+JTxmCZg95xs0XRA4n6Lep
         /cOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094062; x=1773698862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ATIXLe26QAR/R7sQs77BbHbXBqtJJOMvXotTHn05fZM=;
        b=cGF+zEFgBuSUQuJH+cFfV02fzjD4sz3E0zJhxMkLqbaShUHmnMtdXpVb2VrR7d4BF2
         3sAm+7CWOP3JXILYbWx/cJzMJ8X3/E0W/P4Mjp3SR6fjYOND8tgWQfmswFIXh0BuiJ5B
         MQKwm/29w+4HAmUTH2Cfmz3mwloQI64GxR6dTiI/4cV9OcP0kYGmjz04mRebsMO8WUIq
         sF9F9NIthhP0m8vqH9tU9i+Vs9GFNFH0CmisPV6zObpNAS5ZBUExSgLaA0o173vUW85Y
         4WaAYGqLZaJ05TbRsMadoC1Po1d0ocadDKbAK/3VpUNXaEzaYuA4riTWRRtguWxU5kkd
         spHg==
X-Forwarded-Encrypted: i=1; AJvYcCVihJ8al+nGs9geCJ0H3zOW2HEtm74dY+/J3fKAv8AkTP4EDnkfOFKnnrdoOTx2SbMadRAr2Erbzl8rFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZzX2ajTS0I1Ti8YEsIjIglXcFLGcZ7Nj/uFG9t++qrSTRtiY
	j/fUzB/PHHHU053IVcvkLseXtE7lpeeFMfVpJi6dmpVjATg4NxiSbnNu
X-Gm-Gg: ATEYQzzysXv8k96s8C6+W/PHUFGFT2PSeiPZnybcEo31C7FLfOxgzrqtE/hwKrhZALv
	z9lGNOOGbjKFPskZgfYk9T/jgdwoJpFraM098o2zRAitpEt/r5ij7vqc6qUNlUWxAyG90mySdKH
	PXIUeDHlyc+PG1quHwJRSzmMQOgiXgs+w1225/rOzn0Wq8151dr/2+1beVz9kEH9NZ8Wv08fOiy
	LygRZuVvqUnfRoMONSEprrRAvP7Cgydqb3RnJx1FkvZRqVGLMWzI/glzXzZRI/7AIlT35+GwLVv
	CAbJ87/W9QjR1UJGk0RhCpH7KmBLcuN7xSkjYfd95NVYZL2gPBN8hp/e/SP5g/BtTls8WwygEJF
	1k8XXtnLbuRolKi8D2mHmdjOhBNhggQWy8bPTMSRqDoy7N/DE/zRibf+I1MbGmrrIpzqUJjfypG
	DFUbHML02FYmFnwD+W9Q+tz4Sc32p3zys2CB+LqSKJtAEyPNi9ynpp0y9dDeYAnaBhFsZv/d+S6
	Q==
X-Received: by 2002:a05:6512:610:10b0:5a1:2fa5:b96c with SMTP id 2adb3069b0e04-5a13cabc8c6mr3277857e87.3.1773094062225;
        Mon, 09 Mar 2026 15:07:42 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c24csm2405916e87.78.2026.03.09.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:07:40 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v3] staging: nvec: fix block comment style in nvec.c
Date: Mon,  9 Mar 2026 23:07:18 +0100
Message-ID: <20260309220718.6475-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026030929-uncheck-reclining-315b@gregkh>
References: <2026030929-uncheck-reclining-315b@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to use * on subsequent lines
and */ on a separate line as required by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e70fafc095f2..0e655f79ea4a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,7 +659,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* Delay ACK due to AP20 HW Bug
+			/* delay ACK due to AP20 HW Bug
 			 * do not replace by usleep_range
 			 */
 			udelay(33);
-- 
2.43.0


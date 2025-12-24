Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43495246770
	for <linux-tegra@vger.kernel.org>; Wed, 24 Dec 2025 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575036; cv=none; b=ZaMgMNrd1o0LRLaQuLdBhvXfFzuYVUfAJGQiRKkspBq/eHyXsLIEk9VoE7RF32iOcL9H9MekjwSUvj7kvd2/KE7En80UTG3KdyY1q8N9WkuytTPBc3mcJWgB2neuQXPKhyr1u12Y5O8XvXaceflSkKc7yMPH1sRXEMDjpwpPSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575036; c=relaxed/simple;
	bh=Q9TBK8v9IamcPxziafotlqobzS512kz9y7tL/A1ETlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKgs4q3urTIQOuiVSqqsygjq/9Q3FaspBUoQcRs8WkrpzwDwi62f57BkPU7Y/zGqsq2xKNiCwC5YIHKtT/jxKJ/C9Q1MSeYMRYaofmigZh0sISm7ROPNwvaotIZp9JqQOlFVh04PXRimFZyiyjNvnPDM1lB8Rho5i1hZFVhK5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFqCURcs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFqCURcs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43260a5a096so1867941f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Dec 2025 03:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766575032; x=1767179832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkOk+yiD2ZOYk6PyCrLiOp/Whut/X9MPksemD7AFox0=;
        b=RFqCURcsBkgVUr4x6tGV+MSmk8ZYvUpRw9iwGBiSfv0LB6hGf/6raHjyq/ZKZJ92Qw
         uWnI8I98Wp3Gl0lQ9GMLDsPEIoQASHa6S4yGcsGJNixKih4ijBiqOoFUOkmT11Mdst0N
         hIYzeGnW6Zt2YaHzWYiTd0WIosMaA/QMmPp6nDe95AFv0OctJK++P0AP3ux6nyCjdxPT
         /PbQIXnGOxg3J42sBLW4a5ZhO5mEY9BB9ZZnZFqOsq1fCGpcOsfqWQzYWNfi9FqZO1Cl
         RbpCiRLjb9eMde+V+HwNKCTZKeTpHd30lGWr6KWkcVbFMPUUZiXh26/gZBVW2YwsG+ej
         8I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575032; x=1767179832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkOk+yiD2ZOYk6PyCrLiOp/Whut/X9MPksemD7AFox0=;
        b=VxaZ8T+zdA1Fx6oa86/OPftDroMWN4StoTl+lZCaqNZsus+3eukxUegcuSnde2gL5B
         nYOHJ2kvHzJdcZoB9Ir9vcgJt27lJws1tbeChDcxrZLROolaTHQgtz5W+z97h84YDPFR
         Aul32BfIJGH0nPs9nzEp/oerfbMpjYjxjvdG5feTh6TqHzD2KpbeB3MRJsqqaIrsoKoL
         TOdj85/kIwezhEuNuC6QNoGCYiRwBjmT7kIYIft/JXNGC5dq7gN2AV9pdGw/rWGjagXS
         xlunP/Krn/JX5w4AMJoS+F5ucnpPzAgRo3BXzpcujXnXc0W3bx6eNFH1b1EM9v5mivcX
         K6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXV3/VHdtuJL5x1e/ZMiXAMsIK6hljjwrUTzEBRfoNMSPVwPPOHlkX3OKGBorbjA0vuPdVJhwErEcy4vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpS48VhbkZyuV08dXgeNiSzgkCYbP0OjD/TH25nx9RC0QeaFJ3
	vBJLK5DUoN+yNzJzMxTTAoduJS4u+03cNf4dztE8lb6XMp83yUtvPU45
X-Gm-Gg: AY/fxX6sFSw5Cmchp+EMgWeAJxw4EnRcvKyGkvLwixWPD53BXGT40go0d3hq9VrK6zx
	mkwdmeVb/bPHIrZrS6zQ1SnA4B/KUK83eaDnyEM5EBi9HyeismsuO7t/W9c+K6Em4tOMAGnUddA
	NrzH7/4l6szsTy0lQ0L/8rMBU+dzpA7UJHPj802WCvK2lXOQBloAGvC5ST5k/dV+n7IejwH4Ndh
	IdD7e+jRBQO5HAjTOVBJ+c5bAK7yzv0CdiMGZgY8w/STpP5AvqWAuM2sRvGhr+aT5t481aA3VQy
	o9tEVsKx46WZ575VRLbXOo1BM5yOL0MgXWD3PQ68m9n8omoju2SlLUcM5oZG+ndcbeVN00sDdIx
	JDfiY6WKF2qD0ADe2RGEaOGyvTEJOFqU97aA+12lJGDs18xjlQ6BX4ppDeiDOZI8EoAfWpLedDD
	L++zq3kA==
X-Google-Smtp-Source: AGHT+IFk5NWPP1mAAnYgnCDHuVsEDDNY1RQWNp97lhTRKxY7CxIgrXDdZUlZ6oMC5ul6hpVaRzK+eA==
X-Received: by 2002:a05:6000:186a:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-4324e4fdcd8mr16701457f8f.34.1766575032532;
        Wed, 24 Dec 2025 03:17:12 -0800 (PST)
Received: from user ([178.19.85.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm33699241f8f.20.2025.12.24.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:17:12 -0800 (PST)
From: ShadowMonkee <sshadowmonkeyy@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ShadowMonkee <sshadowmonkeyy@gmail.com>
Subject: [PATCH] staging: nvec: replace udelay with usleep_range
Date: Wed, 24 Dec 2025 12:16:51 +0100
Message-ID: <20251224111651.217679-1-sshadowmonkeyy@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udelay() was used for a short delay in the NVEC I2C receive path.
Replace it with usleep_range(), which is preferred as it avoids
busy-waiting and allows the scheduler to run other tasks.

Signed-off-by: ShadowMonkee <sshadowmonkeyy@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..dd92f186e0db 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 34);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.52.0


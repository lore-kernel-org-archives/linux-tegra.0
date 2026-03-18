Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F834028F
	for <linux-tegra@vger.kernel.org>; Wed, 18 Mar 2026 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853580; cv=none; b=eUgOP/VhMD+iDw3mX2an2HaP308WCQtZZPbu2IevNuDRH9fGUdci2a1aiUXx4rj65lvdMDtArDjJVLBo6CjkcfT+1KPShwywJr7cj62QZ7RGZPZeQ2iDTZOSsB3i3VAL1RTU3Z0OYTTgqRvNfHyVbvgyj1EH4nE3MpMM1c3+3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853580; c=relaxed/simple;
	bh=hGxHQ4wepycODTgWMNLguLRHOgeThULgmpSZbykI5KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XSOCYF4HDPT6/BGzfx+KIMsBd9YDS/CzeP+tmh4ajssy7m1hxyOh+ACFtHziOzeE8c/YLvX12z6bTSBsACc8FXL+rkgCPwONKy++5dkAMjzELJ7uVCiiCkpsM+AcptS4oRZHcWc59umLSPBGKZ0aEt2ny0iNTnH9coGsaTvSuEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2xm7k6v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2xm7k6v"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so35296f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 18 Mar 2026 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853577; x=1774458377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RMIRhTiuMF31oaJqo4/x9sgi11wfPHkl7OaY7LxSUE=;
        b=M2xm7k6vwxWJxUksvuTeEmpUHdizo8MmLCe8mIqwDz16lVtqCgs0OdOF5HiHltOu9W
         7qH+bW/GVg1MmvE1obF0Yfh00K//YnHV3xEEwbGnHuc2kmmsRbu/2j8dJG8YKxYxsYEY
         pcfRIPF85t9mm62RYBAtWy5ptWIXXpD6p5n2lQ3C57l34NpSUnd25e5g4YGtn9BZY8Hc
         wDpFztpwEEEjS4G+hh4kcW67FiyXZ1mfOcj8fU5v5ufUuSLXYOquJwypHnt3E1rPdgxq
         hhLIs+BhUb3qw9v8sWvwU9mm2EELzqHlmXchBQ4HgbWjrD73jKAp6taHSwlQA6h/9KUf
         d6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853577; x=1774458377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RMIRhTiuMF31oaJqo4/x9sgi11wfPHkl7OaY7LxSUE=;
        b=iJYzFH8RCMViDKkNRKMumJia9LFGre7+Poz7AolfiMoGRf7h2C8UM0UuBP2L2kfGO0
         +AjI/T4Bj9GO/UNPDfUClVWoYDSWC+ltdovtROqOqX9wGuDGNFsdl5/x+kcKg4CMWWD/
         4172Bp3YjJnbPkasE7Nl91N/Zm9eh4RyeGZtabs8OQrshZXogGybKRUx9m3ht23k5UtE
         H0NEh8yU6cPA3rg2Xhe+nt3pFVUMPhsy4mmSiKLgGk+PrbGWTSbNhr4rR6NA3wCOlwsK
         zDAkZ9a+ZFDfX0aQJROs81zG8gX8ORnMWg+2balD/r1urdKPv6R/Bu+foYCSqqYRDuGX
         ae1g==
X-Forwarded-Encrypted: i=1; AJvYcCVycGCQsUm4eArBXcb4FF/zTpzBgMNzMkp+OWV4ttV1A/qJ7MLioSwfqHsHvdr7vXFS3Ia5ooVqCYzWWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySbN1wsWiRr7Hm88BLtQ6X3sjS5aU/UW544zS2IX4Gi/2CDoa1
	U9rruSJCQmE0g8oPtqwdBhxQdUov7lecDi4Arwi0Ej3DCdxN0DvABV9r
X-Gm-Gg: ATEYQzz2/Plp2G+ZI7bRE0RqA7iYg/ehuBW+XJul5QIqFDIiDP3PzG5HasSM9T/qGvw
	sK+A2xOm21F8SpiuT8FQqlDqu0hkkDGpX20lk9N9yVtc8ARUj9BoJie3FNxRHtVa52b2Q0CCVbQ
	y9wv46cRiZmB7uMwwPFd/K9iCtXFdRthkSqafKAwAcOG60pj+5N+C1KAHFqTArrVKD84F2sakKp
	X8/aNwS6sUT/E3F0rNtLrLE0+oAl5n+YnLR4DS+/8SrHLWXmNgtJM9XjnqE26Cv57dInPeyQIkf
	t1xskzzD9jeCgfDXRrgRarXcSak0oXBhdPNTwWX2U6QWMiGCUPds++K69B7tohCWhLnGzfw/TjV
	cZGp90WEhZRrn2Ra4cSzKa9XvGF0rBi3rfAFu9Mq4zs0rGCCtjX1Behf7apB68FkECryPPQOkS/
	DdnZjHyPBZdtgKSeEd3+b682tPornJ5ZayYTViAAEKKg8dyodZyH24bdJ76PDLbQKE
X-Received: by 2002:a05:600c:4753:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-486f443848cmr65801035e9.2.1773853576966;
        Wed, 18 Mar 2026 10:06:16 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm7061495e9.13.2026.03.18.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:06:16 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment formatting
Date: Wed, 18 Mar 2026 20:06:04 +0300
Message-ID: <20260318170604.10254-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The block comment in nvec_interrupt() does not follow the kernel
coding style. Multi-line block comments should have a * at the
beginning of each line, and the closing */ should be on its own
separate line.

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.47.3


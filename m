Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853A36D9F6
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772603289; cv=none; b=qdt2N6sGyyhV0urh/L/UbGFeJAQu3e/R6fMUFD+5su3qQ2ckYItVvVVboce1WtczLRnSrFiKRYk2O3Lc1oz/ZOutH0fDbqTpmbAU3CrN4aqIW3Zzg3ZCnp568+1h6+gUwD51HDsi3NF5C6H+1Wpsq1FdYUoOJhKwcs4VafWpHlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772603289; c=relaxed/simple;
	bh=hGzGZSIesgRYKKABk3MCtmQIw4wPBxignY5EC/CTKhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jppplZQEcuq0m1UWlefNmAf+/t+LPo2BKj6dXO1fFGnZPAAtH/0E873JMGgxtdvTjp+jCWmh79wrbkEyMPX20jvXJVtUkA7uEkGnjzFiF5tzAAOszld/Xv8una+EZ0Rl9hTY85AK/ZRc9CiI8WkuklcVQQ7vTsmwGWMXDZ+7NCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3iCCcFb; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3iCCcFb"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35990245493so1820062a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 21:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772603288; x=1773208088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU9ryShtwN5h/4AuvpDstnK+MMGP0hOhRJ5NA+muSDg=;
        b=H3iCCcFb1+n+HKBLH65EgOTbS+frKdQHgE4/AxiDLdR1lUqBr05VXwZABE0fHbgIz3
         Dv+5WRqTwuaDUhQh2IfTltMdaeuUnqZNq2RNdqs5QI99r/7QPPkDmLOqm5qd0gir5hXu
         P1BRVB7BPP3xONh1Yr1fiX9rqQ4IoA0hBJJL0peQeJ28gE1a4CrrHexIkLo+5Iz3MNr1
         oRLsS/66iNynNwe26jXK+0meiS1gh51S48uLWS4PtAmSuRwHH9tgEtwa63cSqh2EaG7C
         sR1yXo2OTxhlr+r7CPAUn6ViierNTCdNW0GU1dMqQHa2eh4AmF8F+9jEdtyHRA4G0EO6
         14qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772603288; x=1773208088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU9ryShtwN5h/4AuvpDstnK+MMGP0hOhRJ5NA+muSDg=;
        b=SKNKJe6gbiWGTVNBiQVZqFfqWkI8eNCa99JSGlAzRMfM6XUxEAdmKShOAlrfr9b8yw
         c/9cWCGb0SQ4vxrxppRBANr/e4ga9OJBrFAuW28uoBUJ0ajj8tvxJdgYwjjEbevjtvGg
         POgbE+4a+SwCeqeBHG7lG7inG3mIZeLm3Lk8ZkjSDVOFjWaAXSA1rR3xFBCzZLeDV/5S
         ELhZ9+wnrDMsviYdCul7T9owxP62uOuIakg6hr64bovjtEzMJ2FKEKX1F6UyR22gVbge
         1LzXqnoRmKSPxv42AHMvlmi5cqF2XGvk3CI9cO6teSFyxWkRYJSVHNQyHCBfwvlAWgvT
         2MAg==
X-Forwarded-Encrypted: i=1; AJvYcCXWEIGdjajI44krSBoXhMSMBw4+Ps3Xpr+2Y3ZV4QJGNfH09LhyyNhjaGKAlVtuYdTUmCJJT/KIQFnDKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf496kgDt5BA3JD0s5IIDlHPJX+YlV6PAnmDU+srQCiNqJUfXV
	/eVyR2PbvsvICymk7+jFvmMsm+PkW7b+Swfym+JBV3C/IFjGdwDdwS0k
X-Gm-Gg: ATEYQzwUQfhw0nSKM6UcCM1T3cBF4TqjhC+7nMS3BtscZd+YTH7BW1I79lm7YxN+q5e
	B9vSQEnMjNp+cGiJgQsbowHF3Si9gJCIuZ3Gb4rir/WZSm102LgWT0wwXm4rjmXOOcj1XXYYrCZ
	9eAU3YqM7U0HF0l3acm9QxchyvhITmrJsjYAKJs+bMnISjbm/IOnL2c8ZacHiZwhNF09JnfeyEE
	pSyhJBgsk6/FG4AqvztSs1wkqHL4+3qWAIyFlLq9jfZ9FKHNWfFxX8D/OTBUWIfwmGjmYTvMqLn
	619ZMwbrvOtLWOBx7kcfuGLaxm9/t0O10G4VZFSs/RFvZ9r8TxQH7P6wHVlHB1kLQu+88LvUoWp
	CRof1RdLYCfkA2Bi5oXtYNsiedEU7r7oRiNCRI9JIjymTd/fouxQGs3xltHcioFEG0q3fNz1sxr
	mgzTdxVLE6uJZU2HniugtjKXZjkwXgJKq5SA==
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr842672a91.5.1772603287690;
        Tue, 03 Mar 2026 21:48:07 -0800 (PST)
Received: from localhost ([2001:da8:e000:1218:e91a:3fb1:31fb:f3b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3599c49f6e2sm4416242a91.10.2026.03.03.21.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:48:07 -0800 (PST)
From: Avon-Hermit <avon.hermit@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avon-Hermit <avon.hermit@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Wed,  4 Mar 2026 13:47:20 +0800
Message-ID: <20260304054727.70113-1-avon.hermit@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a block comment describing the AP20 hardware bug workaround
to the preferred kernel block comment format.

This change only adjusts the comment style and does not modify the
behavior of the driver.

Signed-off-by: Avon-Hermit <avon.hermit@gmail.com>
---
 drivers/staging/nvec/nvec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..736f11942174 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * Delay ACK due to AP20 HW Bug; do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.47.3


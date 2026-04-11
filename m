Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE542050
	for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918811; cv=none; b=sghxRew1FkC2RukvnBMzjFH426fIaBjjJJAIEoyeRlBhO8TMA8HNvCgqL3d2YqLmtcveKdwxTQp653cFoKYS0n52d5MAFT0dnXgj0mcs02zs7v2BSqqFAndSj9ihw4Avq2edTkhcxcc8H+breke6GlOZl3Oja4pyO6B3ZtCMktI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918811; c=relaxed/simple;
	bh=Sae0b53RDZivkY3LeLMbIAc0T7BB4OuamCGwTSjl1W8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umLaLWTCoUY5aacNFnSCmw8E9ugKlcBFr0IlXvddN6pC05JU3xHrFI5CWy7XpXJUm3jI/OTjQlwK8aGBxQGRsrDq3maEtImixQxLFuCrurL75XCIIAtKSIf8VQ2B1eE8qWdDwOCzbYkYmoveBUHkuDsDICbznlPwDmHE6OaLwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf6yGFCh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf6yGFCh"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1362452a12.2
        for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918809; x=1776523609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=Zf6yGFCh7085tKQLOT8/h76ziAbyUi8gO2CgL8404hYcw66yK2+ZZVxyKQejvbV61y
         5qzUBYpzZrflrqQzwQoZnc22Y7EOJj3j9SbHfZ9W4OndutprRn7K5NdvTwrW2L1/3lAH
         YwUBzMR6YX+oF1GI/rmGPOLpZZRU1qmX0sM5piuK1oMAcyZelgTuZiwcJq7SBNmTASDX
         t5Ld26ZG4Q78069YQgaZjPxmTMrjzZTU9TlWxKar9gJdM6FTBiqZZsVtTkfsJ21P8AD1
         h8yxOL+LQjGmHAYwPnQGjUI2DC7ruWCfJE62nIIrwfhb68we4OXRAfC5NNvJ7HCe1Ac/
         h3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918809; x=1776523609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=fTBGd/dwUnaCZE2zCGD03MqddAf2DHnvGVk/6fIUAf5Uu+qnSzwfJLVRTZPQTHhP/S
         KePuWw/i8Qs+J9XTaXEVPj9m0ZpsKNb/49FLrZ3SszmKPbOYaQiizCvPJ3JWCc9jYfQD
         Vuvu0P6Yv1OVvy3brox9jWKXTHSnftU7k00upzlQJRJyJK1Oav09izXJuwPeDaLwfX4g
         rf9BvrAbEFvRBCL/Uli23ZmcQuDzpxswScdkRO5I0Ju4v5gknRtqjmrCv2yWEU+R3cWQ
         dib1aOmQZ/DavBPERSI1sy+LQzaTlwDkSBUlho3ka1bLkGV4bB0Sw2ARMUXuOx8/kR3r
         4e8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMqvLahqZro3zhP86v4sqSANfOH4aDlS18KFNWF2MU8oMLT+rgM8v1E2D7+T5cmb4KQrvk8k8vG9pFrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYXhODDLpkKUZPk+/F6PVoCTzhpNhhZsnjCx8paf3HHAEPrIZ
	mphPOmZWyUs2kO0t5PCPwhcPlorXGnL7HuVm49qcfV1+rSiY/dnXyHWzFaeuYA==
X-Gm-Gg: AeBDievAM5cMNpREPveHt8dUQ9sfBnbVOKYC9DAEx9zXVY22TrtnTxVbIb5v89WA117
	ZcCLXd+f2daLJfi5WsP/G2VKIknYuAPVRgdVuGd/OwTylKQBbqwzrbaiDqkPpH7BAiSana1xmTI
	rrjj6hEyCDepbUSqHNoQoYNbTNBnjyUemDxzMTA4QU/vQyagHbV3K0m06J6aFwDlQeT9oS23QRM
	CHf0Hz9LKXCK5SIxbuxqKnmL9HyLCORv/vNHKqY0TovsXuwNhY/hijYTMlgbmO+DQFdvCD6hstt
	ucennIsPDEqZhMDTCxXl+XVkUqjJJVFDQz0gVcIX4/q2VwxO4jnr0vmI69DBZN1Bnv0BEMKXM5A
	b5Wpihl3bI44t0xaVRJ5G/ecjx2Digleu8hzjai8o/taGGV/YHgKf2gHuQYa688uJQE0kbwPdHZ
	MevWttY0lzMI9J6NYjYl33YN8PqDlxt/V7wxTNmt2jnRdFAS3DwLAj/rqmvd9YIfhMNO7EoF3/f
	8Hikt/tFaBGZR5HSMUL+qA=
X-Received: by 2002:a17:903:704:b0:2b2:ae0c:ad0d with SMTP id d9443c01a7336-2b2d591b960mr51851085ad.5.1775918809394;
        Sat, 11 Apr 2026 07:46:49 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm63314235ad.27.2026.04.11.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:46:48 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: nvec: Fix block comment formatting
Date: Sat, 11 Apr 2026 20:01:12 +0530
Message-ID: <20260411144326.3366-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the closing */ of block comments on a separate line
to follow the coding style.

No functional changes.

changes in v2:
-Fixed trailing whitespaces issues.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..4799510d2d12 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0


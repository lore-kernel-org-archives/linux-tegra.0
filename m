Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F93563F0
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090493; cv=none; b=hkE+su5cQxyvA3T0AvbnjJv75SmHTWHqk1bnnMbPGn5OpHcuioPkoqff9vXL52abPya4Gw/0rxcrtb1qS3kRYStnLy9oihiCEAyx84zPAdATT8TtQNnU+tEI0+mKvHsuM7EY2tmi+2mWR0iqAahrRrbKYjMXdssCZh7EUVDOkl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090493; c=relaxed/simple;
	bh=nA4O3X3WVlEsyHGhYULanMa/vngrh/dYZhVoNGh0ssQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yoh8ByqFYcUht5OlGshlSxPmb3ayM+BfHnje+FDsMg1cFMSK+Za3MaLbiGUcQ+dffHmybqLDQsiYnKBPjyvyJhkQnPhaoCcWdUAd/JDw57eWCHBcuzyl4qFh+pzkAs70Eop3qsD4jxrYFDra6hkF2mz2CAgwNyAECjcLyrPUG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdd8pEnI; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdd8pEnI"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so4232882e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773090490; x=1773695290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6FDQ2lzRwRtDD7rhw35ZpmWvjtDI30Atm0ubx6HUMWo=;
        b=Pdd8pEnISJCGzfvDlieReibUX+4f42cKhaRyB58soB5kRFPxIt6f+BU6prBidFPsqi
         VfOdYKmU8IMEEiheeFv9bKQ2/WFzSYnT+AMnWTRjs6Mvi/WMmu9UwTEZUasorADm1qha
         evFcxYTUeELjYAqAmdGV5KAJFj+VaHuqFaw8AnB31YtiA+GX1d81XvIqnHiWltIl5//b
         HG9zIONJjfgQCo/9DOeMonSZU0c6K3ANkzuS/eUtMIu0E0uYt39iuPSZXylM1NFTq2rI
         MaKRZvD7eiFdkVdB2HMY3lj7hoX8sG8lCTfj3xNIto9Bg23h293oWabwcQBIIBqv4I/g
         ifEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090490; x=1773695290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FDQ2lzRwRtDD7rhw35ZpmWvjtDI30Atm0ubx6HUMWo=;
        b=OILnafptdH0ok7kaOvQSTsUt4LDnYKL+FaZQxdDNak7Kadb878trQ8kJJqbFYPWqad
         ioheQC40NEAChXjTbUWyMtSfDgr1w1Z/4MyQc63HWErUTGG1isMep3+fQgW78tGyISzE
         Tjhwa6Mki23mNqQHQKPPyYLqm0YpGY3JdZ/dbMMKzb6Ivt4aECfrBWZUErlO1CXtWItV
         YJu6jfUqFssyyJvqwJa7HepsThwSQeRDt6DADGPamJ4xR25lfsJp5VsMqQPbO6Fu+In8
         UpORGWXyJRg0PVNdPo74jngHhQYeXKW8L9vsZB9i39bTHEIel/pQuYQTCcb0kRI/ibCZ
         loLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmMOKd3QEfDMXs5c+NS8lVfo0lO7ubKJz/J5rSUHqhTCt3h2LQ/j1Bafk9QXeztriyiRswI0yKS9loLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB16ljaP6d9uMIISBelKYWwJjTc8zhk8QlEWuyK3t99TxfsJgo
	nf8S8PMK7XL23uYgyAmDBxVI5q+ynDcvJsMBOiKtjiCztEGDeoIT48tW/9cGng==
X-Gm-Gg: ATEYQzzz2HHKGkpxhneIthkfBNIbMkvEvFV26LUjj/pnuPSnvz7XCt5Fiwhpsn3AnSX
	pm84fAMJF/B/GiBAFh8nLSKq9FKhIfzhKvoWnj3GdbWsuw8CNFPVK4KRhDL9+tGg3gT8RQuxJJG
	nfq8ozvhYMPS2DdYJJUVH9Iue/8Ev7HjP1x9p51Cn4KBkISYv02ORp+IB7uNZp8iGYrED3ZHSyq
	TVkyMVUHhHi7O5rVbhA8pki/S0Ky//FkIdyF39gnERH2NA4iUDKyvRBD7dMRYtP/t+Atu3ottOX
	NxLXSoI8kBSgLwMh9P2E3W/cy5KkYlKtX4dvBNllkj/ugPIZzAqiinxP/1EqsG0R56BcMKpdlyY
	Op1vR0HbdBLq8V7FJhc1+2sX34lXqVOY81l2m2io1ogpTTCvdRXJbNMvY9hU1RVFIE8+1tj9fDl
	aT31HC0A++arf2/Ugz9MjJd11Kz4VGqFxRyo0My9+gpM15OR0m8SGe6SGpmWTMDPFlY7nx2gRCR
	w==
X-Received: by 2002:a05:6512:3409:b0:5a1:23fe:b04c with SMTP id 2adb3069b0e04-5a13ccb9aa1mr3943918e87.18.1773090490223;
        Mon, 09 Mar 2026 14:08:10 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b7f0sm2323362e87.31.2026.03.09.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:08:09 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec.c
Date: Mon,  9 Mar 2026 22:07:49 +0100
Message-ID: <20260309210749.4557-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Changes in v2:
- Remove unintentional capitalization change in case comment
 drivers/staging/nvec/nvec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..e70fafc095f2 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/* Delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0


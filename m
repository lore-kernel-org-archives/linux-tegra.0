Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8932D2483
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775284688; cv=none; b=Tr6Io6lvjC50UyiFvQ9kbttsu8UixGKyWoqf+nDzm8C1+UuE5neqtuAF2QrSbO6+w8UnWnbydp84vPsD7qa1e5b1dY2Ueym06ywz7Pppkp4YDAWvfJYdvtlhbjn3bCHs7qn1RaY99TuB72qPM7SUMS6v3WOMpjZKYzJHA82y6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775284688; c=relaxed/simple;
	bh=/+lWkp7yecAL4/sXTyDMOcLFOTTPY6lO+V3B2v8b3o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFO9jeWtAEccDfQ8oY3ajt0OQqKcrxyS+47+wNciQcjkWOHxtpIjOiEeq4pgbjDCsh67v6OWFAIwx+V2FwELOeQaBLdFiygw/5J2Ie/ViCM7ZKRc5dPnr5uTkG4NgENVbUritTEt3a31XCBfYoMsf6v0yAtH0L+MVfftVujhFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx9GpBgH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx9GpBgH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82cd6614a90so1064123b3a.3
        for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775284686; x=1775889486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVGzlXVQx5SVYG4bBEbahjoY/R94utZN8K4fZhyYB1w=;
        b=Yx9GpBgHpwWGb2ijVdBli/gWmEhNlavRRW9O/n366r75Vy6A3AGeZAi1uRvfbk/n3S
         QYwEmsJC1/ey/RAwjv3o4aLox5TZXAYYZ4ZSTt9S1UOkINuZlZsBGB6E4MerkRZrhnjV
         F3UOsY8pk7HIgbXDt5h+jnvy8AuCwloCe//75PJbzxqiJz2zFQ1a6vOI5Ayj5DnCYPMj
         ss8ybAl0gI27CBkZnC7UgkNE9TYyopC9lVD2+r8PhSKzJ+mjdk+R6/2qrTq4ri8wJXEc
         AFJRAxFy7PbYNVKOGyq0lkViGMnUONtcEywAl+y1xptPG19olyQfZ3pHHRn5ow+M1Yxd
         QhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775284686; x=1775889486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVGzlXVQx5SVYG4bBEbahjoY/R94utZN8K4fZhyYB1w=;
        b=BKdnOe0cuFpU+1tj8K4ixzyAdjcuqegxwLGs1g78CvZcJg3SJ1O+wal9n3TwCNZY5z
         vs3B3P7bE6w25izWEvbDfirkxKkqxS31sfnhLsMqA2bfdAWCXRtTklFLHI0mgJabF/6m
         Bop5mng3pNtg/y2tBZwYspDGNzsVVpbqVHVefr4Zt0MFNFP6VmFfKiOAGoisUqgNHzlN
         B/wf0k5LJyxBsFYROs8pb36JJsuLYHGPhX2g0iQc6pkWXps3hVWncDIEOpvJheQRQg2m
         ssOv6hgAXX3FodmJv5CnOfRJNYGB8XLfZr8IARUqT3/ub5yG8YGb0kEpJtAX5g7yx/C6
         qo+A==
X-Forwarded-Encrypted: i=1; AJvYcCVIXoHMUL3+aNX43O/kfbFWodrXIk1x8n04TISicRvP2rT88M7l9Eq+0PcooaR4Bgh42iacL9lekN+0+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtoy6CY/vn7/19d0m5GCe6P2umgfcAdxNL650BloAIY+6FkCvb
	uwOp+MtIWNgxKAaUbtp3wb+EDSbxZM66zMNlzgblSUt6vbrKPkWHKC09
X-Gm-Gg: AeBDietfyBW8xWXuTSv9Qj5EyXNm/uNwjrJ16xV7TFhc4UUGG6lZnaq8LHxYmVLZ071
	q75+dWdv7HxxWf0hgxkVYax29mU0TISEu0vSGYvmblgNNI8HCqI5L/HHKBxGreH9DH2wZYTInnV
	1GiGihQeg/b1PrPEGJFP1dr9y29uTJuiT5gS8faPKwU/nVs3dUGuTZ2E65SQVBCNVh9vP/3hNXK
	fUUbLxy8frj5fePDmgJGRoVJsvpMF/L6pwhf9RQ7tY9JhKmV3FD5WC6Y42gMTO8wQ5iKlejrklN
	Tx4XVvDvjEYCSCaxw3jJ2ggik0tMzIT5z1TVCIjb4nO7B/BFawIZhg+MxnjIp4xFhfDTg7Bzc+P
	IQ1t7li9tODZCTqvPjF1vtjWtVXMkT/ETInSGx57DTa3A50sj3djl2B42snucZGKDoJbSsVlNdI
	MV3gXIAW9U21J2ZFAPO8FvCS0=
X-Received: by 2002:a05:6a00:800d:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82d0da838f3mr4876331b3a.15.1775284686283;
        Fri, 03 Apr 2026 23:38:06 -0700 (PDT)
Received: from fedora ([206.84.225.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41b8dsm7174104b3a.34.2026.04.03.23.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 23:38:05 -0700 (PDT)
From: Paarth Mahadik <paarth.mahadik@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paarth Mahadik <paarth.mahadik@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Sat,  4 Apr 2026 12:07:47 +0530
Message-ID: <20260404063747.114039-1-paarth.mahadik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comments should use * on subsequent lines and
have the closing */ on a separate line.

Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
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
2.53.0


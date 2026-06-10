Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09933C53F
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 03:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781060899; cv=none; b=eXyw236XWFTk7ltcU5i/iLkht9SDLpI1BmB2tTAZ+3Pb/yEbPEizt6MdmG0CFMb8XHdzu9NFGiIAoumRTlEYzGhXumD/ABABbaHwzSE5eCdQEBZBm4QtwB+Z1tnJsXl5bKJytzkF19iEDygBoFnchuAFRC5wwtGqixSyTnZHe9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781060899; c=relaxed/simple;
	bh=GyRKllbRwjqHwZUloUjWOpwJTt3ojP0HLtpmRdA/80s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kB0U9tLVnfPr6YorAlMd5oncHT9B7Z2Wewjbn5SKzd6sbprK/Tj8A09eP5tM8+pqB4mYESzfzbDRMKWz2OOs77Atd0zqPll7d0iTzhN6Aa4zhV7mMZ9IE1kfNBnA1C0ccY/dnrH/+8i5sJNiT8f6n20IoEyQgKHFS0R/KtOPLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQsRttGG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQsRttGG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8573e75425so2399768a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060898; x=1781665698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BiWkDM88UkeI5kHrEACZ77BOW2Ed9Qe85NMLR9Ta3Bg=;
        b=qQsRttGGiA8B8CJiZ7jwb2yrfzw92O0vNal5EfntrHn3akeCc/+9qSG1ikXo9I24iJ
         znv7mCGCxG6S0FrJueZWfpo5ELaU2Qi8cuT1kodGNDqc1XZS9gt28Z246lq3LRVNqtIk
         ADWmtHbwjaMF2IKkD9M/jttfmmR0vG+cHPI++Eo5K3L9CsTmHwpOi0c9hdXUO6P8+I5q
         QKlXZKURSIm8Whb3bHFOlB9tT00QgumSD1NV011Sa4igV22GzZUHrOx/5B+7ejpYGgPn
         ubVU6Un12te9hM/V++flh56P3CA1SFIJy8IF6V/Y3lIdRCDgQyprEwm8xetoUBGyX8zU
         px+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060898; x=1781665698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiWkDM88UkeI5kHrEACZ77BOW2Ed9Qe85NMLR9Ta3Bg=;
        b=dwhqNbOS78BMwcnemE+S7idIP68UwxIiu7viozviPWfz1rNJ0NlDgTRns3H1gfZWZ3
         siccElVIp/lOSG8quERccF3xg/zasiESwKJry7lQE6cUNxcI+2llWXHIqC3WanJeW42H
         wX5M7M4WQ+IDhF2O/W8trx2lrICb7wE6INOjGzYOilo5KM3UKWFtLN8IJLkT5ouwJC+1
         iJgjzLuuJ1Xz+Z2BpBs9r/9I8YtNZn/cN3J8f00Kwmrxjava8R3SBGep1pS/zloodMtO
         y2F54usadnVSBec8ctPZAEJDKBPWf+LrdczV3KceVDlInOPcyie44RCBPEBM+3v+Uq1y
         I7Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8heSVHAdEuNjcvirSqtqeuTGr5bivcMydTGHPoFaVwmNWxEAUmTieK2zOrni+f1Uol9C1NJiAELitqOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNtivpnDglZy0f6lnW5egByq3YwAeq6La2iDqkili78Gyy8ni
	SNu6H8auMDZGOmvEzELYXrmvPsHes5TMnidz4CB4iB3ApsBBsmnLcuSA
X-Gm-Gg: Acq92OFwWzckeG6i7omfTzMeb2bCvMpXi+1OGpV/LhdrGyMKXWl/6wTtK11zG+Vlz+2
	5FzYhhaeBBk23Sl3BC+h3IlnE+cZ2wS7IEzYy1nEH/qv4ri1B8bb0MaQS4fBsiGYdYdCiqGuC17
	SfUCUlWV5e/rrPTWrZZ4lLLVn/xVz9ZF9V2injZu8nGELha12fAuUwjmE1erBckMc/rni0w0c1f
	Wj7UIULfEZXVCG7tbbdnrgtaSMiDb/fEN2JwZl+sU0u09HGduAS5R4p9KzXB5BMLK5gOakI0E+U
	8ItFYpePZmqJJQzPOG53bUTJMh80shnNsJ+vVjAfQ2QOlJr2jDEKM07LCJfJ4SLZO0j8cyAPLNv
	lJPDa3fV4hqs2sWzDp/DxZa+Ao66k/5YvuEOKvEauaCkUWUJRRTHsHb2hRKT1wnegZ7dQda2RF0
	9cLfSlTLWZeYQZdStkXGtT0Fb2/Rfn3F91XgH6s7o/8xUc8e66FiI6bcyzGE14wZQDdiPRc3RBX
	CGrG88EdxHED8i5sDZpcvJln36lG+JGl8FWtApillKsrcxKIhQ5Zg==
X-Received: by 2002:a05:6a20:d0a1:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3b4ccf8e5e1mr28706510637.25.1781060897591;
        Tue, 09 Jun 2026 20:08:17 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm19679386a12.0.2026.06.09.20.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:08:17 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Stephen Warren <swarren@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] firmware: trusted_foundations: fix device_node refcount leak in of_register_trusted_foundations()
Date: Wed, 10 Jun 2026 13:08:00 +1000
Message-ID: <20260610030800.2100685-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weigang He <geoffreyhe2@gmail.com>

of_register_trusted_foundations() obtains a reference to the
"tlm,trusted-foundations" device node via of_find_compatible_node(),
which returns the node with its refcount incremented, but the
reference is never dropped. The function has four exits:

  - early return when the node is absent          (no reference taken)
  - panic on a missing "tlm,version-major"        (leaks one reference)
  - panic on a missing "tlm,version-minor"        (leaks one reference)
  - normal return after register_trusted_foundations()  (leaks one ref)

On a normal Tegra boot using Trusted Foundations the node is found and
the function returns normally, leaking one device_node reference for
the lifetime of the system.

Annotate the node with the __free(device_node) cleanup attribute so the
reference is released automatically on every exit path.

Found by static analysis tool CodeQL.

Fixes: d9a1beaa10e8 ("ARM: add basic support for Trusted Foundations")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/firmware/trusted_foundations.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/trusted_foundations.c b/drivers/firmware/trusted_foundations.c
index 1389fa9418a7b..43a2a417528f4 100644
--- a/drivers/firmware/trusted_foundations.c
+++ b/drivers/firmware/trusted_foundations.c
@@ -159,11 +159,11 @@ void register_trusted_foundations(struct trusted_foundations_platform_data *pd)
 
 void of_register_trusted_foundations(void)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "tlm,trusted-foundations");
 	struct trusted_foundations_platform_data pdata;
 	int err;
 
-	node = of_find_compatible_node(NULL, NULL, "tlm,trusted-foundations");
 	if (!node)
 		return;
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


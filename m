Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A62D2394
	for <linux-tegra@vger.kernel.org>; Tue,  6 Oct 2026 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266958; cv=none; b=Ac2JTEflVlLHCVJGB/HZPUo7JMh+AEZqtgOrd285frbVMcVhuIwh2+ZvXhJGu7HbCTRbfU0WS/+j0DLXu4nzr5lYMCQB7tz2ovQSKL5chHzHIcB2yNdL7hP3QqPEEmgFUDi6Qk/me6Al4R09Wwc4WNRYN2454szvs0RukGGtfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266958; c=relaxed/simple;
	bh=HVFg8oUhgiZyRBPen6DfaYlVMgTFIxBKy+NDbwY6uBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoldQNuWp3LFGhpkY5YzKISKPrFEKY1gEkkAQjy79UFtFIlCCEMPPep+E6Wr1vGfzr+ssrMJ6ZvO+L0ThNJzdTC9A7GEWkrvAMLmGXzYBSeznvv6XewkNmmWNKRvFo4BeT45o3eBbBzTbzNvpeQHf5xKvlzutbja4VSjZtlZDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJCQRbRK; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJCQRbRK"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-918df06abaaso4175426d6.0
        for <linux-tegra@vger.kernel.org>; Mon, 05 Oct 2026 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266956; x=1791871756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=cJCQRbRKaGcw5G77M8TaVvRX7Y5xsG6t/vHs+vKHZF9lzwxu176HkuwxV9m+hByNIu
         FB2g6mkcIXeKK/cFQgDkJJfDtZUHAGPVExBIOAHM0PSTwAOKq1woxPuc5ql4cavKw4r8
         Kadf2gKkX9nKK1Cx07m8oGICYO2I1Gq+9hivFHraW2trMbvtfmgsdlYfMemN+zOHm2gy
         m00EVBzdLS6lcP1ZeVp1phtir4z/UDxErZjauRsXWdqbBxENejJUvSDZG1JBe9jc8NCI
         JvbKo66HfqoWH7lSDz0ULGtVvPjr0sGAVodcYBKgr1cm+6cxHqrxdjhR8O6wrQS7sSko
         DIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266956; x=1791871756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=MPi4rHJKhZ/btq95nD1m0C+6MjaOPvGe8twKtQuw+I7CIWY5uJU3T9FMK5RKGq7xgi
         wFExI8eIeFNfWAGjV1cJDalYQUog9XJOA7Ifv6htCNBkQsmy4rxiD/xa83J7xraUQxpl
         oQ/WLx7G1rUWuBp3w6Ak26L7cy2f4s8jWm1Zgcw1B830zte9Sb1U1L4GB7HqRj4XvgLN
         m0GsxHEGCMHDKpLSuyNrgY4SBTGvMwGlktYg8wAHfx1DMXoEdtcWywb0inw0tPFUOrRa
         rL1SXRGe6q9xfwc6iXEH1NqRVVxPzkrUg9z3UQkkuUmZv9yrrLZpn+8c8Q5Ev4DXFtXm
         PQkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5irKJsQc5WcnavHfnzEox6/LF0Fds7uXN74pmTAj5MpB/rNPZ3+0i/ZcNTkxEmOHphDNEDus/aHmEVw==@vger.kernel.org
X-Gm-Message-State: AFuF++lrmiC9msrk+HXBa3e5JSTGVHsqGq/gOjb6OsOMnN9K0c91YCVb
	Gq/doVOOaGG3l24pIlFE6i9P2LWxAKSw7XBPKxsKPfMMAq76/8yyvDTf24TkaJDh
X-Gm-Gg: AYBFou12/QQ31hdmfmPeQumjb0HicexFa+AuutpKWZ/I0s1QqwIVLxZ6urxaz4Bh9D4
	Ml/QkE61YYrX9hiDHJjDjQFveODrNIYl3s44w3lBB64/DiFesMbqVMA0ChBk68yY3+RlrRXkdQD
	OuRZlv/8/x6jTa0+QUDGZHRF7Cw0YEsseph0tqMo+/3C1cifnh+b0a9jpH2bUDaojwLDOPp09tV
	MeKVXsySDLrdqSACXJ9+RBa1Usc/btEOmguCW11u8AY8R55n+kKEgEA5+ZhGCQY9B5Ff3MQvcJA
	h2T6tozeY7Ft1nnUm1xNEY2PDNKxbbtMcNnMuP31AKPwQQnUEZ6DGvGHYHvT3Lec51ekxeCX5Je
	m43m5v99MNgY/rHYq+yFk5eyQ/wDdT6xC6ilc12ZEWWq+OcED2U8Zll341tX9FcQxdhJO8QUP2V
	2Yxjmi1D5tWjpU6zwrmGheKWgUABL2Fw47/FOLkG128IIngtNF2wfu3yVne5eUfeBsghNZmwT1G
	AJ3IrFycONL2GCJg0hRBZk=
X-Received: by 2002:a05:693c:639c:10b0:351:1272:e21f with SMTP id 5a478bee46e88-3514e2b0177mr353517eec.28.1791266514578;
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f73fcsm4442054eec.10.2026.10.05.23.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: tegra: fix typo "fuction" in comment
Date: Tue,  6 Oct 2026 11:31:48 +0530
Message-ID: <20261006060149.44677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-tegra/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index b21f51b8e19e..d7bc21bdb519 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -257,7 +257,7 @@ static int tegra_sleep_core(unsigned long v2p)
  * tegra_lp1_iram_hook
  *
  * Hooking the address of LP1 reset vector and SDRAM self-refresh code in
- * SDRAM. These codes not be copied to IRAM in this fuction. We need to
+ * SDRAM. These codes not be copied to IRAM in this function. We need to
  * copy these code to IRAM before LP0/LP1 suspend and restore the content
  * of IRAM after resume.
  */
-- 
2.47.3


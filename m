Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861933DFC69
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054285; cv=none; b=oi5/Eta6MY4ckNkriVdlHgy5tUuyFK/SxdojjRE3pjeUNb/fa85fy3dbf4AnKQLUdFoa/5RfW7f0Z/1dMNS50rf6K3JW2bmVI7Vu2UyyO8YjyoUxSSok4PRn0iL8HSGFHiMZN48SZrjcVsQo9NN7Qyyz8O8CGhzMCmAr+6ftsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054285; c=relaxed/simple;
	bh=xR1RM3RWJW47Z9xeWRrmmEaNfsdqusccHbBUDCDmcQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KNZeRViKxqG/Dcn7BL7dsMZuPG/k7KIk0OJgOlN7W5hfq2sG7cd+oexEH9Z1GsTVshRi1PNbH0FYzCsh64KBnlldNWp7sTDkaXvzB7qE3/d7VG347EYCZNWfIaKKoh26z9tmfCLkPxciTwMh17vuM8C9A+e6kTQGR9emogq/ujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGDiMsnT; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGDiMsnT"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f00a567cfaso470919eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054283; x=1778659083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97mCRoyN7YDaEeJKPq2/ZEaKlSBE3boJ8GScN+I6XWA=;
        b=oGDiMsnTlTpbHXLmNoqqo1hLK8n1u8jcZ2zfzNdNHwnmEAXYm95jFYKj4wRLw2ijb1
         1DE/p/5o9asy1cBWcOjGcpBZm3yVITBCuAqGybv0/wc/Ezfzr7fZs+si0yrC04qkC7BG
         99Uk7byCXeydQry632gZW3tZUAJoeh8e6Ow/ni+p5gSnCWUCPaqcz78S45Ygb2GsXT9O
         KJGD5cBMj5xZlZyuRsFJA6kHNF5j3BcPolucFI9GXKRe5sr2uvgTZJQD+5huJGoXwmSq
         z24pkxfWi3NL1MC+PFKw6BOxI7bKPe48Mpc3EAhF/o3hE3pkQT6bkRvmAhP5TrutCHiu
         c2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054283; x=1778659083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97mCRoyN7YDaEeJKPq2/ZEaKlSBE3boJ8GScN+I6XWA=;
        b=tOgXmNeFazNUETFA0R1P4FYL4cAWj/4zTPoyFfJlm+MnWHrvjXaZD/ldHi/I1LknaK
         FZwhS/K633q79K+tzO8W+sZFVif9bHG5kVg9XdhekKmF+BjG7rlsMpieiT5H/9qIcmC3
         kpuFhYmlczzI2EK1ri7/VxFZaE9vPdKXvdMk9S+jvBfzbPK4QofB2K85rNfCYJfDIztR
         W8bnjn4crKoNlQ7x/krAbjsaWeGFRl0xptlKysjYv2TGU3yFwoHRX0I/fTVJm9XZ0YgI
         kBps6I8nFZ68tGzUhwp9pwEM9P4azHmyZORgTvC8ryPrWViHG1CCd8wobnZLRHzrqaG6
         ykMw==
X-Forwarded-Encrypted: i=1; AFNElJ9h7hMI8a5/5WmabQqtOaws4eh6kK1L8M9L/oayCawsjyi6rMD9aaETHqn0pbmMnxW5sC3l59HgnQp8xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypOUMO15cirZ6IdSUOfGzKZHfzQ5x+DZJPRZrZv4qWfug6XazD
	azom6TDVA8JB5gpJmYd1b/asuy6mvo2WxxnV9Bgxrb+1eVB89IN/zYlb
X-Gm-Gg: AeBDievFMRSNeNOYITHj2iU9LfOB6acjelepnxyg++rvmQPjKzG/AEkEyi9vheLoIQZ
	YKHa4qapLtMT3ip8dD2YHSVzeglPUYmpbGwBgkgltFpFCw8wq4cfQOntBmK5K3RkpZwhtxzcRIA
	aTqw4IfxI2dC1igy7z+34bTGZ8HVyJ3g0/WIQAaHoXRgmRiVFksLPPdHpmlsl5d2vshT/6nYz6e
	lqKmG6smG+9ow4P4lJgDg4VG+anDlPMQjjsqit2JyUmARsV3dIRfQdIR37djq37SDjhWuGC7TUR
	LUDkZym10WEO5fAdP2YMYwP4Tgiu7kVvGVc7ucwzIqYi731YYU+CBW7ZtnfcaS8+Y/RRB4HFn3R
	xDI8DWOb4GEeOEujM+w4qR2msekjSyhbxWmbGatx54pVnwrz2iXg4ku9OHicaONMetfATiCrMk+
	EWXU6ijPGXHR8FNiERdSljkrYioPI6KNIP/0SWXC9Hx1VxhtGUXcCh1zSgT73LDnbJNqG0MpXnt
	iYE
X-Received: by 2002:a05:7300:ec08:b0:2f0:ee2:f6c6 with SMTP id 5a478bee46e88-2f3d19ce4a7mr2903276eec.19.1778054282508;
        Wed, 06 May 2026 00:58:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d4cf2fdsm2416561eec.8.2026.05.06.00.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:58:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Wed,  6 May 2026 07:57:44 +0000
Message-Id: <20260506075745.28574-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Follow Hans Verkuil's suggestion to use WARN_ON_ONCE()
  and return the first available format (index 0) as a safe fallback.

Hungyu Lin (1):
  media: tegra-video: vi: fix invalid u32 return value in format lookup

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


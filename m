Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4665446C833
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248961; cv=none; b=hef/ghzavOV9WH4TxztsePxQgqISlrqALZBDOeR8+Rbz6RCwTtZwvUuUqyLQrkrC/Dvr2e9+qx5qltAf3kMcZx1cMTE7u9X59ecDelXnfyovIHJnuP8VATb0g4/lJeESG5uVv1+L1JnQ6IHWygelVqgsKG4c/5xXjXTwlUcc1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248961; c=relaxed/simple;
	bh=F4dCyYi/FtwgrncQW5XSrTpQkmCQZWz0zvM6wVNpeuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ar37gntIPqE5g+WoOwjUbDSjtlSi/bqCLmhNOjm2Obxynuhf9v74IAmQ/uqKMqdcq0k5vWTDny2hkNHTcgsjNRuCXi7JIqNSF+vd2wS6gdjWhFcjROhVioXcnD3+5m/Zjyh1UF81VqySro8ncWO+wCKn63I9Hb0sIE0qO2UHMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoICp6+2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoICp6+2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso940041a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248957; x=1790853757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=BoICp6+2Htcn1v4h7jMTQLOQxkwaxGgojRYX9MpASz0tTZ3iVCWnmrKPYqQVG7omzD
         jBmkDQPEbSVrSEhJkmPSNFvCFtJAZUQIWaFUQY+tNuW9ZEcfKniXfzBydIdSFdSXxKj2
         KhPiPdIkY2fiEq3wPG3oWy8mQuR5D7nVOHOm+nmAVkrqbhcs6p1v72/ADSS93rDLmVZk
         KZC2/oLkJrKheLXJ8wjNBJk72OPH3HHsGFkWVmLSakA0hHqT1zCIEW+bLmzz5DK/ZBpG
         rIDWirZhtAoenid6+YFCGPq7joCWm4QaRSyV5bu+cHCjNoMgviQU0/iUIla1M+S8wsxz
         j2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248957; x=1790853757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXjS0UafrfQCypTmZOrJ1CPsA/C8kLkUtfgDDuLmlBY=;
        b=zn79n+TebreE801a7E85yMwznlTwaG968KPVCi3g9F45acAupk16SOIzb2ewIlukED
         +ByF7oK8xV82GOsv8ANqVUZd6NVbTtmD9QxxC6O2yAr46Pi7z9SpdRmtKUZh/77XNwyO
         P8FiznGG29aWEm2ZpbZevglZJPz9RrWzNQHD3TmSF7zQe2BCltXBzvw0Klx3rXEAvDwz
         T63qJpdDCkaFuDq5JSHzRgyJUY+pgceS03KLC5iBR+rOxubJCXmm6NvmiKA7pE5JU0TY
         h6acaj8NTxKi+yGTEODgUuGPkO8zqU4grPilQ/t94lVgjh4jIppaA4KJXWZxq5/I+A2p
         OVSg==
X-Forwarded-Encrypted: i=1; AKwUvBzClvveSZ0ZZW4znzHtVGx6O4Qx1N3Lto3kq7Hz8pfymDDecp+UOuaw+IRe3sG04d6Xf/vA7XLFhnLQYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mvEvg9nb2vj4RCLbuJgFAUkzLt2CZ9mCOknBwGpaajlF+0b7Ic
	4B476UktPH2Q8gYapgqOELaLvDYggXRPle7HkAz8jW9iZiiTjrO/waKM
X-Gm-Gg: AYBFou3EcnA1iFvSSZXqbWqLcpiUua2os+RLhUWXMEUeSniLMX4mn3k7+uDyXx6mZPw
	VuMNgRKQ0c59ll2Lmh7lTaRjpUwfGf3n0ZldVM3f/svvM4NSW1euRGZvzy8yO9AkB7bv7GNU6J+
	JfA8TY0bi7/sMkNRq0jagV+/zISRkoHEgewpiPYMCXE5PwI1dbFnN6QZFjLoWG4N5bSyXWqhGaR
	2XwaqrVswef4iLyG7Hj4blNZ0Z4BjmgMgDj2s0Rk7/LhNvfKT8EpXBHz2MfVenyhqoDpLv7XW8X
	Cln7sPVh1NMWtzZc6/cE3/Fddr8Ez4XXIeGabGyZfZfCGL50nKUeojo2EHwKyn6d+/G1KyngmNC
	QhoG1w5EP/PI5CV2iHO1uLrxYMJ6/x5q/Q5jo5i8dxtmXxDZ2ZHGgm1kWIX6U5sInHlug4WhIXe
	fv3Sglryeyo6upHZ0S2sg+VWFyPWekODsky622+ciPNWeu41ZxbWgUzN4E36w2Kstm
X-Received: by 2002:a05:6a20:2450:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3de0e6fde8fmr2226919637.2.1790248957445;
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 3/3] usb: max3421: Free transfer buffers on remove
Date: Thu, 24 Sep 2026 19:21:56 +0800
Message-ID: <20260924112156.1564208-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max3421_probe() allocates max3421_hcd->tx and max3421_hcd->rx, but
max3421_remove() does not perform the matching kfree() calls after a
successful probe. The probe error path already releases both buffers.

Free the TX and RX buffers in max3421_remove() after stopping the SPI
thread and releasing the IRQ, before dropping the HCD reference.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/max3421-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..994e8a07538d 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1950,6 +1950,8 @@ max3421_remove(struct spi_device *spi)
 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
 
 	free_irq(spi->irq, hcd);
+	kfree(max3421_hcd->tx);
+	kfree(max3421_hcd->rx);
 
 	usb_put_hcd(hcd);
 }
-- 
2.43.0


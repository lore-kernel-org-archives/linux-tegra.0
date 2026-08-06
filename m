Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26213DD87F
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998392; cv=none; b=UayNMIDg+fx1mz4u9En/1bqpoyciBsTStgnXYvig+/SGXWg7CRbOtaN/XH0NWh42o1PbHYrzz3PuWBeEBpQnSLd7KPWehh8mgO/3BUcZoumKZMI6fttfzS+6ZQBwjhk2htJ/y6JwqeWRLULQLdejgsrXs02zf+yoAXCKvKex4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998392; c=relaxed/simple;
	bh=QTj5s8syfOr8zEiUjYG+W9zKmue9E5IoJGDTfWHVDSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za54Q+TeiH/o/yV+8IzUZWO2ZYxTrPntjZq9YEP+4yK3bZKjsKlsjwnAxU/4xA1sqL/T+M5kHz4aAOzj5+yPTepvxiLlFzcUfejW6UuQqaFZSZkufvMptBzKQC4i34ZBHlqBS3J++fE2tKPteiOu1466UvpmrLhBnIfUytAgsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/HsTnAE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/HsTnAE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38101f85591so529680a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Aug 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785998390; x=1786603190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JgssGURzd2pW4+70djq6KMjSjssKWvjAqwyJJjHL/Y=;
        b=G/HsTnAEYNarg5T1KM04scV3AlZ5fdTn8t/UlyHMMi5QI5rch+E6NwuAAK/JgfgMdi
         c9b/oa/+rqGGh5PUGlbpJUA5klvXlbuiHAsgkhDS9FE/erWH0yWAqMBCo1JrPA63Bdzs
         sPHrJkCGKA1WpKk4oBD+lNZtP0lA6846zcI298dfJPrzSxBx93zebp3OL0YvYYMdmWGv
         14oB/5EcRmDubteJPdd7w6aHpu4kVbnduIEQ7qMtT9Dsz5YngEstji46aiWxX28Ea4X8
         IizZFzWQ7BcHpT44pnvBGOOONKGLArBuwqNu9M/mNXbzaqW1BLpycfF8dXUy96ZcGMoC
         PZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998390; x=1786603190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JgssGURzd2pW4+70djq6KMjSjssKWvjAqwyJJjHL/Y=;
        b=Pz0yRAnPOQ9Oaqi6tn0eEebpIU5/uPRGQ0/CG/G0xYKptCWyN4UU+nNhQK0xTDivMx
         41rYeNcE3Rdb3eMNPkWSasIszDILZpcLrsznKoQXAT3DGxySVdAaE3NRz69aj9CRVKB5
         G+ibdKC6LyIcnClmzwlPWxKtK1+IL+BBmOyRGVMAsdfYq9saZ8kduxKnB2be+vGBIpnz
         G7N8gmljA+C6TIcASagM0vb+32cacW3IpJWGx1an9b6AT9rNxG4SCkGTgbsQpUTxBGb6
         pyMTwgKbTsMQ64h/wnjICzjMoxZMW9ZHPA8fS0LQNfpMuHTP8IP5EPei42YTmr4QZXTE
         j0dg==
X-Forwarded-Encrypted: i=1; AHgh+RpJqe+EWwCUgPWNgvbqVvjXUiUmtbMHY/GNhzzyhoS1ZQ9GeFZg/xrHZnQleBipj1VCfuZ04Fbe19coOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykguCx7O8nsX12D0bgG+Q6jsI0aKgemeR8ZWcM1Db3ygy91Ahb
	jcVbuB/Ga4+PCCRo7lmwQeOp/1+B1joLHSN+WP5ghWVGmH4g76tCm5y4
X-Gm-Gg: AR+sD120vZDv34XrZ2KcEKYSCquGJguLFt8Vx8J9Gq//K2/POxqttwERknPw7xjoZWd
	QWhw0kp+ePvNM/DXMUJDnLeygR/y3xvwPzhIunVCeb9usUDa7vXfW+sRwwk71Etnbt+X5koqv7A
	acfmPiwWHtLXNgSs1kQUBzDWUomQaFr+6qXmpd49uyUGsNg+FALcMKRbihf56J/tap1+PXi5/Gj
	kmkcM9tJ6Yynbm2+wrxEpLm7VMhMjnoZ9W9n6tIV7cVwIte2Da5hum8oAzBXbIxFD+1myOOxd18
	LpnsaBKrSL/ZDitw3KO6lnAqmc30ZugY0EOParm/eaZARCd/iHTTncKyOhSk8+jC8dlP745ANSX
	sz4Zbc8aKafDk7LdonLY6fgRoF18wm8WyU08DqK2ruQWc+H6xJcEZP6HxcKjpLZ/L4NQ0uvpQVl
	g4UrhRBaswUqWLqTDNkjGyWCOEndNcdtIFulQL9jTGhaCt15Zr0lp/388EqBx81SYC/UrDSv9PB
	YYGXNatiY+htPvd+VG2DbT1Q+HzkA0veWMqv9IMYp5OICjpIPWJVYRSGMu/xjhZyuhln8LCVvf+
	nP83
X-Received: by 2002:a17:90b:4ccc:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3908982a10emr1041143a91.19.1785998390140;
        Wed, 05 Aug 2026 23:39:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085ddd4b8sm875983a91.6.2026.08.05.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:39:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] usb: xhci: tegra: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:39:33 +0700
Message-ID: <20260806063933.27331-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..cb946eb7a65d 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1571,6 +1571,8 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 		struct irq_data *data;
 
 		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
+		if (tegra->wake_irqs[i] == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		if (tegra->wake_irqs[i] < 0)
 			break;
 
-- 
2.43.0


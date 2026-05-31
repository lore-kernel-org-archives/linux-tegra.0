Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2F341660
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219640; cv=none; b=MsBC2L3o+E8VzCszqBMTJZnmWvjH9aJEnY0LqLjLpXzmoBhmqYNfBGix7M78MGytJzYpWgkhPRg20lGwYuyM1lXBw7hd0JpT+rvClhnDNafZzi4/33lMZKp+2RREGYtTVPJMTPXhoE0Vw16PFhhem8XVqtiiEHOwPLKLy6cFV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219640; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FG31BS0FgC73kjRMetEKMYRi1nfSeAVF4bdtbg/fZJ32hatCT3Lo8S0ixHGlVCTC9u6NQV70FkvzNUCdiZM7NxsBeiZwWuhb97BSXEX/gKX2sLgWDJ3vDdvzEqJtQo40e5R6hpn0cjx9pKwZThzLA+SZUcl6Ac8koQkk6dmYsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1kJNNGj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1kJNNGj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ee6d32402so1670353f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219637; x=1780824437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=Z1kJNNGjAxNY2MDRSHYUmFg5HRC2toh47FoBTvuTRF/WAcBI8NPZTTyc9UarLhWVDf
         XHhl2EThExpE3pWWC7a3upvSk55xlQIQedCOC38ZinNXV/i1z79EFB9VSkxwIxjc7nRl
         +pBDES1vo0DUaWptVeZ10YE3djhEJi8X7YQ3EFVRpLlUgymp8x2cDbx7lQAqkbeyym2t
         uw9xP22egEVfqG66ktUBN5h8YPAwC6OKj+MFDarpg47G01G3z2yqazDvPwT2/35nug8g
         tSuacz3aXApMKBSY502/g3Bw57PGr3JkEGxOubMztXefmIEvvwLIgSJ3I7hckmpSnRUh
         jcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219637; x=1780824437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=OvgIXh/emo9jba+HqagTMZ1bEOjEIZyhqMmHZfzSVDLhnDTdQs1idchyb4Lt1ZaxFr
         1Q4RPo7GwwpnZn0mfDh/X4dGYWz5GcsqwcBs4D0gzas+JpEATjwWbF6DPkvEQxOkJDo+
         WtxBA76nhjJlL5RzZcMfRMiIVmK2Nt5E4ksSpFZhi4k/2JL7UDWAr+GQpclU8MXG0gd6
         BV58vPnF5Vl3hyoFuvrc29BFx/6kN1n3c+R3leUnbGGDCDlhFpSDPeNCgIpRwPo7u7xf
         yAzfq6yHuPuegce/nhoqbRqgV95JK+grO+eWOkH6nv2NPEp0+hcI8aJ5V+hs19rr2eaZ
         GYUQ==
X-Forwarded-Encrypted: i=1; AFNElJ84eHyN3brOGWC39bR8E9KcAqmNhVSKc0Lt5mGesmSOUxTufSWawGpa/pmljZpLWEZFoOWrrCrbF8yELQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZ+bmBwd4e1TP+OyNwiPP1ZqWynK9kEGbpBfjPFTy4E6o0zz3
	BDxAoaMWvzq3xfw8aVVOX93KznMxqLlVevRRTfCnBwZ+he8qCN1bqiej
X-Gm-Gg: Acq92OEVMgpz4ziqfinHTU5kBFZ/EkggxuuYn7FrAyFWfKOHtc26O1C6Acys8BChZYr
	NOfwEz+7YGait9GbwLiF6jlpCBZLh12oGWILDgY0sZS0NuntbBXDMVZJBAv3+3oMQZ7VOXShHVK
	vuYxFQf0a8qDHQd97Bk76qhah15HwSd16p7OJO7eSe1+Ksp6cBXtnZuNSwO1/rFBbtePHszQUdr
	z6ZguH/w3w7PXPWXwPTp+Krzvde9Yl/f0PcrsG/82U5wMKqZKyHQrCGpPOEd6TbGqs/biT6a3TF
	tFIriyiUg1jwF7urNHX8sOnL/zUsItSXomaYQOAF5r3lgggxHcPjCRljY/5yzYV4gE5T4rhzLk3
	eJMNZhN32XkOxX2TifVEh/XJTcJVVIE0F+FeI+SntnmNV35B45zc+majYzwUgYoglLv5Kej5C4q
	pPPVXuXL5F+17+QA6BCcRrk1g=
X-Received: by 2002:a05:600c:1d28:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-490a2988decmr123585405e9.32.1780219636921;
        Sun, 31 May 2026 02:27:16 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm68462675e9.3.2026.05.31.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND v2] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Sun, 31 May 2026 12:26:52 +0300
Message-ID: <20260531092653.12589-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0


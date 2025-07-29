Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8B1DDC15
	for <linux-tegra@vger.kernel.org>; Tue, 29 Jul 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801160; cv=none; b=ozZw9XwRcA1y2FsLAScEN6mPvEPGSu8qUtKrBFwDzmFboLese7AYvUD99NFs33ZAe0CVVO4L0Tb0dVM3CRZgEl/C7jrgAx1j4sWefdLnqPoV68w6/DVmxwqLh92AWunxAGRUrUPOOURXW7yZpKxZpfH8XpXqRtKx+MKT1UqZjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801160; c=relaxed/simple;
	bh=dKX9IWhWZUjIETzu09HXWCP2FX19WmrEXQwWXSsiWxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYh0x4juK5XrJr8RssLC9h37cqchrKOLOf9DGC3Ka5XzOBecRg3/d0MWPlOLIcHklwZ0q9CNyK8/PVw20jKsp3sY8Npmsd8Hw3z9PqLLR9JJ5ed40gHxmhQnZ4EdRSB5W2U7H1FcflSFDwGkPaaTQRfxTfvGA9qm6slAfXhsHUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F39QfKIs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F39QfKIs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78294a233so2246898f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 29 Jul 2025 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753801157; x=1754405957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/LG53dFohZCH2eYSvxT4rGMuFbU8m5Cbcl3lHviCH0=;
        b=F39QfKIs0h0itCPVq6DXs4Cuer/njStrnOoTvUnBE5+VSfaVEVF8s5yFjA/8NGu/Hd
         BUhg0vh4SBjedE99+APz9QD9THWAgdIjqJXvq6lZ3PhT9z+Lo7KakVnpMruoPt069Z4w
         5V2G3RzvYud+MaFuzslXu0eswYbjTsrY2P/rdkLbq1x9bpnz8CKoD18K7GS7lxbymhMh
         AYAGx7f5piycvBejNkD79TCKI9EtaL3pZ0nmH1HZOeTiXmso7eKttrG3uBvX1cTeONzS
         GMdTXwXtx+5+sVUrgTEhMXsH0Q4z92iYLMgMI5dJ4uQYHCv6RJJ6YlP8QaKVFroEDdM5
         pO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801157; x=1754405957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/LG53dFohZCH2eYSvxT4rGMuFbU8m5Cbcl3lHviCH0=;
        b=rwt9Ao/8p/rs+VrhBXUOeB11RQfqJZpgrpeYyF2nh9nff+5lJzjrUuorKj9Edtur/2
         9qP1R42tU67ZWoZ4K8ZqACekUC/7M1tZrZqWdJhXQP/qlyeClqDtuGUqQrqXOSjTGRaP
         ISqfVLfNJv7bofO12SLr9BFZ2IL8DL0L793bVvr6/8+sfzrBi8coEc4mM9Pw7i9uXa/N
         LLCgvNOjwR7OVvMHFH1e1V9+hEtWIj593zZRfzEZaUzgqZmgdkdOmb5y9HnQXbu+ra9d
         yLeg/D9n4S9SHPYjHhfBsXi8rF8nREn2DBYHg/I9zSCtnqgPQOWa/NFB6dEhDrkItXCS
         dxjA==
X-Forwarded-Encrypted: i=1; AJvYcCW0gDKRqygOm1LoQ2n01TzhTv6GCIozq7VboGzBQT9KQAZIEKOCZzT8wQOzGIjYSa+7KuWdLx6XknGyfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8AxejvqwHqccCdk9KRPSeo7RR7ErXNiQyylsBJYGlfz0oHfO
	6fNQm1UjrzzRTo5lM60OFEJFR8fCDmSVWPPYUy2nRcOPwYDXVDIkX/l7
X-Gm-Gg: ASbGncuYDI9B8/PZdZgT8mB/PZfE7LOErPkbujinI50x+OXz6GPsciIaB2H+mwSFk91
	FVxBOiRpfma8N2LMWs1crQ8MNGQdjcM8duXyijKlMVkeRtUXCwAXqa2rdB6EdSq6b5ADcV728Ls
	xJZ+PcGJ+nxdrpH8t4iEwvLwkN9g0UoZkPdcP7p2LSaYFGKh1J+5HksWAKDVQxUlgqBYpNdRDgy
	WwMG0TPsjcmhJccMjmDqpfG/JlRtXwtTFBD4X9XBLpI3tnBxRqjL++2+8j6ZBY705b3S5YTs892
	9IZdGB+VacRS95Y1X2yWiVcJgx2GLNopduLNWj0QP4hUxqjWyIxcokvZdIyBrfbl+a3yHUBDQtc
	tObPVhV2UN7H1r8i5QwpraCkzSi+RB/49o9VD3M9IIvgQp4+4M1+A9//ZToAlOJQO+3/I+pNs2Z
	hc4F7kzwOwROEoCQ==
X-Google-Smtp-Source: AGHT+IHaloEvK1EePK3wTlGpz/HezjXIFcDlJ6uZq1eeohB/1LIP4fpQpJ4PSqhyVgW46sS9ezkrxg==
X-Received: by 2002:a05:6000:2411:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b77678ba22mr12923487f8f.46.1753801157167;
        Tue, 29 Jul 2025 07:59:17 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b77db8a944sm11354934f8f.52.2025.07.29.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:59:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] firmware: tegra: Do not warn on missing memory-region property
Date: Tue, 29 Jul 2025 16:59:11 +0200
Message-ID: <20250729145911.2984981-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The IPC shared memory can reside in system memory or SRAM. In the latter
case the memory-region property is expected not to be present, so do not
warn about it.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Fixes: dbe4efea38d0 ("firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 7cfc5fdfa49d..64863db7a715 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -198,7 +198,10 @@ static int tegra186_bpmp_dram_init(struct tegra_bpmp *bpmp)
 
 	err = of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0, &res);
 	if (err < 0) {
-		dev_warn(bpmp->dev, "failed to parse memory region: %d\n", err);
+		if (err != -ENODEV)
+			dev_warn(bpmp->dev,
+				 "failed to parse memory region: %d\n", err);
+
 		return err;
 	}
 
-- 
2.50.0


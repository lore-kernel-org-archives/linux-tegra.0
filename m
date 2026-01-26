Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8E27AC5C
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769455241; cv=none; b=YpQkuaXXdowk5N/hAeCrOV8F4EVpKG7e3da/QKSSXEObMUjSGoXX3dTT1QqT7l9v7mU7IpKhvkvoQ+ilpSmpc4UbCgJOpAGqskld56D6ioRQPz+JxvTfaJsDOvQFo5a1ySgANj460sG3IZTf14ouRwjx+EVTly6ljRW32mLdCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769455241; c=relaxed/simple;
	bh=TEvFhD47F4EVkxPQa3VTN2QuokNnnePWP9wVBCD8Vtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bR0hmvad1D3XL+Mr/bdpuelR/po4CrP9KLZz+T/a3rpsNBR+WphQcI/Ai7qB62l0Fz06IQZu+nZ6vuiBm4f0WZKX9+sCne/v1k+95PzR3jlRtFfcPVA2wVv3nlRU0KZlFHBhKrvf3Dyo5/rR1XvHM1X730k2NJW/4fJun2HFXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPDHg7/M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPDHg7/M"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so53135795e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769455238; x=1770060038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXpV0Tab84NN0s0qLG+y0NdmTdNEa3XJP5kggPe15ew=;
        b=CPDHg7/M5n9keGtcNmrMNTSe5y/1bcUAuWm1j6z2E+72UVbflVu1+3sBNd9G+ff3Rx
         MZL8V8rpEV3OBbT/Ghrng+eDzbiygTLHRQ0XDhoEGQqQtv+UWa9zBoUeawJubmrh1sOd
         h+GZnqm1o+243ZMSv6qb8PlVVoeAFNsz4rBE1TUsq/hVVTtCN9MNW/TdRoyD+IzWJuJm
         LKhYAMTXbOBZ8697IlXzY4TaXRoIzMqQ6dbiHUT1uQJ71o2PjmWExGZS1nKLWmKPqm3Q
         XkBjW9VNevqS9AJk/wz9+mNgV2wZZe63y6/qkV8JrwLy0PTNg9OugthmU6sefaZkdK2t
         Loxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769455238; x=1770060038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jXpV0Tab84NN0s0qLG+y0NdmTdNEa3XJP5kggPe15ew=;
        b=FlAWg166BbIk3KxO4bKKGKldPP1j4s2q6S2254HVGNd3XC0y19Nu9FGFzjV5VkhOpf
         lOCuPyffv68hrYOCs0gR7IDzb5PtksXsQD8i3z2sl2J6G5vtYLYL99sLIptur7+6FQfZ
         17w5QyJCATSHv/54FUYUwzn3WPAapwwJ0Crf9kao8Phz0IZjQB2IvjlV3l+EkbPZAS10
         xEn5cmmMR9PGItfPE97jFHOQensQ871FfYPzkIPNfO3rvXRE73J1FRujF4+Kqy+nurHq
         daCywgDNQfO0rhpGytge/GhbbEVPOUwoDaArObEV0HENUvdfo+POfrq8hBri2X+WKsbE
         EqNQ==
X-Gm-Message-State: AOJu0Ywu/icMltRsbAPFRnYBuYAl325BYSHN2F5NHanifkBZbxGb0FCy
	/EmNvu0spuWxpr8UMKpKNiwUdVKnUsNKPJmikz4Rs012HiUsVh+xhVb2
X-Gm-Gg: AZuq6aKJh5Nub2VO4sP4hHUxViEHmLFfSZ8XZmlrciuhzXFY8FvdQsiENaUMVvHZBuL
	gG7+FWbM85AgLVcwMYdfpc0s5YH++GtcvPRG7Sw9wWhDfSd36kV6TChmQDgodvbC+uYjkCP2XGQ
	p3AIjwKhmn1ME9HJK2F/XYozinR82oF27J2q57PjmiBr+NJxUJxwF9wOLd/xvWaCO/yes8WwfJu
	CjqSYCgpFrWgWs31sYrderlhsWpa9w0CgzIEl4Jej2LTV4G6JUdxs1qu3ya8oCT/5VJcCNvrCwj
	Nkim3tTmp4ED9napJDzyyBiwOpgQNzCR4xK/pROgF21KZIMxW1twUyQFrCOlH5R7JxRGS/6XTzv
	jbTh1M8qgpjI2cn3g1Jzj8a429hhG/UfahBrediLmsK2COhZ4uNJ0ICLf325wbjt0ZpPrC9zjPD
	/5aPZ+J7I7ti4=
X-Received: by 2002:a05:6000:420e:b0:435:a2b7:2508 with SMTP id ffacd0b85a97d-435ca1b0012mr8280689f8f.61.1769455237832;
        Mon, 26 Jan 2026 11:20:37 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c01783sm32958848f8f.3.2026.01.26.11.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:20:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] soc: tegra: pmc: enable core domain support for Tegra114
Date: Mon, 26 Jan 2026 21:20:30 +0200
Message-ID: <20260126192030.79119-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126192030.79119-1-clamor95@gmail.com>
References: <20260126192030.79119-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable core domain support for Tegra114 since now it has power domains
fully configured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 034a2a535a1e..621dbc02afcf 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3398,7 +3398,7 @@ static const u8 tegra114_cpu_powergates[] = {
 };
 
 static const struct tegra_pmc_soc tegra114_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra114_powergates),
 	.powergates = tegra114_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra114_cpu_powergates),
-- 
2.51.0


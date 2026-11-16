Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841840;
	b=SZ+5Yp+fmDdV1zy0TP7DH7b0/q4zHYiLbU1L53aA1lKROeVrTeX/mnjoqkULss04G+sD
	 aeBI+Boc7ySqFMacJNZ7bEdbunWoUD4rx2aEka+/RpuLAZnvJNCrpOYxRsS/BODMsBbm6
	 YnGGVoZM8cB2H26VT1PoRRl3ncH1YhoczwFoA+QByRPt8V7qaU5wYvwNlBpHVNK1QvCr0
	 uNYhUv+azBudjdKBiv/9p4S3K0GR1E3K1okNROC8k7xn3i5QqtZJ2cE3nCGK3d5AlZQR4
	 vb1l6qlXLyW6B1B/iGMeKAdGvCQpfcCXx9qm9kZBlaq8TX4kByvcJJFgiQWzvY3RXIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
	b=WkPtosy+B/sqJmy29fZ4TddvcadqhpnVJMrs1i1M5JwRRlGny2cDz1FmInWOAJa0h8JC
	 2PRxe0bJG/PR3ZcgfSTz/7mZpSV6sl5aaZ4MQrPNnC/3V7mwwxwOiLuLWOIFEsE/4j6C3
	 P6TLVbajbRjPbKBHNzlhPHLlGBreGZiCChiWhPpLO3F+goIPwtFtQdE2IT1sweyq4frS+
	 7LyM2Z+vfBZF4WbGOiGGhMCILAK4GW3q1ubZRrMLE5Mc5xMs+r3ZwLfRn2ZNQyiF+cELH
	 vA1PzCUyS8oyQDr5ZYcpFBj0P99KRQ757aRGtgOwp6DnK817mNS/i75Qtojt5EBcw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FB606A8A5
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081FB606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50715c2757so450108766b.3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841838; x=1795446638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=mqDnQ4ZJ7zwYwP3nxgwnhXAcWGsxhZ565e08TvDBYxWTwGtag4ShjHfVvPPb+MTgvv
         QrFw2XAUHp/Tpp7lkczRLqwEtRmfMB85y3//HcE7VQNBXNNifzO9CO/ok7f88Sp4y7JM
         ueUN0lATdB7mG4PCnHvr6gZAI4Y++2n8kitfyIEdJft+4qpO3rag2JQugk+daMTtPAGj
         d74TMw1XH3j/k7btnmVLAL2TgWZL5kCme3KCX3YbYGj1h8E4Cb3UY66BpmtZLeebbWDn
         OGUBwKIp8pXHASL4AAcGhwXHmSSREqYk/P2Ql57B6FpNKowNylEKCE1adQKBmiXgpVrZ
         CcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841838; x=1795446638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=yfseI1SrVJ5ZcsYs9WiJCUgico3eP8+1yGvMIHjejAHLUeFs5IlxqPYSg57IyLME3P
         8YQl8r+AndUCGT8cAL3w3mHpR0ztdRpQjVoQKgRG1aJv8rluxxVTlVhdGws4fxu4BNCA
         eRcJ4O9iPaYH7I2LzJuFcDIqAOZfN8/8Cch5Z5R1t09jhcsp0LNAGapK5aDi3badvYFj
         MLakxv+HLJ8PmghSQMqccOq8oMthZVt2OL2foTrodcp9cxTSFm1foPNrSLvFGewzEqgU
         EBfjsxqzqUctRZ08addlDslutbFqUxz25mtcTMg0vVG5bglqYlv6Y+ldlVLb7CnT2AQD
         1V6w==
X-Forwarded-Encrypted: i=1; AL+hErFUBCqjRpXZTyM6FOsHHxu+EQp9a6cWSxKdIMEFBEiTAZtdY36lKcA52ojOXipyKHCQdpaIOHLolansAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TwhU+wWluNiN30mGkemoD0bDoGoVdyQZfLPsGruaelUyR5PWg
	o97kbPz8ZpQ+UtElbPyamRCVS4tOOPZ4tp0I+47MXbM9Rv5h0yuoLTLk
X-Gm-Gg: AYBFou3qUtxeJlrMM84kI8I9Z6QOyMFEr//ZYpjQTd08dZ9/ShvgdfN8dAemNnL6ich
	jYInXf6/LElXya4f06vrIjBx6rHvnTTGH4kZgBuBVQ5FVyrR22cnG2k3F5rvFa3snrMzVKc8Qe9
	n4y5FDxpANxbXw8IISXgWh1f5O7KlKpKoYFeGK9/Im4K1iD/OWRoYZjLG/5C5Gnanjm5VAWXhEB
	TX1vDa0cCG6I32LI7AAh9yXh6o/STKx3UYA+dL30144mtSZYfXeupyX/H6zmLOkKfDGAohLuoXa
	2iM2KvFN4kU0Il+Jmx0XxIbHk0fv70ktVGmK4ZvV6ZDsrtcIywCW5xLOcWX3Jd5+Svc8pttMAXl
	XxruDhy2kff5/DECWVgsnjmnADu0M1cAEvYFjAfWWHR/H42svSBPwjfEcSIBpOa19CvjigQbrGG
	6dfKiDMc+TuaWQBoqXKRR7Kw1Z/zAR9I0Xk1hLfq8uxugVczxEOe4OupQBT0HQlrSs+QYVwFkdj
	+XO5IFumkPQdaAf7tick0+qNpaAvcphqmw7MMixzhsaU/njkM+EXAW0MEvmQ5Oq4JCFWhqUlZvs
	TTDQjr2DntVLOFJoVgIE/Gk5FP/s/UCaar5o59zO6kqDdGpcK7SspdHcTWU5V1v7DNev4pJZLs0
	zwINd8yZm1w==
X-Received: by 2002:a17:907:3e10:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c50963fae20mr823362866b.45.1794841838314;
        Mon, 16 Nov 2026 07:10:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/12] drm/panel: panel-hitachi-tx10d07vm0baa: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:08 +0200
Message-ID: <20261116151017.274764-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Squash the disable() and unprepare() functions, since there is no need for
host adjustments between them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 318ece68b7806..153717ca6c90e 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -177,7 +177,7 @@ static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
 
@@ -187,13 +187,6 @@ static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
-}
-
-static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-{
-	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
 
@@ -236,7 +229,6 @@ static int hitachi_tx10d07vm0baa_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.prepare = hitachi_tx10d07vm0baa_prepare,
 	.enable = hitachi_tx10d07vm0baa_enable,
-	.disable = hitachi_tx10d07vm0baa_disable,
 	.unprepare = hitachi_tx10d07vm0baa_unprepare,
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
-- 
2.53.0


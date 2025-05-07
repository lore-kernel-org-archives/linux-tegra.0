Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8972635;
	Wed,  7 May 2025 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628704; cv=none; b=US50/cSll1K9UpBIuYWEGTbgpi3YUKLtZVeN86s9iMMXaCoiiFKqls0fR/QJZfP17x8E4EU2XUoY+veX1vqbhrNsxiotlGA8XkOPiNa2YqRkHaNDRBQak7cCpi3Fcfoy3hUQsJCCRhc6PQiZBrvehM0zHjMiZZ+ageujv81LguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628704; c=relaxed/simple;
	bh=OXFSSzIHtXi1ZftToHfjuhhCWPTTdinmXHmvKD1MhOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faL6savUX27gNtVrRr+qbPcEJ3xSoG8LAi9ePeo0CBPAkUh9aD+U/otRm1FFgfxi0Pe2sFssCnHYdTTrOzFOrNz/cn4o+21e48SHEqJQwnE5PoT8BiA1SinkWmjH+ChtPxZgicL+yCn11acEXl0An3Ei5cuLhvwBr8CiSD7n+J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3q55bVe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3q55bVe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so2437405e9.3;
        Wed, 07 May 2025 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628701; x=1747233501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjHm1B1Dol6/zUw3jQARhV/mKabUcXMJ3aVJNVwVxy8=;
        b=I3q55bVeGMgWXyKDu8pz4QKsB59Nlhqnr2kqKLtQ3f9Zlr0JNMwXKX2CBWjjQOjR3p
         ZzTMfG1W1NHdNitJuOgtAlYJKKfara0+YhLmiyxzbEmzCjttmJdY6g6fScc6NMu4m9vi
         uBWgDZCLkjZYUWC0aEwEejYcrZV5HTaWj/R2pV9QIqJHJSoA8JyzSEeqBeHKHTyCcEE2
         aDySUb4UQl6yh6nQw/xpmP7CRPWtGjgdFvj0ZjV4eiiROaYsD4T5QVTNIkFK1CQu+S0E
         lOstbWIteA5O4BhKrW+Bsow5ogFTeiNBc89yCWrI4xqXvLJRleE1EzKpHiXS4tNRTJVs
         yFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628701; x=1747233501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjHm1B1Dol6/zUw3jQARhV/mKabUcXMJ3aVJNVwVxy8=;
        b=KPgbtR3Cfv5ugBE3LNTgnen4EdBCf149HmdJsJVcXLbLzFUmJUqWARrmgMedWVL8Ba
         QgrIFK3xIe8cYKnmcBlP8N9mfAIY8Iw7TfhKTmCD/rF2CGSx3PIXlrpSbicTmLQXrxZr
         hAiVEae6PQcKV8r9BqJpdAk4k8IZocDrwKE/ZgiUdZfXI6aWgoCr2ZB5VniYTAhqQYfg
         cU8wHAd6N7OgLihwvVKL4RGAYJIWBJJgdIDT1UAA4BVMzCKRDCPsmNx+dcjlkwQm/+rb
         o0BlmJak9/BPn2EuV8quFPpkUnJQvh6cGl0YMe28NpF58dD9VAX0NZG7t9ixSr/vmw8v
         DKqA==
X-Forwarded-Encrypted: i=1; AJvYcCUOpb/bUpKdsMYwtgeCWoitoA4Xw1WCQi5x9MOvMnP1c6fygzwYyl796YE+vfgpzkQyVa0CeaX+jp4CFkg=@vger.kernel.org, AJvYcCWtxb8rBXvC76UQupaOyJu91WqC9CzyvPXqi4XsDanu99SorAtwFN9gZSlZS3xQBU3wfsRLFLV8S2uD@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJBGQ5vvdtcYfQDISIYIkyQ1vRqZD5PATnNEQaWkrW7RUMcIT
	TJWCNSDSZQN5PiMVqo2ybJFPbCZYNQjlz3R0a6QNfSfI91p4UVv2
X-Gm-Gg: ASbGncvoMxPnUnv0TtY42A9Tom5E7j6h7YYV7rTNSAXHooWFMl37e2lv3wP8jEpxFGV
	DJ02tRxsXk6dhVy7ifz353iKZVNpOTdGhTsvgry8ifKikKRkNxpFGWxKiGq7ihMjQsXN+gLd+w0
	oivocQqwKJKLUp3jusTBH4B5a5pHhONzFCAIxSdDdJ7U8Dhe7u4ml9hI6TtQD6LkLqsq0Kq3sUy
	hxkRbZov3H3uYnWftV7+Exh0AYU4x0Zvf0devZHQK3zTC2aNxujzfbDqUi7l20+rP96vw+TvgTo
	SKWQAcA1aKTvL+P8Sy/Jfz1cbDyWCOzyiVZGFkPrQUYlqR3HjvTa+2ReSve+WxrK1v5RB9gSXQA
	D1tCYJOpkSpUKqPhdS2tSQwFNAg3M387o
X-Google-Smtp-Source: AGHT+IHGBKi5VYRbLhMgDoCgAi7F0n0AcFeEp62EtCNfWTr8tx3YHXmmuXFcoAabgma0YQ/p6jtl7A==
X-Received: by 2002:a05:600c:5122:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-441d44dcca0mr24288065e9.23.1746628700896;
        Wed, 07 May 2025 07:38:20 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32b0c8sm3238005e9.3.2025.05.07.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:19 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/8] arm64: defconfig: Enable Tegra241 and Tegra264
Date: Wed,  7 May 2025 16:38:02 +0200
Message-ID: <20250507143802.1230919-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Enable the configuration options for these newer generations of Tegra so
that support for them gets built by default.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 696bd4043c99..c5342a35fc15 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1491,6 +1491,8 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
+CONFIG_ARCH_TEGRA_241_SOC=y
+CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
-- 
2.49.0


Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C29312802
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184865; cv=none; b=E5PyiDTlDXOuq1+KO4xUXrK8cBmILZkBMvvZvEUudZiCSwbXTmX+zcF8+bX2E9yPAdrV/MLyD5GD8414txmQ3NFjfdSQgV9Zfhadpj6kLFqeHACFBr9f7riL0N8mfkJtOSKkBzVw3+X/oxj04DA6zmdOghY1ELceO98HT/MUzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184865; c=relaxed/simple;
	bh=DnZtX8FMWL3xUvEx9ZwEljqS0Zqi/7F7spPDPYn9XhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaRkHpEVl2KCkIyuOpa9MtaUveVNYDTPFUFdNxT/Iirn3drQIOxR8u3IGr9yFRVrTihYDcLwwgDUctIAbdYr67P3HpWRZOaEje9pfi4cny9c/ArMiEsvVJVK7DTJtQhD7kM9Jv+7YNfUZYGJugwJ9ETgk+voUrmsqze18XsvE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPWBGUW/; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPWBGUW/"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78e6dc6d6d7so93031087b3.3
        for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184863; x=1767789663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=FPWBGUW/DWr+I0SRVc0J57YjydlAoqbCoP9CaX3NWNLMaEjrU+8JHydrcMvPeJHQfn
         vU8jfx48e2UWzvFJOm3lGqdhHUbJ59+VaavKwLihWV5TNqkkHglWEdk6TR/Gnfnvkzxi
         s8vIFCLAAWBDbwH8L04WcP1j3/qFvj7bbYcpg+4jpQQ3Uzo+weYvboFahvrlsNrfRUmB
         5QWOKabGfNU3SJABnB5ymawv/PifpXoKqp7f7ZPUVa8daAf8/FCk0hzfH6XzlSI9FzBp
         bp+SFxEplM6/YM89WxAdCPtUQziTEGEzgw26t4HdLcYX8yfRrOIRxedPBYx8QFUiawiP
         lrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184863; x=1767789663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=mZNmLu39Ggs+Eg+42Haux6eD+AAo8HrtT6nmiwv/Z2PoTdXLgblMGkkdJ+omIScOW+
         bpsONRrLngTkr6qbGmZoBf4kDTM1TR7Ug4jqIOq7yul0oudxoUZHrBlFYu0hjJpwKMui
         SW32Q6bwSoMoHfglexDTE6aB+o7qZPpRW6Hqo/Sub2vENx78VwsRAMMOSDKFpB3HVrZs
         9sPdQ7wIt4q7MgW98AKmrvmQDsLJwmuKDTy6mWpJYLN3qmrf1d3CITkMUYlupxat1IbP
         5RWF98b4lfI0KwAH1dlD9KrGzyXl2F/YFjgjCa7+HPIc76YLBZJFrBIJGrIRL6cpD2Mz
         EKcA==
X-Forwarded-Encrypted: i=1; AJvYcCU6x/AUSJNv5/p8RsWegM0/ZGyKq9E/RzWotxdXAygn7LMKr9q2buOCG7K3CN9OUm5ml/6xRCr15aIvQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaqjacIxyEqUhFOG2oZ8gm2yC94DGNYP8zHTgak8pDiOQhlqUA
	gFSuOR9IxngVARGeJtRsy3koOqs2FGq7HrePlGzsUvSoZgiQyDDWU7Zo
X-Gm-Gg: AY/fxX5cTouJGTgSL9ZVuoHtFKEyHn7zEpcaLsm6AXJDo1kiwzsAkGF51TBHYa7eiVz
	ufMdaF0dp1jITaH9K+ZQZmhlQN7wmcnY66GCcpNKNYJ4l84Q5i0oys+ztJZBvq33TPG3oHNpFf5
	pTF3Svhy39GZdF5wxGVAtPS21KvWWnF1YZ9sQ6gJVG/WyZBYUg0YV+CBDu3LT6V9n/U7zh2Shml
	Z8+7xNfREKmiTYhBtyKNvy3tMTQ4XwVBrptKtapp1bswZlrrJeuMsiRCLWFMGf4jxaSCDNjFklE
	x+6ip1NwmtjMDuwEDg4g8QLXKGvD7RgHQBODrVuMeH71UoQ9i/ntwZCgdQRGHRb31UuSnzwfxZo
	La5p9+JZUczCWsMxobgBQYOeH8DqeGBUTSzGzbrqFqLL5Gc7rLdyTYBbjbWCoBvX+TiaNsjq+WQ
	sIBk/QPYv9DM7nLxtEhhEyZG+RA8Gbj33d+nZ0Q/MvXKqOhOWdeOyW63OE/JqsRpFKQIG15sd6O
	LrBOj0=
X-Google-Smtp-Source: AGHT+IEFy0/xAx2AeDnYaJrJhM8NAx65XdkRXLMsI+QKt1RJUDYhZDfCV41A4Srcws0GZCL6Gfr8LA==
X-Received: by 2002:a05:690c:6307:b0:786:a3fa:cb92 with SMTP id 00721157ae682-78fb3ec89b0mr240437437b3.9.1767184863093;
        Wed, 31 Dec 2025 04:41:03 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:41:02 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 2/2] staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h
Date: Wed, 31 Dec 2025 20:39:55 +0800
Message-ID: <20251231123955.277384-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra20_vip_soc is shared across translation units but is currently
declared via an extern in vip.c. Move the declaration to vip.h so users get
it via the header and we avoid extern declarations in .c files, matching
the pattern already used by tegra20_vi_soc and tegra210_vi_soc.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..80cd3b113125 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,10 +263,6 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
-extern const struct tegra_vip_soc tegra20_vip_soc;
-#endif
-
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index 32ceaaccbba2..fdded00447e4 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,6 +50,10 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
 /**
  * struct tegra_vip - NVIDIA Tegra VIP device structure
  *
-- 
2.43.0


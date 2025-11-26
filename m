Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DF22154F
	for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139981; cv=none; b=MZY9HefCwGMZOVwSwGwv9E17jzXFS/NNbSGlJPKrLPJyIcUDlRlqkWmfIiPN56n/RF6iLeNKtZOfDdnQg6ncJwJn62Rvr/P8IcoQpXZtP6lW9aCqNN3z1NTd7d433bct9oU4HAkrbADLY43L+sUcUXLXU8LfNQbkh0BWyX5k0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139981; c=relaxed/simple;
	bh=BK+tZ9pD5eAAc9qRGUcd0m51Raok99lisnLY6sDj8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvQGs3ghN+QYHropqvP5j324l9jSTVraf4pfsRB5WIKD0CMKVPZ3H47wJjyIOBWBExl4msuOIOrQeXiw8oy2K9rFm5TAm5kWVinN3x9djP2sbY0KZn23VPpYigPlHba0e5GV5lVxY2y2Du7czGS2gAbCWpoAe1VKUUVfPGs9RNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEeVV90V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEeVV90V"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso7867483b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764139979; x=1764744779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=PEeVV90V3ZslaH3uCF8eDUidMWQH/QCmR7B95vxckTFul5xmW56JI1ZERvupwnaiCr
         l35s1Zp4tzygchqDvFE22CZ8gCZbaK+sO7m1V1VyrWo/AMNf1NuKVUz3xdHyuPgIVB4U
         5sYR8K1zv50V7LUmXYDtMiEQKdujDjAAdNPOXmDGSc3YL6VXT6yzI3XZQH7CakvAGoIt
         RJaMcyp/tqk4ifxPpj05RtLtmnpl7ZeAKCucdinxokljxOZvVk3NT5LsPuaeP6yxe2Se
         ZWE4thp0qLsDqIFKPjmp83iBLetkDjKeHQZAHKlLameyGG4fCrEKqHMEIl+gkf9+Y1DM
         K3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139979; x=1764744779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=INYPpT65BVJ1rAXcKCKNWau3z2p8vJX7JuVs+GLFtdrud944jQtYkCbe2AXL1ih10g
         K2P7FxueZufAeMr5SkeDeKT8pwmHpgTXgwyvVRR1YGQJkZdJdJhICHiTXpBkaHmOdQEw
         U0PKDgKNpKd2EN/f2KaP7wpKGsE0JetHgtA1OyqBAXd0hYYpBsqQMdEp92kqcGh1wIYX
         UDFr/pI68MXpU/TVkeZ0BoU1jaa6P/lN/PqReiO+qf9Ae0ARtZrso6q+fAwYRaWQR0H/
         1YF3pIq0BVJTiTKv0x+wjMDSNXhyvZ7qXVobkqzgLEgnlHPSZ8nRRkbJnB4ydcxyRvu8
         1N3w==
X-Forwarded-Encrypted: i=1; AJvYcCUGvZ/gpymnp1gZJIGT9PlOOfUwjezoLdEod7iIO3fyEFjx/bVNDGtcQBrYaeZ/OJzkuvp2Y0TDQdRjwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NVoCsWgUOntgt9FnCWOFCVJWz0tnuVFRhlwNiysLePsUrG8d
	1N6hjojZbzUBiozwrbjTuY6Dnqd6Ytw7z39gGYFl+/rgO1PDbfDCv8Gx
X-Gm-Gg: ASbGncu1Ph9DpzMt1V55MRnwjPGY4u3LlbcU426dwm/cUXel50KpAeraZztSs5pkXmX
	FbjuRU5i43RLzVa7YD12LvgMb8qD+xr57g5onfXKJvK3LKznXYtTPAJwBHAq8TVeB4gQgo2I9Ah
	jX3IpUEKEafehJrxUm0xGFQR6B0XW5mTQ2ObAL99K0/q3+f6YciwkMp+fASF8DeszUBKX9dB8IZ
	8Jiw6yC/9KHMS1ltzEmbwADrG1ptHHqaNGqVsKmf/rdlGMHQCPhANIPOXLaSa/ZSp1g4Nu5vzbG
	IJzLJa8cYcuJY2/+/3nKM8HhjrfNXHC/GtDYcbKhEEov1xDnyKf1OVYMb5LqdnPRgUADne9gkhr
	abLEotV/Dcc1ZheJoZGHif6ZSdSBcnWQohG8m+qwzGamOBNRqpB2imOL5Q1QCTWc8PLqWW0dUID
	9CdZsmMgKj/Zize9NrZu9giBEG1KiABejvc5oS
X-Google-Smtp-Source: AGHT+IEE4CTbu1c5peHPM99zicrUlC0JsRXRgiT1+i7EQCCIG5zPCF+CYZG2Zt6NXjE83or4Omrl3A==
X-Received: by 2002:a05:6a00:92a2:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7c58e609950mr19280180b3a.16.1764139978740;
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
Received: from LAPTOP-6H9JJHSF.mshome.net ([61.1.189.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174c9dasm20077037b3a.65.2025.11.25.22.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc in probe
Date: Wed, 26 Nov 2025 06:52:42 +0000
Message-ID: <20251126065242.12186-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
since memory must be freed manually in error paths. Freed via kfree() in
rpm_disable, as recommended in the file comment (line 1204).

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..73127ea6ee49 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1878,7 +1878,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	struct tegra_vi *vi;
 	int ret;
 
-	vi = devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
+	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
 	if (!vi)
 		return -ENOMEM;
 
@@ -1941,6 +1941,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	if (vi->ops->vi_enable)
 		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
+	kfree(vi);
 	return ret;
 }
 
-- 
2.43.0


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081837A3AF
	for <linux-tegra@vger.kernel.org>; Wed, 29 Oct 2025 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750639; cv=none; b=PxmMU96RUVmZ7kX1mEVO5CEfzDcYYakfFqxUyhlu2ETSzlVi6KMLOf1yAoej07W8qmMT6JKwcTHGMJcXNsQA3yBbpwySNYd7lO8DMu4OzHS6L7E034UhzCwVkYyIlzApkS5hDTUyqBMvg1vL3lRWSZtQutPb+ekWb9f+sTshxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750639; c=relaxed/simple;
	bh=KhXQZ1kMNgOTmLRe9yUUciuOtyVyi5do9kBrcA3tHjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jwf2WcDLCinaWuBD4MWziwn+KMEiCrNdT/7v5oAjK7aqc5aoo8bOFltmo+KfMfUhJSPoA/VOxJPUfJAB1HIFRZ1ZcTIT/H3qU4Ky24uTUfMBzdIinbTMIyXNA5PtmTL2e4eOYUf4pnxJ/9OsJ7z0AhLpT5kG/IzxuBiDjYJYB1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LThbs9Im; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LThbs9Im"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so5354486f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Oct 2025 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750636; x=1762355436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+R2ZFqkkMtwDachbNSfxwZbQsdz/SudFMQH3GFRBM8=;
        b=LThbs9ImR/KtoGFTlly1PCrvtqJ3Z9OM1p4ek0B2w2dSj4Pxg9zd3nQm3eXdQ/HlDX
         Z8Bft4FlN6FE/YxE5n6OqDO5yg4kOw4ZYyqewcgSZueLN2DbM/YyQkxfGO4G4Ub9hZev
         NgQpCEoEfHfdc5I8Y1IFIEE0ifXoze8wRIhOfZ6xOs9mYrCEhPq1DD3y0LQlmocnt2B0
         0i3CTpG0aJ69mi9DI4UP0O/JAYXp5wLvyYWxZW5MZeCliYXGmybxT1xK0wWErua/qkD2
         BkFtfx5BZoKWG0zwShbPRSL2iUGO0y/k6a/icn7e/PFluTTYyoAEs8CR33g4PiFhl0Ej
         mmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750636; x=1762355436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+R2ZFqkkMtwDachbNSfxwZbQsdz/SudFMQH3GFRBM8=;
        b=ETHBwNSu61TDCPTawwShi2eKPW9IHV/OSh6g00pPxTN+HpW4gs8Q111Uv9txV1HuUZ
         sTCXXT4ejnnQoPUlTxFf9smblOI5lsz8bi+UrsaEx+3oYG61qX+uoC1x5mEkVC3zykqm
         exNe0DWGsRQq2vn9WhrgqbPo45vlJCIKhgeHpgx2Fp1iMkY/6T4pFEfpNc/ZmWAH8c8l
         5Y/qE/7689+cadXZgl5v0w6lfYnNI/OHuy2lYv63XVLfPUbhKkBfGXVWbselV3eM1BqV
         rtIiE6mz2kS+PkSEp+mSU4V5Jk6XRBhNMx2XrdHbFNGXth9dph+yMgtJ7chWYzhr3SW5
         wbSQ==
X-Gm-Message-State: AOJu0Yx3zm3ZylK/PFId6MvsapjoHsYsXSwpMKKSJ8hwYM/v8/UUTRNv
	mVfUCQw3wPfJNgwP7RNg0WW1R673mAyAUIk/y3TcRN2gGecr8xu0A1vy
X-Gm-Gg: ASbGncssP0IndibBChHTk6pD5UxvG94VfrRx7sF84qfqNOrAn8KoCnKL0MJgkgTw2Tp
	cMYZtQuwjWNWk7rcl3TiL+xSBrFJzxIkT/yi73RGJW4RQD4/dKaW8PQC9MopDTvPkqRcX2OXaen
	ZSEThd9LFTAkHe7q1rrStrFzR8Z6I5ogjxBZgelxXjqS0pEfwjY/26lNaYud3azNZAyNSQqjboQ
	PSbUu9GaPlpROJBp4T75juKtDnaGnetYkOoYMyfb3qrCTcQpE6zX3rXRv9tAbSv1SbY22d2HYHT
	NVNQxJCkr/1BWoZh9ztgKxu+u72GpmKp8NDtPL0vh6jT9dwh2R4pljjwjwcOU5Xq4O11wi9/Puo
	QdGfK1P7V4v9mUjZOMh1vi+T5okAp1AxS/2qDptrk1LSGDQMEa407sde3qpVG/ipXL6HNfRzVIl
	cmKakG3UwTrJx8hsSf5TpJwLvhmWxGgwd0QnWSR334vxbZAYBXyPWTzwf2BxSDPW64NcqQ
X-Google-Smtp-Source: AGHT+IEIzUJ1wpSfjLYPW8CvY1Jktzw4AGQEYrSMsJoxSLjB7HxZa4Wqmzou3Ah0/Lg5zU/p2YsNjQ==
X-Received: by 2002:a05:6000:2f86:b0:429:8cda:dd49 with SMTP id ffacd0b85a97d-429aef81c39mr2795348f8f.16.1761750636275;
        Wed, 29 Oct 2025 08:10:36 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b7b6fsm26973019f8f.1.2025.10.29.08.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:10:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: pmc: Document tegra_pmc.syscore field
Date: Wed, 29 Oct 2025 16:10:33 +0100
Message-ID: <20251029151033.2523506-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This eliminates a warning from the documentation build targets.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 034a2a535a1e..443e33a459be 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -423,6 +423,7 @@ struct tegra_pmc_soc {
  * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
  * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
  *     cntrl register associated with each wake during system suspend.
+ * @syscore: syscore suspend/resume callbacks
  */
 struct tegra_pmc {
 	struct device *dev;
-- 
2.51.0


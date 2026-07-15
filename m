Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A523B42D8
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092319; cv=none; b=ON1SvIbuIOL5uPnCeq/HVZO17itHIGTX/Bd6zKBmVtsR+RX4cyxIcQQViknRGWToi1DfqiDtQXX2rlkZu3gJgXMJzdZZpERSEM6fd09K1g1fWyz2PWZQBLeNE5+BYr+RKQpFBqvkA0To2ERY+E0tzl1v6DyDPYLip5GgqTz5CV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092319; c=relaxed/simple;
	bh=qLfioYwLvE9VutCAAUZImR+gmjyd33EDpV+qIhvHhvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIs+GDsf727pKv+bndttCNlTy1iFd9RHZpTS384MkIM140Fj+QJdmwjwMeIbC00sxwT2FMzWrnWHyxiFThtR6C4aCo4kf8pFiG0srYAZyhRLbHoKrnLch83KTjiWb0tHP6ik/oyqLBIY86rv14pyKxM94XllmbQjeK8nMt8+oL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMHdvV0C; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMHdvV0C"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1557913b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 22:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092317; x=1784697117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Up1ItAxd03r+T8RjvfRHCmeD/3+6lpPQg/1O4r65ak=;
        b=WMHdvV0CNHACGH8Yv2jKEFp14PVR6QtZNPN+XtL/gE9P4O6xwiip6IAzdqFzaryyGG
         8/OR19Juj6W96A5HmIs/lOiAZy2k9adiJOtUEThUGxp+knjvLodcNIknq/eqV19lXAmw
         upvisJvhwTefFuAvrqa/BQ1Z98NicP+IWIMWOIw+GOmopYHHld1tQhF2EWIgtaAGrAu1
         PI8co0Y7l9kFKX4tlSwoGJ/JJ6Fshk6pfUlwz4LjUjqnYmWIlCN6ZlqDwWw1dY9DPOJ0
         WIdqIxaj7tDgo29Icct79phYxPpWN6fFx0iLVTxsjU2NLjN4emI7Te9W7qs3sBUZ4Sgq
         RZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092317; x=1784697117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Up1ItAxd03r+T8RjvfRHCmeD/3+6lpPQg/1O4r65ak=;
        b=nWKD0rLx56pUF/J+DNKSvGaLSDje0xB321tuFZ9MwbdkqRIO34sVeHCTvL11bnMWK5
         ljN0kfSwhT2IhydPlteckWj5l1YO/glerApCO1eGINqY1sPN8yjDPZX5dGJNbASi33yp
         nEWaxNSkmeVNJnfsxMSrRuacAL5GXu74jZHPaXGTLyAJRqUbneRvjdKWC5hVc4tLHSGh
         pyhWF8btyU/p4qyJ2vQy5lK2qgoGVqomaKpDKntvXGrsJQCCsQCG+yWTLpHpheZwXOJC
         1ffy7Y9ImrTL2h3oGMnZ2Nh6IvhOcuIvZMcWnuzNQGhDEFTgDXokSarzxskyZoaFGYUx
         9e7w==
X-Forwarded-Encrypted: i=1; AHgh+RqmXQmd79RJ3cBNqkWiXjZ+/H9gRAw6p/Cc2pquC2d+edpgP5GogleMG0wMXQp8H6NmdwfFu3V5z419Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqeVbKbDY4c5AdH7IboC7La4r0o/WM7V7yY0ddv2WQ3Z5sub5
	uipAlAPsxcHL2qBwgEKXqoFixg6WjS1NQImC360ZFjNaH6hGHZ9fYWyg
X-Gm-Gg: AfdE7cl+7QnoOHdZ4aCgaFAxPnymDL8hVCnHu5iFQYX+KTN9nCAD+w2me6kBCK63+mp
	am7pi4yjl5ZFDk3rvrE9ljfQsDhaBhySLGTUTDQMxwWSwvNkICPCv5N07iEodcK5pSf17D+2UVL
	QXxP3f4mZ7+wkKtrfSYztzCLthjUZPNfiCD/9qEO7yNoq70qvpgIGWOht9Qd4RCYQjMAkQNVEMg
	pp1ZfwzLoUc1aY/rdvb1ijH5IwqFS6hYLpbGr34SYYYuLHXGuquhdlC4PIi9DMu2fmpPQb8474p
	eePLj5diJMFPEEaaYNLXv+U3OGQEdhLucF5H8jx7Kr1a8mxkS5MHzgysChwh4tt7PF6+oVlQ2Pp
	nz48Frir5aWj3eNckzWb66vsfi/kEdFs83k0WjJxNbYkLNKQFJ9bF/O2fgbELC7wcRflNKGvyzi
	j6NIHdBaCTeZK4r+7932p1+dXm3NNYZkN60oA2K197Ss8RrdU=
X-Received: by 2002:a05:6a00:b47:b0:847:9c99:ea52 with SMTP id d2e1a72fcca58-848896084ebmr15599104b3a.24.1784092317042;
        Tue, 14 Jul 2026 22:11:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: tegra: tegra210_amx: Return the original error directly
Date: Wed, 15 Jul 2026 12:11:14 +0700
Message-ID: <20260715051115.17385-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_add_component_controls() already reports failures internally.
Return its error code directly instead of logging the error again in the
component probe callback. Also remove the now unnecessary local error
variable.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra210_amx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index cc1f9c158191..6a67ce6128b4 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -504,16 +504,12 @@ static struct snd_kcontrol_new tegra264_amx_controls[] = {
 static int tegra210_amx_component_probe(struct snd_soc_component *component)
 {
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(component);
-	int err = 0;
 
-	if (amx->soc_data->num_controls) {
-		err = snd_soc_add_component_controls(component, amx->soc_data->controls,
-						     amx->soc_data->num_controls);
-		if (err)
-			dev_err(component->dev, "can't add AMX controls, err: %d\n", err);
-	}
+	if (amx->soc_data->num_controls)
+		return snd_soc_add_component_controls(component, amx->soc_data->controls,
+						      amx->soc_data->num_controls);
 
-	return err;
+	return 0;
 }
 
 static const struct snd_soc_component_driver tegra210_amx_cmpnt = {
-- 
2.43.0


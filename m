Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD17530E13
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914592; cv=none; b=Gyi+U0afhIgTdI4281jrO3RLoi44RXFrghL8AKGrFz+RcPit/Q01bpDON+Bw+1QI3q/vuCOUvHuiHswXrqLMGRsoH7B6FVeTCA/DLjOrPd66Mk+XCo6Ypr6zIasQrhj/wBaRrIW8KADa4rjg+SJlGj3FEC+hiPMgtaHQL3BetI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914592; c=relaxed/simple;
	bh=1EKTNsYObddSzMfazdsEfTP4VW5E+sXjf9Ax6jA38oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1gqRSh5wXLSGfkG3lxVLGRljOf1YfFQtZiJuPj6oqVDXzBwcD1kwoPqE6pft0Kd7N2drEGGBI/zIAjbjzAiSBjKVmtDZ+BBwOluLlpvSIRWqUbBEfGFQZophId90tTGjUhS5YNpQmG3oJw4PBGYl2Vd7qwF7yf7N9GEi8C1fJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwcSSTzU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwcSSTzU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3217959f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914588; x=1792519388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=dwcSSTzUAMNKy9h6TFsrYRPSd2vkKDmrqjWlGt5NuZJEjfi3cOwnq8DTgcBQM8GV5J
         OqvnbqFN7rNmAguF5DoA/PLy4rBxBaDT/NRMLjvaRLEjnvFJ1hshoAoq5dKjasvGngwM
         crFt5KrC4LigS3/N1YE3PmPP8Epx5weHQbV880Ir0kghvJvpjn8Mvr57WwLQ9u0g24Sk
         s01YDaD/Lj223x1/73SjKJikJQirbAdhWdZJZ0yTSK0qzMXwAV8T+6JzTg2YmS2F3tk2
         XDzQ2pNM5JXQNpneCBOrEaK5DpwIXujqjnYuFy2iuZ0TL3oKEFehnO/MfUdGno9qrBBX
         sDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914588; x=1792519388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=KnrsnYjzR6tXcaYjC4z6ZrVvOMz3RC7grH9lWgZP+2skWnPdJr5ucICRTEfEYm79eQ
         n7Vr4zPREg2grwC2yZCBD2gnsC9rcNB/hgmEBHCtMMIYT2v67FI67m9o4GLAxV/RjlHH
         8wdmWa/rB0RtwI7slLE9jVQjq6vMX8kLXT8wLcMnz1fhIZwWpHRDUD2XZrnVwdHwlU0O
         DscRIOymfC59tBreDPARPZZAkps+y8i+fu5hfX/+GjOstIRdjz84itfAUK7Vyb5F5sis
         1QStnSct70S2ffEEIMei0BSbTrKKeQPU/6zP6Px/GueHW5ash7gdii1h1QjmWu0qC4zc
         EQbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2kJ7shePz+W6Kn430F9z8kGqx5p0b0NUMRGXgsZNSj5YJRIFjL4vhAVBpkC5EzJ9WpYHrdhkj+hwcoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvtpA2hVyAAEvdTnCf7v8UYIm+2nWHLWXl2PEtkYvjJWxjLMA9
	Bb5ZO8LlkWNLo7GC0vMMfqe32b87lgTWbmixUztwPQz+5m8MjBwvAV7s
X-Gm-Gg: AYBFou34B3G/a1Doo6FtzXZUuLWO/60vPXLRcjamPhANWNQQJ7ZwbUnW5bwBXDGHR+6
	rLQtekXEmy5GTx7Nysq2vWRYi1rXQClcgGSxwRoZgQk7zhD2HM1culGMVuuXhjjcMqSOqFlY1GY
	qxgSSZKBtEky3TzCnb0alJhtpm9YalhYFf4jQ5sBNscrrQad3+ImupOzcXd/VorbNcY61HPLvkD
	eegKaDS9xWglvABrMNfGFRGdmxyn8ZW9qYNchkyLM6lwdd0wJ/pJulmBLi20WfTr+i4ZHpFjDTq
	zSPJBAJz78Jd28bJ8+WsEGNcNJakmBBrJaQutj7LU0kRNGsitybU7a/Oc8l+me1FOGL5Ko32T5O
	aDbb38HN79ctAOoaHUSMCw+P7POQx0P6lYVxRDLE47c2vnJTvcvGIphnLoUxkVCSCd8YCW5VEmn
	UspeogRxPZEfBbMUkJ6VEMwOJLEbHXfgq26n7+I176y8TJH2ZsTHFvsbVAlF44YQgHsLt7yYC3Y
	hn+35le3J/RatMypyCkoYrn4ZKlJA==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr20450562f8f.3.1791914588364;
        Tue, 13 Oct 2026 11:03:08 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Support auxiliary devices
Date: Tue, 13 Oct 2026 21:02:53 +0300
Message-ID: <20261013180253.477605-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 50b23bbb637bd..e4af049fd7e89 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -550,6 +550,10 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
 
+	err = snd_soc_of_parse_aux_devs(card, "nvidia,aux-devs");
+	if (err)
+		return err;
+
 	if (!card->owner)
 		card->owner = THIS_MODULE;
 	if (!card->driver_name)
-- 
2.53.0


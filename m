Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10D34A3D6
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829469; cv=none; b=Uw4YLHv6sEsoqxxGGxxBU8JD+64CZ9uvizR8y/hAls2/MKGteg0hTm+kwo5WG9ERdJ/TWB87RCSXtGMiqWZ5kGMb+brTjkL9AHD217DumgzPcarXxst+FjKK+izgY03a/U0nsYhm7RgNuB/9nvcLS+tuknOV4lmQFxEi0+GNuS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829469; c=relaxed/simple;
	bh=hj2gh+LQFnJF61Wo8g+AzdFuv8OMSKkxORkVErAo4zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi8km0mecTSBtvs8Iap6IjgE9SmG39abQBitwkaQR5cjX7TfZPGT4J1QXgi8c3XDsMqhUnrT5lp4nwICkgbjsBjl7hZVNfmWx0bUGCJ/tbDuSmGRnhdDuUD4e3UImpnAfL87OKqCUXVHJ4TJVgBd0NV/DL6rpi54L3vNw71AoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDqjI3a8; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDqjI3a8"
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-3878de20527so34238901fa.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829466; x=1772434266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bou2oRwzCjakShdBOoto0Gx5SGWPIs6HOrLc27z4TMY=;
        b=EDqjI3a8oIraC8th/vKe3a+NMT1AQqUeLkcjTFm9RfyB37c2VdoFAHZ+W2YAOxQogh
         aCIdiVl6Be97/DuLXiGwPEPvJChBRtTssjhw0f6pKoAk4w/30ddpHYFyY5dywDuxsLX0
         xXAN+yBKEjs0MZJ4Th/XawYlZi87AoCR4HcY4DBLVhCDQvld+5ap4F1LS/QQIwtq/MHb
         hF4os2YidLId4iSfBezQUfBpiK6WN+y9L35t/RL5LwFKhCgYoTpB4sUUZh1O3K9lojx0
         NOvE30hWdD/Dgiv3qPrFv88/zWnH3Kp+HnqNJsnzGfzW5WCxID35X7HS/TJVq385Tu8P
         IBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829466; x=1772434266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bou2oRwzCjakShdBOoto0Gx5SGWPIs6HOrLc27z4TMY=;
        b=JXWmXowEdgRrEqhqbQyMKDor01dewQcC7om4xjD/vFDdimx/EIF8eVJewa/3DqN5Y+
         oCs4kglBI+MqCBZvPrcjDP/flrxOt7UrIK0J+KgmTJ89VVmhmw5RpegFdMyTqjFlyV4z
         8H1NADR1lmRu8vFSESuLd6vq+mbTG8OmrhMKenjAISnOLKvIbVsVN/v4eyGlNLRSorEZ
         a3Y0TwWwzOy6XOIoXLcplOoI72yCWi3yLIsZFT7lxWrrGeLIkWY9s3JKfajDOGQvR1zO
         luwxI4Ou2ggtabJ2FTBcH/aXNPIiF2TgGCP9CS/xrILQBGHuink9rjSZggy2LGr+K4Lz
         gOvg==
X-Forwarded-Encrypted: i=1; AJvYcCWMtfBzQ4hEl8vZJcmBpcpoASjdvQFjJatWO7OeKtkQo9pUm8B9go9WD7LApl6sw3ogcyISjSe7VRljxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ps1NJPaBHWa/MV0XssT3mGQlcQWWDHL6dp7NOLauYquWJq91
	GkFTsNmftlE2lunj7fwZVgPBTvjruYzyycqWOxJYvT0cZIaQjqG/dGeF
X-Gm-Gg: AZuq6aI6V8/Zep0Wd+ZeJGU8aKFNeW20LPIRJ4IlcCJvKhOfLifIHzW0PWrTT2iEJeQ
	5VMaz1Wesn6i8CedcxVXbLcdZoupy9hPuz9KMXY7vj054HL10oGWoee4HU+ug293IKdlqpBekTA
	5jp5r9uFZRvqfcWrIbaHVBQ/AgEMKqHY8m9+GzTb34dc8S+w2qH+VK1x3aVRDtVLg+xJh6B5kIZ
	ON39XvuQGo5o5nIO98N1o3NIQWQTzdD2SviMPYcaiKJx/PPFaMhpK203TO1QGqcvqcxXpPa9Zh5
	sY2QBxRyQllfzAattEovh+2MtyBi7F9ftntzztweJetqFpNtnGoJrrLZXttxCrvfxdX5DBxSUvO
	44OQRVkTPlS/A6s45x9kn/YzlP/Y4agmzGVft3mVk/HR6mMNPSXMkYSBnYkQv3yIEkgcyaT+8PZ
	KvezQdtStHpnLE
X-Received: by 2002:a05:651c:b21:b0:387:1c06:f747 with SMTP id 38308e7fff4ca-389a5daa3f4mr19110221fa.20.1771829465937;
        Sun, 22 Feb 2026 22:51:05 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional board pins
Date: Mon, 23 Feb 2026 08:50:51 +0200
Message-ID: <20260223065051.13070-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document additional board pins that may be used in routing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/nvidia,tegra-audio-max9808x.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
index 241d20f3aad0..4957645a8e03 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -35,10 +35,15 @@ properties:
     items:
       enum:
         # Board Connectors
+        - Speakers
         - Int Spk
+        - Headphone
+        - Headphones
         - Headphone Jack
         - Earpiece
         - Headset Mic
+        - Mic Jack
+        - Int Mic
         - Internal Mic 1
         - Internal Mic 2
 
-- 
2.51.0


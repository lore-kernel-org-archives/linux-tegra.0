Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9B1C461D;
	Tue,  6 Aug 2024 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947973; cv=none; b=aDHUVAy2nodz9LLwxExxOP4gAbnFckkIrsmHZxWJaT7MHL3+ONxAhbreU+Pw9FMYfZvNq7i8RoQoxSSY1ff+j8KUp0+5lpUZEfXLW/RNh5E4SNzt5X1RGlFsp4v8cE+ECMNWw5jGEc+MvCkDRtYXx1GeypO739IazAidt4+RsUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947973; c=relaxed/simple;
	bh=OUYOXlkQ1FWz1JZfqWQ9giPxsxr5fLWSIk8kPHZcXRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTaH7lNuzEG3XkS3yBrHE6LaK70WDFFPugmZUiY3tX0zMastcp/Btj6BDpAH8bdsgrA4EVsUCkFAsF7YJI1zmrqWr2gGt+ZSnoF5hAMz0UAvtSLQXkYFaI9zXzINDdzP8f5SQQeu5w9b77WhLa8Lyh5Qd/sJAdcup4jRRZu1z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld16IzDg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld16IzDg"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efbc57456so460913e87.1;
        Tue, 06 Aug 2024 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947970; x=1723552770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V02NnW56p0okYptMzxnSdsx3SqjMaSgyO25jEay35FE=;
        b=ld16IzDg37nO2iqtwh0E6qi/ZRhTvkEan5wP4XiyecEJwBs4ekd3vRHm5XR7H5cAQB
         u3S6xVz2PbpfH/FKtuyU0g96ky29YlyOpeSq+ap5lu01PZ3eFhHB1m2CSw/PM1iuoM7A
         oJqzJ1lOlx6piLhWopUkUTiLrwSK2Q/U35EUXSUSj7uekU+HjatqhwU4gbv7GguDCou5
         eyhzA+idx3fFMDbH7e03+MzGqFS7QSsIPSOqYgu5itlblAlmixA9tq9IhM0Xc7iAAVy6
         xYa1/d5fR4fGFrgmaIiabAguG0C7JeKUg2iResUbRB52MVV+988uIkwcpT5T4KOmha7v
         Rtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947970; x=1723552770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V02NnW56p0okYptMzxnSdsx3SqjMaSgyO25jEay35FE=;
        b=c632MVpLjg91B9wF/vd0HXs0hwPC1JMEZwx02o50lYLEoQ9vXSx0a2vEX/y4UFTK34
         cy5ZG8qFvnl72Txci26aZMeuacqhx7nMREwa0Y7rv8WSzEAh5kd6PWOJMsQhAGcMId16
         KWjvoYGbFOQahdWevbsQKdAUhHH2dx7KMgKEwgsRZR4xWIqM8NZgJrX3AoPsAivS/Kdl
         C0bpKmSZ6HOOJnq24qLYsWKkie2nqvW9S0qCvFVYrzN6380ZqbYrWltbzJpxPW2XUIe/
         Uyz6JlGL7Mu/RS+AXwqR8ZfEGUjyOPBXkqDfTDDptfvOOVv3YJnImJI/mxtMM2dt4PTw
         RshQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwGaBMa4PEQD8+2IB97ohuF7epODjukYiVHPHm3H+lRjT1XmomxWS1TvUdQyBMKGAhoAnLH4YMSAuCSRbroZoFId0Z+eJNrtAxlq+ArgVFWgF/X7baTnBfDDoNhai2YXREEtrU5V3J7EA=
X-Gm-Message-State: AOJu0YyKNDKYgUqP9gHIYbcHWwSVoY4aAIjcxsjjNu5yZnSYmyQm9+IB
	XKPKBoyYRhtX5PB0Ks/kfAd8AcoGz0z6dvy6KEXOFS74dYa/2NYRfDpxyaxw
X-Google-Smtp-Source: AGHT+IHMwhMYhAHbc1hhcbfqkzCxfq30klXaR/r/p1kgSCcAbXJkUOnVAP4xUUn0OalsatbXblYX1A==
X-Received: by 2002:a05:6512:3a93:b0:530:ae4f:337a with SMTP id 2adb3069b0e04-530bb36332bmr10494899e87.3.1722947969358;
        Tue, 06 Aug 2024 05:39:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/11] Tegra114: complete TF701T device tree
Date: Tue,  6 Aug 2024 15:38:55 +0300
Message-ID: <20240806123906.161218-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete ASUS TF701T device tree with available information
about the device.

Svyatoslav Ryhel (11):
  ARM: nvidia: tf701t: use unimomentary pinmux setup
  ARM: nvidia: tf701t: bind VDE device
  ARM: nvidia: tf701t: correct and complete PMIC and PMC bindings
  ARM: nvidia: tf701t: add HDMI bindings
  ARM: nvidia: tf701t: add Bluetooth node
  ARM: nvidia: tf701t: adjust sensors nodes
  ARM: nvidia: tf701t: complete sound bindings
  ARM: nvidia: tf701t: bind WIFI SDIO and EMMC
  ARM: nvidia: tf701t: re-group GPIO keys
  ARM: nvidia: tf701t: use dedicated backlight regulator
  ARM: nvidia: tf701t: configure USB

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 1516 ++++++++++++++---
 1 file changed, 1289 insertions(+), 227 deletions(-)

-- 
2.43.0


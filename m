Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD4C269CF1
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501056; cv=none; b=E0moFkqLQGFlMfuR8lopJnT36QuFrwnjx802g/EH4bt3x+PSVHr6H0firz77kpwAEjCDfvi6cF0QXkrdo1PjhJalEubG/dzbfJU4gnpPDCNj3pc+Sy9ctW2hEiLs91M86YrwKjPWfxkQPQun5gIW73nwq1E1Yu7H1dZ843TQwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501056; c=relaxed/simple;
	bh=YZxvDIdDmY/3wxxRt0NldmRCMJltF2rY8Dt82GASgFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D9VKdGlSp+sGEW9kiafYFpk0rkN/L8h5DXHWLPVL8jC+iYIEcrZlhiyoTW0l7339OMTfq4GtE6OjTDDeb9Xo7RL682SYoME6EpkSHlqNtYoNtpmKBlQ8VJsNY+4DKWTfAas000t9tUIPgluHWb10X6IAgxaelmNwZUyL22kSPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLcMzggF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLcMzggF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61cafa0a38aso1201104a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501053; x=1758105853; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/Qjry/G+jx8lqtwVy7XKrhJZHtvYwgGNx73zxEK2OU=;
        b=SLcMzggFsN0iR9lxTRmP/2s65nrVyl5WjbPw+GFo/Kr5B9bP/AUDbpWgxXfAELkUJj
         o2Y3yqfU9SNsjxFhS1sJydxN3U/l4lBRhh+cy07ZWj56hWP2ZUcNJnKIVkuD/3vg2Mja
         PDYg+rYfgi6zund0kQ4M7cZc7ntQmrJFXLzFGwrGMEz9N9er+R2GcGohRf9Juw3s5ugG
         kXaHY69UwHAFX9Pq4KYujJEYCP0QOhwpoLK70TuxHE9xEzcJY/UkXOtiWEwVxXbKas07
         GhRL66716hCHK3/gEFeYCwqn525n82DJGrT3Ye+UW1I5AS27S9M8GkdlMWCk+cDtNy8Y
         SEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501053; x=1758105853;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/Qjry/G+jx8lqtwVy7XKrhJZHtvYwgGNx73zxEK2OU=;
        b=Klmf30nyOQ6EkzAd0ZbvcEHtMDMXXxX8n9h82b4u/bICgLk8x6x1Sn3r3om3GzFzH+
         6eQDis/3qjVYs/GP4QyJFMvCkfDd1uvS3s1qRRQVjhmXXY34rrzz9YsANJrpTmhOmuXg
         hj+yTVilpMayKWGXUFin5/GsA71CKlc/Ee8EmQW6+p2hCYy6+/vzeZ3oDlkgGhOe/myd
         sWE753J02vph5eO47fzCLc39fG6XnpIWZhra3wJ9W2Nl/eRg+C+4cdNFRFPSxRm7NO/Y
         YgU4o4QojJnOg2pf9cBZra04vSACqFLQThc36mP6v0OqXGEH6wyYueUJbgdliBHWIpA9
         NxAg==
X-Forwarded-Encrypted: i=1; AJvYcCVIgLZcvGuvVp9lmKfFCR7MDN651X/sGAg8scQC0lG7Dal1vt9j/B/vM1JWDmEjWMRAYWYcUsWhL64gFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymY665+Pumuzsp0HzFs2IkCgN1OeYAvgxWiCJtX8O8WIVTW208
	ltOghCTom7GV2i76s+Qb5xqt4jtjY9bMrGh52eTn5nmXw9pjTicc4BhMUNtFip4DV3EKlQd04H5
	8Phv4
X-Gm-Gg: ASbGncssjZg7Yjeu8UtCM3uaoiJyf2Nm2FfjYWlFpAu6Bv/S1uWTHoOXzey/WrRM+qg
	lSzm60CiDCK+Kpd2JwKE9excYPdt8rCJuDzzB9US4J3KEJVIt1mLCf4875d8qtSQF1aPwULiRQc
	2Wr1z9LvV2Ameg56bfiaEhpT6XXWnle1hPKwwO8a/iXVeQg6FSbYTwdqWumqz/rEn2Lx3s6NSFv
	l8ZxMr+lhjhv3o31jeBjHJMPsbnrJyY4SCFh9XDh5e+e4jN+i0xvXdiz75Rf+jmO0b2pygNWn7H
	qZaXszUxZX2kCsbpTmWdyBgqzxQoaRzNmuDyeKxEaLhLFNt0ZPGHTtij4fI7TDfDPwRLJK6hcD5
	SssU+n5t9UZRxw2SAUS2Va8+a205xmx3TP5QCs6w=
X-Google-Smtp-Source: AGHT+IERk52gGCs3n+Z3B8VRz2Pi8NLtvk77MiGr+3goAnlVYOxa6u6adOOxLhuUzAHo0UCVOp8sVQ==
X-Received: by 2002:a05:6402:358f:b0:628:28ee:942 with SMTP id 4fb4d7f45d1cf-62828ee0affmr5454092a12.4.1757501052935;
        Wed, 10 Sep 2025 03:44:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] memory: tegra: Several cleanups
Date: Wed, 10 Sep 2025 12:43:56 +0200
Message-Id: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGxWwWgC/x3MwQpAQBCA4VfRnE3tEuFV5DAYTLE0i0je3eb4H
 f7/Ac8q7KGKHlA+xcvqAmwcQTeRGxmlD4bEJJkprcGFl1Vv3HlUwm5mcseGtiXTZ0ORt5RCSDf
 lQa5/Wzfv+wEv03+sZgAAAA==
X-Change-ID: 20250910-memory-tegra-cleanup-1ba0d5f86ba3
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YZxvDIdDmY/3wxxRt0NldmRCMJltF2rY8Dt82GASgFM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZuUVkFXe7gVcwAH9KeTVa2HVPVE407M13tn
 a5vjctr+u+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWbgAKCRDBN2bmhouD
 10ItD/4lrQLY0Pk6xsuHa6nY1eY8cSuEpFxxCdwano2xVA/V2xublblvXIk/HDzm6E/SGCqnSi0
 T7j943THyR5qMjgiD2Er5DzLlkx1eF5JXx15djOcaBhxv/3pKqBuDccjbuXpweNWmfjYZ0ruFfc
 aaIEz0ReAoCclxAFUsAsYrehasRtK+SB4JCH5cntboGaWPOG8W8KPg0vKVIAbQ7LEYgkSGP4jZh
 hN5XLeLDAC6yBhAG29raJOqlRIS3Wc28/tv+gA1EaahtIFRwVr4FrD08yvA0KvR+sXxucqvvxZx
 gEwHRy0QAo20UnqbcE+vL8SnNnJK5n3r2fKI2Gt2pQ8TSiWh5KcVD6/VAmpIXxkpN+ezZHd1Ian
 bDLtF0v8Gbhzhtp7n2mgDSYBzIAwMHEyma7XycSbnDccnRADXQDorSzl2e1pxSLxYFbIhuYckr8
 G/k65Qh6yyklmop+n28IYkDV1qH43iPJf/tkxmgJWilgkyVSIBN6rj6CX9jGHTj5ui/6EA5VBs1
 J+n3XP83wj9bGt9mU/p0HN5sKQoLfpaI68GnCqnPNSGNfCM2zvZpabT7wDPvUWY8VELyc2cEgLG
 ftwXYEUqWhTBKbpJdN+h9ob8yJBuFxaC1peKpw1W0dfinLJRsBIt7bBGBmxHqiTV0NeYRwNHkh3
 BoWVqwVcrOlrJ5Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few cleanups for Tegra MC/EMC drivers:
Deferred probe, few simplifyings and function name unification.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      memory: tegra124-emc: Simplify return of emc_init()
      memory: tegra124-emc: Do not print error on icc_node_create() failure
      memory: tegra186-emc: Do not print error on icc_node_create() failure
      memory: tegra20-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra20-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Add the SoC model prefix to functions
      memory: tegra186-emc: Add the SoC model prefix to functions
      memory: tegra20-emc: Add the SoC model prefix to functions
      memory: tegra30-emc: Add the SoC model prefix to functions

 drivers/memory/tegra/tegra124-emc.c | 140 +++++++++++++++------------------
 drivers/memory/tegra/tegra186-emc.c |  39 ++++------
 drivers/memory/tegra/tegra20-emc.c  | 150 +++++++++++++++++-------------------
 drivers/memory/tegra/tegra30-emc.c  | 119 +++++++++++++---------------
 4 files changed, 207 insertions(+), 241 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250910-memory-tegra-cleanup-1ba0d5f86ba3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


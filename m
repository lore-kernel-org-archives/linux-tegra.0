Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8834404A
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372427; cv=none; b=BlnZ7KWJ6rfYPi0Bwe4iF9hvgtX4X/zZLHEurXx8SpMhBK0RzKIiAfnVsvHgV7m5dQ2t7FnGTRjyQQXjn2h5Q7t5G0ay8bOYAROB2va9jVYq4V1crMKb8EF5rncdjK7CpGs5QcY+pV8Vin9e7KSi/vW7jcB9ny+F1qevK6gytzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372427; c=relaxed/simple;
	bh=Jou1lNMM00w9f5eYejrMFyeqVvolRlVhHQuRaxQ0mdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tUztnVxrc3T9BlK8ytv5KA3a32vdCVAtzm5pRm8ewYy4OtK48bmPvRkwFRZwDf+R4DCu9cICgiFxfgLtYiEtw6RZU8pwJxi6BKPzFPwK8C8B7lFjcRZMExHObKTuCvTUMxsLsR5rgJsPpLvOknTsBAlf8cQAHc2a9ETkI9VKqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSHFNiv7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSHFNiv7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429bccca1e8so161747f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 11:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372424; x=1762977224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9xaRF0+Ylf+8WvDI0dQCdMPlw5uq8nk/5FgqyYx7Zk=;
        b=RSHFNiv7iTBDobLPodRHqDvruLRqnECefigub3B09uG0uB/QA1S2jJ0ofRzdDJjnUz
         L7hUteGC9tUjIGrmjaYMn/weERg9Vt/KpeBZKocB+oaw6CKFGu9NR2RIw57bIvt5aQhz
         aa5mL886AwgFuQxjChuIvQNO18EJMAxOQSycSTVLo5eXCYBzFRmB3a3Yb0rEy7d9+BSR
         iC2FoQB0HsUh9jSDk655oQdVdKKJ5ZZeuZhCIz/7xZyW5RvQG2Ijj9SCLEwPK5vbCq0b
         qVHNFnuFS9YXW6n7QYDJjw0ZYSVAzzI9TQ+fSmtrUr0pVmXoDxwLSGn5E53Al6JnsVOC
         wWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372424; x=1762977224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9xaRF0+Ylf+8WvDI0dQCdMPlw5uq8nk/5FgqyYx7Zk=;
        b=Z0sw/e9jFkYDJ16M7YGQNeOI/L2UwUvdNMfEkHWz4I+UVyjzumNCJ2jDzETX+/gV9b
         rBWnwOM6/Dnrv83zD11bIgF+7LUFtMHuSfexB6fvDSKtd+NeWWSDs20AB0W7kykUiI4i
         L5lL0FrDulVXuNF0FtsTz8cM/Uqhq/X9X1fFqMhnEdDHr6Yt2gLXNLgD5SX47IZGE61C
         CtLKIJsAEc2ndBvvr8yWBxIPVYmSXx/Ogfxy0/iuXJAl+kyGS4F3qOddBtKD0c8yxHa+
         2ZkQTHy0FW1M1SV+iMyqZjIjNNCnDSfBLsElOWCDDJH0wf+woySA8uc6hzt8FxoGjjnH
         7Eqg==
X-Forwarded-Encrypted: i=1; AJvYcCXlWA0LH3AKLHbscvOPeSmmfGoKhAEbvtZRA9N0jm0pQy0KXDx7QAT7etfrdSHJZFqdpUsGIRIW9SYZjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22TdaoNi+qe9r7d0GuJj7sajoF7felcYCnHss0CL+tpl+Cg3F
	FAFeZrPiGcF4YPGhaz6dNWUtVujeEZVKe80PZ3S1vGpXXAdsP0zOHuDm
X-Gm-Gg: ASbGncvAXa7gZCKni1KKsB6FjghFENgiFKCD/3LgIIhFL7zOYMDGF7KOZ4CBm72K84R
	lG9ncwar1ljtAG7DIyYdWoYtWZYYBwjFSJ6agGb4MT9naZikkjKoozBkEscbcLqng0kVJwOBA4G
	yW+atUvqmZ0DSJ7Brv0rCi0Y1eCwH03uyp4QsvhJFsTsJ3SfeG56k+ONMwb0WLaporul+5mT59i
	CnhIAqDOC0G7f7Qwufnst/nlpElLWR5HrV66t0/jw4JXs6GqrrRoluOh21/HUq6USAoVDKbfAlu
	6YpNsWbDdBaGnkhqUQ6kKY9oIvFY/ugwoVhSScX3MXogEx0MTv+Jcf/kG9p2XpHYoDz2yfQcp5j
	akvZRCGaWcurhn/c5aSLHmM4dXju2XaElQ4MlD0Z4s5r4kBeqzHMWXrNKoauqsEnj9deiLJJbBo
	aivqBZoZf9uKeutWN026TdtvUvC/IIjxQ9gqJ97qCRt5WUKnVShYIak2WpUfMM36qemQMd
X-Google-Smtp-Source: AGHT+IGIWa/x4p6sZ2I1xd31Sd6kdQ/ay8nIV1AcjeU2MDxx5pes1fxx1MSrjGbeNguT13vwB4d+pg==
X-Received: by 2002:a05:6000:430a:b0:425:769e:515a with SMTP id ffacd0b85a97d-429e33090femr4013296f8f.42.1762372424127;
        Wed, 05 Nov 2025 11:53:44 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm558947f8f.9.2025.11.05.11.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:53:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: tegra: Add DBB clock to EMC on Tegra264
Date: Wed,  5 Nov 2025 20:53:39 +0100
Message-ID: <20251105195342.2705855-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

Tegra264 requires the DBB clock to be enabled anytime an IP block needs
to access external memory. The external memory controller is the right
place to put this logic. This short series of patches adds the DBB clock
to the bindings, adds code to the driver to use that clock and finally
passes the clock into the EMC so that it can be used.

Thierry

Thierry Reding (3):
  dt-bindings: memory: tegra: Document DBB clock for Tegra264
  memory: tegra: Add support for DBB clock on Tegra264
  arm64: tegra: Add DBB clock to EMC on Tegra264

 .../memory-controllers/nvidia,tegra186-mc.yaml      | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi            |  5 +++--
 drivers/memory/tegra/tegra186-emc.c                 |  8 ++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.51.2


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F03C108A
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128736; cv=none; b=d+UXmq6jvZ1Yb8NxlaQqVUGnKpTq0chmJuwHweQxjVg2d7UpW25DNzAoFdan7TxdiBfCPpD2Of6ffK7tbsM7V8JUVPkTWXtY6ebppF58gvBRMh/G7nl1drvwhxtLi0MvcFVFpg70BqcRgyUre1YLCBHx0mQMJLDxQfniL1TRQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128736; c=relaxed/simple;
	bh=JJ5PatwUf4+x5mD73Hv8f080y8YoRVgQwuJkNNfdR2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekPLEo9sWnl9jgJ1CG1f5/MtKbYTUHp3SgCcrs5W4Rrmy8o+tqcjDR46t0fXI70jwEE7XA4RXC9uoiz7c0vkE4JzOPSYQ3wvWzHK1eSI9rBaEOgXTfuyUdlhBGxSBcsO+2QAtuMcI049OybYDM0D4o4jeLgZqqSNzzAddIywnWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCnZyeyS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCnZyeyS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3743185e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128731; x=1791733531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWjKgA1ht9vd7gcEh0QJP7aH/UymJT1EXVYifgzXx/4=;
        b=PCnZyeySB3RFsYezf45VSoZj/PgX0Ol13DPHxK2goT0AoTDHwcXNerRApDPy3KRe5b
         RGN9WgAbYUXci7AAAHMvFwS5yEJ1osSeMeCYSDo04DLPtzgcwrDyA3cGx1lgbtKmnQPo
         8ohvjlvCHYiABfp6RZc/6eIpqMNxrJfTskusTc+6U426IPKEQtK8SIQYFaTmOkMoQW/h
         fz0tFnN34a30bGuVbIa1TC+/p1U8rLCYsJl/xhX7hm70owyaD8wvou2kFogECKKo8OCC
         07bWHK/ibe23Mms8Lr9Sa4wh7GrN0WGXMqZ+L52GSi3SSLNqVR42qCzYrH6DeKEOLrQM
         4ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128731; x=1791733531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWjKgA1ht9vd7gcEh0QJP7aH/UymJT1EXVYifgzXx/4=;
        b=KRSU6zCctJ8rl6TTAU83bOvaEu7gp+4bOJ7sLGgj0wJ6Fkv2ijUJL3HHysvUi4Wb4k
         +8amQuKIpeAot7X51+OHIR/XKKCMtlwSpm3BzkOwCtp4BbTG4f7KVRe+k27SZWmtcM56
         8asC7PzOFeoKJGbbHNAcV0hhsVllzSqdl2L7FvAJOZLrJ9oNf1AueL1RSneJBZovlyrz
         VFsCa1wT26UuWGxRCT9FKXRx/GH5DZd3fw7IzMjw5viuP1T2mHLIhMAnUhmE8kOOi51/
         w6UL0TQqfS6Bnnra7TP1FdsjJsBcxpv4TyvXTYYHb+7Cnopx/h6n6OhMF6bUm+Q2c//D
         RSUw==
X-Forwarded-Encrypted: i=1; AKwUvBxQToGpbny6jpAt7yyGSEpJKbWO4jlqr2JwOKfb+2nlD0gFdOQ5g9V28z4hwnsFm78AKhUduk5kRCGkng==@vger.kernel.org
X-Gm-Message-State: AFuF++lOPSoFJFICkU0jfPwAlZnlxjLJKZgNrFpitV/BVclyFgRTpBtj
	bmzmRRjohKm3FoahqSrhJQDr/5PGt7ljU4EHj+siZwau3DCJBWhaKdfK
X-Gm-Gg: AYBFou3/S383nhzZXfTSi/Zn3I2s77PFTHAI2TyogufwpoCI0X6Hf6OzZL5mcuev1Eu
	gJZtDVYulbZ9OTOjy1sxgE52xYuYWrIrOAFwr4aiNT/0u531DCw5wDqLu6oMWh8JMnF8BD8A1RN
	zsJ9NFF2SznVC8pEcbACGWC2xkX/nUKm6MvM1O0uiPH0YfnImKJpWeYDOs+ExZl98wnJ1+EhGDg
	JHhwFmXVu8PND71W65FOFHJ2rjN5NpAeFJLMaxEI4RnlPbFqe9PPjF1uZ/eqTuhBSHFcGXuay5v
	hs9IPCHwCdMyMESElbDtcj3VxtjVidIGm43XR1r7pJnZcni0HbTbnLZIDJ95JqsVUdNUwTETzPE
	pfXh9q1MGSdm2vfroPdLpJJyB0jw2mWpQTdRElEha4/QPr9EBz7pxN8/7CJBszu0SnVQi4jktUl
	ok+2wmQSwG0xzConjCDprK9m0I2eoGdCmbtbCNVU6Pr0G9AYF5EkA0PpiOtaPXS5mMkannvndWr
	Q+ua5s+79fL4lppmcA=
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr143954955e9.3.1791128730435;
        Sun, 04 Oct 2026 08:45:30 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
Date: Sun,  4 Oct 2026 18:44:47 +0300
Message-ID: <20261004154456.145362-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for recently supported device (ALS, LED controllers, haptics)
along with minor tweaks and fixups.

---
Changes in v2:
- added USB configuration update commit
- added p895 power LED trigger update commit
---

Svyatoslav Ryhel (9):
  ARM: tegra: lg-x3: Adjust WiFi node
  ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
  ARM: tegra: lg-x3: Lower supported suspend mode
  ARM: tegra: lg-x3: Add light sensor node
  ARM: tegra: lg-x3: Add flash LEDs controller node
  ARM: tegra: lg-x3: Add haptic engine node
  ARM: tegra: lg-x3: Add backlight LED controller node
  ARM: tegra: lg-x3: Update USB configuration
  ARM: tegra: p895: Update power LED trigger

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
 3 files changed, 127 insertions(+), 10 deletions(-)

-- 
2.53.0


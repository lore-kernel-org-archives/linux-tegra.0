Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5433793B8
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411440; cv=none; b=U3BsOBJ8d6Ra09yUUIhm1sg7FKGyIAUOnNiYTK+XAz4lH8z8ncJm70KTA7KkAN4DAi556sj+/npABn4jVIjAzJKDa8AZtdtl4ikDvk4wEy1L/GPstLdaPisLs7QBpStTro7PN5X73VGCVojWD7PzmF7IukgeNobbsK3Txvlzas4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411440; c=relaxed/simple;
	bh=XcTpqX3ydnmlIVYB2Pz6P25RXMh6Xhwymj4ICa/xzbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SMibwT4TQFNvYV3zcmi00ksfkAdtgePyMYRx426YADdW4b+MKgttMLiFXYUu5Or4lV00nH8emFxl8F2Qj23AhIRA0duNY45lp6BB7KSRk4q1KVaEoTE8ZDmatjy3HI83CcCKCPtwZAU1PHuPAKcLgowlTB/97FT1N3oQpoz9f60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISfRekBt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISfRekBt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3cc771c26so307605e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411437; x=1777016237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=314R3/793GME6eVVWj9ZOy0Jnf6xNE5QAaULeE1OxQM=;
        b=ISfRekBtRa4kVj+WYV1yNj7RucY1P+CzD/fx8sdg6cLDuzh196QcoY51dpjgkfBLrS
         puu9PuNPynTn89QXIeWFFcqbgh6PAoxgHT+uOTf7YM3FLGUMPpwl9wG6xqc3+vgj7ulA
         bIBBxt/p2x7pnDsiLIfhtdfX+H1gRbEQ41l88/dTLeGA7w0pbfhCxluwPAxCqXOASyRK
         EZSKkD5e9Yy9TjzxLw5S9J6H8KvDpDSVHv0cI37UaqCgoN3RnyurOq86VArkExfeWXC+
         dEsNgmVDDTp/9uBSLW2VI6T9x3d9GkHJOzLMJrGpIzgBClOmz65mvOf9/u3oTVR/eGJJ
         tW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411437; x=1777016237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=314R3/793GME6eVVWj9ZOy0Jnf6xNE5QAaULeE1OxQM=;
        b=AHZkiA1ft2U3aJELoXQlmHMX+8BhncgcBg/TuepNtxIRRqA1UkUd8loz2jn/52nBbR
         YyGkG8M+owRlIeZYTBrrdIOYImOUIj1CrT0WB89SDxgkbLP4MvGopss6b4choP2K3DHh
         1mRBLqaHOqiJWkRNki5oGhV+oUbXmBuUL+lj0QWFDBkMCBmWujuIZmPiQ4m2XdiOi0qE
         2PqWLLEfPmwNtoHJZb9l6PB11eTHQKxGN/ZlbuGoNtVrqyUJQgHA0Q5Ss56UpgplvU0E
         6qsJSbXofPyI1JoTmQrcAcHlo0dUvzkIp03i+Te8Bj91BOR4kJ+N6MsLejdSDWTOwjnY
         1xsw==
X-Forwarded-Encrypted: i=1; AFNElJ8d3eYN8wrGdi2dm/11dDrA53kTG8GewJbWhe7/HKNJDaehsH2zybGPWLRFixEhlGHOIJ3mtPmsmmD6Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0E1cUA2pujGRslgQJkfK1Iq9Ph6uW3j9XULHAiZnm+F4p0O/
	O7Y7/yMixa+sE8CHbwz5TZACjkOoiZdZf+LYNnADrw8VcYD+c22rt17ouj2xSJGn
X-Gm-Gg: AeBDiesFjDiAbqjutTO2Eg6WqTes+JvSmGWeDmm0fBy9KBr2EX1n86iRZkOmhj0WRcW
	3T8aL3mFKZ8e6muXKWJWaseAToYSzCMxVf2MqGomqmLA5ttWfZVhEeO+FDzrfUZxtDR+5OB9VnE
	VIC4qGnDKg4X36uWEArpmpChyVGsHI+2Lm5jDARusyjds0FA6HBlN3aWSh6EqJzhUrDjXFqGGWC
	U7XH929JT3cl7xQ/UE0V8yl0P1gD2f4eqgEOe6cVLycQ2BU/kwBPhpA5gsbsELCI7nYpzJGPAdr
	CCl0BJR2+UVbCDWsKYlYCxGm6eGliTVosWZjlqnbsd4Y+kXyR0wBuG0Mz5Rlubq6PHnVuMncQAR
	qRNpCrjU6XOagczVWeOZJQ2M7CwXTR05rlwaa27/bzqdeAxBFup9JSHRlQARR7dvxqo59OVEpGY
	ka3ueMhFdC3APGNVb3q4CTutY=
X-Received: by 2002:a05:6512:1295:b0:5a1:3d7f:8f99 with SMTP id 2adb3069b0e04-5a4172e310emr523530e87.33.1776411436614;
        Fri, 17 Apr 2026 00:37:16 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm1692661fa.10.2026.04.17.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:37:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Fri, 17 Apr 2026 10:34:51 +0300
Message-ID: <20260417073452.23342-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c      | 1 +
 drivers/clk/tegra/clk-tegra114.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.51.0


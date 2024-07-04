Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E019306C;
	Thu,  4 Jul 2024 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092712; cv=none; b=P+rLNxOmmvMXi3AT0LVXvgU0XBp9F4hd5hbgsRs8rMGBhAFnnNiAyx4WT+MZ4ndwzlojdQOkvN0bJH8KFpPx5BGB5kLecuOcTm7PzTFwV0p+kv9fZddjHe/tUtrUjayK5J7wAHgJ6i2FfoUiLB9OzT4roBgJPD1zeDFISgFYNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092712; c=relaxed/simple;
	bh=IJfjkch6ZzOcdc7z7UdkuGLyWiaKV+g2YUH+4LnB3Jw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jfwYyigpczUGI1dG/Hn27WK+E2fZqDkB0PrmEiAK1rT/ao3HCwO6w7BuzW5F7V4FH5q1n91KTymA3451uoNn/j3a6Z+rgWG24WkL92cpS2xggx5ZeZnATRXVRJOPO/fxJb3hC45BxAm37Y0zUEuG/Oge5ALlmRLhd9o32ReoRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=HKXiIJp/; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="HKXiIJp/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AEB486003433;
	Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id tP9km0J9U4n2; Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0A535600022E;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x0y+4GnWMSOhZmejSsHhOCWDnBmzLxHwcFZLRk0LV4A=;
	b=HKXiIJp/ANQFjJqOm2h5OQ4tORFpzfzU9h8OCfDfKqGl4z6AAk7eHmMM8F5EDyYJBoB+DB
	IAtvV+NSj+k03L1Iu/+qxOxFNhtBEL+gig0kjQt+HtWf5DfvnqTS+G+mRU42+4I0hpZSCs
	R5QhGmwAk9wIspkhUif45m1ThxOTp48=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id BE7303600D3;
	Thu,  4 Jul 2024 12:31:38 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v4 0/7] memory: tegra: Cleanup Tegra210 EMC frequency
 scaling
Date: Thu, 04 Jul 2024 12:31:19 +0100
Message-Id: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeIhmYC/yWNyw6CMBBFf4XM2jZ9gcGV/2GIwTLAJMpgW4mG8
 O9WXJ6T3HNXiBgII5yKFQIuFImnDO5QgB/baUBBXWYwyjh1VE4kHEJrtLriw/cBn6LujKsqq5V
 HD3k2B+zpvScvTeaRYuLw2R8W97P/WJlztVVlJW1ttNCiIx5Y0sLnhH4iz/J1p3jjVs4Jmm3bv
 pj2eqitAAAA
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=1885;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=IJfjkch6ZzOcdc7z7UdkuGLyWiaKV+g2YUH+4LnB3Jw=;
 b=koNPevSTqaTND3vgiadpazuzNFj6Nk7bT9Jvo+VN+S3NBmxaw1vwDu847rSBOkSS7XYg4mdNU
 3AhD8ulgHxNAaJ1m5FTgnBskCIif49qe57WSovXfuUdUdebKFrVmvez
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Hello,

This patch series consists of a general cleanup of the Tegra210 EMC
frequency scaling code for revision 7.

Currently the code is relying heavily on a function, update_clock_tree_delay(),
that is responsible for too many things, making it long and confusing.
The general idea with these patches is to simplify this function and its
surrounding code, making it more modular.

The motivation behind these changes (besides improving readability and
maintainability) is to make it simpler to add support in the future for
frequency change revisions other than 7, where we can reuse a large
portion of the modularized code rather than essentially repeating 2k
lines of code with minimal changes.

There are no functional changes with this patch set, as it is only meant
as preparation for following patches where revision 6 support is added.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v4:
- PATCH 07/07: Add missing parenthesis around operands when calculating
  delay
- Link to v3: https://lore.kernel.org/r/20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt

---
Diogo Ivo (7):
      memory: tegra: Remove periodic compensation duplicate calls
      memory: tegra: Move DQSOSC measurement to common place
      memory: tegra: Reword and correct comments
      memory: tegra: Change macros to interpret parameter as integer
      memory: tegra: Loop update_clock_tree_delay()
      memory: tegra: Move compare/update current delay values to a function
      memory: tegra: Rework update_clock_tree_delay()

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 429 ++++++--------------------
 1 file changed, 86 insertions(+), 343 deletions(-)
---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240704-tegra210_emcfreq-9d2466310cec

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


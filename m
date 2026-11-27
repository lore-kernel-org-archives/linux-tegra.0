Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797886;
	b=w3cefk5a89l3wHh/EiUCa4Fe3fkXHGMCT8Z3i8ium+3wm6zzMsLRnzzNfQMi3S0mLj2I
	 VzBhMP9qZie+lSnjEQwMoevTaOc6KEycJBUYx7wJzJRc344jkyc54vCgXaxU8fcvVGKxB
	 FAh3wL/kAE7a3UffVRn16zuR8piEbyj+SZlsyg3m3geIZL7SIuBTU491Ycb8fDZYDyr8T
	 14ZNmKJJswebOl5IVcoMS7RK7CnnMSv5UPkgtfPj3UXvd7RBOIMJuoF7n0zDjEouvpiwx
	 lonw9YTB4IqOT+30ClBbDQrkCWXOGgHqMNjmPt341xrVhdJCOigK77sp6NJbg+h5XYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
	b=eIoHW9zZZ05MGAfw7Snns0uNrzT5UNOkjM0eWJx/UbCQhhga9lAmh+x5vC0Ko22lFp3Y
	 MFYiTTY2QkWWzmXbxAmJT7/HTAbCEIyQiaIhWhkuS/MUdxLOtOCGPqsLvfOr8olCN5Ffc
	 JVG1CU2ZxyS4NtIAXgQIqi+SX+yvWVaZ4X6E1Sqr/DaZ6fOlWbze6wDUMXyuA+3FlqV+0
	 rBbCIqXyEb5GmhRdTBuwz/PLZfyq2lqDoEcyyhkJZllfpKfZ4T9n0krVDdhB7g9/a5VAM
	 zgklEaJb1KPDDhv0UQPM15isBya5d3yH6woYYv6pgpOksm1Jv3Te0cBKJW+ynlLPcPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D7606A324
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 16:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733D7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1349220066b.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797885; x=1796402685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=p5vnAV4cFgacoo/M9KlinZGRZDodRiI9TYOENAWWO2K8u39zjPivOEi/FPPpsz6vNH
         sU2byjRnNoKOFK69aRuCqbAY+qGOVqWL/hCaOcH1p/SQ6Skq/Yl1okrwwfv0XGjyDqI0
         XxY4fHSLCDkj0SyAJWZNY2GH/RBvT5GJ06DLpF+yZBwO3kXVyIBAXL6DkNxtqyaoBYRM
         1rK2Hy6uLPX+ChrJJtljZsBZT61Ic/iI0hJRGIDFpx3iCL4/ZtDnBE7Lc1KiS3tn97nb
         WGLF95xBlYcrahhWFRahC7DwdEOa+VJK+ROfFA5iy7RYNTEyJWFOgZqtVWwPgBp8enoX
         xLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797885; x=1796402685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=kunUlW9oR5Qyo68HduwB8Yh8PdA2yCxatAI4XXxpSzv78jeHotIjGIJSYdvfQdZNVd
         oad+WxirFJsObq/kZRGL07zzWkGxVVKN2SCC+AzuQ+JrjOxTgzBmpI35eqa3bNO1827T
         Q+CDN2g47pfwFS/6ZMVv9aQ5hsCSuXJRpDXDMEXImm1Jaqi6DRZl8+dBbRjPfTY/4Ssg
         2b8Ke8FG8PihgWpyYqFkyWob5OXUJjBAaJ/eSKjyUz4PaW6isiW8DZMKEc6t1gKQaLFk
         qkk/4M7dBv3JanBj/ND5+s5fSwlgxkUMunXGwthKHba3IpBmv8OeJdtX2Q+frw2KMzIA
         u61w==
X-Forwarded-Encrypted: i=1; AL+hErHU1UF3l0SfGMgg7Otk6MYHYPL1yiqosvQ8bmMOgeTJQrU0a7xbPKGo1zauuRU/X5fq/421THFDH3b5Cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uiKPhwEDGRrqdkDyHN2e3sTP/BZOFpgXuGdvZwd3X7+gNSAsg
	c2YApKOyW3DKWmfGddZBOF9ElRHLc/c9xtaGxCQoXo3x4jaki9XJNw3h
X-Gm-Gg: AZFdTZfEHAalpC0JnZ38BGnJSEjHEMB5fKT/kqEh36U9WO6b/NAsgoomm4gd96wUcoJ
	7Jgae0iD+pU05ZgvgAiIKhfzn2qeANopBzORedixm/DhwxPAJFnxd/0wola4X+S4SPLBGEiAayQ
	yMX99fdvmtTbsofQIdpQzJuOuyaeo9MS2AqMkl0c0y2O7XM+HFrPfHPYnvyJROzYpzURfbbvCc0
	seGUJpRY3ePo0+gnaI+jZZkI3lgOQIkIstmrjL9FfgHZbIfQemzM06J46KqviHdZOFh3YSMZSBY
	ZLUaB3tizNVTpnUSONVGP4uNPS69KLnJgbo1BEM39UR4kQpuFtPEwQquqAgM6jY7IHFk9aztdEv
	zeN/9/XXlKLaD+IMLpsYYpVEuDdBksK/lnq+SE4SL17Ef3uifqC2+Zc0hBVimSJqX861wqCzeMH
	Qt/8M9d5HwtkEOLYfPNasciF5uvtjUqq7mWLR0omMKkveN9y8rF9pcz/ZH9n9z0EQX++2FQJTFZ
	Ni0BUGTQJSkNdt4DdVOwGum5gCV47oKsO1ONIITzi8wNbqioxt0IXKnGVCMVxEmLLS13aRFcP9e
	EadM8qWZ7KuCDD9cegI4woCVZ5B7Xx222cyxhVRN9E4Tpe/fAlh23lGqBoFQI6YkgtgYjQJUHwC
	aokvn97L47p4=
X-Received: by 2002:a17:907:5c5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c51a200609dmr869503466b.28.1795797884621;
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Fri, 27 Nov 2026 18:44:31 +0200
Message-ID: <20261127164436.292585-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

---
Changes in v2:
- rebase on latest next
---

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 509 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 152 --------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 343 insertions(+), 691 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0


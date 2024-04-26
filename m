Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6215EFB4
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154726; cv=none; b=gf4QvJTkgVD7zTMzeC4ghAQrc6+yVn2GqC8coZBRa8dlp4YLGWN6tfQSYb634ZsCIuH+PDF747Sl/mcs03yEPVRe2djBsYMICC9CpyelLNg2ilsesm7lnpUbQfxKy0SQ1yU8F2SdEHR9NS5DXRn0807lPpmy37reF/A+fWDIb+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154726; c=relaxed/simple;
	bh=AbGHYraq6biSB+3G9o/GmtvJvb9ddZrcO6AKXv7Qi6o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=su5htOgKN1NV90V8JVE9kUEExPxl64nmP2Gdo+BHIwRq5ryEf/3IsxQDO1ez8F9vOGE1xdFZknqj2QjVFkuCWMXydqmOemD+xdX5h49RfYgP7UCyt8tdA2tu98rsjjWSEaN51x5mdOBdTGFgcX2B9UfNJIamDjGB1q3+/xETXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxmOrfe1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxmOrfe1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-349c4505058so1718493f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154723; x=1714759523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wNp87mCj+UBK8zz9Z1MbjXrA+JcnQ3PEmFlr3lO6XQ=;
        b=hxmOrfe106+4vIr4hhUxSMD4LXxOpNsgRxOPC952obKqLtmRyWO1i6ArNGbOWh7aLj
         SDlSprEavuxx2KSn08Y8w00IDD5viUkai2TC3emmGUMv2V1qf8TkE59T0+e1SySfwBBD
         /9Y+Id1Cr5XQxMH+oUYv0CBHi6b1ilmHpT92lMa0Ys+PthABSGkBh57vqApyFQek05Jp
         Cnq+bQmNx3T8fHtnRLSrY6FcrsKSm+RjFmpsQzwhBFkqXJBX2l7EkB1sZdFrGRHKfyQT
         vXhMRO8rmhqivJbWL/p1fjV5Hrqm/yj/N1SbiC0bG02yDTTzcu31jsyfpuDHopx39KO8
         IGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154723; x=1714759523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wNp87mCj+UBK8zz9Z1MbjXrA+JcnQ3PEmFlr3lO6XQ=;
        b=Ku6uMC9Pboussgar6f3wl0xzbv0nOgZ1WD9icajebFQV8A3t4nyS3yJZLAHn+Ev26f
         I1YT7QXqCBgRCaAgRSjM1BVLmoqygCYfMWMW3iQ6l3unSmqGYfYRLSzgGDvpebUoOzLr
         67vFIihQegcIVssTl/sGxdkqNjio/+dFxWlSdYo/mYYSbc48UVgypWp8HDn+Gfnp+A3y
         bXkFkKVQSLl9jan1f+DwkVR+dBjXl4LbdykONIsrE1YWkOhGRv84a024yqcrbJk7XmIX
         ZqtR5cx+oAAnSB+aheNf4hll+M6I2xwTaGYspQVRAfnnPFAOLqQWZ0wZVu3ckTMatZ41
         PJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWXdT5I9P6euXeMtqWs9ZfIU2dwJNwC9Tx9BtR21LC/l2s+ZxHsp9A9LoLgHiVrEcRlO4gBXSojJ8AWnZeTeyv3NpnaLwDwFJZGIo=
X-Gm-Message-State: AOJu0YyOVJ3rM5PSZ5tmKlHqvJWiC3EP8YvqBMa+KiAydHZ1fHY8Tz8U
	nhSwJ2o38pUtutW1Uvoo+FTpMnmLNL9MKSmu8HRSzJbs/OG2hq+L
X-Google-Smtp-Source: AGHT+IEDgC7qvlhIAo3wSZy9P8BGa3uA2mAt94X3P0agj/vrpfNpqRuUTjDT+woH3TXSvRb7dvKGHw==
X-Received: by 2002:adf:f80d:0:b0:346:cd6f:3fd9 with SMTP id s13-20020adff80d000000b00346cd6f3fd9mr2437261wrp.10.1714154723037;
        Fri, 26 Apr 2024 11:05:23 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h15-20020a056000000f00b003434c764f01sm22911332wrx.107.2024.04.26.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:14 +0200
Message-ID: <20240426180519.3972626-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-soc

for you to fetch changes up to de024f63cea3ec833bc8a55be2753879e2750db9:

  soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234 (2024-04-26 17:36:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.10-rc1

This contains a single commit that adds a wake event for Ethernet for
some devices.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234

 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

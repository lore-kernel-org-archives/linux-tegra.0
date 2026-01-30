Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785437F8DA
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777408; cv=none; b=jln+m6wTQCBSWK65ampXo0ly89B89loqublFcYm+t6ea2n/DmAt2BCkW3IrYv8aG31arxHuADve5oUtsuByllHgxfCRNEPjaC7cz1UdwTaq/RLlDAplScHwm89N8JuQEbVKKxGE/BALKWvY2VJz39Izeomw7Oirem0Gprq9xcvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777408; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeELGpCggWM0aRiZmRyZ7zOgd++UheKLScnRh0R7pc7w2/ZOSRuvgFaY/QrmK0pKmXzW2n+ctvJWega1N5LzuW7glWlDg9wuZITyOuPEoHBKqAM9JT+nRltqAStPCP3nAokxT7/Pmmj9bx+CJeRShTp8OHCjICiEyku89OE/yRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/7vlFqF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/7vlFqF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc305914so1917651f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777403; x=1770382203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=K/7vlFqFqJgrn+DuNHyEw1pTkFGBZ5+9ZlEu6OCadmYu/HSL95hvRiTzJx4DZfJcHw
         AWdzSR3O4VYPkM7lRoTwgilfp4Lc4HHwAR14g1e4eS3E5W5dzv+64/Et5vI5bKV+3m8X
         HItrVmT+2HMtG4fyXtQq5Kuoz5byVZHzEFzLEzyDOpEXD1iYk9c7tOLSwvWa4DCv6VUz
         i6OuXvXCvhYofBafWkYjXcEmn/hnI2yQFApnrpyPwnEWlSwLM70XOOXz722XNreZamzI
         ZGdTkbb92HqC3lONdRHH3JCZ5i2ugVMG022Hi6MJn+QA3gIiszXiHcqTtlPPmFNeuDiq
         ZFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777403; x=1770382203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=iUSFfk50MLRMJJZUZJtVs+tHzHm2tqu04Z1Jmx9uB6XCAzcp4XP9yCXgsmaQYcMO3i
         pE3fVOTMWkoo4bY6NreyHai/UtW7Otyr4h4c9rlpFAya5CwH3sz4+nVN58ZBS7ubEAxT
         EFLzeJ/lFgEDw1Ur1rABhEnckTBh7FqMxQZeBrNWVgpPunQc32HvkYLj/hgC17ZaytKg
         rS4AtbkzoezRbxN5vwO3fGFwuCaroAOb6inBEh8fJYLUwtgo2GLOnvCDuN5OJsj7P58+
         s6zI9qDbAAAoQ0O9drNiZ82Q7BkCNoKCjUp/Lsq1XF861R7K7zdcbK5OsJPe1GhY8Gnx
         JWGg==
X-Forwarded-Encrypted: i=1; AJvYcCUEhXQ91jfkBKssIOId0F9dwRfGt0G3WN/Va2pt1UrnXHQxRi3bjRQQXH7y6lF77zl6bAjA5G8piI/VXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7m6wgLlQ30JCzEftwGvjZLpFUDMN9AtLQ9/DdqGa/lAs8Ljf8
	5e39rCKyOmztAHb3j/flrC1/hRACstPiqo6zZKWi0nPn02X0hJeAdFWS
X-Gm-Gg: AZuq6aJNU3sAWZy03KCfpoNLMX0Y/WCgZGeCuseXk09097f8QNR+V1Sk0IHrAp2+qXq
	9lUi/j9/OzS3kaXa2/5ebEdxCWcpf7Fj6fIv9nd9h/wO43ul5L6hjgYyd10AVvbZ1MmcxVeWmel
	yFW8zLaBwq5JRf5vCoDLyICmXoVSN2+Iaw5cqW8V9JOzL/VbNDUR9cvaguUlFX/8pnijUzut3a2
	TazdGxqoYQ4h6Vg3c3FmyHrf4ODMKrY4R5PD3hf3e2aW9rdZHot9bjQF02qEaFEwPFsGvju1cBe
	bkMsl1EVJNhvFZnrrXYygURp2KcR6HhuTRBjKWck++wmQ5NG1c86ie07WsTrwe1r00ULwrozufc
	0yjxCnTTnn0jwvnvlf1YIR/LRKPOnfKNNxYqoGFSeUmONi0GQfn/Bp87QqlIngTmJgGinZ+hIMt
	Q7
X-Received: by 2002:a05:6000:4381:b0:435:9f41:d60 with SMTP id ffacd0b85a97d-435f3ab2020mr4343007f8f.35.1769777403327;
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Fri, 30 Jan 2026 14:49:25 +0200
Message-ID: <20260130124932.351328-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0


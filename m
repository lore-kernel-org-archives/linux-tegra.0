Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B438C2BB
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527390; cv=none; b=TvEQESGfOxVGaKCsqrwxQDWnv2JLgaKVp6a51clE9zslwc1SJQXurHZt4TJW5snb5cJvXxIJP7U48HnDyqva4AEMHMRgwi62dVrEmXkdK2rBB+QRyyMBj4kz2kVbS07b6uZWE500imAT1FejjjqQ6/Rt6OanyMp04IwckK/wy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527390; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iO86NxQT6dfMlCjjEKtGnNvhUO9QvILyN8LZjQlYlmbojVhjsXFs1BpiJFMLuyfU2ridUKAnTTyKe+XoDRj0o5SHlAoMoD8Xd5XmZCnm8+OKrPqfvvc16vHR//P03sfNTY2B1gD9ytZnQRhMFT31KslSKLnmyeXu+m7m8JRhFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVFnK+I4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVFnK+I4"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389ee8efedeso84020461fa.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527381; x=1773132181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=AVFnK+I4XCLGf0l2UuRlPxnvyRF8uAGt92TzsOZnZQl7BquJBzBVvxEp/wAQVaHnUz
         I7V9Wn8ZmGLpc6Rznc1r/GG9XDxAKuNMNJ8UHZa9uML8+QyXD3Am19Nv3hIHzBvyoZ2t
         aWU0IA5APyOwk8nO8q5spOK8C8AU+FDny0V1RlVUT5AEhS2NHRiCC0cW3WmEHHXetgeO
         IOYH9TTEAaxY5INVIMH2WaSPIB0SAN3tXRpz2VDUPMIvKmwIBZmSthvOKjLd3K3PTbF/
         cCir1xOhVgLtXGlxyMWerTIpajf7ihb/fhdOHJYhXPDcKbzSHTjUqLA5ZS2Rqg/Dq83y
         UpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527381; x=1773132181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=aCBo/MA4e3fxLYa/Ts25W+vquLJGdh6WPw0GFIKpOA5d2jA2/XJe0xKUA0grzWDMxB
         hS1nHgdxxPOW+XUkwiqH9K1gOB5OK4u5I/n9zGPcE07vKA3iQinPk61/5NwoTnfqNg69
         YvAimR1stDVemFWZMa8Pho4lzGmxRi1NDXBtsry4TM3aW5f5aQzTzzioPTzvRzFPZbKc
         EBDvvqG7Hi00Cjq7km/wwZXhYwvNh9vGXycBq8wbcXfA3VIlXRZ+F+8FL+VIu+5MIu2R
         v1q20dp+yzcYJA3/xNQqNG5wtjyINildOQm8pPp+OTd3TpYy29yjdLMxk30910RgxwTu
         WZvA==
X-Forwarded-Encrypted: i=1; AJvYcCUCt/14+HydmhbYy8lYmD6Jut38eELx/LnsXmSUYf40Pso5r1MD4ScDfcpWlzxJ5YEOY5WW7vxM8UvcVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6L2hUR/cnExHX7nFSxffSgKybGFPRQt7DT+nFYaHSxmSJivOx
	8+HPOU2GoFMsAb26q76ScLzi5TtwK/Weic9YeYZ/HdfcCwAifu4SPkmi
X-Gm-Gg: ATEYQzzVCo2iHbW9SMAfndYWQOdUMUkkudknFpC+uB7z8ssObTooNaHfqUvEhoyxmN/
	bXpP/buV2Ma+LW3Oll7c0Ch8QguDjLhWCpSgClslzDhIQ6okJCTaJiQxEXVlqjKYTrYbjt+NbEX
	hGwzIjmP6e2YGj3nhmEXSXrWVlmKst0h9Ru/mBUalGLLxVipOd1flLoK+lzFHioXEcIwLugYYvh
	1XMY1X0IgV4KtPo+F2yPwflf1MwFa4QFHVu9mu1UjgD3NXib0SoDeIusuK77gtW+MSxmNZ41k0f
	w19/QAf4HSDfGVX2b5wyDTtOMCDZGAuZ9l6oJ5WQ/Zo9NcbqqHI0K1O2VvIRFDLkJ2Ls2p/iALY
	7vJyYIOxz8MEhhEqLDOmIgWhDGdEw1xQBLL2+fQfqBk8ypeAL2KQXwcBkv7GUwy4S91cJL3JLNc
	9Iy4WahZJq4oic
X-Received: by 2002:a05:651c:882:b0:389:fa5e:51f9 with SMTP id 38308e7fff4ca-389ff355fc9mr105960021fa.27.1772527381047;
        Tue, 03 Mar 2026 00:43:01 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Tue,  3 Mar 2026 10:42:31 +0200
Message-ID: <20260303084239.15007-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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


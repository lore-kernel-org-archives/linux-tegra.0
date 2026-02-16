Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217772E1EFC
	for <linux-tegra@vger.kernel.org>; Mon, 16 Feb 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273215; cv=none; b=D017usOHxtn/sDtUlIyDWTEMyvcOTU9ws7xR14hH3w/+om3i8KBkjQKgL11pWMSTEdK0nR8oSIy7wGbR7/3ZloCXALhcS5b2c5/UMx3hhL6FgA9UBSXPCdi+tlPjTD1w1wwEVZAD/pKx2KAbTbGouqk+vJAUrxXccSWqHakwQ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273215; c=relaxed/simple;
	bh=CeerqnCqr8abcKdY7IWXj0FthuPZeynbfIxJ1HWIyaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ljq2tsn7zAkqPBeFustsjnmfatnP4bakIc88J8NpU05Xet/AvPd2gkNoxzS07eVBjSxPcWvThVUPdhezFLrh/btV+D+ZrXdNgn/E2e7JM6kp4MAdhUX2pXfYTe6RZdqmNyfk2Hi8L/wAEsS3ZasQeGWtPFUGX8Y7vOno1j9JmJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOT1bkM+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOT1bkM+"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo4941158a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Feb 2026 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273212; x=1771878012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTXLv7Xoz9p0WwN0J530Lp7vqW1k88a7ctjlVvUXiJ4=;
        b=LOT1bkM+cBCCKR9FEtJrS2VVhq05DIiP+BqmjhHIqAtB1JELNtBywVxEneRKFGkfZL
         fBHs1HD13bSDQFkmzYAPRZCcBn+MNHnosoh5Ojlz7rgBhuHCfE7b79Pb0NdKatCy8s5D
         ce90hkdkNR4tqCuAYoPSQ9bQBmkrfW2ruxjHj6PlhooPbvRsfoMfEPxY+Id3Li7A9z/v
         6hBR8vUnup4lEHK8hCXq/sU/hoWEV2+dD0iIhJG3yjCZbRQ7yWVrSfW58t4tSb4d1Mge
         ltrPT3tDjTvwB2JCNtxVmJYld7iGMKkNmJZ64WUYnioMdCy5aJi6D07olrjdp/rJxXQh
         PYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273212; x=1771878012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTXLv7Xoz9p0WwN0J530Lp7vqW1k88a7ctjlVvUXiJ4=;
        b=bWU8DwOyH/9F9PSyQ33nd2INyUkxWhLfcmLGNMvk0gq2Iholfgzhal/eyfQmPYZ676
         ou2G73MY+AJ/YG9WelJe60uy6IiHTcv8lmnnYyy+my6xxuIhCi+pLMGd6nh5Q2Z/rkx8
         v1qCdP0SVcy5A1eGmYvawOEwbxTK7Z34IHLfPCaTEZGnO9NlHE4jPThs/qcpaSs8J5zQ
         X7UfOKC4uz8BjRFxpuvsbzpCeu99wRWFfESVaFUk9Jhzp3e2dJS+bVOXWnX2Y//Ze62V
         v7t/UwLkUXJmyzsMFXOouVCf+ti8KKLLIxB26IehiFGlfXQe5KA4Fv97LNvZKHxf3qhJ
         VFZg==
X-Forwarded-Encrypted: i=1; AJvYcCUoH5NGAKgc3fqXARFJV4dSRBS6dVSUreZrjg+H4fdXBRE9inmgHkB01ZSC9uLc6R3Th6IoQt0deBbQ8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8I8EtLjZaXSOQjp21qEdD3GNQ6jhtI+OHxcgDlR1UMnbfEYRN
	yBf53sBbrzBXrYb7RBuVbcn51/xFUgNqhCM8k5xzqd/0HFYWUxNWG5YsE9W+UmARS+f/IQ==
X-Gm-Gg: AZuq6aKSQ8FgfOidM+he64NvQR/k9a6Rc337qQWdjmjY2/E3DdgCv82bJTRr3Sx5oQY
	4wpTH/2tcQfTAX9ElsC0of/uNbj7EU2Nh95rN9jaSq2SMG6VwM4GOxTHyr3zClabB31n2m39rf7
	l0f5r0cE/q4VYvBnyRrUpsGPlXuw68IOhWPipuhqzb+rnFr0D2XD7loRP25je/NOBKU2YFcsYmf
	oyiLlRlx6AI1vIKl8PWtOwYUloNWOKOGTZxRKi8EOaEoPBlFxqvMJzcL3ulzzNGdslIs6obuVa8
	yJGgWV0RkgxmNfwjMQK5wnGYK6fSs/JHJL/IfTvI4WF0+qC9xu58FMWEk2wZaDKqPf9UGLrSjJD
	o/txge7cMsUVyfHDTAHHCPbZoAmDJ4sI35AUDMlMqv0I9PxVHtYPzMR5iiF7WR0uGtlgwF1iLl8
	FfNUjcxJsHyfc/QxyEThkBauKtfPeA3mEPCQNpFyKlN3vHLzpgXJOkhjZhGPKgyV0aI4u5pOltM
	1j2uFxqotcwIr31DHUlT1ekB2ir8GMU4QJQXILrC491MNpBTzca5+WS1ruLF00SY/cjI4tcuUj8
	Ag==
X-Received: by 2002:a17:907:3fa4:b0:b88:64e9:899d with SMTP id a640c23a62f3a-b8fb44863fdmr649791366b.34.1771273212406;
        Mon, 16 Feb 2026 12:20:12 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7015sm275802766b.66.2026.02.16.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:20:12 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: nvec: propagate error codes in tegra_nvec_probe()
Date: Mon, 16 Feb 2026 20:20:11 +0000
Message-ID: <20260216202011.1806-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several error paths in tegra_nvec_probe() return -ENODEV instead of
propagating the actual error code from the called function. This
prevents probe deferral from working correctly when a dependency
(clock, IRQ) is not yet available.

Fix this for platform_get_irq(), devm_clk_get(), and
devm_request_irq() by propagating their return values. Use
dev_err_probe() for the latter two to suppress log messages during
deferred probing.

The remaining -ENODEV returns for missing device tree node and
slave-addr property are left unchanged as those are permanent
configuration errors unrelated to probe deferral.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/nvec/nvec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a..c4e383de5 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -809,13 +809,12 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 
 	nvec->irq = platform_get_irq(pdev, 0);
 	if (nvec->irq < 0)
-		return -ENODEV;
+		return nvec->irq;
 
 	i2c_clk = devm_clk_get(dev, "div-clk");
-	if (IS_ERR(i2c_clk)) {
-		dev_err(dev, "failed to get controller clock\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(i2c_clk))
+		return dev_err_probe(dev, PTR_ERR(i2c_clk),
+				     "failed to get controller clock\n");
 
 	nvec->rst = devm_reset_control_get_exclusive(dev, "i2c");
 	if (IS_ERR(nvec->rst)) {
@@ -847,10 +846,8 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, IRQF_NO_AUTOEN,
 			       "nvec", nvec);
-	if (err) {
-		dev_err(dev, "couldn't request irq\n");
-		return -ENODEV;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "couldn't request irq\n");
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.43.0


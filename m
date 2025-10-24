Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001A2628D
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761269743; cv=none; b=Ajra5lO8e8cRqnvDljBoDDUGMYzWYQgtvYytquC6XpclbHH/YTvOVAhX4Lvulp1jF0z1cZvQr3qMQ6NgKTRjO3mJ3d6FZ/tdELXkOXKVwAy4YVrlki7x9/xxVWNqaPVGJq7bfNOLrBSg7toCxgFlsuW5CPigfYAiM5YIGENLZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761269743; c=relaxed/simple;
	bh=OzHfrAInRSZ0eiTjgnP0ORLw+XKP0Fa49X/R0UcrD+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QWv5IR/D6cgLVu2qzXb9XXPUjttNm5oSmxcvuaPLaMySmktCaVMHcR1JjXZ9xSVdv8Sg55eNlM/Ec7YjZ/8spHm0Z8YxObz805JnheMDcpLoAa9UejKFZpC9j4/DFrCB/9yTmPihBxpLbZKI0ChvJ7OsEj0diMzernWOkw+cpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEweK6Qz; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEweK6Qz"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so1477315a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761269741; x=1761874541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpEV8JmfPBi+9bjulCXf6+3xKX9GZ5AzBtR1kYyEQ9Y=;
        b=SEweK6QzHWqrOkV7DBTtCHKeYhpdFqRtFDPlQCBqr9FAXFp5BlPea0n0XVtWha+sqZ
         Qr/HvnOax2QuitL3qbcmVz01NFUfXf0C8phEOGPLCMKsJ8UJb1Lyc/YIjgzMuILsAI2f
         qsnufjKGPaCxF1JowKFxaK7tQed8UM5Z716+kCZNcPu0W7vhWXfsx4r75p46WozZitSK
         jM/umY/jmuLWk83SPWMl74LwQp0JHP+Vm8NDZxuoZP+aYo09UdtnbjdeR2JcIEDAP203
         6/yF9A9xAS8kd3IqvwfB0u7z40WR35KpFWSFkT6+zWiPdQjYZM8iVnAoo81zgvPay4pF
         2XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761269741; x=1761874541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpEV8JmfPBi+9bjulCXf6+3xKX9GZ5AzBtR1kYyEQ9Y=;
        b=qFZIuqS3m2mlrrpIkQxMIELmI4Ml3oIaBqzHseI8KLnz9HtiEG7ZUGkVNpYvMa37zK
         RTbxfNKwtXCfSmfSEJz/oNsDppyqA05Y2A8bwyBaXD6en2xrbLwr5S59y3Vxc9gTJZfX
         g5LJZZH/4wUBDE91o8zYkleIqVwCHqQypbPn69PAAhFU4T6MONtlShY22nyGhfiGgh7s
         EkG/CRzL57k5ytpMgDTv68b0PaTil1imDn9TqggFiI8xn7sy89cXmojJfoTC9kQx0S8t
         tk0b6FrkqfOc1I58VsxK+M04P+HVnY5+F5v5DG3Wyr93Svlxi312YTnAfEUX8aIO89OG
         eJng==
X-Forwarded-Encrypted: i=1; AJvYcCVVHaxYGm64/skKXuYhUbPLM8Asp2kEKnmTK855QwEzB7lKt0aq0vg3WLVAFI8EHdsBUfuCcMBeVdnWdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDXwVQPOZNKYgY46Y9tz1uJaXoFngtgS4YRCgIPzsL5Q1Wat9
	G88sIyPu9JxqdUiCVjfUQNMQOmMcz0OBLJzyj5/RZ3g67hoZQKyK3LjI
X-Gm-Gg: ASbGncvEi1ZJ/VBDvaPWxfT6XEO44SJnhHoNpQjTJbiA2mRqSHamLwkWHEdg45d7fn4
	eYbVxvGgj7nYxIX0UWsC2Z6MBymtUZkuUzpShfdaED23N/VKZhhjL35G+mVTV3IL2UC7FYh36eI
	EueFSmAGLlaYCJU4sqpYQKMUfQ42Vm2RPBZj/r9vjJeyUbH+/ev/jo2tiQoWWjsKANKvqgu8qEj
	W4M6/hwAG2jPJjS9PIBbroblsvoMx5g3/4cbUOzVEe+vDjX+h25ndD45KHtQDCAo8Xq0JNf0Vfi
	nrqB5iaVCrjEg+NXf4B1jF/ec1kbUCMCRIbZfmp7CV8UoMwIfGJyxLr1c//MJKAoUL5hi11snHr
	p9ztV9fzU8vbiVsJmVZDa+ZK+trCXhurFfbDqxQWkyP7Uzl+gyK3otFDuenO8/BLgpAmm+mhZPC
	dFqTXtBJKH9YAiwsnf
X-Google-Smtp-Source: AGHT+IEUI+U7zUQV2UwzLZwu9TlJemEe0RPKx1uez2BTNfquWqRpSOjvCC8tYXJP0daruNmjhYuAZg==
X-Received: by 2002:a17:90b:164a:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-33fafbaabb4mr5709115a91.9.1761269741348;
        Thu, 23 Oct 2025 18:35:41 -0700 (PDT)
Received: from hilb.. ([170.254.111.1])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33fb016f865sm3850014a91.11.2025.10.23.18.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:35:40 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: 
Cc: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc/tegra: Resolve a spelling error in the tegra194-cbb.c
Date: Fri, 24 Oct 2025 01:35:14 +0000
Message-ID: <20251024013528.1542-1-brunofrancadevsec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a typo spotted during code reading.

Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
---
Changes in v3:
  - Improve commit message
Changes in v2:
  - Really fix the spelling error
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 846b17ffc2f9..e1deda188fdb 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
 }
 
 /*
- * Print transcation type, error code and description from ErrLog0 for all
+ * Print transaction type, error code and description from ErrLog0 for all
  * errors. For NOC slave errors, all relevant error info is printed using
  * ErrLog0 only. But additional information is printed for errors from
  * APB slaves because for them:
-- 
2.43.0


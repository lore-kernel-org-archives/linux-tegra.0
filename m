Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1E24E00E;
	Wed, 26 Feb 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567397; cv=none; b=Q/TFJOV//SpoGAywtmUoMaDg/Gvhsst3TVu+9cOpaXxqe3OK9HmVHjYdoWdvM1FLEevY3+xhwFWeN6wZNmQLigDEYY5/wD6DW3dQRdfbVzO9TDHo6ENSHM7wCIqQHSSZMYtf37yPXY3wyHAHvPuyopErO09yK3AGfCxm1KEP2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567397; c=relaxed/simple;
	bh=nRes/JIQoSt8qzSsHkQQ44Bc7mQSXTTNQNmjL5Ibs8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CW+x5F/hxNUwIJeAnkOJLmvopl6trhbzve4CcCXRcu6XKQWoP0GniRNBKRRbJ8Yh9HbR2kW4BrLJVzPg6EWL5p8juFQltbcU3cxmEMHlJBnicktsxjJp9xnpVmNF3ziZFvUR4kTt75lrCwQWrFrZrSivsdXmQeZV4NhqSMFncBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVxc+rp4; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVxc+rp4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so1376792a12.1;
        Wed, 26 Feb 2025 02:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567393; x=1741172193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnRt5kVVsi6y30e+L7tjbQGl7m0u+I/PjKREYzjCPTA=;
        b=VVxc+rp4icHRPESQSDj1UhkM2Xnn/R8QgYdZt+FJhrp2pTEWyZT0KXi5B0lLeSKq2B
         LN30wKApY9QuMxRwnuKe8rrw8eC/gCQ9P02efjhU8ESLu2MJZuiUPQHAo/Aq4kusvAYR
         nkE6WO757+nyN3jYqvL9UyPdQHPd+N+RLV7KkUXzbfmToc5aNcL/oHZS6H9+cB12TfWn
         Jtym/sp4hedBghXSVkNIxfczFHK6geZSuMW5q0rAjFKaoBCL6p7ihEptVySn2SrdqTMi
         AKwuHbjsVfP7JoALu+lx6QZxaBZv8t8lzdrYv9roNuhyb1m43hhOjdr3pMfUH92KSebY
         9Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567393; x=1741172193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnRt5kVVsi6y30e+L7tjbQGl7m0u+I/PjKREYzjCPTA=;
        b=UhcA90MKlQxNjSPyr+yjTTEBU9cW0Bv+JvR2hYh05SY7P6+bFHLRL9BgNxT4/P/KB8
         4ZIA03TYl/JBbwX9k6Env/IIzseVHSPV2TSRj+B1RDt6RbVdJpecMRPDSRLGcEqFLLiW
         n0DHLMySTbs9MDez7dlsbrvxzXxEcq7izoqclZiKaZ0L+2pjRXn1ymhBJc6I9rAcg5pv
         OawWUtbr+NUVYpY0ENlquYKhTKv9E/b62ig4P1SbDYHULK7Ua52mXqpllaEwS2hngkCc
         IDqH5gUFijT7vSKDEaPFSmSQx8/tydOZKv3ums59Db9ieFXEQjnjp35bt4xuUptLITOa
         OGFg==
X-Forwarded-Encrypted: i=1; AJvYcCU/7oO4G6HTWbRlRHf6fTwxs3/bKFnFdgu4R5LB/QS66EamujmlCKB8AVIM4/IHGPCtIMy0I/bwj8JBXkE=@vger.kernel.org, AJvYcCWJuFlKEkUJyTZn+/7vNmialrTCI1cKL/tn8c3kZZX6FDsbxVcig8LuNXIy77H1wqWBe+uypyvvbjWWndI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TO50rTa+x9lfbkVnzYP6xQCerVs7yKWn8kArHGXL4N++cE5Q
	1dIWM8uzlfyNOEGcEOZx/sAMJAwDBYY52buupYZYqQh4YH9WjE6x
X-Gm-Gg: ASbGncuiBgXJJW/7I8CkNYFvrEMksvgUoAIIe01Pts7ipz8o2Lsfv92f620bjvL7S8E
	P7xEKobZ8rcqvQGOkhThLxSBLCru4b7SWhQ/ugjiTa+mR0AKm027utcUNzcu0aLZuDSPIIOIlrF
	vWYAycLjOpIuv9kbzLZQrOd5x1CndJRM+aDBAHTHdOtQ4k+wCkAKKbE6IsVkY+CfXq1Qk53xxZS
	UUUg5FErxGL8Ca+OTTGrkzt18JIaYWsYLNUp5oKcn/+oA7KDWobvFNtjEeWG9BQLPwD4nmsoows
	e4sPDYR+pnnwWrQqgQ==
X-Google-Smtp-Source: AGHT+IGmQI8YlYmRSSSs1U9nlakmgv2vFgC7SMwvQJFzv85jTtuYZnRItTetNm56DGjM4pscViq7Rg==
X-Received: by 2002:a17:907:c80f:b0:abe:cfbf:3da6 with SMTP id a640c23a62f3a-abecfbf4065mr525026866b.19.1740567393327;
        Wed, 26 Feb 2025 02:56:33 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Wed, 26 Feb 2025 12:56:09 +0200
Message-ID: <20250226105615.61087-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete T114 and T124 device trees.

Svyatoslav Ryhel (6):
  ARM: tegra114: complete HOST1X devices binding
  ARM: tegra114: switch DSI-B clock parent to PLLD
  ARM: tegra114: add ARM PMU node
  ARM: tegra114: add HDA node
  ARM: tegra124: Add DSI-A and DSI-B nodes
  ARM: tegra124: complete HOST1X devices binding

 arch/arm/boot/dts/nvidia/tegra114.dtsi |  99 +++++++++++++++++++++--
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 105 +++++++++++++++++++++++++
 2 files changed, 199 insertions(+), 5 deletions(-)

-- 
2.43.0


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64134DB69
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142908; cv=none; b=XcaR7bmzKIGsxUoHW1lljpFDxuHNS6gfQgzKOVAu1qVlr8xPE/rF9xn2avzO8Q3j64Dpo3FqUETkrfi0+3/lv9v+J45cKKwg2OZAY/KG6NoLYbTOZHu2QO/S5Np3PkD5OJkDAHXf2m8p9OCoi/e5tdHbb/dd0FnHjwD65FkuK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142908; c=relaxed/simple;
	bh=NPYq2prUDw6E4LwASXaQMdEqr6v2oIwItNqZJN/XQxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfQaY1Ho6c6A5fJdRRIaHfgSWwMfusM1Me2iYUI2ntFa7owrWpdfzzJyDco8pTWIDNIrwx+WzXjRqWAc4kI1XNzQoWqgzUgshPLyIh0RqZt3J9YWf4nD7wWpGmg8IhewKWFW5q1OZdCsjAp8JRewWomNq2sDLd0hXHcGK6EtoDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN2k4WE0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN2k4WE0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4270a3464bcso3803041f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142901; x=1761747701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=dN2k4WE0ZY529zJSRBJ5ZwORqoW8KLeZSCDG6UUz7GYvoOwhMzgy1KeJ9j7hImNFYF
         6jgoUufnykUb7VrhHxH/ZbMkng2hRNLbLq1WXb94zmPgT7TBt1gYeZypt52aMSWdZn2A
         /nijUnNp08qxO3kNmhbsPtM1rZZ6YtRpStfEJITrlnFL7NeNBPcQxQrX09tmPKQOT2u/
         s+OHrFBQERBAlc/eA1zcXlLEhbwAo13Ju8WQ4DBjWVP6U7cE2wtMvU+GOUVJDwBNR3E7
         KyiRW5CeKo7CM6Ec+rKxfvq20nd6aTr6KFQO/Yy+9nbETsYnbb3kD+PZ/nQYEecAIMQC
         KA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142901; x=1761747701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=us8WLVnbygrdGf8cV8BRjXwEYSMTW/SIqa3w4zcGFr17SdxIZXcBi/nRE8CBtSu6wj
         zBZtVbQ8QYzlmKwDqqF2TiaRybS/c3U55QnRRqRc63O+VlbCk2uanopKoK5EJ1OQ/mRw
         WEin6DgaHhvQyXT0h8aKErHWH6VbbVAhLUq7bCDgj8Of8+8ePksNqTBbpQIPnfLrETxU
         ZeCzedpE0fnaY/aZfJA5eJCMzXQvVHtqmF9oG/jiV8UCbVezwLzhEdaZkyUbnaqQxamJ
         Fu1NxSOM03nfZ6MWneYZgkeqLfDorwBQSa7uHU/JYWxKmgrcAAdISdfIoB3eYSAvRiT1
         kGng==
X-Forwarded-Encrypted: i=1; AJvYcCWZWaXOxa1BfRlEWrbap3743G/R151HNZLhzjI+vDKGDDV+bPIpmdRXYMssbZMlfO4oxNZZ+hna02/mbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvmGORWoi80N7QUBXnfL2HaWueAG3tFeUqRRObpDPlA2Dl9wA
	iNXtNRQmDCiMIrmcNLeRIIqElQ85ln5iRfhyoHw/jWC7P0thKUXDSBJa
X-Gm-Gg: ASbGncvsy/cotMHBCXtBu5vvRLYdn144MI9eI2DUvFr8RM+44hKQqQBfagq3FEA0cuE
	jbvoQSokn1MbkwNxK6xLOcExfnCliboViWneQJlnl/pvokvTZw4wXmMBBxmvKBkdcOGRjreLwgF
	iX0X9h9vQNeJXRSN+L731NfIbPA1hcvRVpEZiLdoz9KN3LGnXicoR8efXZBYeWCpE8MQm6FLDq8
	nw4BHE3pNX0NrAS8vMOZlUOSdTBCVmqAWhSusrKKNOuShKMAs/oQtmTtTNtMyxcmUlSEDBMhscT
	j6DzVTYiYZ75c6LuG7eEHeFvF60LweWkUIpnsLwmrFWTBFKUanSvzmg5zMbNlY2Ay5Is7RSqmLm
	rNUo2WYNytFQx0Uv3sE4yvRIyqcuyOWWEIK5NNxE/8BKg4vIda0fa4Fe/zEdYyBbXScdVZUdvJT
	Jxsw==
X-Google-Smtp-Source: AGHT+IHM03V7eJFt3Eu6ja1MYetjG461AcLXE4YT5HRjXzs799spnfwnfQrFSdx7t2nEB8DurbecfQ==
X-Received: by 2002:a05:6000:24c6:b0:427:928:787f with SMTP id ffacd0b85a97d-427092879c8mr10794030f8f.21.1761142901362;
        Wed, 22 Oct 2025 07:21:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed, 22 Oct 2025 17:20:38 +0300
Message-ID: <20251022142051.70400-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MIPI calibration device found in Tegra132. This compatible
already exists in the Linux kernel, I have just documented it to satisfy
warnings.

Each Tegra SoC generation has unique set of registers which should be
configured. They all differ, hence fallback is not suitable here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1


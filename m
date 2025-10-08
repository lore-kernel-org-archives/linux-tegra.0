Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B152F7AC6
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908704; cv=none; b=dp9WuThkm+31Su/39iPovMm5WqcIFZCfRp9HBfKSwe+7hpC01k4JzR65lQfq08QMS+HtjEUCRsk5MIlq5hYakhA+KvdyuRSALg1F1u21KwCtDFajtH2037habqlwx0U1zoOkI0nxXBgng7jkSmQdDgePrjJ6aDpABEUVYYPykeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908704; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=invUhC8V2q4NEbrm1nuQxAc7rGs88vyEu5bJqEDZUWA9T7VLKKmvXVp8hw8v8HMBWOif9j7XDBLJ3xZNaCNVYuxmHnVA0kDpPOdn0LHYQjzbEl4aNMp+GuyIOaN/LLZ7vjVwjMZrWTXnPWKiPafgYa9hRMBi4kDPNzjisdS8hxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH09/W99; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH09/W99"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so8513267e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908699; x=1760513499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=PH09/W99bZ0/mngPb4vFpXUjdZ/CJN4JF2IlYA4EvDLB8ZnG4XfweYJYD7v8WNhWUa
         OPH8q0hmzfSzx+vokBxNJsYav5VUpUN2PCHeg6O67N5NWlXkKiPAN1+uq5Cb6tmIUL/b
         eEIeWGvPLTf9UmZMumwTGKB909yho0+mb2R3mTWkfqwzc8HGsDXRR6beoWf8DSKK/2af
         +IItFBSJllCwPxv9O+zGjGzaX3oywjpez59dJ7J5B5Sxs3OkD8OEP3DlkJqb3jQLVGHW
         bAJp65/VTT05q03y3D35msG+ezoSB65aafadWVcJJ3gtS+wnklPWVMIf6olMdSO+sb2j
         MOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908699; x=1760513499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=gdBHafoBnNC1TlQ5XbaK4XBkIoZ124oCCRKf+UL2c6UHGYxzF+qa3Sal0eR0w7SXeu
         NUKxFBiW1v6Za0EFfMdhPc6YjR4/mP1rhMgZ65Ql3MdoaJWQBU+D6+vl/DuUZbjlhxkB
         RnbeRtShFAsD7UjFhKLkW6Fqg2SrjChvTsElVQOYCC3EhXK5G4SZmHIi3GE81HcFpRn6
         aj6oJXXaBGoDWzAWKRSpdnvsvU8rIVvbGU4vNfBX8ZrjwrvQvV6AORb2qDQ7xh4BTPpy
         cHQ0pepEPO7oi2d/owc38pCHPkHGLKeKk0hDI0HYHxEzLSN4sO8WT8jpBco6AKmbUzvv
         aoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlPRQYA7gp9Sd4zN2nIhFtMN7LGUW3p9Ah9ZZvt+OWFYQ5uAdZSrFki7VdpAl30KtBze1MolG1SA+Zbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyILwjXbMg0T1YXnENAVyKsvBeRITBteUh34Pdas8aqFSRk9YFf
	+GsJLMJi3gEwcbui5UD5+F1nh15DJk5gfKv0DILjF3S0Oab9pDMXfwP0
X-Gm-Gg: ASbGnct9XeEfB7o5dMOP++RdaNnT2CVr/QwCxx2bTpn8t25R3x3nDgry8dbi1ZDhPHw
	rI/qizRnRUnZACc1Ub1XOifBoKXB4LSD6MU3VNH/VEkRBw+ICrNGGiGPyu1hG+3kiBTMt5WokK0
	mEL+IRmcuK5BVLy8gzyWADLujWhWUoZla2dEpnxRopyCRo9e/D98bJCU3sbrBj/8EK/4FWKJyCT
	SzkeVe3MlSYwpkrFfrCFrou1lJ9BrbIkl7tRX6dGAiGggnH6eOXu9tTevWja7DwyGJH8S4mIAQK
	a5KN8tbUsfshy8WnNJsc6+apPHzgZffgoZNnNH6k+n6n80FTr0tWKWgomWeO6YW7tSNkTabSVZF
	/TBTHHeTUQVrBKPU2ABCk4ZAXHQQKD4VeDZ5JuMp1+oOJPtJL
X-Google-Smtp-Source: AGHT+IEFplvbNC950NzSCz1hsTj2zh7bFgfmbElqdtfxWz+oMV6+2KVz4G+D8Gd8rLXbzooyRNyKYw==
X-Received: by 2002:a05:6512:b96:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-5906db0ccc5mr608183e87.1.1759908698844;
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 15/24] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed,  8 Oct 2025 10:30:37 +0300
Message-ID: <20251008073046.23231-16-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
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
2.48.1


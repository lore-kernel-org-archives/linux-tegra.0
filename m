Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38013635C
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609974; cv=none; b=Q4L+Bbmy+hOxkWerWQzIzKs2qxKC6GCpLgc7YSuCUxM0JaE/0iI8PyDh91yK8VjzF0wpKPlfIoXuatD3jFNs8LDkmKFAnsLX3J7VRUIqQaJgpj7yayzS4IM/RJ1qHPjLxribgLRwnQ3PWaKPOrpUq6C5S6s9QK5GLCgRuxFUc/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609974; c=relaxed/simple;
	bh=kIeB6j/N5+LCrPUbz541JOTO0YZVR1wj0iYYqzqWfrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gG6h6sarHFXPyMigIEJkidmM+eykTNPxk8Fgh1BftNPgzU0REueFV3xc35zKhbwNwOqW/xJ56/MKLEVwHQKbKkHOJWMURA9/SMflq5v5lWfJ9FqEtf23qZZsErx89h5v/LWcMR17SnjgIP1+YfGOJDTe+MPof3FANhz3pz0X2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsVjPYrA; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsVjPYrA"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233b953bebso1782225c88.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609972; x=1769214772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=MsVjPYrApOq5VNP9Rsw4q5tYcJyts68cJ/25I3EedQOVF507p2EYjnbngJO3J2Ip5/
         LRX5EhmA6qrgkEgFeQiG1QEpiDCwYB7kgVeZKe3e7eQjx0cgnFAB8/QGnsICbJt/cL1k
         VpcXBX5ikKZuiz9sCkGZwZ4LH35yprBoBam/MF+9Uij3k1gCvP2QIQPuvaVpBxaPgXtH
         w826GNuVZW7Ju/LCmC44Nlu3edxgVhOOTnNWfJBOUkGPFbveAxgSUeLWyLEolK+Xh27z
         GZRQWbaoU6aUpOVbRy0Q070uOp0AWSzT0UhQaWDj/zrll/+y9Mc+6twH4X42BrQEGcwV
         /pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609972; x=1769214772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=g+fXWgA4QxLUWq2GBpoS1T13U5VPRZIVpJ77zdl/rNpQjGk4UvUVVvTSRVxok6ori+
         PYtcp7ZhF6w0uyUVdmsX5ryMYcTEsMXQIcBmlR0r3MQIofG5MV9IQRmHYPqbu5Z/YJ05
         NT6sHEujo1Xet31TFeasvC5+z4VQPMbwVhjNAkozFiiAPqpYnhR1K4kIlLCUmtOrkPH2
         nTbh95whh/donaBPbVs6nOilblHkYX1S4u4WD0NGdiL0/6TbVdY6f7ebFWqBhh/Ff6EE
         03QuV7bpskYBLui3PrGRnFNicWkJduJB9XdYBPMiWZrDuvuEQmJrKZvtSM49Hepa54CM
         N0pg==
X-Forwarded-Encrypted: i=1; AJvYcCUwJWHs3UpT8ejVSs4neBaK4a4p4/V+wFHhZL7woy1w/HzSRfMI0cp/RwlKOByomoqzJQdKcZ1xkWikjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSMZE4lZvFS0mnnWIJnJ75KO2GF/NmWBWpSWTvnHf8T5n/tdht
	bI6FGsSSK4upg5gb24mCvNUsAjsGNLRYjheMqLIhFzkXpTlo/Zz1J1uD
X-Gm-Gg: AY/fxX4c2UmNnHBb83cku9+6UoIjJRKcjNbADe6DzmuXxDzDDA0sFM1q+BPApvdg+fS
	jmaghZKF+W6CJeMUTPp488KCyBCh3npNJedBsdfasdYDLVcT9IlLWWz4g5YQoFHvsYWkH4EzzjM
	TmE+IepElHXhDk8Y/cxpIcqj8nmIZy70aooQPLZ2as6/24+qsTc2mBRf2rr2iNYY3CKilWnLbGN
	nW8pOj2/45Gz7AIZbmMUwD1TUO9a1IVCuwHNfmiG6dACz2fJThv3ASB9nNubLUipfrXKJ7wlVPJ
	6mO5ZbN21hNmXhD07YQWG6SVzkKR3pSua7MuOtTON8YQGKsTP5lkyZFPNaAEtPSpQbTJY+xxwYS
	o/6vHB4VHMwFGbjraSa4cDdSfHr/WG2GSTiPbf1Z108KQ+FFSMbIY21nVJ/EdrFLiu41Lw0kSP3
	m6KHnoXj3N9MJUc5JJLY1q9E/V8wAWYyRt2k779glCqdzojDMaHquSP2wESQMz93+xSaXArvAE6
	UXEk5c=
X-Received: by 2002:a05:7022:619d:b0:119:e56b:c752 with SMTP id a92af1059eb24-1244a73c91cmr4320247c88.23.1768609971804;
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4822622c88.16.2026.01.16.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
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
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:32:46 +0100
Message-ID: <176860995606.1697785.9777722896876428268.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[01/23] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

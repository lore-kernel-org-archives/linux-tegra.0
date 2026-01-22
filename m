Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7296530DD1B
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095648; cv=none; b=Afhfnb4UhJRNkgHegKOKJ4YueKtyCp85q89U4ZV4plGo2yJXWNb2ZwB8fhRODL6JJihtvUf7jH60Iy3245R+FE32o4nW+6/R6II1hqHc5sZ/RodXsliKLtQOJhBiQECvdhGCgZWxNz4H9/PTRhgKYi9B0zUuAlRkia9G2SCJUG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095648; c=relaxed/simple;
	bh=UcV0AhIB6M0Bg3IInM60h5ZCcHgjHuL7ZH5ZfMOSocg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUK9kLy3G+3AmBMF4iOrtAB173JhVydrEQBriJ1aIIO/6N+Xr1LP3SKT+u0wvEaGaN3xhArBwzoLkf2m02JNSEOcn6u2hzpI9uJ4QlVERHHi6BjDDFUe9Bo0ci2woblZxHD99m7tqAqfYNKf74yDbGEk5jiWeQjCDldsk0vBbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVEpokdO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVEpokdO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48049955f7fso7552925e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095645; x=1769700445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+Y0827Y/vL3PDJFbPeKfU2v6zmQt8MpEnv8eci1e5Y=;
        b=hVEpokdOSLK5QyWon19UOvsKJ1MpNk6slswYHoKpqCUp1ghELJjdfZUq28EGR4gM8g
         wbaLOfphBkSt00KtzZgSEhZ53QNXwdoUtUbkgzKsxMRtCPtYXX/WJYkKDZXTXV/dhad6
         YR3YC8/+V6on3Kp8OtLsxU+5blG0mQghxbEo63wQzmrvmhosAAX/mx+C06i8ZS6LKWgN
         n37D5xXFS5im1q6FlzeJwLzGNkn96v+G4gF0Z7VVXjXWKi1dnJmEsyNOl3z4yowN/UYh
         QtT8+9ylw+sInpMP9QqZCw5fQ05z1KKpJ7xxl6Tkjc89BozdiitLrwkl4uPwtvIn4/DB
         nXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095645; x=1769700445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Y0827Y/vL3PDJFbPeKfU2v6zmQt8MpEnv8eci1e5Y=;
        b=mRAwAdyJajxlbrDXnxvSATjK811mV24eT110WQPJqU+BssIrxzxF6/yXvGthiFXhAN
         V9GpmOeOGlVC/7q/tlDvmmXhz47fQxa7NMka1UHyuvrEWjJtY6JiyP0OvMCzcDkqZzdF
         2IPJ0nla6LX93/0oxoRPCqOW+rG0ZDsKCkOo2AL9TKMn+mvlY2C6sFzSHpcy/uIpqNnZ
         PxYr++128VIOQTP/DdaUajYMHWz8xg2jRo1LGmHEzTipTpb5ZGx1LxYF6enEmJbco0+O
         z4GdaduYUd+5qmgyEFqLGxQgoZ6yQpkjyzmgI7qIBVedfzEitvW60fx3jnPxBTWsdKUL
         Ggjg==
X-Forwarded-Encrypted: i=1; AJvYcCWzXqlyMvUw2gbB9oxRQMAzo9UO26kIJ6U/kvd0w653yDHbskrmy3lGQkUNFYcDcyuCBzHOA4gTaNoqcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lVWJJ0v7c7pWQATyv0eAwBeGX+0rAnaL5+BahPX/82FQNObg
	m2IIEMrriNLXt/eU2d7eO492u3NRtYvoT/DjPoHjb+490s7JnZtDFaFlR/f8IQ==
X-Gm-Gg: AZuq6aKbTVAVRajyqD4D344UcSGNtZ6uyvhC1MBJqIEQv4SfxnKsB24W9PGMj/gIQGS
	h5reLcevGZG9lAixTgXCpSiop+CGLWzMlXL+A/DHNDJbnxXD9aMZohmw5J4TFWVv/NO0t7RfYrI
	onoZEx8iyxK5+dx9oWkZ1O01aEeBddfZmdeTy9SlJSavbxyf5XO1mkmK0TH6WkRSoWmTt4v2amX
	m5l8IOKP8c+D6PQ+e3QGWpVdHi4fT/eDTB3rhJHR6HzRwNwsuSUJKVKUOUpeXzETMLYSJxtvUy5
	ia7V/NIk7sIX2y3qudLe07BulwLbgqgSqE/9YwdvaMonFJafNkmG2SGfiemDLeQwtyv9Pj0CXzm
	0vDk71R6IaG9aygVJxhugZmuHfiG62HpUfSVtnqQbfY8i/UEyrWNdPF7/VGQ0sAxW7I9ln6VDeA
	cD
X-Received: by 2002:adf:fa0b:0:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-4358d02c81dmr14327696f8f.26.1769095644437;
        Thu, 22 Jan 2026 07:27:24 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f138e26sm20762642f8f.17.2026.01.22.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] ARM: tegra: lg-x3: add missing nodes
Date: Thu, 22 Jan 2026 17:27:10 +0200
Message-ID: <20260122152713.8311-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the recent kernel updates, Tegra30-based LG smartphones now support
several additional features, including an RGB-DSI bridge, DSI panels,
MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
buttons on the P895. Add required nodes to device trees.

Svyatoslav Ryhel (3):
  ARM: tegra: lg-x3: add panel and bridge nodes
  ARM: tegra: lg-x3: add USB and power related nodes
  ARM: tegra: lg-x3: add node for capacitive buttons

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  23 +++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  33 ++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 174 ++++++++++++++++++-
 3 files changed, 227 insertions(+), 3 deletions(-)

-- 
2.51.0


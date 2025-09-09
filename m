Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE133093A7;
	Tue,  9 Sep 2025 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403239; cv=none; b=OGpMctvSd70O04AyHKxglyaMSlCMgxv45zx3d/SNEux/50PeulCOgMYb8KPakViR+B4fd7S9f+qutbl77C2C+vp6GIjr+Iz6TEWIfRPFg7dnAHJ60SrL0zBnP9P3A6e/UeCQP0Z3AnjdEdQiVrbIS0d8yBDHF8m7plFmBg9NaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403239; c=relaxed/simple;
	bh=DnuAfJrDCOqBNv9HIBTYqZkEHEKOnrdblEv4ifRQ39Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Klu29Hscf8UbcJy5raT8t/Gp+bRdSiI9QprAO152UTTeNfXJjBenAm9OLVWCzZpeBg8FMOU+onkTZUpIBdSs2QKiaAC5THJUTXWvrCV5DSbIA9s33AWVPvxzgKXivvTJb49e6b5khd6oiFhgurF5C77bO00hVdSaBBoPfLRuXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUsSyM6M; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUsSyM6M"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6017004dso5525702e87.0;
        Tue, 09 Sep 2025 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757403236; x=1758008036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
        b=AUsSyM6MaK4zQizTv+lyPX++yLC/y7X4SQGOm88uYGPoHr6HZvi48Ufk4EYQI3Fk8J
         +urKD+FUmb/THOGCmzV63B3kT3/D7q0pcTEyA89eBfQlySnSuYa6QM7HRJySyRNUMBYj
         4BtTqtRKmMNfr/95ew9BcZezseMLeuwqSu3nt10+O+2xeR7w4hMkoVxb32BT+8KBH1hS
         uQG3M+OrjlVvj5/4yu0flyyI+Y8h/1hU8y4MASmeEMHHz7OqNPciU58d8V+v6Kaz9OV6
         SZyKCNfbAZpfpSCvrjEny/l4oi8RGr9PV3iPcDdNcttTPUFbPP1WfKJd8eGJfLwQwn6a
         7KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403236; x=1758008036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
        b=hY3n2+j1sAfHW98tZoEkdPDcDiBqdJqjYozpJWY97LJXsSaG+6RsAKTbDZ1eDljHXO
         nEGlQVmCBvQiae5HsRpcvi13H5O17zPuaSX5xUDKzXN8C1r17R4a+ap9kEKrGEwsgsmq
         DdI60PV3ePStAvCkm9nL5WNRYbt8nbmxvXQjO3n/ZDup7He8rj/EuPH8oYJ/vzV0tViU
         sqNqLOoE6+32tn7YWfI7OXqArjwjZ2a2V6PGbguT04qaCg9lGiApWQzQa6XdbbRyFNpJ
         PT5ZUwJ2JdlFt1OcaeMxskU5pomFCCBKqJT5iYcydoG2aIqZWzxQfceoDZjm9+TazGsP
         JBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeOZmT12YgQMWd3h59V1DGUN+1P3zmRDw8lWERpN4ZzECTIIodQgoCgfSkITJnFrbTrnss3x/U293dXYc=@vger.kernel.org, AJvYcCWbVmvr6/C7pIuOhQh7j9oZ4vqa4lYz99DwmKugbT9zHQSSyC1Y3BnvwdyZAxAHbx1SVpMwkvEo+gIiMfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAFx7w+hfIHupjfKHufyqw9enc6LGC70llUaZUdBfzDJt5Ja+8
	S27diuS63Hb0X3uN/88KHA4EaBFfIVjOyjZrvLnW3zka98+gavC5CV0jfGJ6qg==
X-Gm-Gg: ASbGncuawEOJV/9E2yh0r4QfHw6wuOpnwMi8Oqkpvb8xBX2uY6q53rZftkdD3XX9kGF
	odLC9sbUjoWNWEoEmfqii4PtoYfzenAKWJVIumdqBF1bHR2egh6KOpk48LGOnMKKhJPUXVgEsFm
	VimeB8/OO2U5V6Ybl2fXcXPFoevvwZ9lSP4RUMIXHB0/JIM78FDsAp8u+fnznhJBqtaNToKIThs
	YJS1lbOBU1yUdc96Zen6SBwvTunoDo0tkN71Utlo6i490ZGUa+qS8U1OPNldMZvhTQrLduJNA5O
	xl/jwJVNlcOh/fgle+0mnZqGlwaCQz+FWhw85I10WxT0jnY11oUvSCJiFTdlKRIehJfyvH/wOp5
	sV0Eo26YiEbhOfcNWZtVx692n
X-Google-Smtp-Source: AGHT+IGjMMjfkQ0CKqDPHSfr3u5gr4MAKDQeP3g72Tz6X/H7nTPmWyuKEWbcJLScvZ8uzCudkkqSXQ==
X-Received: by 2002:a05:6512:b90:b0:55f:3996:4f82 with SMTP id 2adb3069b0e04-56261314783mr3256215e87.1.1757403235364;
        Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] tegra: dsi: improvements for video mode ganged panels
Date: Tue,  9 Sep 2025 10:33:33 +0300
Message-ID: <20250909073335.91531-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand SOL delay and packet parameters calculations to include video mode
ganged panels. At the moment only command mode ganged panels are supported.

Svyatoslav Ryhel (2):
  gpu/drm: tegra: dsi: make SOL delay calculation mode independent
  gpu/drm: tegra: dsi: calculate packet parameters for video mode

 drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.48.1


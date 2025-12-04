Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE039F513
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828889; cv=none; b=TIP5Xvk6LuPE2e96gSVO81hLXZujdqdBVXeeqVup554r3EWmcS0fZtF6bEgYfNId4+rMJWpp+g7awV3jLHybb0hEzHun87SkH9zgZFMv3hXZ4nADgb6xAoDGHCvxLZuKi9ZWlByle7HGY6sqt7q0w5zTf3tjd+TG4IWkTw/du4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828889; c=relaxed/simple;
	bh=DnuAfJrDCOqBNv9HIBTYqZkEHEKOnrdblEv4ifRQ39Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STDO0VC/g0jkkfOgztDHVk8s86gISpK/+OVMBQlzjBVbbNSY6699UIzG8Wi5fBJ8YuPU8w66CQ6gBbGMXryE7+k7JP7qOc1YVUkdMW+Yo0QarjRsENHYeEEg9vi2lbYOjzdI9vWqFJh3t+WzxSZQXvMxkqjYgRJiJGzW+YhYo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kACzmrlg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kACzmrlg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7277324204so87138566b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828886; x=1765433686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
        b=kACzmrlg0iDzJJnBouf+8A+knVLolIWLEupXznpjraJoQTYGYd6ncKTJEY0a87DleG
         xQ74jEPl6Q4HbdObX1BTR2Bqm72fzIW8FJj9Zm0+J9G/Uu/VgIaAdVVyf6ZQwa2/+orF
         Pcz/5XbssueXmCpnL8lkevmtQ026rLd8cAc6V/S8rUTMshqKvfy3gF+ihgjQ/Syreb5P
         qyTtDz2t44hSiGhaoO7BGeQuKhRXKstrH4L8QbQ4vr0yGBcJCRosonyDzp6e9Hj5LXSl
         q+U3hNrLSyGXEbyROLs/tBr1siBhD+ECAlDoBhDaEKPOO+eh6RymHc8JcJZ4kEgFcEjp
         JFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828886; x=1765433686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
        b=CEIOHKdE/l5ols3SIu58g26fhcRatcO8WPbfMRU87ETPclGP/S/C2xDza+rb21w7MC
         qXirbfWx7kiqeA88Z5ODZJYBcpKRVOtge2GL4ey0n1eMX9Wd0SysNVpqRCl11wS07Uaw
         rMz7LKCO4kqEfiA1qQ8lVnyuju6LFmhJjSZ+/ocN34J9CGedQ2XPVzAEx/zQJ21WTOqF
         Fv6SJ91CpFQIS6cGcXQkxlP6yqcsRNljMYawJZhPO28QdXz0o40euSVsBy4GSmB9BlWU
         a/TCpUJDo0AYEseZa3h6T2kS9PKLHSEGrR+IV25iIZEjWmeAQrUD4aPMeEf7WnEHOidw
         IRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTj0/2etjUTo6rbSnZ2ShdS6WIZya5ZZy740qlOd6/I6okTJNAt5lCuwDK/t1WoKayn9a4QsvVasvujg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dQGiUKi8wSw/Av/N367tGFZdmKtfRzXwq7w6leKkygtpkh8+
	QgC0N3vMQrNs/6zxj+9pzDovQEYuLQ8UhghBpjzWo7sbGKtU6vapLXua
X-Gm-Gg: ASbGncvirlN+QqmF54jyxvobZSIk70I1LzQC3LI7CySltnPsiGJlbpHDm9yTIP21cA0
	2jAobSc8nu53QyhKXVcq6EkXI8UbDL8F67Y5gpWQazjSFyu4FXRPI9AVBlr7FGxzMgCbriuEIW3
	c3NWRBzPE+YWEFE24XjPNDvn2uovlcVkAG8RLlS+JP0anXA6Uro9A+DuMGJon7c31I4NdWJRUsu
	ztTGxd2box3lV6SeXuTKRCIWK/PyrUlLP2dR6kUjAm23WrLIsCpvrwVTx5CVF2QRuTWoSdmJehG
	z/geyD/yiijx++43vOD0eXPhqSUm6RAOEVD7d2V7N3M5cmUAqD4JcNY/86rkUHJBUmUcAJmxOtx
	WalChUcKUD+uZ6FOK4CHE7/tBMwzd16lqW/eqQpkFhlOyE0A57siF1ZUeBSiPW5qtF/PDdbWJw0
	w=
X-Google-Smtp-Source: AGHT+IHX/aAJO7lhZAMTIBgpnvH0r8cqR/h+/J0o7DwRw7NK+YI/qMGFLjVbAIUUAbi++n3shAilOQ==
X-Received: by 2002:a17:907:5c8:b0:b73:21af:99d4 with SMTP id a640c23a62f3a-b79ec473903mr181931266b.24.1764828885950;
        Wed, 03 Dec 2025 22:14:45 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:14:45 -0800 (PST)
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
Subject: [PATCH v1 0/2 RESEND] tegra: dsi: improvements for video mode ganged panels
Date: Thu,  4 Dec 2025 08:14:34 +0200
Message-ID: <20251204061436.5401-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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


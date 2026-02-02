Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99912318EF8
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019553; cv=none; b=fP0UhZgFDT6vd6RgdWd7mgQmL2FVEqZ/dN9yW1K4Amr8E2xFzefdlMOMEamFdgJqRMynMGKokhLNl5vpVlSVqhv40rvsfxp2CETxnB6ZTByePzAWlac5sD/GEkyEGbBwTEnkzp0Gy+GoV5TOfsG718KtwyUalgzmnC8USv/pUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019553; c=relaxed/simple;
	bh=Qvm9jC+cvRFEScvCUGEDNUwDx61WI6D32tWIQpczjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbFUT0pGaTLU0fvdqVJn31ikg40tr3A2jKPSiR16CkYEl2jkE09BRYAYujMGO5vqBrpQ/ovt8vxENKrZku8x0Jex5q8x1mZmWsv2MidpJGRboHZ8JeKNR4k87M7iU4KWQ+w8G1tM4/J5iOpCJdAFMP5Huv7VmuIOz3ocMIF/lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbsqRm7v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbsqRm7v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4805ef35864so34350795e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019550; x=1770624350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlNdBeStLZycw2ZrW9yB0I2chWTonliioSXnljgFzrk=;
        b=dbsqRm7vfLK3wtFRv52aVpbzLXiQUZbmp71T/0jeM9mUUeVoL6FLOveKiwVyLGKBfO
         6baortBkusX3mlYsrzL+tSTTtsCvMPRg9WHJvZ2Fuji2gUG1Sa8o96vOFF2dtlQ/u4Hs
         DiDm58XXYqZm/sV+0CUNR8zUnuVaKrZkbG+BE15mPZ4Ru8qBHkCccoJUH8PUsNy7jnJw
         mZPjVcpda0eFDW4bRKBvVndGn4nQ7YzwQd2VH05UtSDZxRnIuBgracjwP08ibo1akAB1
         /5glly5X9qb967sOLWyzB5EKuYVKj7gVFYvGV/0PhgKABGBoAVh4IwuFOmgQeFvuOJbm
         wCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019550; x=1770624350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlNdBeStLZycw2ZrW9yB0I2chWTonliioSXnljgFzrk=;
        b=dUdO4jeYNl9NiTxZ8on3vmSlHzz/3XfVV5o1Ee8oBFpIlG03ot5hjbtZNu6ntwVnf7
         8HiyFyvVJNJoVT44jl/cWt0gHucrMQ5NEql0S+Xb4YwGET0wxCCGLv5EFoSzvvZNPr+J
         eH3HSlsVOj2jmVqrc7mDXnEL6mswGmbR4yVWPHdprjSIxm/TAekOLWRHGUuWqiLukj04
         IS6O67vQ9GDwx/3A6QNfeDjNiXVgwJqBaciEUcqw3qHAzXLJzNRIf8rDh1GcYC3+zyM0
         JrWfJeZhjQNkFIGtqwWXmoAV5G5JKysniTKwG9mp+tX+W2JwNB4+VIpZKj0Q731pE9od
         Co/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOekhcgw3yyzQZ6UtqHNQHD9GrKDQA0kNCYk6ZIxQaowjiYg0LYDfiLErbZrA7JqyCSGq4ydRSDyaNqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3QaYIykgVYm7TCpDCEa64UkXIXm0K2pwEtPtrwS/XeG4Wyuyz
	UoYQ6zDu8pQP0z2ib7aLPjuU6J31cDZinltn/FkCRdWecftF/eT1idyR
X-Gm-Gg: AZuq6aIzZCpKkLEyRkp7eGSDOArvhFXWSs+f9G5LZvE1pbUDumb/pjq3YMli9/rMIVV
	ityEsssJoBa/3r5252a5B6/c83pav/KvlM9LuMLQk4BtSZMJmMjQQbjDtGxarkFXPs25/U0AyiE
	OUelfjiz1ZMQH4Iz7yWE42/BS0yG1FTHcbqDa4QSMi/sBWTeNCoN7B4Y96+bCgFlJT/COrpXcT/
	fqHoAxc9QjE87xdRIkx22EWa8XFzyInIWEmH+CPMJfsddkidOqso3rCIQDvM0LUE/UWNh95M0qD
	NCK1/9BB1GOwLKThFkpiQe/CxtdLhi5ekbrjpONsooqvdJfieiMLqDY8lLDoAsGCPUgq57/sK7p
	2AVv6d4bOcKq7oQVgjeeO95lNMFknckn+JeF+3tU3nOI51IwQ4lDLEd9BJSHzWktmTYHunCwjPd
	cV
X-Received: by 2002:a05:600c:1d1b:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-482db4973a8mr124237605e9.36.1770019549680;
        Mon, 02 Feb 2026 00:05:49 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] usb: phy: tegra: HSIC adjustments
Date: Mon,  2 Feb 2026 10:05:22 +0200
Message-ID: <20260202080526.23487-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Followup to a recent HSIC bringup with a few small improvements.

Svyatoslav Ryhel (4):
  usb: phy: tegra: cosmetic fixes
  usb: phy: tegra: return error value from utmi_wait_register
  usb: phy: tegra: parametrize HSIC PTS value
  usb: phy: tegra: parametrize PORTSC1 register offset

 drivers/usb/phy/phy-tegra-usb.c   | 45 +++++++++++++++----------------
 include/linux/usb/tegra_usb_phy.h |  8 ++++--
 2 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.51.0


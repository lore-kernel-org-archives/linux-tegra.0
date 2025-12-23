Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E522832A3CF
	for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483144; cv=none; b=B4JGMydsjhzj3YWjdqOwklBbsg6SsQa7xbqKL3os9go/NOJEYVMuaHYVnSjDnqiBit3Vqi6Azfckk018wjf5d1av7rxxAA6QlFywWOoAtY2MlK+IUBWiBiQTx/0Y51MpFok4LdX83vlZFWXEg71J9rcR8mKy8spfAL2TLE0B3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483144; c=relaxed/simple;
	bh=n8iF6LCWaznF/QJRdWglEOUUfpSZ/9BPHJWWYBW+rpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VBae6QHEI9GVuVSVdQrSqIDv3FBH4j1+9EAzdqnP6GsU3ZDu4UakunFDpBCy2bajqQLzCxFPl23uJQYnqDyYo8gVgfuBzWObZzra4neGYLJYEftlBkqvBB+gukNuTJj+HH7zdJvDc43+HJzjwYmpTM94WNO3wR/AXvzcpOvlW8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boo5cDTi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boo5cDTi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso48835265e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483139; x=1767087939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yf7DR4twh1KIB6g4P1BYW5Y1pRuGiPRcjhJO0s70M+A=;
        b=boo5cDTiQVFakEPQFPz9SJFAT6LoNIVHP13dC67gkw/gY3ZLH1cq103UjV+y4UT3ZY
         T9qr5RkGs72rHXNNFOxbHIzICLBl98HozBy57jxi6rQNgT/4GFmJ9basZPVJmmuR2quZ
         Z8WOEcVaiV3IgPrt1tuj53Gx+C6v6kijxj3umNTrfqHF+TVAxXg1jhl3gMHTdUlKuD1r
         5KPPEVnTtp7g/FGBoZbF/qRfogI+35fvgWHpIH1JUUAcYMn3R+n41uRtXrk1PEb0qWIb
         cBG4J8v9iR06e+J4K+VlUem5ePgAHUkeuKk4z2fUvN279RTLNePdKw+X0QDHXivB9BWs
         YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483139; x=1767087939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf7DR4twh1KIB6g4P1BYW5Y1pRuGiPRcjhJO0s70M+A=;
        b=Izjt9eLN82Rul3BOPyu5alcuCPhFunalFhri8MRkw8oynK0eB6BhsjUtQn/PabPB9z
         iOjpK6JQKp6ZKrqCSsgwNXgJIPqLDb3ke5I6l4j3eZnLiPPjxajpmfXS4gU6pF/TTb//
         +uAhRotlyHDGZcQ64ekj5/MyBTUO/8gK3/t7zrcIVTCyZ394AacIkNThxC8RGdO6tYmO
         t+j9yTSukbigzxk+Qqimk+FkO1D8g+l6TMm85CEtnbWnfN9mRmd3xyiHcICciZGwktt+
         VGlbI5SJ0Bj0NjxhGxMUwyfE5lQvAyyf5sDPTL+uGKcYwcMqxsoQDd2xRE7N/23TWjkL
         iarg==
X-Forwarded-Encrypted: i=1; AJvYcCX130peZHwbW35hzqY2yV/dI26H122r+c5N4NHK48NQF40/xjpYW5tKKeqtqZ0+GDDinsXLtMhlY7cTZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqIzRKSLJwI5X7CnTuthPkSq0VouLUg3aXqCSqfozG1b3K9++
	shUEDvb5iG//v/vQK7ElydA6vltdoGHtUjSa8QxLsZK52wbp25/+YOuf
X-Gm-Gg: AY/fxX4VBeyFmNcSuDYCy2E+0B6o0/SVnm2l5XFlaVFepk4IoaLAQ9iKIC/+wyfis+j
	BzlnAh2l6BXV9c31q3iiz3FCoDmhrHysQDk8KWYcc1MyAh5nhjK5laBB+MlYoCXgn7evtW4/8jd
	wrUAvChj9N2LK0cy4er1cJ9bG0gABypEzr38vSO2b/PHmlDI8NlG6XGN3Qtnt6LC6ZtzRq8kh+a
	Ba/6bR8Wa86HKc9vwO+/4z0NJZMwuzapDIr1BtDyRSChBQBfA5kInFmYeIq11O+R/SJiedTIgLy
	Y+WtMbpitsNj87qP6kijwEOYzdMqg/B7yMtQ79t06FB+g/mTXg8AwkDvxJuvcNuVsKt5zu11RZC
	ji/UP5/6wfyJ4XHt24FvNu+6SxdRapve7HlXv0Sc9jCdKC5RzfP2/7Rc8NN15Foq1ChBFQpFFvR
	2v
X-Google-Smtp-Source: AGHT+IFV++vN7dsdftN1ei3bMzYC7um5UeqpqsXHA4exMdHm8/svGPlsCPKkkSe79zY99UyP9ZCiBg==
X-Received: by 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr136008445e9.34.1766483139187;
        Tue, 23 Dec 2025 01:45:39 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1ae12sm25759024f8f.6.2025.12.23.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:45:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2]  usb: phy: tegra: add support for HSIC mode
Date: Tue, 23 Dec 2025 11:45:27 +0200
Message-ID: <20251223094529.7202-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HSIC mode into phy driver. HSIC mode is supported by
second USB controller in Tegra SoC and is used for connecting modem.
Linux kernel has support for HSIC mode in the controller driver itself
(Chipidea driver) but USB PHY part was missing until now.

Tested on LG Optimus Vu smartphone with Infineon/Comneon modem on usb2
line.

---
Changes in v2:
- initialized err in tegra_usb_phy_power functions
- rebased on top of 6.18
---

Svyatoslav Ryhel (2):
  usb: phy: tegra: use phy type directly
  usb: phy: tegra: add HSIC support

 drivers/usb/phy/phy-tegra-usb.c   | 298 +++++++++++++++++++++++++++---
 include/linux/usb/tegra_usb_phy.h |   7 +-
 2 files changed, 275 insertions(+), 30 deletions(-)

-- 
2.51.0


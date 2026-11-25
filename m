Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645564;
	b=Xd7DMVd/pldpOpqGhTe47aOVunDb8JjB9JRFNwiP3tXykMpUsIdwBTmyxkkzpcsi4Erc
	 hfJha+QnbRIgqq0EVyvAQ6Of8oQBB3U9lljtdrH1Ym22Vq6fWkXL77c7X8O8dUlb0KDbA
	 //Sk0ET84gxRd+PTaLHrZ4uxZIEpnm/48NOwp94OrpHhNGdzV389cdiCQ6d/q5pfMQ/CZ
	 itD+kcskbL/ywki7hb9mtBfKF1tPf3o8WbpNRMlUPwFmKTHVfiuizxG0zyGKulNWVrQI8
	 Dt00NHHYuNwqKoW5bZPOHlpNSlducDkCeAZtV0xf44nLfbO8Z47hUv8aTVEySwJBCxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
	b=hZk82cn5I0EIbQOZtkz44tAKsEKw/KlPQCkETu0I6ip1/iKd1LfkXU1wtiAIf1NSe8CU
	 ggn2QyUOwRjuErqFoGJjmt/lEvFwkYilk3A7mDE4U0nkIYBzIro3y0J9rBO17rJP9YaTq
	 mEjj5UHCGHJb1jOJENqyVJu0txtbHtEDdM4Sm6LpmDzK4ukJwsEIh1XLp2c/+4dtxe0CV
	 nGvi8zxZX9r05khBSs/mxbk9qGTd5rn7WPRbD6ngh756M6d4zTAnIf+sZw1TEvZhnCSmj
	 STF/TBhiOd4E+2lY4jrKOIsHmZXhv166uPYmaWVtRidB2lQ1/o/KtEypI/s7YlkdHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8D606A334
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 22:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA8D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYr8UlZQ
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6653040eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 14:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645563; x=1796250363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=WYr8UlZQqejsMUyRWfaFcmN8i6GPXdsjEbdVmmsQh0XcQbpE2IfUnuGMBAnov35+EW
         yAGEQtWVJBG0nHdmMno1WYKwWuw7WlPtazYMS58wpc8/aHCYTOS8SlNZ0xCNhGBKmWU8
         aE/JmvBXNQflHgDIwCrEJSFm4N3ykPSWjWch9MIxtAa1PtNnsNBUrS5b5F0X4xX5R5Lo
         a72uSwULhvstznQ4QKHnoP8LdbU80aWdkfQjF5O+uh5bsdPvpuZU5CR8alQbrHtc7dHy
         n/Ii5+XLTBO5qv2hZdOfTlRAfsTCvuulCQRvonZRQb4NxxFsUVGfzUzxEtFRN0FlkEaL
         T70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645563; x=1796250363;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=b2rdUMNSm7NAq8bDBRI3sNBiTte0OGcSEx3CtNn5HZKo6RzKONLoLXER2HUCV8Qomp
         AGvVldYsptdDV5PDvu0cWSWj+MnahuhA92e24O2SZeziO5vvHNzyWSNLRfV6Yf/o162N
         dQ5ayDEHdpZ5PWtM19JSKHn/leN7m3//AVGFVrbua3leIzPbbqLULO7x82m+OERtAm//
         5TiLRUvFquIKIf9tbm4LaVyd+xkXNxxF/lxWnv3OD/aGe9qjFjZd8c6Rdqe2L/EnJs8i
         2RBg7S0L3cIyTImeSYCj5UcvTcbKWj7FeOcpzeHx27OIvsRoq/skmwdQchPc+OgsY2GX
         zouA==
X-Forwarded-Encrypted: i=1; AL+hErH7YxZvdCz+bA3Uqlx/UX83AJnERO1LIvPO7rIlLaM0bt5NmXtblL1ZQEq432tla6BLf8tsal0z0tw4aw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WRqleN4LQWjfqcR5PVzp012pZ0NnyxA6lp3hHwzmXcCH72Ltw
	hQ9AByzwBtQiu1+RaYCeMeZ0h2rA8/jdsKPCEeBr+ts4uj97BQc7i2cp15etgfxW/kc9Z2uWVhK
	NDw==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:1b5:58b9:e078])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a83:b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b55693aaabmr25999920c88.38.1795645563065; Wed, 25
 Nov 2026 14:26:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:47 +0000
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222549.1447825-1-elkin@google.com>
Subject: [PATCH 0/2] pinctrl: tegra: fix Tegra186 AON bank index and add bank
 bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  pinctrl: tegra186: Fix register bank for AON drive pin groups
  pinctrl: tegra: Add register bank bounds checks

 drivers/pinctrl/tegra/pinctrl-tegra.c    |   8 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c | 102 +++++++++++------------
 2 files changed, 58 insertions(+), 52 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


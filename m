Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941321A4AF
	for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2024 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868760; cv=none; b=iTIpg2xiidmLEVWLrz9RpQfd1wTcXdtoIwZutjpeQsTTKVWn4XHh+5vJ9hLe/m1HztE1WFFL488/wr7wcmzJUIhxqHOxOnk2/PWnVB8lj4N46WjDD5fiJREBxe496MGr6ObyGGMwXrYQK6MDrAlHb05/zKJLCaDA5JhB3Ht4GIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868760; c=relaxed/simple;
	bh=mL3P31vnK94XPTMm14lw9mYHxzoIT+LrGWCL/+RNDy0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k4Zn95Klx3wQuIusZpvxO8VrRyjWoqvgPiACKkE5l1srCz3ZfKsLLNeM9bjoeqq3mNcKvRaynjd+ptWp1qijFLMr4ZiUhYu+Zx+W53DydTf/VshhDKqlDToNyPabNEKJQs3UsfpyRt24nWdelCxTnyZn/vtPn1fid2l76qqsfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeqylfeA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeqylfeA"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2771535e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868757; x=1730473557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=FeqylfeA6R6yerYN1unJkqZranrHlBCsox6kZGiVHmNwR2m4V5Omwqy7iSXPrsZMmf
         ChCwFU8+iCcMtwj0t11FyPEh48iPyDjAvef+7yxN0PuXhxu7op7V6n9TYutM/YejqOQh
         J6HyxddtRX4Lpspms/lUCZzbxGP3fx/Dvo20Okjc9pKRcofaKfiSCng0KXfX68lbZb3X
         NIh3mvk8YNNi2A6M75Uqn+amPKH/Q0f0vImJJXXArmlv6hFDrY4GmcJjvBHRNKtr1Juk
         8kw9hAqPJGINtMC+nCzXOhhKcboQ+sjE4ODdLPRRzBew60GhY5GxVDz6VNYofDBCjF6R
         nxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868757; x=1730473557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=AXpxlCGYzUPWb5BCHoPFkucCTxbjytM1itnQ0aQArQ7dndsIs6c6SBqjysirUcQ8xg
         7BIofYB6h4jrwMR5RVdZgjiLcSFQZI1bPr10ODlaAA4IXULnoSI05lZ7+h4dypKlsdzX
         I2Jy38bxKw1zTu8HWivVP/v1My43DjWyX4cyWY4xBwvXknHvfUWOAp03KCNmwInAMiXU
         f5dArp8EIpUWn9Gigan+CjUmZqdWsJgcPauXn/2cjkkiTIt2DlPlZEGJ23Saw98smRuW
         HtUW6XsnHoRPIfacEU0BO43Rw4a1w0DK1dLGd9EESWfH4YRob6CAOKUhfSSmo65waSas
         fZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9BKJDy6Wd2s0yubl1la/Hs1HyrRVoGJSVuqZ81AyBFe53YB/azDiZsUlUC5sNZDF1H9axn50POuA47Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhevGYx8BbqjKyRd6XMUSjK5wt+2n9R+iVKx2tuLYPf7g8bjri
	qZp4WHJpJvo1680SmR97lBVlwAnrMc6GRz9a3hBid8uvt9B211dg
X-Google-Smtp-Source: AGHT+IHTM23FL3bJlpdISIMVzlbuGYE9A6hd7jLPKz9nwIWo6tnhlsoUHKmmW3kzgkp6OuVhvzyoHQ==
X-Received: by 2002:a05:6512:1594:b0:533:4689:973c with SMTP id 2adb3069b0e04-53b1a33312amr5892835e87.23.1729868756328;
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317dde77a5sm73187855e9.1.2024.10.25.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] firmware: tegra: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:51 +0200
Message-ID: <20241025150555.2558582-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-firmware

for you to fetch changes up to 61c6fe3d6f0e1606a2219ff8afbac7e5068a5795:

  Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths" (2024-10-24 18:38:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.13-rc1

This contains a revert for a patch that I had modified before applying
and the author didn't agree with the change.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths"

 drivers/firmware/tegra/bpmp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

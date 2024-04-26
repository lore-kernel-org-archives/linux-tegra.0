Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6E15EFB4
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154728; cv=none; b=is0egnSGFSrsFY4Hhv/IGQOvVrHaLZm/vlJzBCGyCS2Xg8ZQhDBiywphzKshY3yoELl9BCVZtmYMYoVfzMx/oP6lSNMEV+zh0/5YcEJCf3T+k5kJi5Nxwry3f/GkjJDHiINyBM8eIC0MOj+BjAMnXiESz6Grx9bpG9End+WzGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154728; c=relaxed/simple;
	bh=wbAZ4j2Q5OYVhXuyILerwGpFdJBHEdW+rBFcbymVSHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONabXjfL4RFTuoMVNXys7tPuX3rZ7zZruZDszsXtpQfmZVqHCD06XlbXbVQhzF8G2VhX1A80+FqX7JKmCzGKepK6Z5Tozcc+Nr/tj1YZhtLJO15sgtxTN5W6pJCM7sryGWW7AGAxva7oi/POBlq6TGFvzZxBlw6rCHoPq7m3Ov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPb01iUJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPb01iUJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b869326daso6753225e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154725; x=1714759525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw7hiFCqSH+f5xf1n12qathK8lx+2pq5HrS4lci0i5I=;
        b=lPb01iUJ8QFhoJgo9YNZoIHn5ut9e4MXypJx/L0rDxLWCD3LtAs//mIr5iG5Z/wRjE
         dl6KwsHCBgiMBom1f89nK7rEseZJpYQbp/Miz+l+ij+s/OZaPnTZEgN/6MoOud/Lu8G3
         HA7SAvdJM0h8ZeM+QyRk0C5u74bUROJFliZjnIlwh+AuBbKd/Hrc+qyU1WOOIru/wjna
         OwC+tc2z1F0YeGfLEvA+WCJvv1P9VJHR2WeIVLtf/eWzUeZPmPXEZNnW+Jh6+xDFCLpL
         +7OONTMJ6mwCQgxwDpl8LzHq+nAD2QjhrfeRvt/SS7IZhOW85D60F298aAeShp23mTnf
         HKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154725; x=1714759525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iw7hiFCqSH+f5xf1n12qathK8lx+2pq5HrS4lci0i5I=;
        b=fdnfV52e2f2cIKzal1u0rzfsVUQnTHfy9YMcAQnn2d4Z2Twsoqw1Dw2rRzScFsjm1v
         USyNAR8krah9JagsYQdB4AQlDwQH8UZm9BmS14Y458OqnfnCVde2SP/Uto2ummxjgNdM
         3D1Q1ZR925nv0VZgoCXnmFH1RKIZrHYwx9hEpYDHBXn6hkEq+Bbihw5ylKLjplk7ftvX
         1Ig3Wb7ZAayEpazNOxIGil6oPQox4W5i2DzqFDK0zUH1mLYBzvYT0ippsyRDQe+NgkLX
         VdzlD/dT8wdIhES8ucpGs5jbO6O9IW+xRSr/x9B49dJhNmmJHoJqBiL1VoJ/g3AuzuqT
         MdTg==
X-Forwarded-Encrypted: i=1; AJvYcCVaiy9DoVPvYR26QyPvsaPLU+Ojd7VNoKtYCzO8xLSW2PZMvvxd42Y6NizX3wmqsy9+EfvV1v2Hu+HCHZ1bp3ZNDKC8HepLoCIO5+g=
X-Gm-Message-State: AOJu0Yw81vD0263EpFZD2FrQvd5r8fwLnzf80YVi9ePW1tzvSIPiyyhn
	yt5hT4vxwsv4aIBgHkHGqmSegO1c+TaYoO2r3dKHWoJrAJenfrCy
X-Google-Smtp-Source: AGHT+IEXVfEdI/LdVu3nIcAo4bA5JHuJ0y9b3SCGJOBTQKa91Po8YAJyBkLuTWSOcUvg5AnOLp3bZA==
X-Received: by 2002:a05:600c:3b9b:b0:41a:c82c:1999 with SMTP id n27-20020a05600c3b9b00b0041ac82c1999mr3148617wms.9.1714154724924;
        Fri, 26 Apr 2024 11:05:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b00414659ba8c2sm31770464wmq.37.2024.04.26.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] dt-bindings: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:15 +0200
Message-ID: <20240426180519.3972626-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-dt-bindings

for you to fetch changes up to 22b92b28fcf4f7748279c4071c63e53fecfacc2d:

  dt-bindings: display: tegra: Allow dma-coherent on Tegra194 and later (2024-04-26 17:40:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.10-rc1

Included is one change that adds the dma-coherent flag to the device
tree json-schema for host1x on Tegra194 and Tegra234.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: display: tegra: Allow dma-coherent on Tegra194 and later

 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

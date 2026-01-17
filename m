Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638F13D638
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610024; cv=none; b=FrqAj4edacNKvo1c5IacAjD1juJhrXjnSJS/eNgdyXUrjZUrnqPfcJIeGbdWvDkZuevlL3i987i29nPYv4/rmhCDeu6jgb/CbKsTZoehhRKSCPgpOfLxSZ9LQ9V4EJ62gytQhpkd+/gC7x6kB+RPrMgYGINdyTQeQSPAbOW/xW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610024; c=relaxed/simple;
	bh=S0dSLB9PPtlW4v3x12PKUIXk9LGmp+kBGNVfXeGVVVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERYZdqgy2EKAc35EWoC9W7nEq5Q6mhhUd8av0CWIKFLXQfuMjPpUaQYrPkFEA4ItpTahrdAuK/uJHlIkPo9Edq7GG7LJpeec4ZC0BMUH11i/jz6NExE/rLrl4Cm8D4G6tb3E3CJH0JxIHNfR7vWqh3rAnCRDlf+HANChRFp5bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8pffeuB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8pffeuB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso17415195e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610022; x=1769214822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=j8pffeuB3hAu7ieM7dIWB6DMELJjs6/4IfZyJsXiH+cvtGdFZ0lf7n5OEXpOluZH/k
         II67TNHTQSBqrtbpeuSopEZOv19EpxQbbgKr+TrTPJG8VgUQMOAwsOM4SG8F9XL5MzUy
         3mVx5V8hlOllIuQWNNfPhhHop0sORQDdP3GtJK4o0cXq2UDNc4s/mcCvEo3uK7x0MT3p
         qMOODIUhvdWh5wE+szjEQioGmTlCLFst4Wfci6RGoa8VjXNYApQQdV61X0eVnrUkkYdV
         lDaSIXrWE5lU5tMHv04U+6qyX+p7lfNxf0viKrF1VEJ69LFIk5iykCD+U+q7K9qPw9sY
         erWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610022; x=1769214822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=bZqoyCPXgq352+EfV3c5HmSyygYq1qsua1Hpz5kdfWHaTEalryNTUtS/ifGBHvvOSP
         Utiyp+cQRTeEXgLh9LQpDNCFPzeVyCfQTxptthmR8PwbG96/tFrnguY2XWbrWLw4ihkX
         q7Bl4QZ83x5ms38VuDzYAqt21qVXq/kf4x292jFT7Qo0o8/ZMRQXhNf1q/n8pInHxkn0
         WFjGS75UtvFnfadujb1L0dqLbTn1N+RknPpZRsIJV4IH1tBChSZzCydPo8vANrH29Z+D
         nMq9PZ8Bki04F5D7tuPIsFy3GFDLVSJcCcILUFVeOPZft5CA9+l/+RTmeHOKave6NwXi
         tVGg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7kU+scjr0CFJcTQZWJzkw4pd89Mj8ND/7BJGV4QlcuxQa8152t54obkIZI81FqT+noLkSNKIGtmnjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+t9SsPxC8pAAeaoGPyyhEwZEGVPcTlz/L+CXIUM9Qn4wEGGIt
	2mCra305D7sXThCQz1JxuOaL9BlFq4eO/uw8IEQefiqb9nlVhYt7Wt/q
X-Gm-Gg: AY/fxX6fFqNV0shQ4j/IJibaJsWIVnrj1j8MKl2p3cUEZXjSoS1N4ixo4tAt+NrGbSJ
	fJ0O/sDhdoisgV/92Qd1cO6jdDrisdHHJwwfTT6iUmLc403HMrGkjdJ4Fxl0/rFlvps1nHlwmt5
	QaSV+8MfXqLgkugNbyB3NKQjLLZy6bU/lSYAMFzh1K0H6KUWYuNMgic4VmDbOWLhN/RO8wkHdHN
	tQ/x/a0z1y8Xj7Kt7TGeLSeiI6iWY0lSzSlewWGdzOFQrkJFeWO/+JWghpdKd5ec/lf9TqKtzhW
	3ffLh4k/mhLUy8DAMWp4qK0Bv8J73rnvuvIqTuouPrCKiNO/yZ+dkVrybrkO9XuUuoT12wjM3r4
	UPaICFma2B6sPaddmCshO/6l+dpj//VvvW3BUUSXSQBu+WnttYS3vtUa5qy6uFszgTnyBJi5KHa
	mWDlNqcrKHsAVeYQ6JL9sOTyhXMlos4fGzcfSdbw+8qV45YCS5HRIyb2QTLtKsXzxAu+/3/7tIk
	We/X54=
X-Received: by 2002:a05:600c:c0d1:10b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-4801e4a38d6mr42472145e9.4.1768610021605;
        Fri, 16 Jan 2026 16:33:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe74987sm27997325e9.8.2026.01.16.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:33:40 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:33:37 +0100
Message-ID: <176861001038.1704662.1663515837927668217.b4-ty@nvidia.com>
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

[03/23] clk: tegra30: add CSI pad clock gates
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

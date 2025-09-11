Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7787326D58
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606617; cv=none; b=oJmnerp5/0V0tT85uuM/oZeKZIfRAtDjV6c1EBPYDmtc2t7ah5yhDNLQqpgKKw9NEVrhMZuSUUmc1JRqA42jRsbpRMYhbrAZVXdHag3WYj3qbaUsWqGLpnSX7Xsf1HSALEwyVGnllZivAOtk83nuDjeHVRgmrDf5OHpEJPe0ox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606617; c=relaxed/simple;
	bh=feg8uvcoH+psbJKogIt1Fi6gMzseaI/tqHa7Fszs4kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qf4BNvzIlj3KQOX1/j1J5Dynjunq+vGw6KsLRNOSz+SovHnjLnHlDdk/sSm4UqNP2xVwXg4CfMhALmtOhAxw9gC5Z+RUvHNPE9BFic7NzdbCtoVcunRJJqD9aDHGI//JP7xRIs/DXAJRy4RyZkgog/pRt76FapBaukTHcn27700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuGc9pOE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuGc9pOE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3dce6eed889so887932f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606614; x=1758211414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/CVt0Q8ERlL/cAPy2S1KrYJmxZlcG/hzk0QI53bNrM=;
        b=OuGc9pOEjM7OyEZLwLsrShWbXKSSK52MravEooHk2nGBTXcOTzxv4mVvS1zJOJXZPE
         sRogypGLTo1ojGNzydmK1blep9JXwrhQPodDmGgvISHr3+MJPr5/hTZX9QjQXKCpgzR+
         KyaUukH7L4d1dz22ieFWcyxuL8axum5oh83GnnzO3kHNEpabo0L3dvZIMiFsLleTjLhC
         XVmJNTAw0iMlUK8rlBquCJaon3MHULYq0RBMXQpF/TmWjD12yWXk61n3pGRhl7l0z5MU
         seVpz7++KQz8gj7FPpXr15DLJRrM90ccaJrDEp43rp0+gC4w51fUF5sJzIUiMZ3M5DDt
         xW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606614; x=1758211414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/CVt0Q8ERlL/cAPy2S1KrYJmxZlcG/hzk0QI53bNrM=;
        b=Mdb1RKNHUt4y/pR2N5rBZnZx2Ikr9fN327MbauZ0EsqxaoZDVSQiOwGX5+zRv6cNP6
         Jr38DahNmkmj7+9vBdXyj95fTctWLYaH90N7BU3QbD01qD054vfoQNppL7Jk9IMYvMr8
         T1sRCg2XN153Z+3Cnt6IpUkAnSZ1Esl5nDYUXnGo6RBecbL9/rA7CSiBHOLeh2URcVzU
         D7YfQ0euujIgy2+tnYwLZv0w/LMi5I033FjjEkNuzKcb4JZ1e5DPBHyKmEMyozkYcE78
         GFhudEu+2mdj3ngoILWkDFRhNN0eHGCSSwfh6u8PSg0S6LCVjnUcHlIlGfo5bTQ4qyA3
         ywdA==
X-Forwarded-Encrypted: i=1; AJvYcCWX0leMGmeIzhdK3iO61VGzJtx5LoFa84ZMrEdAQ+zkelWwDjqjw2ARv6Hf2w1ueJxVjFRqQpTtM0s36Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9PqtZDVWPXncoJM+zTTAB6VOBXrDAEFryIW7tB2163th3Udh
	HeoTTnJDN9Uajj5V0RqC4rcJ8rU/FmZkI+0EcHO7qMTyzYhb1LDaotcs
X-Gm-Gg: ASbGncs007dzUESmn9iIWTAw11Cy+7AS7oe+jkvQoQV4PA9cC7RvwVd69QemjxkdfV4
	BiWAFekiqvyWb2J8jfKZvDcN5eERLhIG8eSK7a3ddp7dyUggp6Rzk4bmgEfNRgdE0A/a7uJsIGU
	h01RC3/Si9B192i4+eM6t1QqcNr6TINQ647H4guAtlzovxFr8KsSjkkPdAoRLZy2HEmB0s78Rgy
	9zfGsld9EdIV/nrNoC5AWw/3qbiNicpDTrB9ogdcLb3ZYAdPvMCjf5MGK+kVqJQdmQgBaVbSTPn
	hAye0KP4O0ErpR+8DHF0QgLNpJAGV/S2+HIlTqzkiZW9kjxNcwnNi1Tdj/EmmqDNRA3HksaOAv+
	HtIKkIrh2HoHrrVGZoueXJBYAuf9Ud8mHkVeQkkNXdl2Rl8BRVk2FmJgx52Gcy7KA7X2euPYOFi
	dBsxklgs3VpklC6pbGg4oOnqe7
X-Google-Smtp-Source: AGHT+IGpmTcBKfpAGCaS84hYrX0OlyTAlSu5KtPBPDSfSIbv52UrNIhCRbZT1XXdpy8U6ep5y8gjXg==
X-Received: by 2002:a05:6000:250f:b0:3e7:46f1:dfcb with SMTP id ffacd0b85a97d-3e746f1e310mr16662659f8f.26.1757606613807;
        Thu, 11 Sep 2025 09:03:33 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607d822fsm2993951f8f.53.2025.09.11.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:03:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/2] ARM: tegra: add support for Xiaomi Mi Pad (A0101)
Date: Thu, 11 Sep 2025 18:03:28 +0200
Message-ID: <175760648467.2794963.16075568384592969223.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909074958.92704-1-clamor95@gmail.com>
References: <20250909074958.92704-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 09 Sep 2025 10:49:56 +0300, Svyatoslav Ryhel wrote:
> The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
> originally ran the Android operating system. The Mi Pad has a 7.9" IPS
> display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
> internal memory that can be supplemented with a microSDXC card giving up
> to 128 GB of additional storage.
> 
> This patchset requires Sharp LQ079L1SX01 panel patches to be picked first
> or at least panel schema to be approved.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: tegra: add Xiaomi Mi Pad (A0101)
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

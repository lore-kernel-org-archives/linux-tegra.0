Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED61E15EFB4
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154731; cv=none; b=e7rCnt7VogYhokccxj4i7f2AfAWRi/U8l/r+gD3Cgn1ZFZJWAdQt5Img9HeOUIgrUSKJmeoNgtL1mMjAqVHo5Z8on+DQDoXbv+u9DT+HTqxDXrkqjmXE/6XmG8MKAnaL5TVFRFfwm2FZ3GN3IWtGV0xNN6xvUyNA4jmDCYPhmCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154731; c=relaxed/simple;
	bh=diG8dADV1ktsEq7UIVnhFm5+0BKn1IKG5Hmyb5TFFto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j9yBWtrwh2YGVaYFtntp05IgQEQ4NUrid5HB6wftt6sHcWMoUS+UkdU2yV5FkyvZeV1Kve4cQePfRATeGbqARzk0nkkFwft20DpA1eKKhybHkpFifhYPV2zU2nZbEpXt6/JygJJ0pIr4w0utLqtLYwkQsxbK4wVx+cSaTZO7CEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXAsQ3pZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXAsQ3pZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so18195715e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154728; x=1714759528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er1tYyCt13uPsO0y7NV434ai1ZywuWVo5RfP9WCPdB8=;
        b=OXAsQ3pZ1wq+S8dmtnXFXo4RqEyFy3jym5OM7PzwSEk/hK/fqAZhuAXG1WvMRrQZLT
         OwWRD9dz7hZAu+7RIrlv3qYi2nyG1cuEwH9EfGYrss+iAnJfb/9cXehNLphLzJO6J6I4
         kTuSv//KNl+84Gun+7wseaU7pyOL0p4BlWcmZ575CmiCGlj2yna2c9I8zfUTYfhMPXpb
         j/9awnoEdg6ypp8nhG9KbyTHnE/TDO8e36nM2KWXl/OWGY8THwWNCTv9w2RZLZUgb+MV
         7a3+iUxhxAkie8b5FCl9xxnwpiSQiEcLF0KN3pPPlTDK3KlK4fRmbysI1Smk6UjEIvXR
         6+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154728; x=1714759528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er1tYyCt13uPsO0y7NV434ai1ZywuWVo5RfP9WCPdB8=;
        b=l+9n0g77s4dFPHJHQG6YV1125z/aPEHRhhw2bVF3Gi5vOBbaknGNpC3qcMfgCldXHH
         TThDeSQZIZngDINZ9z9RhWxpZI3oYKPrC+T4HAp5hlKvNVJZHyL4beURfrOBOw+TO3p+
         HaQH/50eu7mFUPir1aXbcLqvOP1FjnnxWHOGhob68n83MHnzI66YPVZPwT8E/nDjPbww
         MRjbaUMgq7Kk/il/dMCepiD1rO6A78B6fGK5vfeQo1sZ52ykU8lc/tSBi3p6gtsfSYzz
         vwOwLtmGIkYBVv8WEVa3Wo8q5EWivTvEa4vsvzFQ//3GIeYJW1ZM35ItqMPaedjf4Roz
         Hdng==
X-Forwarded-Encrypted: i=1; AJvYcCU4wNUUEqTpjJx/Y9UQIpIVXwnF0fS3w8Ke34resFy1NYDvBxxQES6ktSvms8go+1QVUQijfSZAarabfO0WX1T6pWL7oJ69VTmahcU=
X-Gm-Message-State: AOJu0YxV6jnBsZoePVBI+hpNugg3klcoK0WjICZN0gMEPI4ruvhrs0EB
	0uLAGi5DHj4s1mzdrOhYO8uU40/FIsx1MC/QAs3ZKearITl6JD8YQqZ9ew==
X-Google-Smtp-Source: AGHT+IFcGcZCotuCyyjLiLREkMlEbMqXPS5b/W/si5dCVYGHCJyr+6QukDeZbLs7p4POeeWWspc+jw==
X-Received: by 2002:a05:600c:3b24:b0:418:7c58:d592 with SMTP id m36-20020a05600c3b2400b004187c58d592mr2745550wms.28.1714154728307;
        Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm20946523wmq.17.2024.04.26.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] arm64: tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:17 +0200
Message-ID: <20240426180519.3972626-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm64-dt

for you to fetch changes up to 0d23cacb2ae0fc9d8d40f36cb37ad272b3249ffe:

  arm64: tegra: Add Tegra Security Engine DT nodes (2024-04-26 18:57:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.10-rc1

Adds the Security Engine devices found on Tegra234 and fixes RTC aliases
by referencing them by label rather than path so that errors can be
detected more easily.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Add Tegra Security Engine DT nodes

Krzysztof Kozlowski (1):
      arm64: tegra: Correct Tegra132 I2C alias

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra132.dtsi       |  2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 3 deletions(-)

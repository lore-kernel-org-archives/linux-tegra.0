Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496A170A31
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027009; cv=none; b=Vxiy8sGCcvMQ524q9zSP99nbG0HsF578oZj7FYf+IYwLtoWUYG+vOSoXQX1gEHTVjoX5to04oKffvrHD7Mh7akeYZ270PNv0ZyzgJlAhgxjilCBIo5w62r01M7/0tYiTP9upYGUqETgqnETc4Hhr0jMcsIWHESz8Tb+BOoX9k2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027009; c=relaxed/simple;
	bh=U2r9VR1AY1nFzOKpt4B5CsFpP5W6pSGYPBGLB29VPZA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QrI14kiuVja7f5zJc3KYSpeRo1y3vFfSiUK127H3ADYXj23/IljfFMCqogfUdsLbO2IhZaCvEUMzkNOjr7qe0hMuadX/piXtFDjTuv3RrII/4wvNKvBTDVP+zu+qRql0iJ8dYqPIisYruGsHLgJ2xi9CShHIv2dCEM5/KxTnHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb5R/+Iq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb5R/+Iq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bbe809b06so4060385e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027006; x=1725631806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0vfLLVvgVR8/+4UUPNZ173tGMb5xNPNr2QMLpkcyV4=;
        b=Yb5R/+IqFnZUCPib9vPH8ly1O0l7RzjPRqqV61XesCewJlRw/Jj8JzHvFlTEAKxYuN
         IyQempTLi0exe0ZN1al4bHIea4kXYdYn1vjx0f29ybEejpvc6Vim3YWpfGGL6psEbV1R
         Y6ne6pZGcdyBejBI4msTivDMd3Y2C0IkAvdzpG8Yc5zjUb/HAjufJHXYA2kSW657q8xG
         tzWXFw7Wi2trHeOHw/M8PwnFUtB2Ang/sUGfR3JvX8jlBi5ioLBDB+byWXDqrFPX1si3
         G3tNvvgWeHn9z/CgWUthNj/8zMkfBkkB9NifKDPL2bBHW5+fFWUA/F0LrecFznlzrqRn
         p7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027006; x=1725631806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0vfLLVvgVR8/+4UUPNZ173tGMb5xNPNr2QMLpkcyV4=;
        b=W9tLEaZfbxlIqUkRtI18iqZkIXnlRovVPrkIigClAgQ/SNXTiSR7QjGcXXLlVPvWPZ
         F+R7R9yRVGV46qKHceiaDg6nGy18fs8YGizYN3rXY5Wvx7v8vnshrWx+QDdUdvkn5TyE
         kp8+UFlf9j6QSMVweUp04MWOU+AmdsO5Ge4DSJQfrhmZO/C4Agj+u8XFgQb3tgp0wVmZ
         QiXfJvsfsUa33N6kWC00SlxGzZ14lNaysD8zTnd8xSqKdcQPfTGhuuYWMZvAz9ho0ix5
         ANsLchKAyVG0unLgv7/bpEWSZcmkzMG9VqFhVYWYUZ/4BCcoBrzwA8jGl7FIc9vnRj9B
         uwUg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+S/sgXPpk8raLTCL2J0EQB9ryCo5GlPZIohv5/dgtVf29ZAc/T9LaFWlyJPQwLU5VbTrVUEf9EHEjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EAQeflSzZzaDYFuzLB6Zoc6Tb6coQst7VB2emA3MhR9pfaIn
	wixnO/cSfDS11a7AHGWCipGXy3I1okzqo+p7/goq3bOcxLI4aK3Z
X-Google-Smtp-Source: AGHT+IFCnbU8gUpa2S/G+byJk01/HZgK3g0uAHqhn2xulkoTkl8lDqCYGCg1Bj/TJbcau1BPqm8iKw==
X-Received: by 2002:a05:600c:474c:b0:42b:ac80:52ea with SMTP id 5b1f17b1804b1-42bb02c1098mr49627755e9.6.1725027005702;
        Fri, 30 Aug 2024 07:10:05 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm82113565e9.47.2024.08.30.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:09:58 +0200
Message-ID: <20240830141004.3195210-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-soc

for you to fetch changes up to 4d57a840560c3ff04fed07a06b3aec7cbac4bff0:

  soc/tegra: pmc: Simplify with scoped for each OF child loop (2024-08-29 17:43:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.12-rc1

This is a single patch that simplifies code a little by employing the
new scoped OF helpers.

----------------------------------------------------------------
Jinjie Ruan (1):
      soc/tegra: pmc: Simplify with scoped for each OF child loop

 drivers/soc/tegra/pmc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

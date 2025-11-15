Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52591FC0E2
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197268; cv=none; b=aZOMs/jA1i/k54G7BCJwr4rMencLL3e3lFmyDBYCPtW0bHR9cdEin9VIEXHA3CFuIQue3P0NMy5PZwAJX7h2zR3BPDH6TD8UzHERhukzEe2+Qj2slqgNziaip72oI0ZUmZumFCcc8t5oRBkwLDYYPK48DUPtYgQ3kKyuFM7OXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197268; c=relaxed/simple;
	bh=zv+maFz1rZ05C01gYlLfTBLLNcYvksJP/DD9r2XuRq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dUQCcgzMjdABtgzN0sjZTlmjx/MToYHXT4eISyvhxcWVl9U0mdFw3I0LHNZEiiYg4qGo+DQMvS3Pq1nwam1hDYw6fGolQLEQ+4UHkZOLkqc3z0eHSmA6Sc/24WX9gf4jf/Z6HBz9a73qOMG25QqOFj0/iAibdPoXDhxBmSAO1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqAL5vjW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqAL5vjW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so797135e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197265; x=1763802065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=QqAL5vjW9LRqryHQ7AIrUDmh0aZ05qMFIAnNngJrUYnHP4V0VlFLR7HwSmNhASmDQP
         Ua6Yc+evOgkKMXY/vYZiAEvGIz+jchwRmbtp7FEzpMO3aWmTCBdF04U2kPW92gBySU/R
         b149xF9NgWz6MlehCqpdK+zmLEUxtil3/Gw1/0nHFDB8n5egUPF5S6YyVyuqJ7cMyLac
         0Mq0w/miqBbfkfrj7C+MwFRhXCcUFRTHl4z7suVBXcOlhDmk4iWXSs+EDK+pR+H8WCSz
         V61WQoYxAAVEKZfTOD3On/qU83pkKmThSEXBCSBaO3E1bkGOmuBP6ljRJ1dCjOvOBme3
         WcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197265; x=1763802065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=scLtgf0nK8C7//+yN0UippH1nNAipCnDGRfMhDKpPvxqTtixdQU4Q8w695ccSz0DZi
         j49gTMFS+5mMFvreEJdg7tz3oeEhomhYonAc7TNZnK9MUJZK0remjtxeNzSryzabHTtL
         wDopKsYl3bha+iwz68lEi6r1gF53hqfbbYfoJFF+e77iFe4/IpR0U2BItyxsVJ34485A
         o1A/0ku4sFSv0xNw4q0m1ik4I2KzPL5jJxqOVP2dYgqmVYFvhq77w7ClDwGrgFO0T5TP
         e6ikpjI/gVR2lA+9YFzZKd/dyBxM5kaITsGIRirN2MxiqEtcbSbbRa9zxJ3tgCEZ+Nze
         Jn0g==
X-Forwarded-Encrypted: i=1; AJvYcCUGYYPXEYcNaN3j4GwpUhd0geKXAVUdWlimZtnQ8+jR81B27X3/mbIlReHevJZ343HguNEsPNdHiN336Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/UEhbaaCwHp3jzGm7PxCdiVETTz60/jnkfl7a5BPdRhYzkaY
	DfY19nXk1nBApailjRDKMY7FdAQ95JaNHv2rJl5zuzg6S/URcrRv9amF
X-Gm-Gg: ASbGncvFWpXlkBqBdkRU0/nN4U2Ybunx9Rjd8do3yva+IzpXnfJWEtaUGlAqHEUR8Mr
	w3wh69q/3zq2gcEbPBdJfbD6nhIOuPvo6gN3yb+6gCjDJITIBErL6dnJ199JmCY524aroUhZ7uX
	9fieEQyB37SqnHTtf0uNKlbpwcP/GuzMFgtfuzuhgKVXbkbeaNSJyuEMuKqbBSB0HS6kRViRIK4
	yGPbd2NUrrgB6eXM/Lkr9G9towvBrBUOdduqi8tuuYpapv23cMWD0kFfg9eNyC/te9gHAg4wPpI
	j1PnA7g/1/0YcNL+GghQcAT++rmupx7JKbEbrCA5YdlLzsLVUSd4pko87Xry6/ZE7vOPNCZNyag
	axhU9yM1mxUif+NeC7PyTA3HYsr2PsY71mneR9a+vfMe3M0ldXUGZ7pG8UkK1ubaQVBx1t5la1N
	EE8sOz0ep0GgS6JH2xbo8wiq4+GloUM/n5lKLKL3tCEhLO3Phd5f/+buYV7xkyvJAYBqVt
X-Google-Smtp-Source: AGHT+IHaz8rnAcDH+Ih4GXwMyi1IntfGLPFhdJ3V0CaIhnOCXB9/ZniCGlMvXD6/h8Eah1krdyuflQ==
X-Received: by 2002:a05:6000:310b:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-42b595b8004mr5910070f8f.54.1763197264994;
        Sat, 15 Nov 2025 01:01:04 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm15080566f8f.10.2025.11.15.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:43 +0100
Message-ID: <20251115090044.3140331-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-defconfig

for you to fetch changes up to 145cde94a5435920cb9f78aacfe91bea6795efaf:

  arm64: defconfig: Enable NVIDIA VRS PSEQ RTC (2025-11-14 16:29:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.19-rc1

Enable the new driver for the VRS PSEQ RTC found on Tegra234 and later.

----------------------------------------------------------------
Shubhi Garg (1):
      arm64: defconfig: Enable NVIDIA VRS PSEQ RTC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

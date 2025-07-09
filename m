Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91A272E7C;
	Wed,  9 Jul 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063627; cv=none; b=AcQ+voS85H6CdeHNZSDC9Je2fCc05MCKkQXXt9lN3RQwVZJepmvGuhJzMoL+DmLAhJZf6Utn8RJc0t+6i9KOebdCYZl1PU6+AT7xAqETGDSoczOX2KPvepCl57r8YsT7WAtAtyxkSwc4ax4ripoixVA8z3+Q9RQL2uxLO6kRYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063627; c=relaxed/simple;
	bh=vTxSr4OcEFLxV9myZXbp9oq5itZ0+F6vLpEgCoNxz0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eh5XRydl6DEAR87nDzuc93e9Kxl1eb+Mei+6hCU1DR6ZBkbOnrEJDyDbyqtauKTrtK0HHBw2AJEBiQkD+HoCKGkMPLy0bEZi7MmK/I3neDFv9kFIVYl1z1Ar2rJmL8+vqrmLz6kNRZkkK/jXukHLSQDdv21ZGWIrpr4v3lxaGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8iMRGjl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8iMRGjl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453608ed113so60052305e9.0;
        Wed, 09 Jul 2025 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752063624; x=1752668424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz5QQgif2TZ+psnMb6iWbzxnGr67pPa/3dM5Lbz5MrE=;
        b=d8iMRGjlpsoQSYGNCgiS70Fl3oETvYM/A7xkTiNhtIR4LkY6pJH3iEFEjcXC93y+1+
         xHLr59PESgkT9Fh8hDuwmxbNiMT1I66491NBjZnu5s58Mwat041cfhJif2f39VtQifE6
         gndJcFbh4qRc+P8HraWHXVO8cz1SsLanPHMnI5YbuCl1n2u+Y1ui/muziyLvHN97nkm5
         gXfbLCr714SGnWlJWfszS6RCbvVP4xqqF1cmA00/G/mb6/SZxoZ0DLqjbvIRVs4I8fB/
         VqlVmjrUG6sYoIhorO6C/dA9RhnB6j4sZQz7KRf508BQura1tuxCTciMRPeS46R6j+FU
         sTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752063624; x=1752668424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz5QQgif2TZ+psnMb6iWbzxnGr67pPa/3dM5Lbz5MrE=;
        b=OUQOwAZeIeXiLg7Jt9vxR4LhRfgo6JxRT9Z6D8+spPIjEM5g8cpZvvQtOIivZbIZuq
         mY855Zxv7NyYY85kVoMo7clsQOik4thtFMSLf6x9y0CXOOvIRzKGlUHDWRJfwSLBpvCr
         bYZnjUFoli4C+uo7Iy8ocKpp3nQVkE2pV0QM2t0Ka/0qbOq3W1xJ7VfLZdzUF9vvDHPz
         wDSeoo+XnLzdgRLQmGwAVadnkZyO/NSgkvtEvnB9Jb6NFcJcddM1SfXKs2+VN+fe9eK4
         fBCPjZa3ukY5DFLPgp2M4pD7HtgcdhhFvzvMpV3lkzQVSHFOWY+/TUf1A3q/Vs8z3zeN
         vnZg==
X-Forwarded-Encrypted: i=1; AJvYcCUsWPUeKMBtcJF0MnFhW2dsYX1yn6dLr/GTBYkG2aZHD3yyflSCwKfMEWH/S3NJgEh98sLp0OtVH2fF/Io=@vger.kernel.org, AJvYcCVpB23B9Cshd3+3PX9weIP4QpVy2piFqvVRRSQlGcDQV3g2ADfIWwGW+E8wR80Pdi4Bg+e/lNwYtAjBxHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJmDNPr+VBBpI/ZVTSLxKYLqdyIncNJDqxqtKE6z6wJXCH8lO
	NLwCcHzq5WCQeWNc5Mk5i2G3FoybiMW/+yJ36diAJzdOaxjLS31M+pNN
X-Gm-Gg: ASbGncv9aiBxww/ZxmAznbYYdggLNjIFNp9OOgSM76X2ZBEbNDLHp/NtOTSDCZzMd/Q
	cMteN3Ohf6KTOB43VdWJ3Uc4GBqE9HKWbDCDvkbsk8CCf70i5YUI0d0He6ep/TZ4cRt1FcbOP8G
	lChBbFDStf9IZwMKB2WtpEfq6RSD2WWLr8yFVqd5OqMbKx4y713oXbETeJqQnY46IeS8ZUdTrcw
	IhkP1D51OPIJTI8xs0x/PRsUhv9Dsl3i4CwckT+gsp1PFofGRr9U+HqMFbdO04wwJy83GO89hZb
	Ovq1d/byjuJSItbVICFw90FOyHgz5WQynGKY653SWT4PYdsAr03Bf67uQX//5k9MtD8/gFz0fIo
	iFnROdJa+9HCZt0gKNeE280U3x1J7eDy8q1yCrF01h3IUooNpo2zb9A==
X-Google-Smtp-Source: AGHT+IH6QLMupQyvz6K1xZUyeINn+lP3CNsWV0TExX1rWT3sPHY0i+kJ1Ij7hqhRt1VAgldCxPijDA==
X-Received: by 2002:a05:6000:2087:b0:3a6:f30b:2dd6 with SMTP id ffacd0b85a97d-3b5e44f5a13mr1981376f8f.26.1752063623787;
        Wed, 09 Jul 2025 05:20:23 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0aa0sm16013292f8f.34.2025.07.09.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:20:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
Date: Wed,  9 Jul 2025 14:20:20 +0200
Message-ID: <175206361431.1595082.8917361083602390778.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 22 May 2025 11:11:24 -0500, Aaron Kling wrote:
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
> 
> 

Applied, thanks!

[1/1] ARM: tegra: Use io memcpy to write to iram
      commit: 4110a4d95bf0bebd8ccaaeb93988dc9c08bd7d6a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

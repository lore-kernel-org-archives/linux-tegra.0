Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565A4340281
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240801; cv=none; b=m0mpS5WPKYjy1pYMZVHWMjcuJ8i1TG0YaphY1NYw8h9kuIdIa6sJEPd+JJbYusFBSyolXwZPZ13WRDiAujSMcUQ3qcFaMEbWMvmDEzggkU8K7bUMgCr3niUtX29gPgLzymI35s2Cq24qi7HvVnJl5Omr61bo/+Fn9sqhDJqNnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240801; c=relaxed/simple;
	bh=nK28L6hxZ9KSJUY90j7KB9ZFcL/Tw1vP3St946F4sGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF3MWU6scENB1ql9RF1d3kLvuqR18/25fLT4I8NSUt47YoIKQM1DnaN6+hIWO1jewjwebOd41F+j2EkLOW374rhg3ysTLVskwKBgRqFj16TiKSLjRcOUegeohnzu7v2/ylo+A3SA6GY3l7hLu5wCnanzdtO7R1mMNRhKYrk9Mlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCTeg91k; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCTeg91k"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-482f633cd78so1074078f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240797; x=1790845597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=NCTeg91kgeO/6hhad3TJi0TyEnQP0uxcb+6OAKEHPKrddLSfUu163NCPx3H3SM2oZ/
         ax0VTOP+qvH9/ZT8zc8Hgfm5oGjRoheNenMPFTTsKJKLhDktWKYxtl9mnniAhSDdjRXD
         +zDm+Jg+cl+RuIBTl7YRK8R9srFdHIQ9IT+MUvHTiAwDeSJx+zOVkW+RYUYhiO5R32sA
         F6cjfFrATQ4U+DXUicBx65GUFvcWeoADV3eJBg2n9T04aq4lNgQ1A8TRFfBy3HBVibxc
         t67sa15+xCm2/8MVSMnMf3Ji+bk1dDBPsnfQGm1yah27KOtqtCmM0p/IUYmjqvbwKzwR
         cKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240797; x=1790845597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=wbgJMNAGLERJBQdO1oIJwTJxiYtvV2zRURUEj0dp8MeIUlUioCKD/98xi6y9Pzrxgu
         Wv0eN5e5LOC4EYI6DZBvsg00Hn4XS/6+/ih1libAnVNuvIq69JRPsxcVIpR43f8Vs+2/
         XFenUxOZ4vC47anEAJTsviAh28GbmdNybSckRCKckCW/wVLQx2UcQpXuxR9mPkKx7ekO
         D0G2TShuLtyo2NEsHD2W5vS8NmrBrmikRgAz2xl1UVZafCNaLE7QNKynRRagyGfmTJmp
         bV7pBChHmcZnhvDzOWpMZVvEL5dKyjDuKrWqQQ9iOsDAGtzx3A28sVSwEufORTb/S8r9
         ic0Q==
X-Forwarded-Encrypted: i=1; AKwUvByG+ZVMr1ibzg01z+zm3j7EGDh/DIaIqChtJlqPPVq9NcnXPSe1YnQHxvFT1RjL1d0edIEJsr1V+9AkFg==@vger.kernel.org
X-Gm-Message-State: AFuF++kNV0r612iySkrEvBNs4lQPsXN19Jjbyov+Qm2qRik+hbG46L2V
	ZynAXH1OvnmPJ8ZYfUSRQU4At+i0h3mdRImVras+D4wwuQQArqwcq3mX
X-Gm-Gg: AYBFou0YfQ4ey00fOLQ6Q+8n0dmRyOnh5nmIjtxCzhLGyANXlXJNj+3Xg9SV2w7k3g+
	ZqFpMqFV7CCnhEVRaXPuFbsXqN+P+VyheDWoxsl3aYg2OlDD08paenlZUDc2x1z2f9qAMDSH8eo
	tb/gn3kYRpK16AxuyTAj9OHgEH0LRTB9Jb+DPm00hIaP9uLVzYM/tpGWu//eN2e5Gil6b9ydlei
	NnnhAZLnf4t4HrRUfKO0qMQLb8PTMJE2wZ9e/tU2f01ndK2O1Nf9XE3a9jJk1zi8Y8Eu7jTC5wT
	t3r6aZDfLH/T989LbqgvfH0dRt5iSJoXYjGwg2+Z+X1kse7CGHQzWOfea/3f5YVkFfw8TEDjyqN
	l8AEvhnDelaDXGAyTie8zTsZEWUGKORX6cOFfILEc5zDWnFKEhiERv9EqJXNJacHTLsmARQridO
	nL7qjSYdj2iMlyx3t52Z/OZHE/ctvX/qrm43fI9JUsV9HEMUhvUUMVJ7Yz3CEvpKIq5+z6nGiPF
	nyknDy8Ug1By9QYRb0=
X-Received: by 2002:a05:6000:26c1:b0:487:342:d141 with SMTP id ffacd0b85a97d-48871679294mr3268587f8f.23.1790240796949;
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] ARM: tegra: lg-x3: Add newly supported devices and fixes
Date: Thu, 24 Sep 2026 12:06:01 +0300
Message-ID: <20260924090608.28734-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for recently supported device (ALS, LED controllers, haptics)
along with minor tweaks and fixups.

Svyatoslav Ryhel (7):
  ARM: tegra: lg-x3: Adjust WiFi node
  ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
  ARM: tegra: lg-x3: Lower supported suspend mode
  ARM: tegra: lg-x3: Add light sensor node
  ARM: tegra: lg-x3: Add flash LEDs controller node
  ARM: tegra: lg-x3: Add haptic engine node
  ARM: tegra: lg-x3: Add backlight LED controller node

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 106 ++++++++++++++++++-
 3 files changed, 108 insertions(+), 8 deletions(-)

-- 
2.53.0


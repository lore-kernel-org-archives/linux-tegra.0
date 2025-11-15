Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46674221543
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197257; cv=none; b=ZfD7vBrV/pylVthp+ZQ0ofFWOXV0ebWQEF8O26UXnkgOo8ziZT7oVOg7X/hXEoy1Cfme4HhomNaExFyXCJS2GrBrinxdjiWpsNG84hmVGz9pzERjoCBs/9UWvekz6YxYBk62xWVrSm51tDdRcLZDeLj8mgq2PSIug4/8FuivQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197257; c=relaxed/simple;
	bh=4Lq/BDtaeJtbfXdVh5QgCiqIE8bUeV5zVhjBbFWgtQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NnNWGGiI7PfFTvNS87dvJSU3NRcw3czmkYRVf2Wz9oSsNiHspD50kWGlLoOvOKfx8i8sRLx26NbU5q0fBccSfA2fmIG4WewSoGF0r2YeRjXLrnnWQy1IjfjF7BIk0NOwUqXup5eaGx1aufFo5jc98ShIr42VgUxx/ZkMPlYoqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf1zAPh3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf1zAPh3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477549b3082so22893735e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197254; x=1763802054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=Yf1zAPh3RrWHc3JAZgYd/8XJg52O2crru8xyZEWSS896+zjOD68mn9WaAMQYSv+x+Z
         Hd3JukzCAPRGJcWKFczMYFS+nlF3NDY91Mv25uK1Riwe7pfxiJApGY2Yf0c6omtEq8/F
         8FE0cmk4Vwg9bWSWcRl2xb0XhJk0r7KUDCQwGplVaEBhmeqvvn4TEHwZ3xjbptsj0Q2P
         S251dtmlZQwy4EE7lp9paMpq1Fv5a5K5mX4Sp41Wh+aP7BpJ4+6vUwy+cw3pfZhuyLkZ
         pzq0WUuT0TKfCVNNDGsBKc19pX5gNBVz+cQwcAGCY/6jHxQn/5hjENY/86t0/005twxO
         9mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197255; x=1763802055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=m09Ok2cMhXbG3pWcrSZ0akBfJJOPM+2EddMVJVynfAtPnT0IJ2378zsmRyz8SUdtoV
         XlyrgA6EBJw6b9QuLO1zWqtIYP8uZn7j15YP2bajAhYNp8dqgVdwox10Xx84cdJTvHQ8
         KJmSnBS9SNQDMYd0PdUnDBUYFnv12AxwHxD7RwLl00cmYybW3YoKkdDvtJIELnnGLg8P
         uSxDfqI/qhIOuslRdztAaE/nRxNLmhv14E6/TFkHQeT9s478QTRjANjxIZTFxKIgiNmf
         zhv1ZoDc/0Yk5p4j1UWxgMOrBnE7FsJLVanA316zgFeFfjEWvqvJEsQAMrZSfzTzA9Qs
         OYSw==
X-Forwarded-Encrypted: i=1; AJvYcCWi0hsM5ttCzuTLzRRAqns/Zs4DkWl24hZth2rwuuNa0wCBbSvUeLLb2n2AbYFDy0D7oYHMrtDr6Z7RZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbfl4DLupYPc2ycQaAjvCMiATB0s+t018yF0QSxRMIinhZFnPM
	1diWcnugcOHBBYWoCX55m0tUhfNjmtj7FMeA18LQ3IScFLDmQpHERGdf
X-Gm-Gg: ASbGncuvi+m/a97xg9H6Z/Mnid/pgsXxRNfzxNzgZw0CiIa72Zj4PYWF+/oOxDf3Z/j
	vS5Ur1vkc13b0BBbRHxqjXbODPinZvW5mPCgcvkKXqqDuNAAwqDIB6ZhO8k+fykspqWb1vywu9D
	x9FJtY93anfAmcf8+P9L1rlPEGe/JxABYCS6gj1yipn2AXfBldxw1fin/59Vzy7EiyD2Z7z1FqD
	EQ+tcl/iRiD/cjzWDl1QKhk5tP44OO46HvbRdKvQ7ZatSNbCHujj2hAlUXwjPfII6uzbbwnCeEs
	R6fsdbIq3H3E6AQ+LAek/puZXGMu7NL2yOR8+rdW+Em15hvcdedB/NY4cT7sKrvav4HtQGQncoe
	hWV3eji9GxlIUcrCylBOWgCTYtlGz/XkHl1SZmnutzxD1oTEDt8fuugiTu4hpz3eeD2ZIN34Ysq
	VzAoHC9oLzQOIMMYfK1A3JgduN+9i4Mwq55z9fd+kJ8CkFpJ6jUMJCROyq0ZHDCVuG9aHiMnLCF
	GfK4us=
X-Google-Smtp-Source: AGHT+IGbQ/s7KX7f/xqyB1QpfckUbUgWDGGjMrr2y1kPsnMSCp8R/Hg3hnEJQs9ahhQaY0z1VQA8wQ==
X-Received: by 2002:a05:600c:4685:b0:477:8b77:1575 with SMTP id 5b1f17b1804b1-4778fe5dcbfmr55442485e9.12.1763197254489;
        Sat, 15 Nov 2025 01:00:54 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm8331095f8f.14.2025.11.15.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] amba: Fixes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:38 +0100
Message-ID: <20251115090044.3140331-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-core

for you to fetch changes up to 500e1368e46928f4b2259612dcabb6999afae2a6:

  amba: tegra-ahb: Fix device leak on SMMU enable (2025-11-14 17:49:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
amba: Fixes for v6.19-rc1

Fix a device leak. Could go into v6.18 as a fix, but since this problem
has existed for a long time and nobody has reported it before it doesn't
seem critical enough and sufficient to get it into 6.19 and then
backported.

----------------------------------------------------------------
Johan Hovold (1):
      amba: tegra-ahb: Fix device leak on SMMU enable

 drivers/amba/tegra-ahb.c | 1 +
 1 file changed, 1 insertion(+)

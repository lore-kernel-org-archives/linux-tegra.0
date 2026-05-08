Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7C1E9919
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778205453; cv=none; b=DV/NEupUUZlwrVX4Nq+H/YQ/sOlG5Brfl0rIyHVLIx63IE2q80aO40BOE18hcl3OOzNABvBNcOt/fFzafkOo5w7QV5OHSqBIhZpB8kgod7E8jYn8ftI3LVRYA1DMM3lfMk7z4H+Pv/jvdiXNbjJFfSPRjEcljGGk8agS6P9qNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778205453; c=relaxed/simple;
	bh=0YjRBe2CBFMPAOctK7QuiXIxfcyjyHVuiiuEWUAXfQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3DeJEccAPeePFN1m11Fly5394WglX2ehNIWlPxxX5pHUWPuTkSRzMXFjHrkbIOLZ/bS5IRcQJY8faeQ94VTO6/+TjXvxicxDz0HZ/T7LDBSraDm8gglTudnayfCe+hd1WIQgFAhLGdGjLKVGS96V2U4WjrvLepfHRyT89COt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwJ4j4qA; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwJ4j4qA"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651c5d525f6so1707231d50.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 18:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778205452; x=1778810252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuIfT0xIr/EuF6poYtCVM6j6KRvCMpUYP1PE4jbf4xk=;
        b=BwJ4j4qA7A7VqmtgUAtErNV133xom3YqA4BzargXBBjFtXUa4Cc6mbTqS95Ri8HXqH
         CEFJyie1YJ85nme7CFyRJlXmQdg6ywseKKbFy6CfwbNexMfSp4Ns08ZC2RSPd38qpjn3
         wdzs/Fm7aNV71pJvmwDVCZrdiomwv4+exW7lfwQ+aLzoB+6Cs17JXUYmlAXTGR24NoJ3
         OUBHJUBmwWUDrLH55Yh7c0mK4dQBz1cYsgLH/offVPLNyWWHx1nB5M9wmNasC8RUx/jD
         T40ZgRJnHAb+HngVVtmLH31Cf+53U+p9elJolN7BFPsBjDr4l9Dx+JxVrVwZtWbjhEUy
         kI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778205452; x=1778810252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuIfT0xIr/EuF6poYtCVM6j6KRvCMpUYP1PE4jbf4xk=;
        b=s7q+BTgOX2Y55hTGzmuEVl46wIFYl15P2JEhLrsMHh7TeB4itw6aE8cwWs/UYbEyEk
         8NNLnhvoLBTm7pDZAu2jA+8PpzV+Z50e5PGStY/aVCdrgQtLP22bu7rJd9zVSCQ86mJV
         JHvUwy30ooUR3HcDlbwwtHPAV6xd6dyo6XER+65DhGHK6ddM4TMB1Bab594AVJe4AB7k
         uxwYXQyDpq5flTARICW6MStzN25tRspdQUkblj4alDaUyeTJ1mX/wIOazd3p5kUwihDK
         xF8MAiVMeMuuqy/PJOY0pqmh/097mTioObZdSO3hkHiFgtBDLgstL0kJLFrev3VJQdTj
         4R0w==
X-Forwarded-Encrypted: i=1; AFNElJ+Gzsfb/hLVQglz6V24nAgnI7ACBwfEbrcABnmpoh3+kNi/6TG2ypFKJtd8JW0Vvp5Uq/BGzWWanqH9gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTCeY5DTc3p1Nx85XUgshclv5saFI0wmuXd4YOXrXuJMy6qe4
	F5f0Bx3EQrXw7CBuWROlZn0YnyPgPlDAwUemIN5z48v1Mhpgve28FIAH
X-Gm-Gg: Acq92OG4AD1MNiZppX91c36TqUIGnZl4r/P+a4VKxwZFW32wwZ+y89JyeRzponkFcO5
	sZx3gPdVn2HAvPdbdAAnrgd7FPG+iBThL5HagxgESYp20Lov5aLqaThKVN8CJhwvazKz4fSt11X
	J+E+6SrymbSH/gplMIPWPpZGe4F+w4DNEthDMa7w+4rEHmpC4GxiwPbJ5Sw9GyfgRuFCHnPgk2U
	fGH63MDTVMnSz3k2rIhXUOTShIVitugV7b4c0Um6+YLDBkUBG0pFy+S/mMBmHwCGjbyOjwqPmo2
	3s/uZwSNrTXMppzdxelDUVkYPDKVLinyTwS6msOVx7AcTxcATJ1sk5dxMjFi8aQ0bh7lEWu2zN8
	2L75Ji76VY/JqpB757F/XYeSD8/bOMU8h6v1kemcqnyw/9THUlfVVdx+ugaC5SYN7fIrggkJJMj
	nI7ssnOe3t1QLEyZKebzxuiRh2yQ9vO+Wa2ARwLLHdGKU8Eqt5ytrMZQyK46ahKKFVpsdBrkpKs
	grNhI9Kz5AFZVycAm/xbBOHSOaYB6mK71s=
X-Received: by 2002:a53:cf0d:0:b0:651:c8a5:fdd0 with SMTP id 956f58d0204a3-65c79df7703mr8504287d50.46.1778205451625;
        Thu, 07 May 2026 18:57:31 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::111d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d96c36171sm102786d50.20.2026.05.07.18.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:57:31 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] memory: tegra: Fix possible null pointer dereference
Date: Thu,  7 May 2026 20:57:16 -0500
Message-ID: <20260508015716.652347-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function tegra114_emc_find_timing() has the possibility of returning
null and it's return value 'timing' is dereferenced before it is
checked for null.

Place dereference after null pointer check.

Detected by Smatch:
drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change()
warn: variable dereferenced before check 'timing' (see line 515)

Fixes: dce208b5405f4 ("memory: tegra: Add Tegra114 EMC driver")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/memory/tegra/tegra114-emc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
index be6c699cb656..fc3bf1a28630 100644
--- a/drivers/memory/tegra/tegra114-emc.c
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -512,14 +512,16 @@ static int tegra114_emc_prepare_timing_change(struct tegra_emc *emc,
 	enum emc_dll_change dll_change;
 	unsigned int pre_wait = 0;
 	u32 val, mask;
-	bool next_dll_enabled = !(timing->emc_mode_1 & 0x1);
 	bool last_dll_enabled = !(last->emc_mode_1 & 0x1);
 	bool update = false;
+	bool next_dll_enabled;
 	unsigned int i;
 
 	if (!timing)
 		return -ENOENT;
 
+	next_dll_enabled = !(timing->emc_mode_1 & 0x1);
+
 	if (next_dll_enabled == last_dll_enabled)
 		dll_change = DLL_CHANGE_NONE;
 	else if (next_dll_enabled)
-- 
2.54.0


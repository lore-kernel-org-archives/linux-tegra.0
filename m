Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A92C37FF45
	for <linux-tegra@vger.kernel.org>; Sun,  3 May 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826337; cv=none; b=PqNyMLuTVpVNPmf7S1pevRj7BufeBD5gMhXiZ2zWSd46S8SB2SlC0BjIcbi7r3nbrriyIiuA9BsVsKEPoFO/XDT81LBxXxIfBt+mCBszTQXUpj4HIxL4lyngnSLx6HLajc9pQLc74h3Dn3t9LiJE0S6TX3/bLxjWYdoo11x0+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826337; c=relaxed/simple;
	bh=/83UcNMLmRQOQZEUoPq6Mx1XNqHRUJid4M54Vra9UsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzICAl3kaUTD8qWH53kx+XkrJD+fHd0H+u6RqOKrNeKMLIA28tsmGfRvlfG4SAbVZ0FQX7BVb3jJ0YWqG+BlKmA3UOgneO+scilgxKafbSazoSBfGLIAO3xLbuZVHWMs/0R+j4yg+uV1PjBMlhcywCY+e2nzSq/zCoA3Z1BoLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWsPYqFR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWsPYqFR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bc23bebd345so30363966b.1
        for <linux-tegra@vger.kernel.org>; Sun, 03 May 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826335; x=1778431135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uncfobcGMqJkNZBnd2AFYRmsf7AjZTfSUk16J49FjSg=;
        b=XWsPYqFRZF0JFLZFrsnK0l8l+Zawd22QX+Xvro0QcxiBapLDj+KzuEFsgDY44NvsY9
         agjb3tjDdW6nW+wUSDNmH2RNpKVzz5PJJwO1B2Kw6VfWLW8RUNeLOYsHCmkaD2/E8cHa
         OcD31HqQUobWi4ZkvQHyDMYflE1v/Gq55O6YfRRU12vhgZOQdidpTBwnaZoqqcYXyNk4
         NHkGrrMKXZHjqu8iQP6nCYsnf+rj1tNn6D4nvQGp1AP7R1K3ih3/5tMSFAYfj/AxOVnH
         jLZCpPGkPNRfAE9w5cVUyMe0gS9It/oFeBYTa+YM7GewCu2tQCxvoPvgx8zxptZ/iygi
         7lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826335; x=1778431135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uncfobcGMqJkNZBnd2AFYRmsf7AjZTfSUk16J49FjSg=;
        b=p93Cfms8f/7Rh/OXYlmuHirDT8rF865sL4J+JfSHOng9FNIcZnIm1uAnxvUpiHNNF4
         20HLMtx3dPcBljPV9DfEe3QAIdSarxMnrfck9rfUW4mJmKi/EpFIVbZbTZI+9QyKZK0i
         AxsAnfOmd2kpmA6eS7U+9V0PxChN6nk+fTbzZmPdgIOaPEtyirUI+9o19xQCdIPQhwWP
         HO3uFz9DkU526QWXFFoTjp/Ic0A7TIftcAkPYkGgFQLKIHd+9+q7rnl45pnzQBIPZVDm
         iE4rXBLF/wG48iNBeSznkCXTGVwqfxnFGgdvhLS2m7q0PjvJqzNTo0XMugvjmvMy/HBA
         dkew==
X-Forwarded-Encrypted: i=1; AFNElJ/vCsN1mUcwHkXdrumG4H1KxCuVgUz4gorCx7cdDJATGWyILQEO5ENYE1ZmqiJXNWXpaQu5VyGlS1lP9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRGbDqohYVbXwtvkEriSzwaMEUzvmHy+VxtJQ8C/dhy9TxmSpL
	yhJVhQ49PtkUUqxbmKPlTQR6m4ShQr/I6pt9m8vVMUkunWnLLVjL4XOzIRSm/g==
X-Gm-Gg: AeBDiet3aYrvPk9q1sQmVDBEmbz2c6KrIxmIfmTQQX5rlk4UB7SiqpuIBktNycjmgYS
	13638YRvPyJtKoWMH9r2ivkOFYvFm0FvgR5zyX5Uyjf/aI3GFIoG8lYRFVadU5gt3YbWuwTTCxW
	5oBu5Tz25WeoEBqCSEmCVEIsi7loJie7s8f4L/Msv5zBq35gcRKvUrjtic0l/j38uGhb7104sfn
	bV36+B5rxSLse7gW1nTTETDbyuoRradXpXJcS0qo+0Fbf0TKKMpMvqEShd4PuKX85JgY/zvdctC
	7oTtHHS8WZ54VV+WAnNd9m0PDgSfxU7adWquPKhH6WXJRRJJ/h0EIPsHvA4y1Dpbi6jd5y1/iFu
	O9bIGUab4E67+c4VLKBrldMxRwOQfYqTPm3erCE/HwwQ9FdxrVYyipiQgKQQVxXv/wnL6YrEsMp
	XnbUNlRjKjvJKlXl0coxCCj7w=
X-Received: by 2002:a17:907:cb81:b0:bc1:c4d:cc70 with SMTP id a640c23a62f3a-bc10c5d0eeamr181734966b.2.1777826334818;
        Sun, 03 May 2026 09:38:54 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ffd6f8e9sm44126066b.13.2026.05.03.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:38:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
Date: Sun,  3 May 2026 19:38:40 +0300
Message-ID: <20260503163842.213489-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gr*d_remove() has pm_runtime_disable, this indicates it should be
paired with pm_runtime_enable in the probe instead of being inside
gr*d_runtime_resume().

---
Changes in v2:
- remove pm from gr2d_exit along with pm from gr2d_runtime_resume
- move register map initialize before host1x_client_register
---

Ion Agorria (1):
  drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove

Svyatoslav Ryhel (1):
  drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X
    client is registered

 drivers/gpu/drm/tegra/gr2d.c | 17 +++++++----------
 drivers/gpu/drm/tegra/gr3d.c | 17 +++++++----------
 2 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.51.0


Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDF399031
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277943; cv=none; b=a/wZWQ3qbCuhMUFL5RAO/pR7DzMYaCFlKHXdeEuDqa7lBEHfy2iaE27c0iKlrs1mpgPhOQE+7GDFn9nwUpT6GNazi8xULkmsohGUpIBABKxLNQFCnOxNNpfK/H6ZDL3mYeDsprcTSA5GdEZjYN2uN3G7gLrTPD4uO08GSMi2MXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277943; c=relaxed/simple;
	bh=THkvd2xg4OaS55Hsbf7hoATE329XQJwwwcT/zqhgWtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mnUyZfIgYWLI7I7lqKWf+fh06kbsii90qBeUuu4ymy9SwAO3XytPgoWjXZR1ch1a9wjx9mjlUpNL1N6N12OilXBB/Mz9DkOXjk8NoLkR7L1VCeyhYd44aXJFK4TAOhpVHHu6kxoGPa12HVds3TMWiu1zRS5FpRWGL9oVxYKgTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL7lUH2U; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL7lUH2U"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44261378651so1042847f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277940; x=1777882740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kG/U8gUtyi4vRCmib+owYIy2NRNfDYiG7cZGNbkj1RQ=;
        b=iL7lUH2Uv/dDQd0vj17mrWStSTP3dIdI228CHS2XkRjn+FNDwPQMDZ8xGJ/GNv/sfw
         i2l7F0qOWmj9XZt+UWXmqqA6HtYS68GFBV1nIV2WQAAXiWQ/ElN9X/gcdOls2AigYjMO
         Qc4nDr5fdyJZIyNOPp7gT98bbwu4vZBLL2L/f8znzyY4rBE1L24xNsHwBD7924XIDJbU
         8ioKYbCg6EjQdcZEo8fzRU6lOFUwys2FwvoknZBgTxa84p/av5BDhWyplpGnsXDOUpph
         UZnpWTQ01rq+oA4+DEIwZyaw8Kk3t2lBJ3Wel7R1mRYo42+cpNTMmkfPTGS8eYBOHka8
         7YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277940; x=1777882740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG/U8gUtyi4vRCmib+owYIy2NRNfDYiG7cZGNbkj1RQ=;
        b=n7CXr1Ii+H+e17JI6u58g4d2Fo9eT1Dur4aVf/P/ODCZLclBbZJOGvpX6muudzwPGQ
         CETOKFWd6nIWGVNqDtKAyPVZybMWRM2xWXK8cbqs0RnM9wi75dj4SfKQbuF88SkS+glG
         DBdIZ0aIB7zjBf1Qd6HLiVrF2MHHqFA5ePjhLhOsmD1aL4E98l8SeWVue86XNs+vBgkV
         sKcdIK7uridmhvRpMqhKdooXAX4s3AjI4atLSNRID67zYyHmaLpwUhXmTsMQUlAgodwj
         uHpHEGvOFNNa0Vs2FKbqh27lOInIcHroG63104kXcNw5g27rk4/UJlTJoXcYSjt09WMD
         tn+w==
X-Forwarded-Encrypted: i=1; AFNElJ9xahqvzozevS4j+m71AIHGfktGTuhqCH2lm2TCiAgB8B1IcvvhqY8V56SbuXfB8Vw2WdXk2rOSTdTR9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IPTNVhrYML4kNXx2jxeIe2UCJf4Slyy0WxVc7TE5qypeoZlu
	PE9+uCaf4oty5fo/CqxS72KxunbrfsLTZhw+DPALgD3bAFsON2/MGfay
X-Gm-Gg: AeBDiesi17mdRFCpwxNJqELM+6PW65VG3WMa6XcamOHnXmZfOZSHxyhIy7vRg2GOFO0
	xuYxg9YKUcGWA1fRDWBruviqxPk9tIJxghFEngyCm8m9wswXxvxk5rjcSbwupDDyLuW13VItFX8
	5YwJBDsSgVIBIOtLGnDow/WCm3Aq0DAKZDG2J0tNLVYp8c5HKdgQvD8lOFyNpi0cPE+LoTdVGcH
	YAof9HLvB30vdhxx6RMi76nd9462GF5xq2Mk1pUqUXP/BzS6DhRxQp80a+1bp4qXneq7PQU2oSG
	3Q9RM1sCKQ6S6BXuFtRrffeY9Vjexz3r+cOpb/jwJLrI79varGdx3zStw1g99ITNMoFQRIY6zl+
	xL6YpSbQ091RnLIYdsy68yDNMMLWvYqDKkIu+5DC30AfHZem+jYcLRHmeOa+sz1vaAFNwHiwuti
	/IheDqfbcK9mjAV8lcCC325NqkLKfJB2joejAGdWqZ3JNYfEDSB+iYKGSAcvgJ5zqmJiTEFwojy
	beDbL+3kOQ7wc1tTzUtMw779arkepp0xF3NumtiCkJyMjCv4CjgB2Izh7W2K6gUWVPEGcQ=
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id ffacd0b85a97d-43fe4073831mr61766799f8f.15.1777277940421;
        Mon, 27 Apr 2026 01:19:00 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:59 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 0/2] staging: nvec: fix use-after-free and pm_power_off teardown
Date: Mon, 27 Apr 2026 10:17:11 +0200
Message-ID: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v4, full series as Greg requested. In v3 I resent only 2/2 as a
standalone without including 1/2 — my mistake, sorry for the noise.

Changes from v2/v3:
 - 1/2 is unchanged from v2
 - 2/2: drop incorrect Fixes: tag (already dropped in v3)
 - 2/2: carry forward Dan's Reviewed-by from v2

Alexandru Hossu (2):
  staging: nvec: fix use-after-free in nvec_rx_completed()
  staging: nvec: fix unconditional pm_power_off teardown

 drivers/staging/nvec/nvec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0


Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE286231A4D;
	Wed,  2 Apr 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604890; cv=none; b=pPPuHb81NE7kjKEw3N7h3ulgdt+OzNCc3nBvg9icCtdgbOBpO4kBqC6Vf+fSQKr+GDTBVRnKMl0ha0YOzDNyWitBp3oLxSof8j+IMmxbBy++hhPPN3d+cwF4PirTkzWsEESrZRoz4U5BgE2ycq11fbkYsOS/LX7UrDlktpJ9XDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604890; c=relaxed/simple;
	bh=BELqzgis7jFozBSeJ6g38zZ1DIngTYXk7122T6OLrXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R6bmVmnb15KK0CBt25OCzAOd0EVVbI/2pVzpAVrGGyCXHVpAs3Ev2UzYBAyHhZx8tI99iktPh9e3YvHAxAs+r54B8Y6iI7xULKMvm7YOKyZl1ozKreuxz0zXJdyzGiWDZq1dOOyincX5tqHaSIeqL+uJDq/x8wT3ItsvYtF1AFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBQpO9Je; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBQpO9Je"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2260c91576aso106049495ad.3;
        Wed, 02 Apr 2025 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604888; x=1744209688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGWlUxREAIk1n0OSq7YsQ2Gc20plfDNCnJCmCbn1BdE=;
        b=MBQpO9Je6QRfl9OoFlCy42pclFhfri4l5HQ8dLYoTYw0DchahlYbH2UF0UgumjElFA
         Kqq8FBpegJqk/OgrvrGq9nULCXi21XWYRbFEeTmG3MvFybg8rT3qwNauQidPPkjoSwHL
         9zisPiEBjDb7HZeljKFgbl9RGl4hOt5Ilh+//KScFkdxvAFywZIEBBHsajVea7led5rq
         jtGwYrXiDN1tDS+WR0m9EOJ3FmUF5BdDg1uwt/rG45s/ZqbW9BlmnxyjiwkwWfqXA49D
         7nKqfdQEYwPCBrfnc8A6ZJG230SuNIJMtqdFaWvp2TkvGeMzyDDKoknbo0++uJNSSjVc
         M+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604888; x=1744209688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGWlUxREAIk1n0OSq7YsQ2Gc20plfDNCnJCmCbn1BdE=;
        b=aKSp9HuFXIDvlEdhOYb0vvZyl0JDmvUJ2CFd+0Nt4vxf9AKpWK6fSw0ulcVeu8rJlU
         JYdYALBDgkq4fWfY36KZEHcXHteJIzbsfY/59yhrrcxH16Q+CwjXd+O6zltFzNJNXHbE
         P2ylwAzNrEn7pxQbDNnkfM3Ndd+le5s4dRFkSDJg+dXR/aBX4ePPXg5T39PrJyu0Bmj0
         m3CAv/+lqAbHtgmVtCJDQktQj8mFFJ2eSnf02LuBpXESkAYwfnPFlOFrIZjtVZqJ7Rjv
         fYSK189JUfrSxY8F0sJrK8nd9WiG2i4HrOgzCTDXz+oujmyHh2LphmE9awSwckm6seJ+
         eH6g==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ih0gChjDYcIkiUwyMOVrfgcZNGvmtg6B+Jcdrgn35K/M8d9MwozHp7elyXmciHwsfIkij/pJritZ9lo=@vger.kernel.org, AJvYcCW8hn4ZK1HD6oFM9g1SMvwwCJzBdWwY1ucTPkiG6dAHH9CjGLWDzjuvrLIp7hppjXAzlY4qUeKOVaycz2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/nATWLbDyIju5DYHoFcLI55Pcr6yGKTihE3VNBrhYqKkE8/bU
	pg8bDVphqQGlu7quinNiYt6vrSOOZrY++nFfhuf+5tUrnp6hAMqy
X-Gm-Gg: ASbGncvEb5CAtLQB6zicy6LAUhR9enVLuE5Hhhb0dsSBeo0pqnOihdprjxb5JWiGX/E
	OHAcPQwW4XoWeqd07FG1l8PJZQKDMV0grvufclufDEAqloj+bYZm48tqou8W2FgXAkn7nl0m/z1
	oSrdFXhEVE/hIJUSETTsHg+TKptQ4IYOZT4bq6xhyfEGMEeLyI7fIFwJz7DYsAeZGaH5w3maHu/
	yVYv10eCOjcEFBiAsxzam/pn9D7g54wornuqkdnAZL7wB0bUJnz4APTI7X9RuOr0c/UbOyQ2m3S
	OOvI8WwLKgVlmxzPvPTvagyS5ZKTh61qQ+7TIxW58JmCwn7o2zNJbrLjJJt/N/9IAFij64Q=
X-Google-Smtp-Source: AGHT+IEc+PN2L6M5+Vl7gKBtP0eJdSZzb6AYIIImcmBTGM0KDPJd4BbOUVEmERuM3OIJXLQaL5bbVQ==
X-Received: by 2002:a17:903:17ce:b0:21f:ba77:c45e with SMTP id d9443c01a7336-2292f9eb7a8mr246042105ad.45.1743604888022;
        Wed, 02 Apr 2025 07:41:28 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce1b4sm109142875ad.150.2025.04.02.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:41:27 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: jassisinghbrar@gmail.com
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] mailbox: tegra-hsp: Fix null-ptr-deref in tegra_hsp_doorbell_create()
Date: Wed,  2 Apr 2025 22:41:15 +0800
Message-Id: <20250402144115.45564-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kstrdup_const() returns NULL when memory allocation fails.
Currently, tegra_hsp_doorbell_create() does not check for this case,
which results in a NULL pointer dereference.

Fixes: a54d03ed01b4 ("mailbox: tegra-hsp: use devm_kstrdup_const()")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/mailbox/tegra-hsp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..147406149fec 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -293,6 +293,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, const char *name,
 	db->channel.hsp = hsp;
 
 	db->name = devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
+	if (!db->name)
+		return ERR_PTR(-ENOMEM);
 	db->master = master;
 	db->index = index;
 
-- 
2.34.1


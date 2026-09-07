Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215240BCCB
	for <linux-tegra@vger.kernel.org>; Mon,  7 Sep 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763682; cv=none; b=hd7XsnD+cnFDahXtW7NwHXvgdN5GlgBU4H1+05TsJrWdMiLh9NPIbpso4MXr+o4SsARGZyOmlKr6TFVQHqpkOv1LmvnfSbCYHdNhGNAEg6iq+oQ8OMzKVF1nXY7jmx39k/XEz7A1bp0r1yA8EYIBS3Szs+vfI8nYOrBZadU9Q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763682; c=relaxed/simple;
	bh=yXnUcv5qVGtYzgWj9FiGbfPJUzxRYD9YlLEosr6E6dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ0L1ourN7WSjfzar9/ruMZL5T8gBMZ2WqInwi0Dj5C3fYqd0R3fpwqSYmgn48REnq/wNo25PXYvKUnqfQm6OweXlGDBVI0FzkHv0c4RkZe1X8V3S8VFTteCJD3JQUxAN1gPuvrILl2TUQ19sUYQK1QSzUbEO32HaH+QOAzoKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEkA2AXz; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEkA2AXz"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2268771a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2026 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763678; x=1789368478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=TEkA2AXzP1ykjfqACx/jwed0U0LNdDZW6cGOrZ5RQo//9jTV+EFTNwnnmVzXjhb2op
         6BPX5Ow09lMovUQMg3a5IJ+aIFH0adXTPVdP0+KC5v45Q5TFr0f11AG/7dNn7t5RbItV
         c/FOxNxh3mUnUZ2+Z5UAmFDnsEqqDhQAaznTL5N3yyR4KmX3CkHPYapRil6wIcYCS1+B
         6X0ch2njIoFDNS7TwVF+yChN9zUPBvQ3zn8HogDmLXr+Jpyh2s+XiGYvjuK/a5zqhILT
         J+innFog8GVkrLiD5DdP+1vhX0F+laIpVd0uaIFiMElXfHI3JY7CLHyK4iKOUZITTDw1
         P+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763678; x=1789368478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpKYH0amj/dwSRkLCI992Ocp0fThRc8J4K3VwmqlP48=;
        b=eg+YlwOszXO6n228EXEP56ghA+ZlT8CaaxOtp5kEtllbr2vx52c5A+pFnJSJaGvByT
         q04SvTTpFnpahOfDFX6ZNr7axUUnqgBAenETXTLulysxBA1rqfSBL3Ei23/kg/m0lMuT
         eb9Vy00yhQUXXYaEJaOFZQZ2dpRER2U9tdYP/Dr1FyhJ39KG8/Ib4jfCZE8mG8gAU/nz
         SUBXXHq1Icu31EyWOnGzAB97Uuv1dHp8FI/7VYFUTheIhtP1PNBGydW9+K7QdIBkS+Bi
         xjCG7nnO1SAL4i96kgmy2S8gXQrO0loJhjijgZkO6lnlXUuw4fskJNw0b69nW5m+rMMx
         nHtw==
X-Forwarded-Encrypted: i=1; AKwUvBwxb2ZDAFkswMwMouKo7g0Lho5bUgqu5Um/plXqxTEOwaLMUgBnJpmOqQ6Z3Er/tZFujf4GtXHo0GXNOg==@vger.kernel.org
X-Gm-Message-State: AFuF++mZgiw1e1RQ0eUcEvSleIKhLzjCGSH5ZGdnpB7bFeuwxgc+irzX
	1mrJpCw0krxnTFx1bFU8N9zWGdnshPo8AbaSDu6e9+c5zbKVN9yPVocN
X-Gm-Gg: AYBFou3pwJNkuzpSQ9bR0TTBPSepGbvS6BG1YaxBBxuICNpti2wotc0VH9TXnCdEGhR
	Y6l8cqCBVWfuju8YclLcztBX8pdkK1WZ+Hrkb1nm6N1J54ZOBdubQxnBoeWlcKYgCC9ZR0T1Go+
	LRhc6AAExQAYMqH/tKLicq0YkmH9W/hZuqwV+MpcVEXs0v8ajwaRcjoNZXynnmwbSxDsBUqXXgT
	qv63n26AKFGmFU1Q0y8Y0tOe3a9//hYdx4V7JbQ2vlqnfb5x1FyWPhBX9tVZxOqbLHNUmllDfA1
	gOqzIhK9mYUjljX75iIKcluBFXhUtARjwrrJIFTMaZieji4aIAz10/BUM4mds4yg7yKlZrQ/lR/
	PbF+ZP4xsiSWi45suSR+UzvnXCerIhnQz0IMQU6G2PgTSPl93GIYO9ktQikPkkVnGlgBDacNjdp
	xxA+JOWUD4Uk/2WCoFYPT1WT7PygSOT337c3Jzk8btES1EpgAPDsIi4jLDXKSCAqTcr3LrOw8NQ
	vwmWoJWXGz2Ew==
X-Received: by 2002:a17:90b:35cb:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39b261ae617mr36625720a91.11.1788763678086;
        Sun, 06 Sep 2026 23:47:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 4/5] cpuidle: fix repeated word 'that' in comment
Date: Mon,  7 Sep 2026 12:17:24 +0530
Message-ID: <20260907064725.10686-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'that', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index aca907a62bb5..d2fc216c38fc 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -281,7 +281,7 @@ static int tegra114_enter_s2idle(struct cpuidle_device *dev,
  * LP2 | C7	(CPU core power gating)
  * LP2 | CC6	(CPU cluster power gating)
  *
- * Note that that the older CPUIDLE driver versions didn't explicitly
+ * Note that the older CPUIDLE driver versions didn't explicitly
  * differentiate the LP2 states because these states either used the same
  * code path or because CC6 wasn't supported.
  */
-- 
2.48.1


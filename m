Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFD739060A
	for <linux-tegra@vger.kernel.org>; Mon,  7 Sep 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763688; cv=none; b=XfVEdz+NY6XH2U3Yc5emvRo2xq0vvrlsMyoc8SvmVMBhQBLItgVuS9mfrAMKllDLxmjT2HTJrV9RE9JvhYdxkxTv/xrPqKB3oP5FiFHt8ss0Ir4993/EbLlpM04kZNATPlFfhNqc4CUVkwlFxdD1P5gTy2TzrqsTKjGnyxsYjn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763688; c=relaxed/simple;
	bh=NySkzWKGvAVQrs22Wj3YGugY/Vl4ZuUmyHXC/e0Qdz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4pSKpGxEG/J3K+ATjSST2y3KfV317j7lwgf4TGh+sS1quOSnGlF1xZy71xOnSLHwAXGGgjYzY9KUyzMwA3qucDUnqtZKjj/JR9CsjBJr0Y2mgjcl0/SjCqR04iHl/oJxjXlM3q00jCBZUwI3LwqS6pGV8eo+D8EJJNURg22glE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcmxg0Qd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcmxg0Qd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2392603a91.0
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2026 23:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763684; x=1789368484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp3Y74c4rqp4LQw7mbFodFzkhcskiP8CvJ8q4Odm34Y=;
        b=pcmxg0QdhaGNJULz7S3WvjNFTMfgKEnfQ1lTzIJKt7RAkiFS2bIbnccWhd7edV+msg
         eZW1TE/UXd3aAnYa/UbJ/Vh/YnJGXPkczE/i+KPtxwS9xsYnDMNyY3aRoWwpt5AbZOYF
         U/T14xjPplnfMUBMcMmR2EJZizqH2g3dNQ+2nh9Pfz2nZ+NVypi8s/7kPnQLeLS+588U
         ineD/9arkUWnWG+W6H9J35qKfU1zihcCS4IAqodFNKl7dpagHbzrjd53C0/z+zAnieK2
         0VLOTRj1DFtJ7T3Hy7nQEJlsOF2C8RQYtrRwVhtGqnmHgHRAYUuBv1hNhIlmk3eLpQdN
         dbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763684; x=1789368484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp3Y74c4rqp4LQw7mbFodFzkhcskiP8CvJ8q4Odm34Y=;
        b=VPrLpkaZv+MFkGhtJJJzmSw1zXrNLgftMxZ8eAx58QdSFazbkVqPsviseHXl7viuLU
         zkmkrJwSZ6uRL74m5i8Ic7WBswEZAAeCY91u0JRvZ8oELZKSH+fKlOk3/pqP+HQRSV82
         cHnRPxgO+ERrThh3kvFNwDANZ0PkyWUzClwcGx3Uw/U8flGlZCtUpsdnFrBm94Lx2cHb
         SQas+02DHo63h2gpuDjm/54af9zak2O392BsEsLUCICZKhJtbwodgWeAI6LbhD/nZktq
         BoF8gBYJKq5V1vrCJwpsywUe5+Pv7TopEdIRmBboatno2YIy2EVGnYqB95FMZZCYdpV+
         UTOA==
X-Forwarded-Encrypted: i=1; AKwUvBwc9Tzz6nFh3/YKybTqhjjutSX4elyS5/YEhDcn6R2eMgbZPIdxAoMnL/SyDqugFZDs/VwYxBo2hKQJyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mGfstFGyQsZPS4AGtnm2/PC7X+eNTG4jHlOb3T17nK7khhmpTe
	Phm3CVKYthvsmZesW/5HvT1pIhOjqEdBX1xcmO02PtTUC5VqXFtyVij9
X-Gm-Gg: AYBFou3sLu3032y9wECa/niE4KaVwkJcECQxd0I2DOoXQO0mfq/SPAnr2EUtOCRrcth
	Xf3IF+Aour0JTZMphssL7oCLNVeyL6MjFKKOXoiyHZvmO0VLAxXrNmbbSMgS5ZyMKylRPCqslus
	vLU0RH0uIa019Sfgz2n1Fzz+TltWTRX2EzkDv7yFBMiWGdEQ5KiCUTyivHCxix5P/s0tA3goRdr
	NoR5lweFXpEi890uyuUv0irr5V7cDd86ws/uDO9Lx/H0whKiViiTWO8wXXkys4Tjzh6fL2eBqgJ
	eyQ/cwSVjhB19Lrf9LUeGfi5qoodbiYvoos7gOGDIE0dUlJpahSL4etp6srq9rNWaymj8JZPFVC
	b5eTx/6rHZIuWi4WNjufJv8D7AlD/dFTzx6+DPwmfdopFLyp/JHY2Whk2IdA3u9CHzLjvi47Bl3
	xNlDh1LBQS/zu8sYTTfN2wBj7ghZvwidjzmjTqnSvpqmkXSzjp9NUZmd1tAwNHGZnjdt+/vwwBv
	NqpoR62TbicFTqsDzHO1371
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32259222a91.0.1788763684190;
        Sun, 06 Sep 2026 23:48:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:48:03 -0700 (PDT)
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
Subject: [PATCH 5/5] ACPI: NUMA: fix typo in log message
Date: Mon,  7 Sep 2026 12:17:25 +0530
Message-ID: <20260907064725.10686-6-hemanth.selam@gmail.com>
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

Correct the misspelling in a message the user sees, reported by
scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/acpi/numa/srat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 5c407dc6401e..f5616830f5a9 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -111,7 +111,7 @@ int __init fix_pxm_node_maps(int max_nid)
 			for (j = 0; j <= max_nid; j++) {
 				if ((emu_nid_to_phys[j] == i) &&
 				    WARN(node_to_pxm_map_copy[j] != PXM_INVAL,
-					 "Node %d is already binded to PXM %d\n",
+					 "Node %d is already bound to PXM %d\n",
 					 j, node_to_pxm_map_copy[j]))
 					return -1;
 				if (emu_nid_to_phys[j] == i) {
-- 
2.48.1


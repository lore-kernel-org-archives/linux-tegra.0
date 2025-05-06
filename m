Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F1283137;
	Tue,  6 May 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538290; cv=none; b=SiXMfuLMiEHveBQ4pS7mMhtOLgG/e+MpwMrS43Xt9/ov1jG7kXDfApzJxOxBpdHnfC/CQXDGXIdfLI6roJpJhMX37+RbL+P1PlBXPJtUXmwxha5fv38TA/h0xSXI7LzXHBCkLAenzXOILDdpJ8XHxZRJFeBh1rEKnxdHEXFU0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538290; c=relaxed/simple;
	bh=JZLVmgHwJ+gjPj6lHxSUIeiH66ZZjsOBGeXt7bphIAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7WOpAZ7sD6yCOxMIxcVFZ7AxyV9IPBWqINtAh3eIX4yn73tUKnsFSavFivH/aFbQ6kpWoPI++ckP6L4QC4TfyldeGa231x2joSc5eLPaXQDJdv++BMttGbWLLZI3vNQR+R1JtO8fFCzIpOxdSQdkPatCQpmVELT3LaHtFoGW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4hjskfr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4hjskfr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso6076317f8f.0;
        Tue, 06 May 2025 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538286; x=1747143086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSCtok/LXHWjOC/ldk4qZGIJX40EUPQSZo5x5RxQ4Js=;
        b=G4hjskfr14l1PLPZ04QqoqcabbBuq1JQtO0daWmz5NY8hIcUn+n5AMjNPzeilV7K6K
         zsAbY3TpdobFUKrq4iamw3LJlhPO7BGCsoOE8a96fffP/xQbYjUpyG+rGRyePRFwh2rl
         oJZDCHJQJN1xjT/8hISCs+BCiKPX2oJfxGnA3reqxW/v+65eP7p+LdSxxHShpC6ypMA6
         Uppn4j5L1FD0WrmLmsddiD35ymPX/UBZT2myLigXBGvERszEc2X/w4mSHb3M7xguAGlO
         2QjmBgOt2/PULSOORNSJZ1Novxojs24jZL6xjKg5HqU55MRcvNlWjE47LyYnU3V+t831
         pgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538286; x=1747143086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSCtok/LXHWjOC/ldk4qZGIJX40EUPQSZo5x5RxQ4Js=;
        b=R4xJ6TZlONCfP7GFUffF49UBTPIyxT60WJ+vG9yLv0KCoCSlRQEsR0kVH3/4j9BteW
         jcLvmXzqcr7NPB8puG8nFU5N+xWM/xYG0YioB2x0EdbjOqlOR9yjThQhsuVg1qYw3OUe
         DNaddllhaHNNtFLSa0a0JjhjpdQwLaXJrMHWFbIQr3EH38FPV5evWRjuvMHytHHxhfsn
         85uUfraEVRcwOm4xtro9aMXlQzAha9/3nZncr3NjQ3Ca88IieGDiTBz0NboGEqFpcAVc
         PyV6be/RseMyk+0le/yhBEeHZb35+39Mg96ZDTaI/RbR8It+f8InAJclPeoT0g+LUh3Q
         mupA==
X-Forwarded-Encrypted: i=1; AJvYcCWmW0QSTtgmvBfoDjKD5RuAaYwMW4ueNeThLiL0VxphtfM0e1b7AHE8i6H+HyywV3jpRKRmOt+Kf1I1@vger.kernel.org, AJvYcCX6fk9u3Lwv1E5PX14EIDAVfvrc2yMKmYAs8KnLAnE9AibSLp5mZ2ERxvr3khaAam4O6RJoceDFOUYru9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0czEMasp1MsQj3QCFn+PwS9uMwutAjk+FzZ5tB+92ljerEyj
	Wvgv9czhShHv/EInCOAHbnLhesynl145yE7Qsm9rN2IO3PMYJktr
X-Gm-Gg: ASbGncuQXtG3IBldA6OrAZmCcn87rnttGgtQSxk8CCnSJEBEEo1oJr7F/xfYbfQpzFJ
	lVWLOD1+4JjMeBT0Wad7Tefy4mluaWMZmIculh1IssTk74iEgieJtzSyZu30p+KSPIj/oyutXXz
	48tO08E8YKD9Md76A1sIoOejkNoLjpjwds3/SoFa3tKvjf0yjtJ9eaalJ29ywWuoeJg80pPuDJH
	cFFz1Jwg78Cy/nKwa6Zy17akwBqwpblyMsdyBogJ9mp1HiGlf3lWQcPNobKCy0TzrFLz0mitT3S
	wgr7pO5hxj90+VwquebsimPLiAM7y3C/y7bOMF8Hyyttbg5CYP1RxVxB+sJCw1h+sX0vgZKVK6K
	IoHT1JJE/4N4YcnbbanQwN3ZLXd9Be36w
X-Google-Smtp-Source: AGHT+IFKXjOd72Qs5TKxJQUEwSs0e8lqRxS+nFWKJwEVL+VsNb634sDy6T+tDo5HnQs5IujdDN4T2g==
X-Received: by 2002:a5d:6dcc:0:b0:3a0:ac3f:cdb4 with SMTP id ffacd0b85a97d-3a0ac3fcdf6mr2159303f8f.27.1746538286317;
        Tue, 06 May 2025 06:31:26 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17096sm14150866f8f.96.2025.05.06.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Date: Tue,  6 May 2025 15:31:08 +0200
Message-ID: <20250506133118.1011777-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The PMC found on Tegra264 is similar to the version in earlier chips but
some of the register offsets and bitfields differ, so add a specific
compatible string for this new generation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index ea4fbf655220..be70819020c5 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -16,6 +16,7 @@ properties:
       - nvidia,tegra186-pmc
       - nvidia,tegra194-pmc
       - nvidia,tegra234-pmc
+      - nvidia,tegra264-pmc
 
   reg:
     minItems: 4
-- 
2.49.0


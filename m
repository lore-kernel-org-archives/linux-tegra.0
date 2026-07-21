Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D044508F2
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628179; cv=none; b=CMlSMjqSwjugJtdKtpC1kLGaR2Jzm4pcPm4D1PbGbew7EfvAjMouRg52ilgULGh3YomLPQ6em+Az3csJRZLt8dcsHkSEVz/DrvxosmIoRx7CnGqSkD+JInBizSRuXW1Ix3r+jhwUotMh1uggYfD45Tw9ix9Bqk7wMb/uwzdbdfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628179; c=relaxed/simple;
	bh=7+sESZCwoRmRdIMvSHX+5fStOthQC4z83L8wCCGlnHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNdAcN6ChAqq/ZfWX1hiEa6CjvKM+qUFJWdbu+GmF8lsvNfGuC1P+nKPpMd3s8Q5z6bmsrmAS6IEoQaWbWhuFXlrYFoLrbJi0TCVDIdhkBzC5TuMF9GI85dP6/t9AG9ol+k6ScC8q7ZIm0TBOBTcSC/DZY2i6jmqetzv87SX/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6shmsyR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6shmsyR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f73b1ee02so392296f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628176; x=1785232976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=001R/7t07n0Z2h3W1UkPArubc/R60QJ7+7vPomj4XII=;
        b=a6shmsyRgbZ9NuRHBfy5B0RBRPoQdEtXUcjF8q7LcGh+iwXRDbkjT9V0jYBnUgQNri
         zaf/BAogXt387tM/jQFYejoTXmbKskPC9dt4eVpAEqNcN5jmiLOIdvlUvmrB9gYiI/i1
         E562l7N9KXYsoSyJevGy3ZYlEikn/u6lnox7cbatBnTcvW8n8bB0kkE+/mg1DK0vDL9m
         7EKmVZ8LuiaSsZF6bhhVzcriAKhLzwRflqD+xtipwifwomUAC8/aPDMhKAWdZ1hJWgA7
         gZ9WBRJak+wG5OjBy9gt8gyfkMbLMuxIANhPE5KzD+GFWNm/rTRu0Fk3quTzkIG+te50
         PoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628176; x=1785232976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=001R/7t07n0Z2h3W1UkPArubc/R60QJ7+7vPomj4XII=;
        b=dN0vP2+zyNh0Eo9oHiiribTdA4KM31JRsrmV/xcTGJysIbC+xG8nfqomeb6Q8XurKd
         JP7SJerBkI6RPBeRcxPfUNGKlRBGQq7SneWRJ5jGMZf4ZEqQNOPPG4WnNHi/8PPI+/aF
         vtqABpywFylFkBbeQupt9XSt7daLoIFsHQqIhjbWwQnih9oxY8qWx/CBVygSqAf6XZSv
         G9mVY0tFhurwN+0SKTtGA7VsSAsfcC3sdvR6ssGZiCyQTVvVIJZYOSBfttaCMwWvHg/2
         6ZmGgwtgVd+R180aH1XqKv/3XY3424uIAcbfE2fsSb+0dFeFOPyRyqX1T5VsO4kC+DGW
         QzPw==
X-Forwarded-Encrypted: i=1; AHgh+RrGzGqC3uMG2D/dyG1bvwx80Zn1gHYrDdbI4iG5JCsCE0GNaBeTXBnf6wkIsOTAWzECYMjfbK7Z+ppLfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wI4GPOmyta/p1eGVi6CBxJu9ZjiYNvNekz2EMOp5wWBC4l6E
	kb8zhsMMRGqQrLomEZ5Akm5mZgI9HRnCBf+8cpKX+POnWw0qhvI8jjgx
X-Gm-Gg: AR+sD10u7Yqc/8kasnFJu86e8G5Fp5kOkPWKkmMeqvx7xDlcZ4U50ncJpepBPRLOYGm
	i7wvrVmOolzsVUqoX/0cDzfPgZ0BCiSyNqWGxQferShw/zGUIwa1Tm4K+CNT3Jm/YPNLR/jvset
	/fz0sOs23guTraO34d9s3OXQO1epMQinmPuRvJgosgTnvtz8s/zBEf49JLFTzES58yXF6ysibM7
	eS1dfzgAkChJIzwtTQUJRDXF7fi1/Vy7YFKKz+iFopz9hgcIewcUmrLDPlzmbxo6j8Y0NoEUHUf
	qM0wRrEopDPXZ3nhuWfQLYqMgw86pkXrgcT1KVnLeRVtnGxiInI9k3pvui7x/OIDQpdVcLss0eD
	yCu2CMZtKvVDaOuG1q9J0I1JmrCsgeawtNa65fyC+DWA/9Lq/uWao+3L8PqqD9Us5KfRk23VPIi
	/m+I+kETOBba5pIydkjZ2nG3Q=
X-Received: by 2002:a05:6000:178f:b0:47f:7261:3a58 with SMTP id ffacd0b85a97d-47f72613ae8mr13330553f8f.1.1784628176206;
        Tue, 21 Jul 2026 03:02:56 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm39976860f8f.17.2026.07.21.03.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:02:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
Date: Tue, 21 Jul 2026 13:02:43 +0300
Message-ID: <20260721100245.444623-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Motorola Atrix 4G and Droid X2, which both are
NVIDIA Tegra20-based smartphones, originally running Android.

Svyatoslav Ryhel (2):
  dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
  ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2

 .../devicetree/bindings/arm/tegra.yaml        |    6 +
 arch/arm/boot/dts/nvidia/Makefile             |    2 +
 .../dts/nvidia/tegra20-motorola-daytona.dts   |  107 ++
 .../boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 +++++++++++++++++
 .../dts/nvidia/tegra20-motorola-olympus.dts   |  108 ++
 5 files changed, 1417 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts

-- 
2.53.0


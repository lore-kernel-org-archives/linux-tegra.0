Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6077F15
	for <linux-tegra@vger.kernel.org>; Fri,  2 Feb 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706868501; cv=none; b=GxFtfsY1oTPGSw4lbW5oq9EusHqg4PEir0ISeTvZfve1lNTiJpzOq0tMs1PcurxEAGcGIExUf6JFlRVNoYnRxYclmUGRqnZCHDVIJ3apxgtvYxbmnTyyO9XDggXls3FillGVzGrHmuTYj5b3IBjmcBNs0LaSlaWust+du2LRxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706868501; c=relaxed/simple;
	bh=uxXpEEwo1l0pLL86+am6q9zNgp0v4r4Mb2+ytmcDeXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GV1rx0PpjX+Q7jimsk3MNKIsg6kg8LyeUlPSDUNVwTC4vkvC5FrArvFKnUDm4c9ifP7jCQGZKT7uwGafZ0S39rcOSAWkG2Fr320GuTMqrHTZQ+kOivm1fyOAUUt9lo6/n2FnBDEie4xTSQiGlCQvwDK5a1MNX2huV7KhDe8zIdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMSeVhbp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMSeVhbp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so4204695e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 02 Feb 2024 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706868497; x=1707473297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5r+0M3w6ahd7nh8RaC16w7otrcREff8CBK8xjU0mng=;
        b=aMSeVhbpwr/Fugft6TaNDuGN2Yl5bhs+dLrwaJLyo+5TAXfjUYit+/E3uPqbTyEuHf
         l5xW05et6vnW6R9Xvyd4nxZb8H520x78pVhIcda2nFJOg3KOOuH/ikvlhRDNvKhoFTRh
         QHDHmlbrxg0xWu8/b7pEU/oPVCYBgxB8BMbt64RpS0yDEu/MJuU69CKUUjOgzONp0x6v
         g6O87goFrdj4DE8KG9fEdhHP7eo1f0c5m5jSIsgwBqCZTxrmpekS1gIP6wTtgTsLy0YV
         ksKGUn9dRxEg2dw7UnaenvKLWhF7qPh6ZtF1LO73Tv/+TRroN2S22azONmu7sXfUxNB3
         TWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706868497; x=1707473297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5r+0M3w6ahd7nh8RaC16w7otrcREff8CBK8xjU0mng=;
        b=nrT8pF4t7tl30txT+SmObubIk1/8QDexeZue2B5ueZ5NMs/Rb1r/jqFdlfTJneL7i0
         SknOe7xoT/PesEd0Yi6VVZZJnboxSOkh9wOVwjXmwFuFsq2kQg1g0nUZSr2jUnMO+KkN
         MxssV75CxCZ9PiJqsr8x5THBxSmWYFzlT2gBsqAmk3kZKq5AZIva4LIBzeWspC1V3UT0
         ckPYAxqK/ilmMoFBKT2vaxQnXBEqQ6r3XU3bOy4IcykIN0k2uxwiuhBR02l1GGIz73Dz
         xDL6vRVsQNzXsz4T1EIQhBQsUdelPA3Eg9s7qqEecQGJGsvYLBEXlq/zZbzj9eZ2xUwv
         Pa5g==
X-Gm-Message-State: AOJu0Ywt/gvWPx+4cv2BJt0OW3iXwwYYuxGGe3mMLoCR7GSLZ5ugeKLp
	yBl80UWjv7wT0E817+JJEILS5dO+Oj1+Y69s01BufwlVk35tv9M1
X-Google-Smtp-Source: AGHT+IFeMvxx6vpwk60AYFQefOVRoeVaXzTyyLg+t7RcYEtvZqEWOnJ5HcJpcPz7YdKcNW1O+3yXbg==
X-Received: by 2002:a05:600c:1c2a:b0:40e:cf0f:5fc9 with SMTP id j42-20020a05600c1c2a00b0040ecf0f5fc9mr6218315wms.31.1706868497235;
        Fri, 02 Feb 2024 02:08:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVfhi7M2VPioS4RcYZfMInYteMkKyZJSNfitDy9irT/6XDAIpQWCfWIJD6NIjziE3IR1o6rtuIkKppdwJMy0WZ9PLn1+9sWQwzsdJsm5nkn7KmyW/bk67qhTuMTVzwXq+U4jSQgMIj9he3RMxePcNdHww==
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u27-20020adfa19b000000b0033afcf26e11sm1603317wru.29.2024.02.02.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 02:08:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Set the correct PHY mode for MGBE
Date: Fri,  2 Feb 2024 11:08:12 +0100
Message-ID: <20240202100812.866143-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The PHY is configured in 10GBASE-R, so make sure to reflect that in DT.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index ea13c4a7027c..81a82933e350 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -175,7 +175,7 @@ ethernet@6800000 {
 			status = "okay";
 
 			phy-handle = <&mgbe0_phy>;
-			phy-mode = "usxgmii";
+			phy-mode = "10gbase-r";
 
 			mdio {
 				#address-cells = <1>;
-- 
2.43.0


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D863C1979
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128743; cv=none; b=FhopAcrWsAjRJb4Ni0f2pRpXI9yw70Z8LRKM7yDO/JoqfrGaRpcBjMkIuby/W5afXAdUGMu1nahqiqjIaq4w3Rc3f+ya+iRGHNliGSdZ0AP+xJfiGbLbfZPYIS5583mitFBijgUvqfzdZYY484poA2saCGNt0O8MSLDY8oJr6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128743; c=relaxed/simple;
	bh=e6FA645n0t5jPW4InVkmFqvoSKjwHUPLDdb3WpkSe6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx0X1yEsOrH+maiXhlCbVqTq+eflNBm006RbdiVicpzgewATAZjOHAwYigdfVbEj1KR4wOK2KsAiEOSk/VwQLWYs2irduOW8yCjIlXNhFZRF7BycEnMRvqELB9V1ajNzhmDQVabRV6+9ft2w42cSENSJW0ra3erXeRIkAJYFEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpDx+xeB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpDx+xeB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9378835e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128737; x=1791733537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0aA9Ox0j6Te9B2H1vwXJMXFZTa8054BUZn+qPVQGD4=;
        b=jpDx+xeB2izIaCAc8kqY0ji+MI7agX+NflvJgpHR8/zuBmAv0jwBuL5BNY8XnJ4LG6
         iI8DydhmoND2ANyu7vaRyUGX+4LzJVDq0DZqId6OAcxzdKEbcFTAEdo757kw3PLGi/SN
         4i3zhI+OXUHarwTE7lnmSeUse4qvqB+ZrRFKcU9sYp1clGsbKpcmS9CNWWS1GcpV35sB
         CF6qUVExIFrB0k0PgZGyA4Yjpb419xbzJ+4DYaiXhHJ95xW45B68sTz4oW8LZ6SC3yf2
         IQzFuUtBHm1nlykMLOfnYLQONsRNFOg/UEhVk45K0CnGPI1bPaVoJcZRVPBZn5eB01uc
         BLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128737; x=1791733537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0aA9Ox0j6Te9B2H1vwXJMXFZTa8054BUZn+qPVQGD4=;
        b=NNxfWeqysgB8JbTsR6fK/FX2lID2MJrJh2JS/3b9Su9z6YEBHJ60BBU0P56NYUJMQd
         /ND0nNoHl61vwXYmxnB6UZICX7f6WDnnKMsIhfW74Zo2jMvo95ptvs43B+8UI4FyNElb
         tSvSS5smaMbG6ULjtGVkVcUAU3H5NQ7xfH8r5TrZ4rM/iCdF0dPY9+J+V+dlcSx9aI9k
         tSQMQSrf9DBMrxEOzqMSpEHErnfG6D0/CnlllsbGb4LveRRxkUqD4FD8GkSKq+X36ab4
         d0Tor4AwaeVYOalnqiwepS1ojb1m5H8qWawlS6wF0L5NGM/NsOLq+XsuXiJDcNFrVniz
         0tCg==
X-Forwarded-Encrypted: i=1; AKwUvBxW9g+SpxWthpm2KiwO/h/g5tPr9vEr0Cv4ktx2ZDlwwmxDzFBlxHk0JrayFs2CBgV1vVTa2wIAvdfswA==@vger.kernel.org
X-Gm-Message-State: AFuF++lz6JESrrAiJ6LinJCvMdIVEM1Yqngnq+pz90jI8hqooBBp0XV7
	d8GZC42PzKp7ip9hTmGoA+AtWr/BCTdJJNPu32QIy2ODfmcK+OU9fJND
X-Gm-Gg: AYBFou1j+j6oul8UBYo0pc54O6wEjkl3NQGlqP4ZziVVtK28A08lwQeKUGWmnjeAzzN
	GYWwHT1puXJqbapm23FJSYbqD9M+scnOU6UEa3ADnoemsdBJFxKPgyzD8b7Ikzp+caTEZ5S6DQD
	hh+e7JYM6vZCM0seByYq8O3G3HfWTGlxGlu9dGkG6y/SxCBbreOCP1nSJlEfK/4WNwkNEXJTVlx
	i4mYnzssMbp6HkqG+mt2Olp8Noj/1W8foZXHHGAi2KaIuxtbK0wSrCjkKPniuiAqYDhRtCA8hTh
	hS3xaBRXM1ysrJv8lTqVdWnmKbx4PlY+TcjM9mT6nCJ/poXiOL+/DfR8vWkd6JjSC1cVEeJ3+A/
	rJF+YG/Hpv35z/iVdFVIj0rQsjE1qMvoehdYk5MHaoZLPESI8fq8Mte7bNQ2w+PmKwdwBcfco6O
	bnQVVy69iOUewWxGRENgax68udRZP3aD4xKc9iLh7jXyYCmgTaulZ/JgxLQiVdKASYkvScqOuej
	Y3ZTTGijXWcOFM6An4=
X-Received: by 2002:a05:600c:8b77:b0:4a0:1365:8559 with SMTP id 5b1f17b1804b1-4a0275663d6mr120969885e9.11.1791128737510;
        Sun, 04 Oct 2026 08:45:37 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] ARM: tegra: lg-x3: Lower supported suspend mode
Date: Sun,  4 Oct 2026 18:44:50 +0300
Message-ID: <20261004154456.145362-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG P880 and P895 are perfectly capable of supporting the lowest suspend
mode currently available for Tegra devices which is LP1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 7010d8c01abcb..d5365253c740b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1610,7 +1610,7 @@ bridge_output: endpoint {
 	pmc@7000e400 {
 		status = "okay";
 		nvidia,invert-interrupt;
-		nvidia,suspend-mode = <2>;
+		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <2000>;
 		nvidia,cpu-pwr-off-time = <200>;
 		nvidia,core-pwr-good-time = <3845 3845>;
-- 
2.53.0


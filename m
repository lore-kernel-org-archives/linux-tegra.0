Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378509;
	b=SDL1LOzHsNAUyjB9Tza/ypzYRtFSN+FywiqRP9jER8g0W1eZ98/i7j1w5jXcTZ5jxKAP
	 b2b+HgEta7h07HcDrUWyS734qyDKs52rj+FDYnRGyvel01VQPrc+D3S/JFwHePdLr5wcw
	 l0IDOKqmIaeMzmu3yPZcVe1R2Jw7NmZXYnGM9wAs+OaYx0xeZQiASsKg7pRf+SxDx+ZHY
	 K4z/56H7h1osvy7ju0531hztbs92HqBiow/oysIwvKSJDVn407SDna5uiJS1zT+WeAurF
	 i+oPH7FKWYdY04R7vTyE2GYMTnfZnJYoBALEerrk5ofUinYx9kPg3obZK3hduXbl51Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
	b=ZClGp+x3Py1fgPh18ZerBH7aBBheu9O83tJzl/hHvHE3cBrynLiO5Ln4j/3J4Xmp/soG
	 RRHb6aPEfzWtAuT6xVoDsWsr4bXlf8MABK5mJxxjc10yqtuA3aRYRJlv4JEpqiJoeVPrx
	 Rswtm3pWCUNvlwJDUnRLrFr7iR2yUbJn9xPdX0zX1D/kVFnB4m+2n0rVzmCTiSjOAd1sN
	 QJjIOT6261bVOQsu0Y1e5ETx4GfU2sxbAZgDigxFGEvx8O435KvFX4ZsewEytLRQZvjV/
	 ywXO+XVzLAQ5rvKxs2IKxTT9hYsOhXygFLKxFuwMp+e0F9MEkXuFe3KgVKvjUZM791A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D0606A682
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05D0606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso3042952a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378507; x=1795983307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=GYm3TeMklN6dkS/HNb6FOP56f7UVPTedXjNJ04dD8uUgYgEKEZi7qmhLoQAVkFLdcn
         2MZBbHzPtmeP5y7a4J59YU0ljoSBSfwfb/rXhWTOlOqEUt9avn+PNm2BTD2TUzaI3UyD
         wM7bVoxZ4Wml/S1Dq09CSpgZUKkLrXe6VAfnroL5JvWmpp/9qxH9XhGUeQ5CMPCRb/ZU
         8pV+VCfOju9Jonb59/QugN7jJOZIqBYsqKuReVj7UMnMGGzSE58/YFaPvTcOsB0D/59r
         rPfgK0jF80stTzk9uPBg4/uiVjsQNTf0uqaXZ7J9svJ2fiUNADsVh8IVWVA7PtXanoYI
         pt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378507; x=1795983307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=jjX4KOB7/7yELeDVxd5BrTI4Me3zLjNnsbc3gMBy9Mp3j0IB0FbCgAiLrBUKs5QkHC
         NpC2Oo2DzE+8NJAHgZ6xPk2Z33sZcMQkbvTiIdxuGx7pOgXjEENfQp53VtMRh+4YAdt3
         xsKWrvpaJGqFe7hs+uQypWckQwj2l7sKHpGqcj6YCwEbjbk0KHzRrhqyLbTalxS73H4a
         Syj45edt3LtYSD+7bIY9UdhqZr0ikOzEsBl1x9w5BLLD7d0rmgW5t/+XYkWw9R9rU2zl
         bcI/U00Tau9q0HsyHUElVdp6YBpOjUmol+5st0veYVmH3Tzbi2iYCfsckFi1ty4XcDqp
         OIzg==
X-Forwarded-Encrypted: i=1; AL+hErGfEjxWaX41OYrgK6OOcjm/UmcrVn1qtn3LxxnqrSDA2CDPbbhBUETvpR49+CVgny93KOVhlK1y0IZJzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fbo3Y9QtFOQdikbxvc03CLBscDRd+V/jtixXG7uc7+Xlzi+JR
	WL/jprjBOoTx9+gsUoe3o5Hm7bHhNouF+JblYTjk1oCN9Xkd/MAHBKzMJ9EgkQ==
X-Gm-Gg: AZFdTZfKhr/vgiUpOp0rhgxL/GgaPzPpxZ8xUgGKkjb4njfY55z+h5uHMZh8epIkLJu
	vLRskInzn5tSqoxE4QfIyDPSByaCH10FGM+UlSG6e7NX4L3wtLHXPR7gBQ40VJGEv1LnTdTdjy8
	fq3UzBFJpdThWhdHkIF/mKrbHE04GfKUksRAfjU2uqHKw7kCSpD3/smd2JufE9lHgYY10Wp/Lpm
	2JcwWeSOqaSV5h2SaUowK63Hpo/ZZlPrENs50WvECTuqehk9MIsPnwt/E3nTwqIqgV/43+C4eo9
	+GzwUTfii8APpAlLsdRCYtcoIgFHjC2cdhlSMP/mJs6P0ISy8wy0uCirXSZbPgcBGkAogAzXL/x
	s3H8DNCVq7zeYxDU/kFguEyx7Jmthk4cQF9OlnhUBoDZxVq+qNoP5x9jjTSupqXB5rT1qCVZCAZ
	IAcHpO4LwQY4cNPp/TJMnlLLjYVYDGuY1HvVlTMX+xPSqflFH/ZECa2DflYrM1t/rFf1Ahcn8xx
	nPJs5k1vYZ6Pn+qRHFiZ8ieDLydJL3YF6cnJJA5+FQKP5nb9bgIkN/v7sciDsEeCUIvq41fXHpZ
	V8ykQo7q8ILsiig0u8NjMJXsQLHxToZPGnv3S224Fxb9B6RlB0YfhqWrJCzYssFyWmp+0mQrJXc
	GeGVk7+VrYw==
X-Received: by 2002:a05:6402:280d:b0:6ba:b1fd:6e73 with SMTP id 4fb4d7f45d1cf-6bab1fd714dmr689422a12.40.1795378506948;
        Sun, 22 Nov 2026 12:15:06 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 18/18] ARM: tegra: tegratab: Add panel rotation
Date: Sun, 22 Nov 2026 22:14:07 +0200
Message-ID: <20261122201407.23742-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add panel rotation property required for correct panel orientation, since
it is mounted upside down.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 99f0d1c345e63..35400af7c1c1b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -175,6 +175,7 @@ panel@0 {
 				vcc-supply = <&dvdd_lcd>;
 
 				backlight = <&backlight>;
+				rotation = <180>;
 			};
 		};
 	};
-- 
2.53.0


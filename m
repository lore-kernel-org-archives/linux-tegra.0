Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC1283128;
	Tue,  6 May 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538297; cv=none; b=F00terNL59xscfAgoKfkb+HyEJEk44ek0kfX4OdP8vE2iB+0Fg+158H6z16isQhVZ8l0MPEdEE6iugfQXxuIhMOlkhiRUW4hv3t6sorOwNQeil07PcvFfKjdUMPNTPy+Bd6/2Kp4hu0zrJG9mPUYJohAAUfjEbhzMtEKIM5iMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538297; c=relaxed/simple;
	bh=eIjzo8Ckb3cXJ2nSf9RVpGInHD2QTA1RcF+UDZa4jeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcE+C29S9Tk4s7xHvIihIhUWhS2LBOXYc72BLtYUvehdLejLGsvRgdX6CcmnYY3iAGujpWsxTiKPwwuAg+U/E2uVAt80FWSe3TXf7dxfkgx//ZcKCfdFJe8YVqNZR0xUaSk2xIsBN2TDGFNPRGZu3xg2PxBkjpJY5B6MklMFt0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkSHCMs+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkSHCMs+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3742554f8f.0;
        Tue, 06 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538294; x=1747143094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ly7N+DC8UGuo0Brj257a3S2ZZi5dSNi5oLrFAULbBo=;
        b=IkSHCMs+qqQMr/FqOnwzvKBwqZZH7Ju19U/gZumAYEk4kDjIvPMrBGF5+2fTVpnRN6
         5OryHopA7Nq05CIIrzbNTU8MqkaTGZG7KEocTnmoKGlH0IWx8GYrzWEhat4lXIbAs1ew
         d2P8YggnCnNfyjAUEyJRTl5GKf8BSjITA8itvO/nbvsCz+VT1VoJW3MP2jwD3/Gvliu+
         JvZInSW8ak5hmyhHo5JHoDR9vhpqPoJbE+ntjIdFPXwhu1LYlPjr4MVsE7BvxCxXrjdP
         7514fNuhWKH1VimnlYp00sQg2aJMJLfUcH7Ebt2bB58+VXuZ1EmXz++9VvQc7tOfmfQa
         +7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538294; x=1747143094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ly7N+DC8UGuo0Brj257a3S2ZZi5dSNi5oLrFAULbBo=;
        b=bYq5OxtxaLd2J2tOwCMoyJFIsOYaRg6DvGSeX6UTuo/7mqt+sALd0iZtKU3k1oZ1rp
         DRBQbYG26thLMZzvKB/DH6jHPz+pj1dH0nVilw88ygsS2U9eJcHBDfmdBt0AjthD1LRc
         CzsRTCUvsM13oYjJa4IRzCRrvPHR8oYsVyDzzeeVB0OBRt4Vw2oL1HGc7gMZEWgDRsnc
         nquGC9vrllui9GziP/9EQNwXjq8fvCmA8Hywz19ImInHaMMcjwno/WauxDRCLoweRvgk
         YBn2Yms8s/jh+wml2MfzCn1Gjtk0D6rolTk/rtjl9lNWaSg43PI9aP1EejLC6go3XTTN
         TtSA==
X-Forwarded-Encrypted: i=1; AJvYcCXNYiB13TzijjLnpuphRQrkwlfB3CNf6i3Uds0uMEim+WRtHeLgiSiFmhZgOn3BVwP6arZWrWeZXooe@vger.kernel.org, AJvYcCXk5+kPYjOeGyWQyerCPJ3Y/nbAXcyjqqMr+Hy8iTYaAfGYNc3ugsg7XOS/aY+r3JxFdAXPixqEz1Qv0po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+m81L+DWHi7LVU1BzXu2KrC1Q5ph8edmZftHu63CsRVpEWxDL
	NhgfsCrGHlIDyU3rh0Nt6PHrTMt1gJgD9V3Dmm6q2iyGEMJkrqVe
X-Gm-Gg: ASbGncskpRvee3WeuTTVs+hFJoOU+2fzfekPLS+OdKnM/jl11Zrs5VN+AvkUaprJ5fi
	If4ueDfaqI9DekEuFevqTeV5zaDIULzMsLALyZhwoFAXhrTJQfB4RdfIP3ag9NjTnmhAMjucy3U
	QvSsjvJee4FiBJNpjcFDoKF4O/BpLNbweFpQz9oHdoTpHMpGGr8KQbf2aU3id6HXVFLbTew8xjF
	5GpObw0OollheHE0qR5h1/aculc/eyLd5Vc/BDem1/ifg1GKSoneFxlYoBXn5wMXN8SyghYml6p
	8qCI6HvF4BSyJWzKZBh55VCmkNrtSiVjy/Y5mpO3yQva0SxZie7hwYS8m+f4t+6V+G4Gw11h08i
	NIqzwg5HzefV3r3HOXVpyHBFO0xODeduT
X-Google-Smtp-Source: AGHT+IEeR1ExlmG1yo4fSKgBq3ylxxIF0pAxZcjTLkLUeaBJk6yosVMQT70HuL6uaTIrSbkavGIhGg==
X-Received: by 2002:a05:6000:184b:b0:3a0:77d0:ba3 with SMTP id ffacd0b85a97d-3a09fd79f8bmr9224541f8f.5.1746538293896;
        Tue, 06 May 2025 06:31:33 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d3csm13488923f8f.3.2025.05.06.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/11] dt-bindings: firmware: Document Tegra264 BPMP
Date: Tue,  6 May 2025 15:31:11 +0200
Message-ID: <20250506133118.1011777-5-thierry.reding@gmail.com>
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

While the BPMP found on Tegra264 is similar to the versions found on
previous chips and should be backwards-compatible, some changes could
eventually be needed. Anticipate such changes and introduce a chip-
specific compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index c43d17f6e96b..3c44fe607e12 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
 
-- 
2.49.0


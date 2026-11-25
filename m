Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605999;
	b=UzpnC8kJQNHv0z3KfBq0jEsmOA10TXnD3PYk5GvmFm7lEpNiFU/+Jn2CPnA2RtMf/tb7
	 5xuDpizH6PQkRksM39vjJCxTBZt4kjD1ddIuDezC+6y16MApYPDFGe3UwS/QHSW8gtmp7
	 J0UmHwRyxKaGjhv9qVtAcE8so7J4K+uQ5AXczMMyb66A25o/7XensZe2kQL8CzFjzxxg/
	 N5A2qOlLyhLQuvaqvx+fzw0zVCm3CsmPm1q6LD9imjyLFc/YlSAJWeCb8NQ/LqyLdaB48
	 2ZKacPQPOUDzDSxjoXyi8VG7l/1l2DpJV9cJM7UNti5i2jy96GTXnEMyF1UQzV+4rAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=XFpPkVZ33hlY02/H6dtyarn9VqfvoIzn+iW4ksy/XHm9dDDy+FpYNKy5OlbF0j/K2NMY
	 i87V4T2GT1qW20qEgbtTZsI50dm4q0dwI7Ab/6kAf/BUZVNyV7+o+sddv4/CBXr3+Wu8o
	 DG/blm3QNzCLECcV/KRZA3uWmyYxTtBGpfDQ2GlquiiBUIE0Jtud323a/UUbc74NhOUJf
	 0RejnCELOBb0VwtsRhAQzr1Uw/oy7OjNSGgh+X78lppLF6zdo6xKdh32f/5Pd+0rEHhNU
	 KBbmTrjar/lfWhiMsRTO9ELHA2aoW8Kx48fzfsBxZoAjag/5426uRUkgWRc0Z7YwCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3A60A382A
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C3A60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so7657586a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605997; x=1796210797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=RVGQ8Hgq8nSm+KEOOWBIlYqI+TMl8HVguwqgFXbJguqc0lDwsjLI1kgYrBgUym83sx
         Q+sNBxZzC8ENFnb720pQzCWyGyxn+F1uzf7mKSCZjksGaetzcmbIk2S5bODx01feZ7HA
         5ChvPBgvjQKG4KB4m/LKfTYEFdGg2F+dq9vlr38mJ1ILKgdJ3gc9j753NII4BxpJ/74h
         usfYMs3nixas1jpCb2MvtF+unJNTPEaxxu0lyJr/5jiw4tKpQjbWArt+Nhg5J1Q+heiR
         cbU+T/8vdMOaSh3i850GylT1WTOcm73gCFEqukg7wXkHAZ0c4D9kNucePNH+MDu0cugl
         3cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605997; x=1796210797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=aebykLtdNzJseaTLliltm02B3g7Y1NtzpbrEMefsHuRGJPeDLrD1AMwkLJny25oNMa
         H+inR51D+w9rL178KllRB/AFA7BmsG1ib1mi6ZcCpduMxdI5uJWi1SPPztu1s7SGvgZ5
         1E7NycOUpv7ZOn3PI0HMRQABQaaRaFnVN0oTopZc+KPGCTmU30imU6UN1u+uFlq6SKG4
         J8N7iEYtDYjkRWuZau5IeMDqdd3te/Yu0Y3KLW1n5Oo830yTSajYdz0l5LyPfyhuxC+f
         vGUPAly9ZE7XNcFDiLYFisqdH8tgNyFoKiHEJAUFj0301ZN7ZQGCmbwne78k9XQbD/0Y
         m6eg==
X-Forwarded-Encrypted: i=1; AL+hErGqUoV13GRrdPNv1DmfkOXiggjJEBJaxT0ENaHNX9xN27cXg1fYdwyK5LNAPI1r2S0Q90RcQk8DlDorjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+axDrVCOpJN0gesulwMr4vQm9NV05yjVn4/bMtSEjROPdB/PtV
	fssd7nnSor4BjUPNQFQnM2SAGZPRtTWrWqeNnvb+ewtlbIpCAcnpGBXR
X-Gm-Gg: AZFdTZe2QLYiMx8DBhIXtCRGYu5bYJAjT9x6vuHI7X7ixh310q0DC+AU3YDFb83C3b8
	xjKGvPAszlY3GhbnXFv64ljL1vRMcvu43d6p2l7U9flkPkyepi/+EENhn8VwhKPwxdqtDcDwtQk
	n39olGHe+6BIcPNRDX8s171obuH2dcz3u4vA/i142tTq14EaUi7zYFJgwpDxZgORa848iM8H+Lx
	er6Jqpu74tyVZ8aY/MkjWORuV1lze+ngPHF0cHj+xxtoqRQU0eEe23G6MyIUkxzoh0eoumck4aw
	MNslZnxCjsHFAxmGnxWJQkf2m3iE3fdWtNDpnE+CJbmAZgHVMajPEA0ROdTdHss931MdmRDzyOt
	8kr0WioRWC9ogrghDN7t02ItD2hIqwWMgyMqZXfC8JSkmUOpwGk+Bp38Vs4a7kRbOk+p3xzxpxb
	ZdVCc5+HUATCavgzib7KeLEqiEqvZqToN6UQQznywPgF9nrwcEjRNsYVBPWo8UVZ4nR7pcO8BBX
	ZD2PMLDNGdir6prWeBpBHmyUOctdaxzR4jsr9d19+Uz4zQvJJ7ECYduja7iXlVvwwybVkzJWPiY
	FlsDjbcUWBegnIIxCXwosTyYHAblSCVB6hCe6kLRPZMJPOQmwy+XyvSLg+u33AIv+wtmVHZbczX
	2MUIBVkr4u3jtqU6/ZR2WWds18jszbJA=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:dda4:f72c with SMTP id 4fb4d7f45d1cf-6ba729046bamr8500699a12.44.1795605997391;
        Wed, 25 Nov 2026 03:26:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Wed, 25 Nov 2026 13:26:12 +0200
Message-ID: <20261125112613.237333-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0


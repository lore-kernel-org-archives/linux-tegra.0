Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391866;
	b=DsD90nvYZbcBZbPV/4y9Q/as9ERaijDzTT5vVd+lKZX7xAT+dgktxGCGPicgMnXqo29s
	 MlZHOJzHJ/eeLqql2k8B60CkqHH48cNeyh+cZ+S87NIw6YKKigGily/fbCNQGv8PB7YxA
	 OXoSY98MajB3AjxC4je0NsPo+e2IPB4bTgpRrTAFiO6gnWolqQVQHPciQ15uEdXPC9fWf
	 624n3kBeGHWAIIev6soZ4mnp5Ec+5XqQjZOirB4OQXWgdI+vQf5k9lHZmz1nL62LqD+gc
	 WJhN1t/bowtFp1OcSodkMX/1KhpGP3qrDxArNYOnfG0lfA90fIqPIjtiYUdk6ki9Oow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391866;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AUsolObt8QXatVB+sDxCGLaLW6XPzWoZiEKzrGUA9m0=;
	b=z9rauh0E0JgZQKK2WTv+6CNYFz+EqK256GwPt8iDn1liDTSbwYj9fYjw9z9mm8dFU+OZ
	 A8zIPXkuBl3MOw2vbgsNxnf+880S6Vj6kFWJsI7JZM2fcrQiB4Pd0FrQIi8y2lh9Iaj4C
	 lfE1VASs7FYAZf4xPJukHOQ84BrUd6Sg5rcT1en7QEzwQaPN5OJvBAAOKyJXYETYMFeyV
	 FwUddz6Osgpiy56DPOKiMneZhnZippoJecpwZmmhB3/ffIuT7vUR6txSRWcGuNzqErT89
	 RQxZkcRimZh9jtRdyU76dE4dqgGOwhvksyqbpUJqOUvSaztGJAiVE1witlWi3SLfB9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=civehD1t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6E606A88F;
	Wed, 11 Nov 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=civehD1t
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794391865;
	b=d5qS/D+oWjiF+lGBWkcxhHzW7sj+rssTauKjZVGOEtiJlP5vcC/u58yN75ZLpLR/HucK
	 cRGCzlW//pVUTMRcQdPljyKa1vtFUsN2VTqFC39+b40wo3aEJGo/3a55sJdXNhiG5rP7o
	 lMmVEr5fAFRzfTpwYf4r9p6uzNXkx5K5w1PSd8wKjyxze2YirHWBoqsNUjA+QwVA9MApS
	 JzS1EqkplfdlS2mepHuMnR8E5ttBtlOmMZ9Sf+uyzuqsHpYfb9b9EbolbBzBS3hjsiABk
	 /IGkftcaBzKBEgleHwXdteav+shCG1xPOzwlYEry3F4r/p+9rtbsfCNmij8s+4BW+gA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794391865;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AUsolObt8QXatVB+sDxCGLaLW6XPzWoZiEKzrGUA9m0=;
	b=zI3bl9dgsPIu9J/tYEUUozJMP610LGxgfi02kjaMFkXWZsQC+wFNS2nTSmV5xo3Y5Zf7
	 iPuA4SZqA1Zaw6MZrdrBY7jgm+9QuuPRuIaQn2jGewkrQtqzk+dnxJ1D0w1n4VeornUH/
	 IRFlJrY2eBNfxIzmbvJpbb5gADO7dReSC63+OJr/e0cBS7ZshMcQD0eHMG1oh2GABv0CW
	 /gDcJ4wcUX4qQp/NX93xf0iWywiqaQOd4M3WX2yapmqCp1/5mw/s/D7uQUf1uj3OdTfQP
	 bQawAxMCXDG5iP68/9jyATUdWFT+h/YYIz42eMTpP6M/GoPDHBEmStRC4qxz1rHxFqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 626BA1F00A06;
	Wed, 11 Nov 2026 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391865;
	bh=AUsolObt8QXatVB+sDxCGLaLW6XPzWoZiEKzrGUA9m0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=civehD1t5HZ3v1TJM0TWCk0pXAgluujZR6IN4DmXz/bpd6n1BoYTO3UWAPOEMIqt2
	 25WGPZQkQoNPYHDf40UkRBxdcwNp+tCAvSVBYa29pxoNa7IAuv8nW8vpKGLPfLQ0kc
	 Od24q7lxY5OyIQg40vVka//Qq6XEJbgcFVzljjEyOwHisBw+MwiTHlv33/TBiAomNR
	 /B1KV3hpO8u8tpA5u1Q53FChq9po9e7nwVqgTFo0W0FNjHaJLqou8tQHzDjWlPGiJX
	 zyUEj8Tz85CGpkalvrL77A1zSEEB+W1aK7rpgMJ9p9DYj3OwqxkAEbQ9f1uiM7ENpI
	 v2/aMjTGKzGfg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 724FF48F43;
	Wed, 11 Nov 2026 10:11:04 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Date: Wed, 11 Nov 2026 11:11:01 +0100
Subject: [PATCH 6/6] ARM: tegra: Add EMC channel registers on Tegra114
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-upstream-emc-t114-v1-6-54d9e1bceb6a@tsv-stahl-riesa.de>
References: <20261111-upstream-emc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de>
In-Reply-To: <20261111-upstream-emc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 Patrick Fischer <admin@tsv-stahl-riesa.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391862; l=937;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=T59sEe/f17u37JLlvAN3pI/wxW5PHR4RdVn2Jyt/Ljk=;
 b=4smoglDsXKDNvXsQ2jiYAlIYolcSJZmo8yABt6+cC9hXJz4IJwIgUZKUOmq+54NcT1p4IutRi
 WmznIROMpvsArDTaPtH46uaxf+peeJojMUQ4TaOKUa6fN0YQlCFxU3V
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de
Content-Transfer-Encoding: 7bit

From: Patrick Fischer <admin@tsv-stahl-riesa.de>

Describe the EMC0 and EMC1 register blocks next to the broadcast
registers, so that the EMC driver can program the pad auto-calibration
of each channel.

Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index a5958f3a965b..cf3d98274b36 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -804,7 +804,8 @@ mc: memory-controller@70019000 {
 
 	emc: external-memory-controller@7001b000 {
 		compatible = "nvidia,tegra114-emc";
-		reg = <0x7001b000 0x800>;
+		reg = <0x7001b000 0x800>, <0x7001a000 0x800>,
+		      <0x7001a800 0x800>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_EMC>;
 		clock-names = "emc";

-- 
2.56.0



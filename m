Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391865;
	b=QNsS7J8GN9YzwyilywGJaDvKsTnHEWHCI7+WJvYVliMsjieQu6tRmMDJ2HIhKcPxxT5w
	 K+8hrKMNBylSKyrzVtGFZNQBQDNmGBfEgsY1YyXvXl1bY+fasXBAfSoowyCyY8YrRwJ0F
	 tazHFRoF8VpsJilhQE+3GBtGBHSHsq4YSXakEtw7hEppx0twQWRz2xit2+sE76Ryj8nid
	 Lr/YSJYy7W/5niY+0qRJ8uo7MSgyblFt0t2TEagvv64mGN8OunlPyBY03YcGXaUEpY9gr
	 +56Z5FizAgaiz8a3rxslEO31g+dKFU+q0zyMoUUvdpT0fT3MtdVCj0OLlfAzjc32gfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391865;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dhDyQ0M6YX/T0CCUUPaPoZa00/IhAx2EqWmpwz+i/k8=;
	b=yyYPzxuCHeQofnTMYSr83vBkj+hBCShQjYvjNzmwzpQk501Lue1OP9PO8Mn56rFccRBS
	 oZY+Ar4OO+5dBLyB40UtBl0nmi8pl3lZZYclqKNPcv4s2+3ShY/IPWMXDsxXaJb7NVpO7
	 Rw83nwHVdm1Nj7KZlN4g8DzAgUaslTyMRU3u6GH0AqpUOp5ggMoW9O3Mb4BEcJDWWXEpR
	 /GkzV1uACD5ZULjl+N9XxoklpYSM9DVFZnF5ImI+1BMr7rOTo5BLptdJvEqot/BokUSuP
	 KwVkGvGlRiHog+SlOF+Kq2M7Q5RkkOP3HJQRNcff6DW+8H7Tk04sHZvblFVy3hqCzBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRM6+Qxx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E9606A883;
	Wed, 11 Nov 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRM6+Qxx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794391865;
	b=Cu5QcipET3fLZAUswdG/h0WZK3zKh+FAXtHO9/8H7XNmXPT2nwzs9niKh1hrotODn0oE
	 LmaEYL+pY5yIGmd4KaCFc09UrqXmzlweMB+TNZap6mtK77iPwJ/rLpjvWqMg0lD8jszlH
	 OFT1ZUlMKPEC1pjt+BHPjnP6nVO8SOKrVIP7LVehReDrY4v+SRLvzXF+17hjlgxHOUuTi
	 Jw4nduG9eqpPjj/bR2vaFogDAG22pdRiCEVkWgpAM8Z+JnA7l6TnsAX6QCmcYrQ8B14H/
	 vd4p3E7VUxzMxyp7Dgv8DrmKWvwHjmBS/1aqkOSQtFdI7XHt73tWUERElxOEB/WApvQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794391865;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dhDyQ0M6YX/T0CCUUPaPoZa00/IhAx2EqWmpwz+i/k8=;
	b=CZZNlV64Z1vljr4qbxrtygqXwMqGUR8/WJh0TALsyyeaykH0CzDOUyLSqHizVvFbvqrG
	 sXzSTMPqzo0K2aIrt55UwEYXK797Z9Xwy76yQdW/I09pahPMUSy5CdheJjn4KsJIH5swU
	 O1e8MsP+NHkEb8w0A/Jfe7fXxjpqmbWlk6TFtHYJRb3isHfrU7cnBV12NG3kBeMCohaA3
	 uK9eynOWLjiwlxI3MerfTtCW92g+YBEq5bsoTFg0U2qNeeq8ESu4E/sC3KzdiICxezUb+
	 o8Lun190uwtvMu2ZUmQDfwMp0tlNODsaVsLHJCHfzNe49WEEYH8GDS8I13tsuZP4jbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A57311F00A0A;
	Wed, 11 Nov 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391865;
	bh=dhDyQ0M6YX/T0CCUUPaPoZa00/IhAx2EqWmpwz+i/k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZRM6+QxxcZCi16KxPfQ0ylfFkYDxTn+Z+032tPRI2jWqyzisB4vs4jj/jPZa5HDN8
	 spH/x2UszDbcNTKcaX6Ny7ML4m1QD6TMtLFM32ytfoT6pxcOpiGPk8ykhPV0fFAF+0
	 P5oR8asOYdtBqC8S5n8fjyWD3h15luZgWK3UBsSHF0SURhKcCfofQyjp7Lt3dtGnhJ
	 GddcV9h5aptIuzesxPoR5VOHoYcvK9FjC2gfOx5MWmHOuFsrvakX8Pz6jfSVxQWx4D
	 N8OQYOmvyoCZ/RT1zwSZ2kR8uBepKFD+AaXA81LWagqwsakmbsrxAi8PBvKwIP1bZ+
	 UZdSebNsL/MIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2B96F48F3B;
	Wed, 11 Nov 2026 10:11:04 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Date: Wed, 11 Nov 2026 11:10:59 +0100
Subject: [PATCH 4/6] dt-bindings: memory: tegra: Add Tegra114 EMC channel
 registers
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
Message-Id: <20261111-upstream-emc-t114-v1-4-54d9e1bceb6a@tsv-stahl-riesa.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391862; l=1977;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=tz+fHsI6+R+ZQDMJkf+fY1vAhYfa/ty8mFdbV8R9O0g=;
 b=YyxjzpRtK/HlZCwJv6QLcW/Wo8upl+4LXgotBpg0azVCxg+51zLtpZjvmnOEVU2V7FwtgvlRZ
 PiOkMSojs0gC9vSoknAY3WBjzEQ0FR7BQVk9toRl6GD1v0gdziWZamo
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de
Content-Transfer-Encoding: 7bit

From: Patrick Fischer <admin@tsv-stahl-riesa.de>

The Tegra114 EMC has two channels of 32 bits. Besides the register
block that writes to both channels, each channel has its own block,
EMC0 at 0x7001a000 and EMC1 at 0x7001a800 (Tegra 4 TRM address map).

Some settings have to differ between the channels: for pad
auto-calibration, channel 0 is the master and channel 1 is the slave
(EMC_AUTO_CAL_CONFIG bit 27, AUTO_CAL_SLAVE_MODE), which cannot be
programmed through the broadcast block. Allow the two channel blocks as
second and third reg entries for Tegra114: a device tree has either
only the broadcast block, as the existing ones do, or all three. The
meaning follows from the position, so no reg-names are needed. Tegra124
keeps a single entry.

Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 8e0c67d671f9..c9335483ba85 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -25,7 +25,13 @@ properties:
           - const: nvidia,tegra124-emc
 
   reg:
-    maxItems: 1
+    oneOf:
+      - items:
+          - description: EMC registers, writes go to all channels
+      - items:
+          - description: EMC registers, writes go to all channels
+          - description: EMC channel 0 registers
+          - description: EMC channel 1 registers
 
   clocks:
     items:
@@ -218,6 +224,9 @@ allOf:
             enum:
               - nvidia,tegra124-emc
     then:
+      properties:
+        reg:
+          maxItems: 1
       patternProperties:
         "^emc-timings-[0-9]+$":
           patternProperties:

-- 
2.56.0



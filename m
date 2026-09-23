Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A553B330;
	Wed, 23 Sep 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181929; cv=none; b=P46BaNYUuDn6YqU4Ewp3CKXWv0y++Vz39YGxZoYrPl2/roRSOomN9vkdOovkMRmnJL+M0/3xZjwmyJbyX0FrlyzWE5ed78ddP2NHzFiqzwT8mrgGnGi543P5yapMVtP7dF/1jG4wvi4SXMSwqYADnN7ok+h3nK4tjofGJgKnRGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181929; c=relaxed/simple;
	bh=PBYgvduEUT6jxsOixdvm+WamBf/qjCs6W58+PTNYzvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUI4TUN2ECpz8zhHhWF30PNpaBe0rowk2yaciDChg/j+2YaZA86VPXg7OIO72M5cb2KzEejujG/pYwEpjzXyJ++SE8/4I+97K46BmtmfbQDjJ/cBJwVZLaX0e8kl+WnKUeoZ2oGZp8vosCGODq0/ubuLWb0PWYAPi49Dqk4Bfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=a9eWTc8/; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="a9eWTc8/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 39D706005419;
	Wed, 23 Sep 2026 17:45:18 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id cbK6P5olbJKV; Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 40AED6005413;
	Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790181916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNrBCyt384EeqR+3hi2LdUMpUYUFizfCHss8rjaEsQY=;
	b=a9eWTc8/X5nJZgdcVXk/BSGe06n7Xq14fMep5kJtQb6rn4yJX0Lk65nkndKWJ/FjSl2ZDA
	yq5wKVKqqd4lXcya18MFRE0nT5MPgl0K4ivG5lXIKp2x2UkVgMFONKcKJe1ovHWOzPMzi0
	Ae9X8hildGoNlsNONpiLTLjBk7SJU7jobYq/0OKW+oFqjaeHatZM9f24tCtnZUJd9PR8Kc
	pRbmCsAp5iCozSCGtfLSSEFRGh2M/uoeIxLcLfUkuGy6GpUpdi/EQlUtjgyqJvoO4EQ67B
	ANZaxus3HZtz5rEag/Y8YwQQ2WvoLdpPbzLW/MOMPdVbDnvgvK3wyWGt9w05KA==
Received: from [192.168.1.82] (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0E68536012F;
	Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Wed, 23 Sep 2026 17:45:10 +0100
Subject: [PATCH v2 1/2] ASoC: dt-bindings: realtek,rt5677: Add MCLK1 clock
 property
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rt5677-mclk-v2-1-6ca31e8f68a4@tecnico.ulisboa.pt>
References: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
In-Reply-To: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Ben Zhang <benzh@chromium.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790181915; l=1300;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=PBYgvduEUT6jxsOixdvm+WamBf/qjCs6W58+PTNYzvc=;
 b=oDoNDKDWpXmiC3aU4xX5/hqR9tk+ZWuO4wN20bqGpK/COEM76mtlIQk6RcQHf4GWD1UiZzppC
 MrNoN/pf0NJD9JcBoM/w/cts/mQ7sJiCgMOOvk75ly8qLMeblD1gmeP
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Add a clocks property so that boards can describe the clock feeding
the codec's MCLK1 input.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
index ae27ae78b1b2..f76aad0d3016 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
@@ -44,6 +44,14 @@ properties:
   '#gpio-cells':
     const: 2
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for the codec MCLK1 input.
+
+  clock-names:
+    items:
+      - const: mclk1
+
   realtek,pow-ldo2-gpio:
     maxItems: 1
     description: CODEC's POW_LDO2 pin.
@@ -127,6 +135,8 @@ examples:
             interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
             gpio-controller;
             #gpio-cells = <2>;
+            clocks = <&osc>;
+            clock-names = "mclk1";
             realtek,pow-ldo2-gpio = <&gpio 3 GPIO_ACTIVE_HIGH>;
             realtek,reset-gpio = <&gpio 3 GPIO_ACTIVE_LOW>;
             realtek,in1-differential;

-- 
2.55.0


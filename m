Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F83DBD6F
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556183; cv=none; b=QBizL0Oc8GG3vTjWa6VEEuehQDeM3DRMqDj/5YdKZQE+xQFCbm4Gwa3srVbwj1V/TEfhUzF6X48zVxinku4W/PByjlHTnDiyOmZrxDMuWKGi0wyhEldYMQdptaRzJj2Cjce3R6c2rApA7erP37XKPna1KDD/K9ZPIcapDZLU5U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556183; c=relaxed/simple;
	bh=1mQOeEDKKa8RTw33tJe/hUOtVu2h/h8LfJzyZUMI66A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMETIpH0RkX4MQxnYiyfKCY0IfqvYGLXFX+stXqoS14HYWyy7G9ti/aJhoubYRSiu2gESprZK2DKpXEEDW9puB6QiW80lZeAbB2jUQPoh8ftZQPV0jIOIbr0yitbrcEhNrOnfEKhnkqdx7ynicDJgAGC0XzUPqcEiWlp0ifPfyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hw+X6HlB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hw+X6HlB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec429c2bb1so44829566b.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556179; x=1781160979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAHlF7TQfrKoz90U4BZXIyI9FMNQl7Uleni3uNf0Pqg=;
        b=Hw+X6HlBY8S9eM27nJAO8vWRv/j5XPyTHIboUtaq+rHNQmr0CE4zEcNO2VdBvAOfec
         kcxltGx2ZFmfQ0sGQ714id5hDm3iBiDJJr1IwPmuLqq2eWa1OMLYP29+T7lidQyNFtYo
         dB6wymS/QrJUDh8d+Ssyt6RfITPQ7zClUr1aNgTYAgA0hfYkKRbhvtlCYfevJQ5CMRCP
         vHlJeyWarHy1c82MjthfNqQ4vu2seO2Xxa/pd1qUy/gCU8Wh/PlNkVa5CNLy+gSEMyWW
         xEacY24vmu/NYRp5gidOAudbq/RhuqPUziwq3NDNtDZ/0bdajeqUeo1IzStl3SKfki3v
         1caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556179; x=1781160979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAHlF7TQfrKoz90U4BZXIyI9FMNQl7Uleni3uNf0Pqg=;
        b=RpoP1t6ZZrqYXEMwZAXS5r2EU5g1JjxsWsmJWzgxqSbnbrV7a1eZO0eCGAMHp9IfDU
         4Jog4lH7LbasASj9fOgOgUJlTgvu3DVOQuiy4mnU9psGeGnOO9SrSPvmG93fFuDIC9rL
         NcJxU5rMfhQKDIyhFfGrBLz4hyZ9SOpqo/q/RfN7iAKnYDYMAkjjy7Gbfahd70GlP1qR
         /I4N8QFwM/83Ijk16nrM3NB2zu9k02P33agmp0E0pBnYfbPpYs1hi3dmuXWOe4Abp7PJ
         Y7lCNba55Qtd+GEc2xF4W8S8epE2YuwRAjYci64eih5/GTUpAZtOvIawtVt4kWrgJkLp
         0Kww==
X-Forwarded-Encrypted: i=1; AFNElJ8W6B9Yb4a4NxYNs7RI7V3pHraq/S48A2w3/D++X3xMAZBSE3h9lh26txsTSapJsTKRMDSHJ/k/ldTqPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5kNW24HNrqwXTP3qLlWmkyyo109f+w169ln6xAEgmysW+axN
	w3uCm1iyw/ewjqEYW+upGYbE7RWjAXiXnd2eXTGw7aolgXTox/2ujvkZ
X-Gm-Gg: Acq92OF5MJmRNJAIJXz1w3UZTB3q4D3hTKbx0YbCveIsG43+28JSWGrrK+ieGVAFd8o
	LSqee5EZXMlKbG8//xQCaGoXCeaAmSj16glUMdIgAx9EEv6OP55hfFWgJrMaAiN0q4/YUAA3SNe
	9Nfa73aiaCAIHsI9z+GMwg3UqvrhxTzsuDWO649Rv1lN5kMP8zCygGGeB6WC8pfSHGMgBpIAkes
	PANyM8zd5QUE/Fcn1nlKLGk8qg7Lg6l0NdiNTU2BJGin0RsWfxlKlMDpWIkV5g/EUjNbHdFrylg
	sb4fner10L4qn2x6ceExUtsUhLfkK5+vHyGv595boFn/VpoZ6DBqNkIsuDrNYw3NHWmeQfchHhu
	UkTWKVorgrzLDaXvW/3ob4VlIjdRS8j+WsGT6Im2rb/U+3VPTK17MynjHLAFM1hnSuvAWFOGTCD
	wY8NEPIiFmUMHiTpt/fU0ENCs=
X-Received: by 2002:a17:907:970a:b0:bec:a96b:75b8 with SMTP id a640c23a62f3a-bf0ae40053fmr364129766b.32.1780556179346;
        Wed, 03 Jun 2026 23:56:19 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:18 -0700 (PDT)
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
Subject: [PATCH v1 04/10] ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
Date: Thu,  4 Jun 2026 09:55:50 +0300
Message-ID: <20260604065556.137614-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schema discourages using "_" in node names. Since pin names in palmas
pinmux is not an ABI, remove all "pin_" prefixes from names.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 140043a1fe59..63a37c89771c 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1462,52 +1462,52 @@ pinmux {
 				pinctrl-0 = <&palmas_default>;
 
 				palmas_default: pinmux {
-					pin_gpio0 {
+					gpio0 {
 						pins = "gpio0";
 						function = "gpio";
 					};
 
-					pin_gpio1 {
+					gpio1 {
 						pins = "gpio1";
 						function = "gpio";
 					};
 
-					pin_gpio2 {
+					gpio2 {
 						pins = "gpio2";
 						function = "gpio";
 					};
 
-					pin_gpio3 {
+					gpio3 {
 						pins = "gpio3";
 						function = "gpio";
 					};
 
-					pin_gpio4 {
+					gpio4 {
 						pins = "gpio4";
 						function = "gpio";
 					};
 
-					pin_gpio5 {
+					gpio5 {
 						pins = "gpio5";
 						function = "gpio";
 					};
 
-					pin_gpio6 {
+					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
 					};
 
-					pin_gpio7 {
+					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
 					};
 
-					pin_powergood {
+					powergood {
 						pins = "powergood";
 						function = "powergood";
 					};
 
-					pin_vac {
+					vac {
 						pins = "vac";
 						function = "vac";
 					};
-- 
2.53.0


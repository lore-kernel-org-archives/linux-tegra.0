Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91CE3FA5FE
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498092; cv=none; b=I0nT6xoQj+dicSA3PVt6fTZIAL9U0CQ3aW2TtVh6vSOigM/2GqeyWO47DPsytXyv4ufceLn4GWZfAet+5b1eaPnZWoCtOEjyxNkAKGNP/cSQrCpdfh1tNSMS3XFNMVEgJxr7jnEvaiv0JExwO80JoNEOjatFQ4FDNt02QABkFy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498092; c=relaxed/simple;
	bh=fClExvxhAfnwcMseqq4K0j3yFwvxAa+7dc+FGYEzOWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkuPLxMWKGB64DZ/cQSdmLCldlEWrzDrpplYk7aZkUXstJVr07xM4/0pqS++1um1dYODoutEz6OJlfWjd6SuwequabP5uqkvgQ2V5NhtDHYrVtVPUcJbMYSrrs6/kjOINDc+O/WmSQ3nB6rSpjW7cLM72tJxb1lerr/JGuc3V98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfNaDWfV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfNaDWfV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so789254f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498087; x=1786102887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R99v3fRI5K7+eRSuULtRBn5lyKFrlcGO1cKaa7OCOgs=;
        b=RfNaDWfVy3fLsLXgBPaRdSemiohLb2nkTgAh6PD8Mtgnkgc36SNELmonpMZffvLaDL
         xK4vPZ3wYdGKbCBHEDLqoYChX9jMEYFuqX8zj6KNUtuY2N0EIwmM+Qn4Wy6Z0oU9Szje
         tUVwWVZENixkOrnc9z+pHN1Nbf5RK34n4NVrEguycaomEPLMLMZVP8DtOf4S06Z/Nl2z
         NCfoqn/dBQfBWxOxcUfdfuZ531jgWtTUAn629hW8fClxBALozC1kbzIfyskQhb75FxZ6
         K46jA/67c+Z+2WJeW127wcaiPCxu1dfXGWlT+zn5tK33PAXFOBU4LAu2tyxuXbN+wrS8
         nARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498087; x=1786102887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R99v3fRI5K7+eRSuULtRBn5lyKFrlcGO1cKaa7OCOgs=;
        b=UDLvw3Hx2EKDhLyEMcwGcbngwnFxqhT31P622BrTHJ1GBbScHXTlromELu5MqSCEHJ
         uRy4qXHuO5k6Ujhn3r3gbiiTNo0QN5kCQPSk6mHaU411ggtBen8kQYaS9M39pI21N09Z
         GpCCWtZr8FchUljpILJl76dbRJteHoxmvyarJjJKjx8yygcYmVinmKXKPxW1xt64ZHcT
         em4y8ZWs1F4zZVDIio+MjUnTLJTzgeOgIYQI1476HqCv+9OyiK394b/NYvEzkczPNNmW
         SPivwoBZyM1ak9r0CGLBGV6tkS1QDu086aE2C0C5LViiH9z2E52fuTtNmy+9wBi4sn+Y
         sEzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/YEA14omYjIkexnVVHjTk04GeSQTtyIcj4oTnB40SuJ1ZC2oZfkkmMUCkwNBl6922sn0Se7nMYkWUxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27QGWcRB64BxdD4oEaswkNhJqMm2YcPTdVyH6sbIjDbZAR9d1
	1H7IgFcPAbkE+21/BWfCl1NYHExmcpFJeYx2NWC6tRBAQkKnWTDiy6xa
X-Gm-Gg: AR+sD12BJFxiwLqpDrHrBKBcf/5J2vVZEYSSNMXZ/7y4IQpJRumDRPYBRCz3GufxRNe
	G2UY2kPu3VZOWMjI6rO/YpeLe2CIDesLJu/6ikW0URH/W9T5IWkJ83q9woMFe7hjeXHemT7Aa7V
	96ZaWyf5tLTodALHq0V520LtPmh+n/VNmNUFgKgjWDI2KaGnXSEkMgppkWqh1z/unhKV8St1uQx
	WIGjj2S7UivX0WTT0GNeO6ppJID4oasvKwW9GaJkX/jxxQhJWN2/Ke4hAYY3SnZSfnHPhnk71tp
	+bf67fpzgKwYCHmZdY7ExctTfoOhXHMZVSvbyOSOr+CHMgc6FZL+XUbNYElpHW7mUxOC4477keL
	Xr8GJh6/iPiQFgn9Iva2uFW06/3kpdIdj/eYb/D3rjWTKgSo678axCOgzAr0DuTldT8xQvY6rQZ
	IRSjd6uBp71hpTSQ8nBPatuioWUJylkL7MsEIybBXANiWNanQV0O7a7qg5HRCbOwlO2pW77qNgY
	3yBQCWRrw==
X-Received: by 2002:a05:6000:2304:b0:47f:7aee:ed3c with SMTP id ffacd0b85a97d-47fd2abbd2dmr4221334f8f.5.1785498086512;
        Fri, 31 Jul 2026 04:41:26 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
Date: Fri, 31 Jul 2026 14:41:00 +0300
Message-ID: <20260731114106.169398-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 00eeedf3ef7a5..a27d3c4f2c63c 100644
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


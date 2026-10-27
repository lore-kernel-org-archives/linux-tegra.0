Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102462;
	b=ExL050UBDqjR17JPZTeYv5ZP36qP6F3muRNNH8Xnle3Cyx26SRPx8Fbj5RmOHkYQqe8D
	 rtSfOs79A0upZA580POJrWtY0G5h2eV3foTA4MtqYC/Uyl1M2Sb8yxKWxs3nZSTR+jLm1
	 PDs2TDsk8GEfvw7QjQ87Wrhg+JGaiXc0jQ10LXhp1l0O5AMag4gIc6t+g5uohOAyaOV+i
	 Lc8LH5/gMDndyK2hByW9uT1Zx66PJ/3/imjBfD1MugOFG5ApGXFJuq36lK4XmTu7XUgLl
	 HD5mftqg4ZhPxzAai0Jsqu03qb9zLlfx2Sv36F5ZQARU4//F+hx4CqgGk29ZyMQpeSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=g6yf7tSHC/ApYICwfKYEFPPryS9+45FGrieCy8lrgCu/mCZTKoYW+UeaV+H1WT9HYtt8
	 +b1qzDhNGVAZgXRBUHxXa6a+1ZMJKpIkjxDRuz8eZrDepbfbFLIjKQANCPtDJWdiltoPP
	 LcWrH0ea531DPd2m0Iv0U/t9YO0evJpmh3LbGaseP6gdelN0BWNKkq2f8otZKXcKmKZ3Y
	 8LillT+SU1ZbjsxtfITH4yBuFfaZ4BsmS+CZNB+853MLMAYOxFBgXQxmOrQCCLJ1GIFon
	 6x91V07IcPTGmK5drG0S6a8BADNFUZ0boAm18gL6Qs4UmiPB1GrewFedjQ9EfkDOuEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F92C606A334
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F92C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so6631725a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102460; x=1793707260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=Xjt5mWv7K++mwN/WN03NfQkwgE+faDF2HqvMmYn2EVFGiHAcKg7buiJBbJOQfUlSdG
         Wl33eAegRGaOwGLBg6BDwCZ2xspHbB0SYvdGx/FX+gSZNNP4YsRBCHKthMq7rcYzbcVE
         RL7ibq4ad6sGu6uIDpyJRpJjy3vhHZlsOeavUmhf27x7rWR2vaOQnLE1UrsoWw2mGkdK
         QOljAfT2YC3szoE2jOVVlza5EZkOKT1FW1fU1gMjo4EhaE+81YdN6uessiYM4+/vEd/a
         9c29+3ppVjNv1FGY8bYTUiTiMqO8FRY8zQ4T/gHWgc0mZCxxWzABh8dA07/5qPNjklzE
         pshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102460; x=1793707260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=fK4Z9BIU4Ofds4Dgxi0eHzw0EQgCCjELZLDsmnzso/vKkyA5vXTc7Yh+0Ld2dYTEb5
         Vepd0W28Zgs4uJ99y7BwxUdcZdycDhEAvNnaNFc+Ok1jN2LJP94Aom1WnmPm0FqPV1OG
         wEt/qSgKmoVhYZl2kwT0NwKf6fUpmosxMG/QCMw+ZQdhzhlFxdQ2gBpBTKhBUvRKa6Ik
         bglvB7VRBkGl8RKmjvBYjMZxvd65ILMav/PtSxAxfMCRDSr9po8J1Fx2IuPeGCC5vSAq
         IyXVnWA6i23raWZezJIbQ8LkTgRsqL2tY1LaUK9tcfskZa/y3oLzzX+GSCAC1gFfgMAI
         daoA==
X-Forwarded-Encrypted: i=1; AKwUvBzV4JyNmK7cvlYNYHFEyrC7iXT1fnG1FCLj2qqobWF/f+elKu20yeHN6w+3YBktb7Gy4TcgorI5A1VCWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbLEqFpP0DzdvFyf+XpxKPigBgsu5ZDGDpT819iFrjET0kPwVC
	AJyt8g2BagN/heNVMlHsDROShO77kfxgN3lpj+mXmL+Svull4CiSRjmj
X-Gm-Gg: AYBFou18+vmvAfQwOGTDxvZ6bvv8gJMaWKvDO1i5SWLuK29RkqdtjP9GVSxhISRBGmS
	hS/D2ceuGS4caxjq1JbfWz4dXhA6U4F5C3GBjV9x92Q8s1uzDcgnn3+FqvIx88HV+P1SLqx8CR+
	iOwQtrxeHn3t4/8+qB7H+7eo1mjdWrBpfEwfEl4NquwgEgYYf3KZJnmEP9edH8LJh/t5MpIKiwL
	YyHMK4wj1QplGxjhuxUGjTSnF2H3wzAcQftMnujuBtMmpHoNwWzPukDRypHvEAuGK0vKOtlS8Z4
	T0ZRWfEUqEKi/sFZIrcn/vU9xy9QQmVKvo8TVDinjqBICTA87tK0Xs2GGvrFnVqqWBiSlyVpEdJ
	TlTo/oQAhp/JGL/ZpmTbq8ErF6NWlwpP9PMVfKJGfnlX2RrmXLH6xcUYzx7eQSpcPVn2tqmGDa4
	i+PQnbzf9NRru1fjkxAiHAjY4CHp/Aci5+iZ5wEq6XNjkDFuw53VBEPCUhOjcOEWDEdsLP6b8Rz
	W9PAQqpCde1d6MQQkDGfhsmJuXfXzjBvKSSKwT9B8JI2aITxXD1bkF7hUZDOTPJxNue5iRr80bP
	Ym++mUUOpVktS/1IFCx1jg==
X-Received: by 2002:a05:6402:4143:b0:6ac:7d0c:2cb8 with SMTP id 4fb4d7f45d1cf-6b443240278mr10161733a12.30.1793102459088;
        Tue, 27 Oct 2026 05:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:16 +0200
Message-ID: <20261027120019.93611-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


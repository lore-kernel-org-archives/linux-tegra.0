Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102454;
	b=w2psYZwtdncWI6r5Y9cFiNX0NljbeQ2wI21vdBeXu+G7R59JHbuw209Kxb77LR3XLSNv
	 rpapMXx8ovZTodvm0L4BO6CKnEEU18UqTDSUq/AJBTLRqCoIcTKdLdd6p0TF50BaZUhgh
	 uWta0zI6y02Zb4lPKnhMcrBtwQTWq+jisbWCR5RD9vlldwvY+i/E+tegSIxqub7xked6L
	 vJGgV4QFy1dTtAaVVn/g3+/keJw868jVRB4SJ9jF57bEevR6RWM5ld5+kAWwCisVcIkPW
	 s4tO+EE93/67PEcvl1vMsncWv/nMWzJsO8q0JncrTf4yVK/s8vr9UjKCQvLG8CELI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=YiDC0KHLqi4JGTxGqajd6LqTCE6YzwnjtFOBqsgK83+JmcnXU+gRQTW5Vco6gfNg0W5m
	 /BAQpYmGOS4anue5dmnfntr3wQhIlk0YHKq7xKMds7b+86oXgpRE7eTmMPxO6htih46WE
	 qLhtF5qJFN8pt282EAA0a5h6JQQjwtB6TOHmBGW6EZZmGpsheBleh+aUOfSJlZK77+F9p
	 3Z0dZnyIG8Ks1aqL3S6NyLBPk1cMssSxlABwRsD6rV/ldbRDI1vHIDcKVMHr4ugXOuj4c
	 77gMElZuTy51TobR/KZP+H+PN8UuGGVg3bm3y6SBKp2ApH5V+f30jZo/R5arxbEJ95A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B2606A332
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658B2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1115495a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102453; x=1793707253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gXsK3c89vpWz088eJ7ug3RXM6pCdHmPR51kIClm8GCuTOQnA0rnAqT0PKP3KJSiVEO
         UpnTeF0Vo9pMjQ0eTH0W6EnXIIWmKw32WkkjqFyx8HA3h9jgzpRst9qtgcY23VzK6bfW
         zOc8AymEchMnog9IaOt/l0ZRXFFBjoGgwoGVLAh5QXQf4Y+262AgDfjq/Fv5J2r3phsF
         7+7gOeFqRj6oSEvDwKYHKx9NzzMGMt8U2hr94fJWLGyI6S3rgKDsN+e1utgPGHSD5VKe
         rwk2B+pDqiM+EEsY2sGXt6hT3lH314BbS4tVdUZlnf8DGZlVu99bmtoVA/Opc/vg2Rih
         ZDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102453; x=1793707253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gU6swGEMz7aFUx/jw57yD49RyO8LgpD5brXRkYqFkl0gPRQ6WaX7HWmrULtdq8L3UJ
         0tO3EnHwBBDC0iOjFm5IzqOTI8slzfSR1EAFkNKXoPHJ9o6duHVzG1PjLwiRz5GieWUc
         cqFjz8Hz3JuObmjahBZI5YatJ0t/4zTZeFbYUxKIc7tZxsAz9ZfTIA6WugJqwaRJ6C+z
         Sk6nCgOwBnlmmp8ggkPa5+zl9PSx6BCB5NoHp4dUFVGbd0opO884ugcd1MSKdGq1yorX
         NQ5tc0VNBDAOHVPzAValhs3WBWeXbP8/VRgFvl9trEHFKv4AnLVrDNsXi1LM5gY/g0C1
         ubIg==
X-Forwarded-Encrypted: i=1; AKwUvBwUCC8U6fm+iWeD73ZSQGW8CYAFFGck1TO6AuoZOTLcSVHMBRx8xdMXzqaGtksLTpbHr3T0iPfSgU/J6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIXBuh06GpO3dNRu2Q9fmi69yreofzzLxoMRrm8BriViFdztW6Z
	D6XFkPPHiE51jtbcPEF8NOarL/NZplldrr9RHhbx3dcPi9aureC8dPEk
X-Gm-Gg: AYBFou2fpF/P3lLod06eJX9rsFlfwqYgQDtrzrVt80FGf5nt9H0Q+NWxEM9C0kAv/nO
	S6jd9YODx9TchD9/41Cb766UF8Ynl2MNFJpTYhMBE6CyJgkdp1bJ3ZQEiPj/ORAixed1XjmtrtJ
	JgD10fV+4vAqOcAvkJDzzcLgWFJUwjsn4WyKFtR/csKhp/lti43frnvoHmxeNzrxu8n0U/i/UgL
	EqVAiUHrobvVvi/IPifN4l35WHfDyQ/ner6Yu2O7g39HGkfyLabIQpVMeUy+5KSsPAhRovL8/Ov
	1/7DeRYhgjMgLckAl1mMX/wyW67qLT+BbEgwRdQPYrSiscFBiNJbJa4jiKuhSH1bZdZnMkIJGg1
	bmEVRuwzbCa/KTRjJeMDa9/prX2QHXNp4dBFLEGdGOY1q8CAl7cIauRnl298lvZkQC/u7vfEXey
	C/FRGAOOwhUFsiFwbLorgM39Q4gYHG8d4yRj2hlTC04qTKkGG2oIn10xFUQqGGXIpDXw26HvV6p
	xRaoWWQiZB2v8lm3kc4HV2ztKcN8duGg6H7VWDbT1bGhvLsMOafxoBqZ6gELnuLXdEL+xIfL8bj
X-Received: by 2002:a05:6402:e03:b0:6aa:9284:9a99 with SMTP id 4fb4d7f45d1cf-6b442a806a7mr10453861a12.6.1793102452579;
        Tue, 27 Oct 2026 05:00:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:50 -0700 (PDT)
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
Subject: [PATCH v1 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:14 +0200
Message-ID: <20261027120019.93611-3-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


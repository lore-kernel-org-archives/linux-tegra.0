Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B7362153
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525043; cv=none; b=OEuBbpPCWMBDvkxis8zEXw+LhYZjR/Y6/Kxn9JHLJ2JE6icvnJBhdq9LJ1ZgNsaHgc59Q9iNyDCTmfOKT8lJIi0aNv56ruvFRFnebEFtpj7pC9WU+f3kI7u1NYpoD6niseG00vBKss9Mfdk2LbFJsl4T7kUnCEdrK8LY57TmCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525043; c=relaxed/simple;
	bh=b4zUqL1Ke9Cs6I32xqzsUT0DCZF3QkH23uPT8sySGAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDPv4YKmNJdj8gbmvZX3v6JtNjFWr8d1GsbXRkAlL4um5NwhbnwlZrhCZUbxrs/3FJoQf5rnZ3RGcWTXGRLc1KnaGzfktOknCAUC+L+CxsFjC2hOUyUTrS/lIVsld6Rfv1TMfyrkR9FMq+yZ5sJElKDh7wlMs8trEXdEFcTIAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjqg9z0F; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjqg9z0F"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1183053966b.3
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525040; x=1780129840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6p+M6SIjzcIcxd3MTES1MZkiaQb7Dr/HC9nyX3iDS8=;
        b=pjqg9z0FRTFWOuubUxmbZQzuonL3Ld0EMv+22tPnGPy/3yg1zS2z5zYYujAOoCmLom
         qXZqIYR3fHZnSjkM7YhU4PuwPoCTJlnQE4aT0Jc+E3KovC7H3jYsQntqSgsx/flPJbVg
         A7g+pg7mX9UH961QTOOvkcIU0eej4wOfnbd9sstKhMCuH/ewLMvPoq9aFWH47Aml+guC
         /Pm5NNjWjoeVqbM5a4VRaHWoI5C5PHR7kKF+pSM3ZYo5120MX16/Nk7VbIggH1edwPKu
         hVpoVMjYC1DIKounLREek5RP8EDslzt95E69mZY9J8tGljAipPJy21hlf8MlF6jfDxuo
         sTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525040; x=1780129840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6p+M6SIjzcIcxd3MTES1MZkiaQb7Dr/HC9nyX3iDS8=;
        b=gKniLVtKQkC4D8z1k+v7W1AzCRtdG5iKfaOlKiaYcT7HLpIwD/HX2cqVDfOfkwYRMp
         jdkyGFGLYOuLCTSVYFRM02nbRyk9X/u5CLbx/DRtZYQLN8OiiWS+yuOUpNqMniI1FmMV
         D0uVHV60XaPQZyS+dhBB00fXZ6HOLFFlvClfQLQa9DdeUbDOAznIXzrHEcbJYGk1jscT
         66Qm0HvXhvFUilUP1syXZxrylvfdBfEiPPscR24Sf8SLtYrXLYIQd4tiahnYl4uElACs
         yvNgvXUbls9HH4SUqZ1KBWUy9fIPuIIziZ9BWBpSQM+etzmruajhY9F0NUgFQoipn6l1
         WkxA==
X-Forwarded-Encrypted: i=1; AFNElJ+28ai039GTWMIJoBkhfS6x3Uzh5fKUZsmk5kXXXrAmBTa4MmEIfjiMldkMibXpzeWNu5LQw254k2Fv9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YznMyorkxHPipIurdcisSWnbK88K8BiYNOt+OvN/YldDjbwAC1E
	fovdOPVZexF682Rs7tLLEdnj4IOBVQSUzFlQLMiUHwUef5FIYc4IRDL9
X-Gm-Gg: Acq92OG7SpW42zdUcXiqDSZjfkNLZUr6wU6kTHiHeu06h1CdnWy02A5AJeEu5UZ0LoZ
	Kb0hEs+A3QbJ+hTIFM70nFgusbKQK/OmjzYsuK5nYt/3gmzbc71BcmLVKc/8jokmHji78hnnaYD
	JARJLnhMAUbiYRq0ysmFz2vYZYDYPTqB+7QeRzycvNqbMtF9mTuZv9d86uWGgY10u5GZ/gfsxBa
	ihotgZ5dm4QId1OnMI8Mhq/GsdsYbGm9S8NFVMN7b5FJ5xiD98c7Ys4bJCz4HkqpNMy9HeKmaaC
	9zbRK0xR4PCgHdhZdtTUw5ubWxpWvmGr6qC361TY2Rn1wtssfXKoHNwo4zl4vpkOupKOwsIhgqV
	zOk6LCD78prkYxiUsf45UsaGRIhc7Mw52qRTmLkHxbaJ5Awf1yWScX7wIXnAsRIUFfFhJqpdgbd
	ZBGAk+wnq1AZ0T
X-Received: by 2002:a17:907:74a:b0:bcf:5de8:567f with SMTP id a640c23a62f3a-bdd2580c412mr414994766b.28.1779525040277;
        Sat, 23 May 2026 01:30:40 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: usb: chipidea,usb2-tegra: Document nvidia,external-control property
Date: Sat, 23 May 2026 11:30:10 +0300
Message-ID: <20260523083013.46372-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the nvidia,external-control property required, for example, for
USB lines in HSIC mode connected to a modem, where the modem requires
precise control over the USB bus to properly enumerate all its stages and
intermediate devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/usb/chipidea,usb2-tegra.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
index 78046f8a63ad..d99a18900b5a 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
@@ -40,6 +40,13 @@ properties:
     type: boolean
     deprecated: true
 
+  nvidia,external-control:
+    description:
+      Indicates that the controller is configured externally and that the host
+      should not attempt to access it. This is usually used by a modem that
+      requires precise bus configuration.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.51.0


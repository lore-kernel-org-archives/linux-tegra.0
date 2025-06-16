Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139A1F09BF;
	Mon, 16 Jun 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059622; cv=none; b=TbyBgV3Xymz2qpDlTy9BCGKYtX7noK/s8RA1D3ETAIa3u632MYqNGC+y1ZVP5oUpxGknHIZscUDfS+vaaJuGRNsJV9/qFJOZ88V5QWcYFpw4aDUuxGNjJXfmOxa8H4FhGTl1fAjqL5AR3tJUIg9nk0RY1eDd+chaQINNdwPlxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059622; c=relaxed/simple;
	bh=uf1c7b6wV5zhastLCAqi3KoHMy/GmEnf2vSM+CMzF44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrT7Vg1/+X751c8B5sx/P9DhU+H36RK0VrZnGS8qYJWByqiQ7p3lbDtfVSyWwkYSmDIIPSvY38bYBJTcGYvje1vQhibwJ2vRukNQcire/r34XKf5UqYwl98b+e4Mn7fNoht24vF2LcV/awwerayNYbpuVqHH1/KWjQ1dQy3Ogz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpHn3baD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpHn3baD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55351af2fc6so4574560e87.0;
        Mon, 16 Jun 2025 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059619; x=1750664419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QowhzLlyhpt/wBdayccfLQq+OvDIY0BBZc2dTRmHXis=;
        b=PpHn3baDe5II+XjTZsbkKvB4WT9Lr3Akigse0ARfm2AwZ7ysTQdZTBqNPRZtJ3RhLe
         hF+rNmtfkrINqLEaRdvHZQjSnV0z8jIfrRhR7vM3EC0qSv+hMq8HHdkW4tjPbTABt2W8
         2RawAwFeQwyafG/vJfFQuzI9zVtmGON5HKgk/PVpuTXobHgG26Jg3FrxZNWdWaZ6vuVT
         UPu/xJPuT7IlFwBkFikAoU21JJHA/nqFnJImgSNI4Vs2/iNrG52sz8HVOZuOFH0Xjz4p
         m7ylCflznyglRSq+JI8f9g6uJKhPDjRARQEnL6ShGqe0QBxKZ5QmWg1pMlxeKhYAZyxP
         7E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059619; x=1750664419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QowhzLlyhpt/wBdayccfLQq+OvDIY0BBZc2dTRmHXis=;
        b=Ea04RaR6SBysF2igPWzVh1aE4ounPyRD5gKK6eOo5UR+/QK00Ei1RBGSAU9n7MNFaj
         uWk759Sml/LHyMz/Y9Rzbo0dcu4BRcA0F3piXNSNtKMJOiEPQuyBX2KTjDKHZgpjK5Uq
         wC0qMOLFpMra2LmAWwX65r+bLZJt19hT1g1GdLnJAYXUNSA/Y6p7/Eg/BEDqJNfbzP6/
         Q0LjYP7nUSTZMPU4DpKEO720sniOaguFf7HForcAVNTx8nbrBMClfWcEAdLOpG4PJIQW
         H2oMnfPNcrTAgJGRqc5wiNjPjy6rXtBKmoE+8Ocb4Gf6Inlf4IxQgrBXQYlHKqUx/M/v
         rfng==
X-Forwarded-Encrypted: i=1; AJvYcCVToJdQzzICLJk0XtYF06EpLBhjsQxtvWenR8cjP6zOv/GVdEsbRqZ0qAUaTZL6ZrJc3USAnUYQ/qJh0QE=@vger.kernel.org, AJvYcCXV8KAULh2+iKFyoKq1LH5V2dqNKDS6FYKwNjLataTS1zH0XWCsODGowR6+vX/sL0O0liPsQVnMZ5q1ugw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Z64XUROiOJaJJJ/R7nvioKYqohq481KZRXhTsjt4ZlV33pyG
	BCy1Iwqnbgc9HvsHIeYhX/yzk7g+T7zDXUS4Nq0Fo+kjOWeEfLwIVIaG
X-Gm-Gg: ASbGncuGZOeWsySW+RCYTeuWROsgZ02vofO+nrMKzRAZJqMXxKfPPp6UkVSTkGteWRV
	87eHPOzEjqIoiAsPy8S+V1HSE/dYufPcbNkD3qDvu6nXzOo9DVUg4NjGXkZUpt6h6QgGSl8WzxJ
	lfcn2kNRE0VVH377tCHh4fOJtASCto0bTKls0yH3AP7xhhL9oe+0gz2L7mWD4rHyF+JFk+/v95z
	z2kNR/cTNnTooNodCmLeTmBi27oMR4drkV9CP27FJxQLh7eWT3sWevFkbJoM4r6eSp3ugpoagpq
	A9pDasDDID5sM9MzIdKSv0RQD3eSY1X6b7ldU1kIBsC0VgYG1i+xww==
X-Google-Smtp-Source: AGHT+IHVthDXPnu0iZJ3imogPzE1kJl9SON1BNQjHX4qfStH6kv9COkXX+LE08mGtEGVHc/uvkP0hg==
X-Received: by 2002:a05:6512:3501:b0:553:659c:53fa with SMTP id 2adb3069b0e04-553b6e7330emr2044334e87.5.1750059618485;
        Mon, 16 Jun 2025 00:40:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab08fsm1452721e87.89.2025.06.16.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:40:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T
Date: Mon, 16 Jun 2025 10:39:46 +0300
Message-ID: <20250616073947.13675-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250616073947.13675-1-clamor95@gmail.com>
References: <20250616073947.13675-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Add a compatible for the Asus Portable AiO P1801-T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 9cae3268a827..79b027740694 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -52,6 +52,10 @@ properties:
               - nvidia,cardhu-a04
           - const: nvidia,cardhu
           - const: nvidia,tegra30
+      - description: ASUS Portable AiO P1801-T
+        items:
+          - const: asus,p1801-t
+          - const: nvidia,tegra30
       - description: ASUS Transformers Device family
         items:
           - enum:
-- 
2.48.1


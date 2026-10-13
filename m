Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237C7531AF7
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914590; cv=none; b=QaU0UcKMTOSvwVlYRkumCcEZHivaLUtZP1Th6z6WnH+Tkn99p9K34j345/DFqyEibEHVH1faOzT6bXYq4BJ7oQp5wepfriaO2LMxmUedOccAWcW8Gt/LaTNqhwSgLEfqSB72QERqFhgFG8AHiKj7JYXpMq6pueiHEYiUtSTnNoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914590; c=relaxed/simple;
	bh=8QoQiaUknFw6yvkIK8dR+3u9Ax3UfCtpP/SNCi3d48w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBlH/IUUwj1yLdS/7nC3Za2FH5ZKbPIQs+I5WurD4kqD+PXP2CHYBkyrTdT88A2ByZai5+lA0QLrW2CvGqv9mem85T3H284IFCqXBlt0Iv/EEP6meJQlDx0dBEulpCxtWEcMcJiUR6+3RGg1pju97h2Pu1uvRpV85YtrTAIAOfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxPshHhs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxPshHhs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso1495955e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914585; x=1792519385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=KxPshHhsdHdn/4VG4H6U58ZU3cu8VHkD23+aRv/6XARIO34mvb3geUJlxngolSI98/
         IYLfiV5Cb+uOuphje3UObDJ+Qvy2ehHMYCPzoHztFiYZkZ1Zv4lfUmQQRCfa70udPmlq
         jqyu8GFCM7aRaj7fa/uwAyPpAk4+nroQt+e8p7sjj+h2Dvno4I7guSwm9A+bUvIh2hO0
         yz5EAXhZKNVFt5U+DiQFp6Uv5e68DIDnOf/Lpwe4A7fmLQH2/8G06VDCEwR1Moyrjm0R
         5mhUj943fcpgAiKwFkBQAsN+4mR944UXw19zEI0Vur2hMd26u+Kt6c/CjoOSLIMsO6nO
         +myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914585; x=1792519385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=pCVC85U6JVJ7GfnSnTNiK4InrlYk4SiRIqb5x8jHqNAItPcoOrJA39zVpp6z3k2ccp
         fefmPt3Tfs4BV7GaONzq2bcoo6jEWZLZjR4BxjcIt0ETvhO15vTgy3UJ5XOYwwrZWXpD
         Iz6KflKF+f7olHRiF5l8FWRIxwZfkqIR8iKpnQ5smEkxg1eLa8HNLUMMpHNRsTJxCV8j
         rEuCIQ6Ir5/7ppliJdT3ZfSQAwI8BAy2b7KQFyV+IFp1Cf71siMuGwf1aKLMfMQbVIEw
         2Pgx1iVst5Xv3ymD8ZtKpAEpn56skNRCoMWG9/FlOUe1BvQVQD5vadNJEa+JeJWQ0Q07
         U5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8wSd+pHaGre3BkLF5Pk+6Oww5lQ7nvEPA6TgUUlqCeL0K3VUIkAgozCyv/I+cNOsG6vzCS3m/WRRYTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7d0sUTxrVJ/lAwOVYgkkIs8s41rvXdzv9Qcn9jZ9SK5gZgywE
	qgszHGWxI4IWyg3+3Gt35OLO4J04fcli774DY2zTLntGgtvH3yQo5Lgb
X-Gm-Gg: AYBFou0i5GueElsuQ2ha5JmawPq9EAUA9uCXbzuTEy62Q1OwUTvB9praQufhFo3YIMT
	57soiHQT4yXENUYb4Yqm9FNVFz5ZZBiBWmpSVrRulVJ5HLDTMLG33wjJ1KrTo1d2I0CTD2HGQKU
	oeKe/rwhR8M8efRkKbKDCfBx3aWlsXjgHAn4l78jECM0XtUypaM0QY104O15VLSJ+UnkXYfu8Ez
	JEPpE520rE00LRu7qvfq0k7yu9lJ3K7bUE7iSJybotVMDTjwFJx4cEACGOTuYjPLFL0C0lcDhzJ
	bP94wwUw3YEBx7Ciusv2kXeHTAnZ4+Lpxfr5sQKIsnSC0Sf5euZuMntlKO+chqsjQIK+ddgAtG9
	ME8nkXyOKgPuAT+Zn3rtojYzclol3dBWrAQIHk0Ib1vvsT5H52sXH6RnvmifGok2WEp4Y2Ga100
	iWl2LkwEY5YrpKzwCu/JxkagMPmstPq8P7FdxAsFSuBnX6JJ6OBWHgTh/Ixs00lbWEWtbSSPxiL
	qO7XtQrLl5KJ7tKzq4=
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr260068075e9.3.1791914585194;
        Tue, 13 Oct 2026 11:03:05 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
Date: Tue, 13 Oct 2026 21:02:52 +0300
Message-ID: <20261013180253.477605-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nvidia,aux-devs which can contain a list of phandles pointing to
auxiliary devices, such as amplifiers, sound-muxes or dsp, to be added to
the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
index 2588589ad62d3..316806fc7346e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
@@ -48,6 +48,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of audio codec
 
+  nvidia,aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles pointing to auxiliary devices,
+      such as amplifiers or dsp, to be added to the sound card.
+
   nvidia,spkr-en-gpios:
     maxItems: 1
     description: The GPIO that enables the speakers
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102464;
	b=AYYyYyGGRGm4E/jBxJ+b1jWS874z+zSCJWsDKXSBIdH98z3Gg8Bv58v42pwDBOBHCudk
	 vWMriLGCQjkoVNgfP5osIFnqqQR/HWfyyk5h8TasBFO43Ddl99WhCxDZuPfbxK1Vhkz79
	 SSgzjjMibWx+CpUZDUR0SIom7sMDJsgJmk5IzGt0bCI2uWcMaoJ/eC1dtdPEqhfhbFlus
	 f7yHQS5glp7SGoCFvQ+OHeaeWl3GKTRE51YHghg91RwWp218rmh2eJOPILL2Hr/4+hb7U
	 5zU5lRyPSQFDTU+Z/9ODhnKE4hE2kmA3o/N7bWvX1tJlzCX++SyMaI3cmIJgn5L7jww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
	b=GO9L67L4oQBpCaLCqQdLsfxa/lTbg48uP/uLNzLmbxBp/AG3ADhWyHNl49v/Z3sfsvtW
	 qgXEirkS4/G+O6tzCOsJnxZ4r7D18vVavvTlw+5FHB2Hi1c1v+ujusTMyrrrAWyztdKR9
	 +SbP61mfUrKb0IIKLvPibTKYiRSUBiScO7vQ70iv511Ii8gd20rIN2wR1mB9ywC9hXBrz
	 uS/xm9f4NtJOs72DJXjDMLh2Io6oTDvuC2B+6sOpPdH4uPCuBgMa1whFqM759bHkqpx2c
	 PR6Sk14BuhvTxBbckALbdHyXQ9xxPdkdzwiUKFFx1xCR1IbZxBqBYlQq2oUaY7QZSXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080F60A3802
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7080F60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TxnE6HkS
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so5274413a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102463; x=1793707263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=TxnE6HkSm/cAlbvKMme5D5UwKuEoIsGqzBXQWe5BAeNxcrBBNg3gamuWAv0zjMcLp1
         C25hq3LrHYFU7tBgWoYYbL1/P0S9KUNsVtF0hg1a0OOU2jZIn8saECLD7IkiUXMlJN82
         WvNgK1t3oR86E1EYtHaxka1TEwGZ4httlFXNNltQuZsezGrafGFnBSQyiDodQO6bUdfj
         b1vp2wkO5/9lJD3sscinQljbsYNe6ungHs08+hEjEJKthJWfYFGe3o+46U1GT2iWmDpL
         hlfj2KgoT3xH6dEYYLtlRyIZ+Byip2Os+8Za5NAkoBFigQDL0lGDkAxCGySfcD2ZF3O9
         YgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102463; x=1793707263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkhiNlgHYQNRxwIcJQi3AnXhCExu73DNr0s2jcVWxCE=;
        b=hblJtwZBzH7yECcOmBloVPAbgkwEMkIZAdybSuH9sPO8vBh627jtUhjmg/TsGyi3w2
         +1ovIH3CCrxmjqYrCsUyXsq7x7kQvxi3azmlc+zRAwINr/FhTQvJDuZmlLJYRUalrxLc
         sd6thx5UYr+AouwZ5UZQC75bwsrPaShbdDKso66AM/LrG7s4uLYsDwRQX5Anq8x+g6PX
         M0D3kezNs6QpbpABAVUJIB+iIG3A1oYjLAOYDlR2wpXCQKhrxIxIf35m3NdV+sqmS2ui
         hX9LOkH3/k8amc4ZcViLpKe77GxNXKZ/zKSEg/WC+5eg/RbDirzBPe1if+wgTlPovj2I
         hhXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMQTiO6n/c/4/slrI2SbmxbXuLsdtTkQ7lv2wltAH8WQqJ5eLjqJxhSPRUqinY6bmUAf+ecKoHQZnvDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJfETnRvtnWdtCFvuYUl1sXN4kE2XJpmOf03DijiV49WaMHnybY
	nwLTU/iu8IT/ya4YvN9dkNHUp810DyAjEYcrBko6v6IfFzVMcfNkp2IJ
X-Gm-Gg: AYBFou1Hf9gdUZ9V7XhlFQSARkIfOJoPzCq1oToNzyFocMnlw9sn/MbrprDBjYfAhi2
	02f3mJAONYVNDJb4a7NrW/EcU2Q4aRyd3GflkLzT6TPcTdL8m14S7xJgTmfwkJT9pjRCh58rk2A
	dP9lgvSA1A/F/+bDwJG5o1Nf+o0GUqYex79Fdi6n2HfWC0CZ6NsSwXmh2FgHcWlDii1gH0xJ3D3
	GgNel7TOu1iLSrFlCWgV5MDanBT8Vq6gf5XPSnp9c97G/7yDO7RpZ57NlkwikLTUjnqlYvJdsvj
	0K8QGJhs7asfbOhLGP6VKYFIQey/BvOSb5P49CHUw0v0YtojuJpbGK+/Vc2jxAd0Ls5tfUHrDea
	AUkF97KOQioAfXn7kxuYRe9ivZNZHL9WULRMIP2oH91UPtPK1OjQQyIAzInmi2aXRs2iych9Tgf
	X8k+bYrfNmguA9xAT5uHksQ0O/VR2+abW6OdNLaUZOM2M1HnxlW3FXfq+JdQemJQ6JjfancZ6eT
	YBBi9YChMoGKQwv3PP1seW0+LtForzLsT2BYgzxkmfxKQBxKrFIwnnnzA+5eQ==
X-Received: by 2002:a05:6402:b04:b0:6b4:1037:2b6b with SMTP id 4fb4d7f45d1cf-6b44311e24bmr7137730a12.45.1793102462588;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
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
Subject: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:17 +0200
Message-ID: <20261027120019.93611-6-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..39bf1af7c3ab8 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    const: 1
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0


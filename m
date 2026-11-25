Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605992;
	b=xWxVR8eL8/kjgVfMw8gUZhKlKgJWnC5vmwzxnQ0veoXd824hMiCWPqyAiYvAYehdzpeN
	 BcCqTNnI1HOdDPx/WNz1xvvURujtheMM+3zR0v2bLBg5qNj26weR/ZQxEbwZ/tKRaItX9
	 N2P2oDJ2cQPMmrQhPsh3PMVB1sZrILCryLjnUDghpmptwQ9R53VBcIrDjFUCo9cYa39ja
	 gJnONTuZzEGJS0IUzstAWINg61McU89mR/GNEP1IBKl5M0UNz6CryBraonugg3m287eWU
	 PXnO41NHyAxdBNxnJQsx0040RcWLxRgTNQeKw/LgcY0dEgXyS700bS9rWSNChgPGVDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
	b=bQCcI4rIxp0cut3c5AFq0c1Jr3IL59tJVnuj/gSFSqZbIBvap/fCSyvZieWDjfk7NY35
	 hexKDDqQumkro8T0BL1cq1EPaWCrVShaiIuT5GA5gZpaM6BuXZGvgGm1wbtLwaXVTSSvg
	 kr3zuZyUzc79C/enFnOxgCJauHiDWBdSeVs5r6gH/VTIVPJooFWoOxJEZGj0Ijr8AdanF
	 32BidbRfbew0+Tlu6J9TaZ2iJAeiqps8jnZ8fthYtNVFTqw58q4fu7zEeOGz4SGn498Zz
	 4qtvMK7kQ3mNEITOdv74XcNNZlf47iU8I/T9RIxAWRwr1KgshzANE0JF1QBMR1StuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0dS/JiL";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13126606A337
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13126606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0dS/JiL
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso6653848a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605990; x=1796210790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=s0dS/JiLcvpL97aX6ifBN8UMRnPbAYEY60AlqHPB3f3nGYubja252dFE6hKi9nwYdo
         DaZyGwWKZ9wv9TZX0gDQ6BYOoZibctWuin7ZpiE10NcI1AxITIxW9zCTqb0JOyH8dihW
         iChCva1BH14OmMB59y+XqSPPXbN+iRzP9Lr7h2MRJGz7QOW3tqMrhHsbrKfVm8OMdBr3
         gNfY8L07HP+wI5KSbLHthbJaDFKnJUFtSebD8Yx4zOMTmv81ooki8nwS/k5VAbsrBhMB
         xDD7PHWC7G761goRY1lOMcc+u3ggeTvCQbR0GmsGahh0MPI8AAM97eZ5O2f51AY0G8e/
         7RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605990; x=1796210790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6WheGrEKozXa+Lv+Pc9T/hQQN8VmqyBg/NVOB1TtcE=;
        b=y9ba/kHn067qZhY/u5rilACWLZq9Iek5Fgj45gTs6Z2KHne9AAGpO2NaybFPjTtJZ1
         OMsmpY7il3kAwN4PT077UjliraLEztc2TWh90DLOsWBO5zhMQZEYJNLMiFJm76RvFy4H
         jDwaDi3zIYgZ3ecKLSBnux2nTYBojTk2PgWYb79Gky03R9ScZkfb8HY5eTEncB6D8Joc
         CUmbTErsvnXVySJ81FzMYf11QnXtCH/ZfvCdZ9T9lfyAyE/Dv880IUlw0TO1E2qMfBpF
         EeY5ftWdsEQBS34nTXSWdFMwiL/miBWE525Ehc6rZREjkHdrCZ0OYjk1gHeQAkMhLbbr
         eEcw==
X-Forwarded-Encrypted: i=1; AL+hErG2Y8q5bJwjOa7GTyCJIxN/6laSQwKXIzxaO5WH74Z17lgQZcJ8WaVLbLSIc640u3eRrz91tl6jGNcVtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RwoCT+Ul4/dYgBCi39GSgy6f7qoh+49CdtWyM9X8zjA5bE0BK
	Do8XHaLVR/f0YQkrX6PjLXMiuTzjD8WJCY3WlAknpGkT8Vn1vJfINSbO
X-Gm-Gg: AZFdTZePHSM6WzC19ckqRF0V7wX6GvDibugbCLwuwhLEODln35yA+U6ySnPobz6CNMU
	41PtVTyVf3olaBksPRtRPu2QLwpfUYfY+76msTZiWj3JsQMqbfFZ7hDMxFmEAuGrXDV7eoaxKzC
	uuYubEguTjoOihlcG4ylTw/f9T8G5YG1NKbB+fMwZKW9nAYIhz4rOiYlADRvFz9Jj8LGPYUMIl3
	Hm+AdgNHYXQowKqtqWt1OUuywJUJ/awj8EmrXV1UA92erVmg4UMbMyQCkc0bk6jIwbZu65uUsLP
	AHGsMTB0OzPDreWy/EFYMfxwNMG9JRc8NufQULhEuApR0TncWN4Xm0pJ1XI+zv5JWP3H1r2KJcd
	gSkB3jmi7oBoPkNCVEQCMQNdd/nlsH9otCujY7cu01Q31bnABt9Ar4k+yHbDcZCu61daqsnhDmu
	zTnHeWQJyCt7KND5GIAjIn4BgeJWFOoh2/+WARfY43ywIL70Kv1o6z9yJUMBvOvzX2w5PNW89ls
	Wt0EVNRumZQOvqTUg/igrOyF/9Z6PsRgX9g28eqXGvyIpL0TWFykRWlhKxWbed7l2hE0DD01o9n
	3mLEXv7DrANfrUlzJgJwTMkfPP5xiKJc215KZE2toJbMvduNXUv1YFPXZjftnn5MQqfbmTBXJhw
	TLGD0aKMS5g==
X-Received: by 2002:a05:6402:4028:b0:6bb:2a86:1a58 with SMTP id 4fb4d7f45d1cf-6bb2a86201emr1407592a12.43.1795605990172;
        Wed, 25 Nov 2026 03:26:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/7] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Wed, 25 Nov 2026 13:26:07 +0200
Message-ID: <20261125112613.237333-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20—principally, the maximum VI clock
differs by nearly a factor of two. Additionally, Tegra30 does not require
the APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0


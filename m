Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586726;
	b=QNTf5s3K/uGHrSJVtTiwzqNHzChldPgJQBUg3vXVNsBlCUtGIKZ94JaST0+j8zjLhVcc
	 le0ey/feitdqd3VxR5thHua5EnxMwYnuEz6bY0rzw7JHAIu6YLSCeNPqfQKpsJHvOGrgR
	 no0wC44B4SgMsNABIbnYojejgvC+s/DWplxm+6uEGelna7K8kK9wSOjHydDX9ubbjaoXH
	 IOa0/mNmru8LpKXWZUydy/SZyhuyOTTklml2aGf2JvdXeDVC7gnsrGUOi06OxOcPVhX4m
	 asieIXEfGXe0c0LMzNJ5AdmGGYEKXFr//pCDAZ7YAXX4UKCWgj6HhZyNgbBaxe9ryCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
	b=UYOCfvVsI21q+MMb5HKFr+urG9631pGMPN7HYO9s1ZYoV/88sEsdf9GQrSsK2b1yyMnO
	 UTd1xd2oWfpk1jamTq/wtuUvIdrfSCxBdaeMeUoQnd2lm00dU3MU0v864wFOGvQ7wE8rt
	 W9i93ZViWYh0jG47glMrtlp4aNj6ZR5o7jNcq7m2tKLIxQem3kKtZxKwiouZq/5a26JnX
	 mPnT5O7O8VoJKaLtK1HDxQEYZ171uV9aNc4Si5J5tkmXNboQalUHN66OT14VheHKpOevw
	 AAL40G87dhYSMrdWPjsbUPL/8vxUbJJI5U+BUn13zmR01BWddIUuElLMt05Y5xK0k/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1E606D44A
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF1E606D44A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so2187640a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586724; x=1795191524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=f0BSaAfqvrF4YVCe0zL6bqwE2NH0qNrRF4mgMNPzpCdomHb+euxkiM3S0I0BfoUMez
         rwiZ1SGxAy/qCs+Qb9DQwE8VMfXB1mVZinJCFkVmh8sjIGvfhhSNfbVbBUmOPN3IOgG0
         gqLtcTpMO8r5s8soO531ZL8MPdnbMtoKWwOX54DEokKWNJdq2Ytd+9L8VFbZHcUaTprJ
         9G2ZkREvaNNmkZOT6WPseTtFfhq3ezBzAEDrqm2wkPDTPAk3PFHaVxywpKECjmsMvfVe
         tIz1s6d5QoCurGlPvAymyvpSfYcTt/V+tKWJDJELoSVQG3onfx+pSg2fF8UlPDXwWH/m
         +NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586724; x=1795191524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=KzGfN015fdVv8hMnh22hXv1n13Cr1Uwdm63jS690P8xmZ3oh4VqbUEXfFw8Fkgnbbs
         aWpB7VCbYV5TxElO3RC2I1LLbrYy+d9eOLwt/6+kS2WulvXxqmdCcq8SkFYoI9keHuT2
         sQ9Uywkz750Dga5dBVyLeZWEnRKz2/Ai6W6fgywUR4tzhgpddhO5Z+oC6mnaW4/Jm0K5
         e6babaKvryiEyPDBU8qb0wX6S6BH9aAy5h4y0Xbmh5SskjgWM/D/5oDncpjwORO0g99H
         4MX7cOnpy/m3/itMSKcAx3sWgOcRwF8zc/F2Bf8YQSxnMTzTaslSaht5mcY12aMzyHND
         qYkw==
X-Forwarded-Encrypted: i=1; AL+hErEu3AebUtF/RIl/n5/a6iAcajhQtjAMHofSCPiXk/bmXihlqrkb3SIuJx2c6ovaR3YKsj5ghblfwuHk/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qISawUOTlzhJu25dt/YBL+tNODRPBTE5Yfpe1+S3LT4Ul7Eiq
	ar8/T8hl26nTs1GQVljJQcl9vgqhpP9x6Z4HPXg9APEmHUYUNRJ4Dk0C
X-Gm-Gg: AYBFou12m1sT3o2ABQDNyWuI/29ltcV/YRmFoPYIvD1KACaVeVQY+cYgg4YgXsFtjXU
	l8kuM/Sg5/PRcl6ZYVeVXj/2Go8MrWDJPoLGHN5R+HCORWOHXCIb5DGwzxTgHYTguXwIO1FSG1f
	7CuR8jzcclKi3jvXJ/PYLjIwCb66F2ue/rbZEPfB14ISN/Hnqwf6WhnSHmkmXE/KImO2mIRxKPT
	wwqTokgqLMgGKTeOsCWW9B1Z59MDl+9rtV5P64HPkDtXMAUzu120gVSVQ4TvvkB1WLBn4LTWzln
	GuHxrcSUluIEoW73JcvWLIuQcF54MSBX3Luf/Xi5CdsLfrzLiyG7jvoFLG3zo11Sw8eYuy8Zcyn
	1QbU6NC7l0SznfOtMx5dsiN+ZxxeIjfsszRQ68ozeVUqZ435agDXo2IdJwJOdHpPKcn+/s4bdxn
	el3qdXtOTc/BFyI7MVD6ogqlbdwQNS6AlFREEf3CfiMH40pYEeB3e9Wel9slOh9giWMYaeoA5Zn
	5Avij0q16iEapx1LpcHii2jpk/2K23UvBdF2R5PE4i1mXDZm9A9LIIAKZVVymikRQDIk2ZCU0CW
	j4hHEZUO7IdM9tQiiEtcr9Uvok+zbhosOHjUgf9s4Za2IG6clnU2xWkPPn8yXmTbv5qQiHfcCjX
	IMBwOtMFwHTg=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277084266b.9.1794586724367;
        Fri, 13 Nov 2026 08:18:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:43 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Fri, 13 Nov 2026 18:18:11 +0200
Message-ID: <20261113161819.36847-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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
different programming model than Tegra20, the maximum VI clock differs by
nearly a factor of two. Additionally, Tegra30 does not require the
APB_MISC workaround.

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


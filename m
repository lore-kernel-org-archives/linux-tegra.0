Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983449620
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611547; cv=none; b=TBW5peASBNdvzW9UZc2pZyB1IudgP0er536Vt8tU7830f9uGxA8xurRAlsZI85m5qvWyTi5qsSigzHdCqxx56U16QNCkX8xeEEydql0KE7IcEAr8TXXnYCA0x3IcneYrnQyh4iZsc38aIG6W5EiMs22T6q1bQCaWqBe9Uc+EKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611547; c=relaxed/simple;
	bh=ZveipeIP7Bmtra4tJV836ZoRkFGm7qdMZOJGSTZHv5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APLRXs8wY05124UrhjrTqJQQ8V7vIhPPjmH5gpTwelGfFvn0slcj2w6CfOumVmABUrMpPryBUCq76mZy6RICr60Lvg38f18Z3hrDYEpEMIOBnJFZJ6J/MHhA7gN9IbEYnxQa/1olv2RwWbpGiFdJbdOFDKgqCoBWjOqvwEi5uoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhI+LvMa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhI+LvMa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d256c2a9so2551458f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768611545; x=1769216345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wzbNnTwPY3sl1kDBYO8pjwy7AQ3U6oZDZIuHTJM1cw=;
        b=OhI+LvMaHSser8ogUVoWen08Y4NvsMT4duH30zfQaOucwAYuWbKrgK82rtSCfUZJCH
         atEz1QdpNqqFd+FUzN+IAK+tqA5PES3gUc0sMmuVo2iEc9lX09JPwLNtUZ3mKKS4iTfQ
         oVccuUVQMubtxoukZroBcWgY8kGMMMQe0qbjO24WTOql99gI/wcq3z5k8CRktpbNGjO6
         YJ5R5AbWWKFY93FlYYiOQl1a6Sjp1SQp6u57MwSXNQya1nhBvONMnXSl8xyUp8dm6+3L
         MITX+znpE6JV9HWgcyzS0f8z64h298AL9OAo/bd6j2+97OE+D+IZr5Om6IKBtuuQ18BB
         J9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768611545; x=1769216345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wzbNnTwPY3sl1kDBYO8pjwy7AQ3U6oZDZIuHTJM1cw=;
        b=l53XiYrYAs5UptQe9XZJ9Jnj7xQZSS3GQhlaE6K35bqP/An2plhvs+mvwyyShWfNuW
         TQTTMN4+iwl1J0Th6G0Aeq4G6m7Dl58sX2mXpyP5al9dVS2KnnbXRIQKMl1w0QKocgEl
         47jmk6EseC+TTLRjY+Asaholq8NIiBmolfEU39PL0ZRnPQIwVJxCtB80P8QYoAy4/jSg
         ZlclyRw1ez/AryXq9u3dVOwnafQRoBHOjTovtySJLStYwBPjt3BoIFnFfe7CuHU+xhwW
         1cndQusdI7/x12fTR5bdYWBIeBab4h5Ud1EpCv+22QIwnWspVecd+nElBDGmyj73qEgr
         OysA==
X-Forwarded-Encrypted: i=1; AJvYcCX2R8Oc7StLSqJklEJKjfUXmfK55QcUJ/CSsvD2MRydVXWG1VH8fcaocEkRCcuJLgXsM3C4UyOBLHQ6XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1S2My/Ky7F/vm5l8BL41J0ZTTcV4zcwPjUaBzBfyDViuHsdbt
	Q4NjQ3T9u5vqxxpSujvWwEujDn1Qu0pWDGrG30yo6FZ8qurTHIZXZXl6kV9TZGcE
X-Gm-Gg: AY/fxX7DZOVjPVmHFQ3RUTVDqbQrkyenBqYhhjgQ5bSBZPJxDocnK4OXSHVDvV0bO8G
	zvp8/uuC/P9rf9ns1Yq858IaZjviuDRpFvBl/clSy4s9pPWwkTMarWu06cgwpaWOi2KkMUVlQ26
	JiW6c+V7X/Joldm8lTE/I8fxS+YI3z7+rMxAT1odEnaLy83XGEGNypblyxhLppY1ST2rn+ywxlP
	3joyw6iA1s0FCbLSEAH7F2LfoO0AnvRgRs3IjhNU625OjzKxA8BVcg7fViVUoTB/j+EwoKja2gn
	7OgMWNC7g81U1TrDaZymsHFp8KTuTvkBN6QpQckF7jOTzGaM4eYsEZyKwxqqSN44CHmt8ku4a1Q
	EzDe1DI6B4Hmn3m4BrqzzK+8Jh12fcazCFWu+vLrRrmCp7EmGYSEjN+fFUolL/0JqZruUKZ033X
	1hIk2w/vy9viQ/3UHz8hy44IBPxHfTIywRqc4caoV2vi5Ov9r0BQRsgJkbfp+Bo/zCzVPJNR9X0
	hw6taz6hnPe1EuAtQ==
X-Received: by 2002:a05:6000:288e:b0:430:f622:8cd4 with SMTP id ffacd0b85a97d-4356a082f50mr5383723f8f.49.1768611544731;
        Fri, 16 Jan 2026 16:59:04 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921facsm7885225f8f.5.2026.01.16.16.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:59:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Date: Sat, 17 Jan 2026 01:58:55 +0100
Message-ID: <176861152450.1947082.2637987844354037789.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 08 Jan 2026 14:31:55 +0000, Jon Hunter wrote:
> This series includes fixes for the realtek,rt5640 dt-binding to address
> a few warnings that are observed when running the CHECK_DTBS=y for some
> DTBs that use this codec.
> 
> Jon Hunter (3):
>   ASoC: dt-bindings: realtek,rt5640: Document mclk
>   ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>   ASoC: dt-bindings: realtek,rt5640: Document port node
> 
> [...]

Applied, thanks!

[1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
      commit: 601a821631c55014b02371740c39748d0af916c1
[2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      commit: 2efe28d11cc19b69b19b9bcdb6f498c1bf842fbc
[3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
      commit: b2788f6320722d6059f849f35a77eb082608c627

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF0B19885D;
	Tue, 27 Aug 2024 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767991; cv=none; b=FkAKzxqtcCqsqYkvvBk70zz4mcSKWwZLcWjLPNEjWH4N8RxY51HAMd7jtQCXUCS1A8uGWSguVwVLLKnqzoPN00BFON1bO2Heu3zqdAsAaQ5TQhlhAo2B5uR3YTOyEIynbqJTMoJiTCWBAkGj6f275CpQ/G2zteRW/wmXQrdyZvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767991; c=relaxed/simple;
	bh=pQHiJ0YQH3LGaszz4aPFQ7HDBDTjKjR3Pvk+P+87qyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RH0vOsd5hS9SRi3gMTGtx6VUCUOiUU/Kt9t2EQAOKTzy4SCOU+UYvL38tsBPfcg9A1kKycdWC6DgS1HaWpk0b3lxG6ijh0f2HIk2skJg98mBHi8PPcJrUIddy8Em7cSQqUZa9TCvIj1JXw6hE0FNbqzOhcgGSMKkA3BcN77ioEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaJE9yve; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaJE9yve"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so48290525e9.0;
        Tue, 27 Aug 2024 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724767988; x=1725372788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N4yGXxku9/0Pzv5A2irRVxTpy8ZQwxlWTz5GIjgTgU=;
        b=EaJE9yveCKlJ2C9A70c0L6cH9PAcqSpS3VhC2jumXIkFfiold9fW1RtLppkgZkBhJU
         5rfLMVeTarCARKliAuMaz1q3DuZRRtoUSsYwr0K/GQa7CVc4LTFVHmOvaAaCRdoC7R2d
         wUgsTa/57FdbHZhu/dGkROkaWbsKI+bv3d2OF74yr6oQHmO+fQlCP7VCjay5qQRP5iYD
         xsb5DRbnuMO8jufC1i2gH1prnmB8dVq5Gvchpy81FSGfZdP9z6LvnbzHkpqZjiBNywLO
         Mc01rXfz1K+g6yWYAFsq5c8IJI2caHBfaK+d9TMw97glRy09LQK9CAH+DTWlBrBq4pS2
         xoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767988; x=1725372788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N4yGXxku9/0Pzv5A2irRVxTpy8ZQwxlWTz5GIjgTgU=;
        b=KN4z+Ty3mbEih832X0Hm5GOxa1ZsAuOW/2mLcDjSl7GuOx3U8S2V34zpkaYvNx2gZA
         VmcZBZpCmIVAVCDJvf+BkpDrV6Ni1CeuxcCjymQXroZBKuwqsl93HTlgUUp551JHZcpy
         PptatNxS/i/j3qMaz8DOYcuP1gxMqgma6oCZg+GH4h2yfwGDTPDuZ9F0xLf012UuhikK
         RdDuw9uwHmGpGDNIIjMedMLNbm/VEAPIrvi82+TOI8ml5Qgxv0SoYx/KZC5/nov4p9zM
         Y/gB2MQZ7rjVow6knhWIv5GTu/j1H5A+HseeQq8yEcTNHjOy2R+xnkLz677XrNo0SMEY
         fB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUtVDPwgGCkWew+X4fGdhmASZSdi3et6If8f9Dbnz9Yo9ds0qwX9/E9FYuqA8fwc+qRRewLFfde78Fyr1N@vger.kernel.org, AJvYcCUqZlTsA16wjLj4tC+9N+FIfjPZmBeLdA+EXiPU6vvunLbJU5v86gf20x597pHZKsQtPbFioXlhTh4h@vger.kernel.org, AJvYcCX2GkVZ31UNPQ0pQU1VQys7Y81s/wG5rQqZYdjFZsazgvv89iexP6gPaSk3AeXD469bfdVC/wcSi8pWHLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv61sEJ0qNlpHjmEtkBaNQX8AQVqNZ05viF1knEqnuKnELfu4U
	5tg6KVSwbMqkoXp16ODMWq/j8bT971Ht9alO4n7fPIZVXZZkIp4x
X-Google-Smtp-Source: AGHT+IF9TvyqbA2WJCc/nfyxd67rej0RmN98uzOhVFhxtVYeaAu4l+dfcnUZKGvVuEdDgoZ76pQ1lg==
X-Received: by 2002:a5d:530b:0:b0:371:9366:6d8d with SMTP id ffacd0b85a97d-3748c7cd5a7mr2045330f8f.19.1724767987324;
        Tue, 27 Aug 2024 07:13:07 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c520sm13177827f8f.39.2024.08.27.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:13:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree
Date: Tue, 27 Aug 2024 16:13:05 +0200
Message-ID: <172476797836.1249424.11758818345738178653.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705235254.126567-1-david@ixit.cz>
References: <20240705235254.126567-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 05 Jul 2024 16:52:43 -0700, David Heidelberg wrote:
> Avoid firing useless warnings when running make dtbs_check
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree
      commit: 16b760acb2da5c90c52d1258148102bf2b60c21d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

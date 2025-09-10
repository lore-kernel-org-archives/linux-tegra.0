Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F793148BE
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497279; cv=none; b=HU6q0dOBTNcX/DJPicaggUi8DNAYbCaEawckyqh+mJLhRkv8hNtCfs1GzN/YWD7O5rVOEVWz/c7Lo9L9dGjhhmnK+ucM3ALqYGjP/AGRPmlwLDkzPfTjk+uahV/Xxs6ZCkt/Xr3p1dM4Lbs66AIp42GIhS1bzCsKwIVEXxAnMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497279; c=relaxed/simple;
	bh=sZUp8SW9Tfp1f74Att6rsJtcQTfdahYzip3ExVh1YXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jEbik1pqQFZhcTWceza1bE5P7f3m2hD4ll/sKUaoiO8GcVGTGyNQ6GCckSbTMEX+zGh5ttveuEzDPE1vfXiZhoKrab4cSM4TKzP8GJMdVUwhRenBJQ2EuO2JQBCNp24bCpSE3pM8EnKKKXruZAQdbDRTY5RCS1LCzQXoImsnv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJA+xMuv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJA+xMuv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61ea08e565bso731291a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497275; x=1758102075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL8PU3/bJen0cT+fcrsTVjVS+BhRynUifUy443nwXXY=;
        b=LJA+xMuvKObaPLe3mrGZWMvVCZfz4x8rghuOC1rVlUQpC2NJ9vmaCy56Xtdl+lIDn+
         dvRXrtgkh0LcwHiaHMkMdaB0rCt/ola1QZI55JNp+y+1ghfVqs/TsXe2+Yzgkug/fGn/
         rzl+GdWncyNg+x6PvHsQf4E3fKHo6jNUEw5evraMO6EL3tJf/3VywI6CGCTXa9vM23bk
         0efiWPGUE/kx/4GDteT5iiuqtMTUJP3xE1jVeaTy7AQgxgbICUEkjtGIJ5FgcZYDGtNt
         RHdW5nV/TJ8wtwR5c3jzy1YYRxPDQBi+jrqCz/Dbz3MpPAO9i4q4/tM3Px7r20GGB3xF
         L04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497275; x=1758102075;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL8PU3/bJen0cT+fcrsTVjVS+BhRynUifUy443nwXXY=;
        b=HB+7N6Fm7mlpNmxmCGCowgd2C7YD3qQPNxesLwew9jr8irgaqt3TGGnX7ghFeomJ6/
         tUdJttv3IyBuJyeMWf4x8WMvu1ICqWUWVQ5iy6xcJfIEAweLgpRX25hYQlovJblOt/qw
         ql42h5Hz0JD6XI9diehD1WNesd8VGHf+QmAXjvdEgYuvMEYbanR+jg4yduutkJweopzl
         iF90qdJ3S3+asuRpJ16VK7sN/Sy6MyBPUiyjYZUo4nlZ6QAFybcTpGPnHtSidA5KL3E9
         fVToifzrxTZNqtwI7H5q1btYi25SO8ub/i8gWHArFF4b0iWzZgQxFLySnTMjf/TCqwFG
         2m8A==
X-Forwarded-Encrypted: i=1; AJvYcCWnXhwoQiSpuBmZHL/pw5dzPhUk+uOByp+b4k7wK8QIhvWET3RrkJXVM9d6AeroY/uZwXUc5XBYBJujig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXLTUmiKryIDbgUyDfdbpBdkdF/3g8G5VvyjAA6ThKvnG/EYD
	/5WGneBgbmhoIiHFLDdqJgkUc6To+weHoMyDAEWjOcywESyZYdB1giUU+13091D2GE0=
X-Gm-Gg: ASbGncuorue6iZfIMSZfJqfkjlVF2fJQG+5vYx/Ct/VIGRMyo1kdhtqFwB+EgpI5jMF
	qKs8axLrW0m83l8jrizyhNwsBdehHWE7H5hcMadkpFcG/800m+Ytq4Yc91EPsLooWVYUAwOKaSt
	MfiE+JfmYsNn0IFBcWBTDVBgcYWy/uIqeP8CDQ6TWmf0v8lTgEWSfbHTrTBL8Cr2/cisKeG7wyp
	ZC2g+46cJiTvKxoidKIHTv93Q8LBAFFL0/wwegmGqjrs9pEW5EghVXV8lSGjbcQKsU4QtSsJRjY
	I2HSGzu9a7mNwqP0XtE8oUVJuhcpsAHVbUzYOBQnha/uVN4LOlYBs/KFvnOR5eQr11OtstwLvND
	rNHG2Pwp4zgvBsnnBsfZWJ+nzlwwxTW1jkM/2QaU4HoZMlMjDEQ==
X-Google-Smtp-Source: AGHT+IFluU1es+hUKEAAQ6k+MN426rP6ABJMO4pvWzDg2AWSxzJmSyi0YpWdow2bVsSEtKWjT6rzNw==
X-Received: by 2002:a05:6402:2345:b0:628:3c12:8732 with SMTP id 4fb4d7f45d1cf-6283c1294c9mr5368678a12.8.1757497275239;
        Wed, 10 Sep 2025 02:41:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb7e9sm3021590a12.48.2025.09.10.02.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:41:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
In-Reply-To: <20250906-t210-actmon-v3-3-1403365d571e@gmail.com>
References: <20250906-t210-actmon-v3-0-1403365d571e@gmail.com>
 <20250906-t210-actmon-v3-3-1403365d571e@gmail.com>
Subject: Re: (subset) [PATCH v3 3/9] dt-bindings: memory: tegra210: Add
 memory client IDs
Message-Id: <175749727366.29308.15174837806848682381.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 11:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 06 Sep 2025 15:16:53 -0500, Aaron Kling wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> 

Applied, thanks!

[3/9] dt-bindings: memory: tegra210: Add memory client IDs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/5f5598d945e2a69f764aa5c2074dad73e23bcfcb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


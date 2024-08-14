Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880181B013B
	for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645261; cv=none; b=Cr9r1uObf1D8XssGmkQIC+qqu6RmNWeIPpgu0rhcStvsY370Gl3iloWvGOCCtbe0z0h6E8C+NOeR56iPByWJu3SR4U0ZMSqcUZuA9NTJq5dn8sepkRXqGfTFo3GG7ItaM8Cw5HiDjGxw7r9VXnP8Zhqg4ODPidB8ToN4noi1gTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645261; c=relaxed/simple;
	bh=e2B9/Cs7d4Es4Ydx4mTglOtYWxfhlPYZWRfMX/o6h50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sOQ5SW5Z05+AeBglwn14IJq8k1Fyrz99yRz6xAywGswtHFfnq4mrxUA5fiI0l6+5u0ouuBmOzVDKpZNwEVPLOtu3kNUQpwvJFCXVKM7CXtdqGQhK5usbazrJZHSEIsIjnuYG6KsgttwTTrOXAnIEek3dLFvYcDcIWD66bfKSrKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxgzAmyM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxgzAmyM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428101fa30aso49778805e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723645258; x=1724250058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dydVKtkIk6+whYZz2cb1BbukGAXA5bfaejUInxNgps=;
        b=zxgzAmyMn+UnboQXscXLY7FHL3TXF30/Y0wY9sA0w9DCuCYE9SPmPupf5iUB2xwDtd
         UP1GcbduEKgIA9yVF2Eb0RPv0Vj8NutVfE+oR0ENUtlPKp4KYs8XCdyQo3GIuGZ9H3CL
         Uxe5i3E/+8cLQMcOfFjxxutGNx1rSdrKEnLsJ8ISZaJWl8fEI+S4dmxTIiCzbHo1oFor
         Ly5d2uITzdgWzRqlDKjD0FKFhX2SysrwKgjNV/LHO4+/WwsWpdzZSaxH4ojB7DsfxwCI
         XE+LQmVqLVcEAEWs9FvONJ/a8T/4w21Z9NEVRlh0KEV60yRhogejMzLdKCFIgtGWRQfn
         84TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723645258; x=1724250058;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dydVKtkIk6+whYZz2cb1BbukGAXA5bfaejUInxNgps=;
        b=dtKrf78S68z0e2etHtADwSSMOS1jI0uYfOzUepnr0OUZTUYv+dDlzBu/eori5zQKtq
         oAP21w31iM+fMjCV7V8s+ILdLxlBk9vXwKqhQKtxlrceEjYeECziDpiYi+jaJuE1yYSS
         Uh4VwxnyZs4Gdzc6zkKm7pvX5gnhRmsxNW48dA7TO35YPM0B5ug5EL3B37QKlF7L7zK1
         LRdWRvoHup62FZS/jmwMZMXHGlEdC6abZbWHCLRdZtoMIz2339I2jy0ZYHjKEj2OIlQo
         8aWNoaoLewtrVFWgXIjGCIBOPchuH0ljHrS6wjrRr99+YMw+40/sy30EwXbkae/zc1X5
         xbkA==
X-Forwarded-Encrypted: i=1; AJvYcCVapqr4ygZbXwnW/iXFv2XzRZocrFDHGNmryNp2tBz9PMWJC//cc9Co+MA7rvIpCqFf5Z8TKdKsEebMOd6l94SE33a005v/ApU6xk4=
X-Gm-Message-State: AOJu0YwVSE8IxYhDJrngZvf9Ztz1OkiizXS1f5TOk7FrHBatt9PINDIi
	tiLNGykO0DVPG8H3yxSQqCOu53O9u5Dpw4IhSNvHelohuIRJOAW0anLmdeQkX7c=
X-Google-Smtp-Source: AGHT+IEULeUH1zJX9vJZQF4v6AJw/7s/pzWL+QO+XM+pg43wSACflFFsEcM6MgGiffHSOP/3R2h+aA==
X-Received: by 2002:a05:600c:354b:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-429dd260171mr23585065e9.27.1723645257861;
        Wed, 14 Aug 2024 07:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded327f8sm21211085e9.18.2024.08.14.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:20:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20240812123055.124123-1-krzysztof.kozlowski@linaro.org>
References: <20240812123055.124123-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] memory: tegra186-emc: drop unused
 to_tegra186_emc()
Message-Id: <172364525673.95325.14279036440219295213.b4-ty@linaro.org>
Date: Wed, 14 Aug 2024 16:20:56 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 12 Aug 2024 14:30:55 +0200, Krzysztof Kozlowski wrote:
> to_tegra186_emc() is not used, W=1 builds:
> 
>   tegra186-emc.c:38:36: error: unused function 'to_tegra186_emc' [-Werror,-Wunused-function]
> 
> 

Applied, thanks!

[1/1] memory: tegra186-emc: drop unused to_tegra186_emc()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/67dd9e861add38755a7c5d29e25dd0f6cb4116ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


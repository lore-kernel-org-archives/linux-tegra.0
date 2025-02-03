Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B162036F0
	for <linux-tegra@vger.kernel.org>; Mon,  3 Feb 2025 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583638; cv=none; b=asN7k6vd/hna8ri85tLxSwN7ZcT6oawoni15PjWJSQO/wGnUdNEf97mIBBfgR2O3mMUbn/038/9FWsiBIi3G1yetElJSg9PmTUJlnltiOYJlVhx+mueReQF7oPoSIcV2GavtTj8fLO2a0yhrBLZaTWfbeCaonNZnNR7kYIRWyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583638; c=relaxed/simple;
	bh=meh/lrf3lQBId3u3rudz9MSEfCO2RYxB5NClOQzPRCY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JGeGkZE1yzVFL4Ky+PUB8NiAFcmBdk/aC1xCdP/PWJVTQ3Y8H1AXJkXo8XvpNOq89w0TEqZejPjusdqPrtTkrFwIjt7mD3ObxBMaFurSMUgySmPS+tcEDnNasMjxQU+n1lnpC2lduU+TYIB2yKuF23nYqv5jfVdVR5MU+/4iRRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxUSxLvz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxUSxLvz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so845572a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583634; x=1739188434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9tM7OqjYQPC/oIGbMDoNHBcwCYZBpgt07HcYPZRjQ8=;
        b=zxUSxLvzFi55qo/3ZY2ZY+L7uy+KOguK0ymUIQTtI3OOgjfgRWnMdfXaeCUeYCZZAc
         avEvbkVz/QkjwsXh5heMLPEmXRYnopxPUQD71P453hDFeRs/md3WTQXQrjDtHrbe6MA7
         hA1pDqOQtTZkA6nZ7rhbFNoPpshASzcnt3UmVkPc6oYMutMaMS0ZxLaWBjaASpcxCDAP
         ymSP5pM6Zm+EZCNlF+1LGsrvrEWvc675GwW/cc6rdYj0N9nJTLvEtHtXUIybfX6vB4ZY
         zA77DTg02tG8OJyFGkObijATmMyH0X9qk6qyXL4blqAW5H3k4b1evgGGR3jAw8q0nHpd
         numQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583634; x=1739188434;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9tM7OqjYQPC/oIGbMDoNHBcwCYZBpgt07HcYPZRjQ8=;
        b=iuCLnm+fN2sU0DzE+WJg6XP0Ragxi1Sc3dGlLD+5O+Cek+FUXcpijWwZjhPFWZfgSc
         3hcLrDKiGMOrIfiOCPC69FtV8B0e9/pkcRwjX4/Vj5j8bJzwZnZeQZxtEQHpuGylia7S
         e6eH++W32TdK9C4050iu3ZLEWPy0y/Vp8+cXcdTR6UAbnFAqfG2qUsOSHezi+E4PbWaW
         br6aSsAVU3ydiycNKyMJKiBuA+cRvmNo6sVm63MBF+Gg+sBBhuFVBjnOB0huWvksQ6d2
         ecWncw8xDLg933UX0+ML5ZRTpec6tnSb2FudSkfJFozo3Oc4bImvDmJ2atC9WcafDTCV
         TYvw==
X-Forwarded-Encrypted: i=1; AJvYcCXVbONEnB0H3tvBJdGZu1ez2l3u4p/Wvd1dLL9tm4j+aVpWH4s/nrz331jYuidieXa3lbDcYXlSHtwf8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyhi/YQbJwcOSZuxJBSGRgLEXJ6+6tGqw6yCWHTWFlRakLqrGt
	Kd++Ic4qewhP4D3qgSFO/DMIB5n5NM9R0VFKNLOVngX5OVTtsEVe6pJni25sGUU=
X-Gm-Gg: ASbGncvEjJOqoMWdBH2M/rvPjNAeX0mGh/6XYgqnmGqCKj5y7X9sdcT3vodITEepbOk
	6E/qrNS2gXvnZuOsgCuc0G0ThaZ3Uzjrt8fsjACXawPIvUDKKnKTHQLGP9elX3yynuLaAtoX07O
	C94OU+VZt+PvZ6tFyIyMV2lOeay5NdavROeuBakq4+gPQQGnqaw94ZgWyjiQAwV68dBUvcgQv04
	LKJqN1GQ9n7cu6hAN92HYwGmbCXFhXRpRZHZZ7/vS1q2AdBQlVzvfWDYxL2NRcWVuqS7jLxFUgB
	E4YgCnyZmG2rXEavXj4+Bpoc+43HiHo=
X-Google-Smtp-Source: AGHT+IEwxGompX0RDX7IgATosUk/dQdYe878OcQcDjQG1dWZ5fVvuhozBCD2DX2UUP85oceDFhvY1w==
X-Received: by 2002:a05:6402:4287:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5dc5efec149mr9404962a12.6.1738583633919;
        Mon, 03 Feb 2025 03:53:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9cffsm7586519a12.74.2025.02.03.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:53:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250104141430.115031-1-krzysztof.kozlowski@linaro.org>
References: <20250104141430.115031-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: tegra20-emc: Drop redundant platform_get_irq()
 error printk
Message-Id: <173858363265.129675.12403410768215721898.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 15:14:30 +0100, Krzysztof Kozlowski wrote:
> platform_get_irq() already prints error message, so duplicating it is
> redundant.  The message about "need of updating DT" makes no sense,
> because this code was there since beginning.
> 
> 

Applied, thanks!

[1/1] memory: tegra20-emc: Drop redundant platform_get_irq() error printk
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2f76a890fd2c636c640af1387b333aeb0cf69c75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


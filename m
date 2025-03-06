Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2F26E639;
	Thu,  6 Mar 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290129; cv=none; b=qg7MDix6eZaannmjSK94dEH/nqIt1dU3fwB/f6Hpmn/cgRDzhTY4+Cq1X5KDdNxSTYoLGgAISh+PdEMZQ42xPgY8/H9KRilfO9D/JA+JHXg0ZNIc1TyG6tOBibaC9llzczBrkACiMWtG5x1eaNmL5soX9xWSgyljmkcVuuuIUb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290129; c=relaxed/simple;
	bh=Vbh7jmzH716EhzQb5NTtu2WmC96/QYiwIunvECcvWEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFie9Yv51KzoAsY/FzzEIviepTcJURHbDKRpf4BBaewv4iArv0MfEaBEAB+RmaNffciLAIpROJakZx/ruH868MHx5vRJeXvvOM8ERWRxz9hg5qsM7whtyZM2ZyBD4GLn26IU1N81PHDYenK01kn4iT7Pr/JhjZgSuwBkgEaoHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9CEPO0k; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9CEPO0k"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so1037671e87.1;
        Thu, 06 Mar 2025 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741290125; x=1741894925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YakHx1++nRz2fZc1d00qU5LIWacTV7aWUGmJn3QRJ0E=;
        b=B9CEPO0kKCWMW0DWa85dUb/91Xi5rdrhvIACXEoDqgYZBSXVbh6b1Ps7Ge0lh0bVKL
         vRBhODVFGuetO2MIC7Uqi0+XZ/fc45hLYOL6/aBoz/KHS1bvcL9vDpRblF/nlsP4dkrQ
         wftmY0m3nIakD7AU/sFN4slcgWaRVt6Dlr1cd5VO49n7a484xmj1UiFB1Lx7DMNTAY5T
         +GGyO2R90+7rwueTolKIOpgc5ocrxDHGzfh2u27Qmcn+SnVLNU7wZfOTdqCMyAepRvaA
         Enyw1WP/lp9nC+y7Rcc6p3YoZrPMn7fqsqvlRtN0vLKvRDRgvN3yhZQ/m08JQjNkX7uX
         Ak1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741290125; x=1741894925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YakHx1++nRz2fZc1d00qU5LIWacTV7aWUGmJn3QRJ0E=;
        b=OpKzhm5pKVuMosHKZOiqm1l3oLaIIxPw0m8nlGndmpLwxrYpimKzgHMgbMNUCgQh2W
         B82t25z/VeRJ5vmr+W2yKorIglrhHYGOue7ACBrAsjHLfZmlut8gXGp6hcruRP/qUcRC
         IxGMBzCF9rYT/vZP8vjhwh+GVNKgnFfTm20AkPpdPmYZPaw4QGgJNIcO2/qOefAEgGqu
         VqThVaWdfPXdzsHnR5yDVWbHUJ+gQFoIqBvcLKwBX0bqU60jlXhW2d/2S/BxTVcOULNA
         a1fufZefPWfZ4/7j4FbbbZA9/4OcEqeNoxOg1DIjIFEzJedSDlmdYXMC7B6XfEbilOw/
         pDCw==
X-Forwarded-Encrypted: i=1; AJvYcCU7CRDPAUJHbyBuZwrkLv8X1zMCixK1Cho2SBq2fJtkLYgHRIYoqu62O27YpV4c7m7jm23hkot565e0@vger.kernel.org, AJvYcCUjNStPztcI/ka4NFzlXknFkvkK6Acyld2ynGGOGLzS5z06ttnHdzEYe1bIzHuTqj5OXx5yA9yAjrDs@vger.kernel.org, AJvYcCXP3Igx8igL2WDUEa7nUVS9uidz9DvRw3EcXy+xsPQg9WBhR4b6eu9us5HFmigG4+lh1zyeL9tvCpaA3qE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqq9Np7Mhw96KEmT+xBR2/0iB8K5t9N35UU+Y3EGQOWNyPyU/+
	439/2XZ4zTJUIY0tKuIKiGvk0GV8/WK1eYfHHCaryQfbEaedczpk
X-Gm-Gg: ASbGncvUXc5TgQItnDHsTQKZbM4NowTmQ3goKpwBBq03nQDHbO3Swh4KR3j570ls55D
	Gm3j4S7/gSYlLKQj+2rq88DkO/EJSI10OYJPtLzHst8aZUYReAmlrz5bLcInIYL0hVFnhgOsdjg
	lPiKtMyROU7j8YyDRwXMtxgJIAH93u5WgusryQuCSeAUwHnHzDUzKeat94ed9rmBX4Qo8cEWIDK
	2rruFTXJxKCyNpCNmausOMkJQL/pekRQa0/5evoNruISG9o4QAOAau1gU7JS6UpbKCJc3oC4K2a
	VCz/i/tdEElNDvA4KYbCRB6Qmr1xcUU1jdSNjyie0mB7vdk8I66oSPoBg8HIkj/AMy/4eC5QhpD
	7Te2ANouq0Q==
X-Google-Smtp-Source: AGHT+IH3zGM8aQkwgRgqxqsr2Gb01x0ep4b9lMlsme1Wq2bd9nwc4TefVkU6ktdXTq5m7uP0nT1ATA==
X-Received: by 2002:a05:6512:3086:b0:549:8c36:592 with SMTP id 2adb3069b0e04-54990e2bf7cmr167965e87.5.1741290125064;
        Thu, 06 Mar 2025 11:42:05 -0800 (PST)
Received: from [192.168.2.145] (109-252-148-237.dynamic.spd-mgts.ru. [109.252.148.237])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5498ae46073sm266150e87.8.2025.03.06.11.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 11:42:03 -0800 (PST)
Message-ID: <04be5106-0d93-449c-b8a9-d8b3dc15ef24@gmail.com>
Date: Thu, 6 Mar 2025 22:42:01 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] memory: tegra: Add Tegra114 EMC driver
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250225143501.68966-1-clamor95@gmail.com>
 <20250225143501.68966-8-clamor95@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20250225143501.68966-8-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

25.02.2025 17:34, Svyatoslav Ryhel пишет:
> +	/* Read register to wait until programming has settled */
> +	readl(emc->regs + EMC_INTSTATUS);

Tegra4 TRM says this must be MC register and not EMC


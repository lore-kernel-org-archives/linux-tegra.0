Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE321350
	for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471776; cv=none; b=g1e7s41+56KBfm8RHFyAxi7mcNforhQ3/AfYjtgrg4EF72cQJrkMt5VdFUyXqwbtMtTFJfCsjTyY3ajzT5bAnlXc+EsQrjiI9nU5eSXAfeYN+GksRxrStvw9uWQfRYddfq7lwYxQxwWxUOWWp4CjKCtkgtE17bdP3eMM0PTZxV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471776; c=relaxed/simple;
	bh=IeT2TPtEZPvMX5IKSeDV5nHnc5zJT96g9TnP+aWgams=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kdxmhoaDk5aibiT1sWAWBUjtNc3Xpu988HE2GdsmZEiC6m9tob+XFDxev0oeluPWmvlFvAZ4VLOgdUsl1cxh77Hd3ds958Khz2Z8sEf2aIgEd8ab8cV2qazJyQm65sh7HOwr5Js6vBbrhcOQNmsi/BLd+vew7oVy7PjZ7Fj2wwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ0Qtvnu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ0Qtvnu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-364a39824baso5285045f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2024 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471773; x=1720076573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38Vd7xfZ2owTTRAHxnXDTAjI2lq7xxr9qat0ZWdPVu4=;
        b=dZ0Qtvnu55qLAFojVGqUdpDaVhimXeh+GRy0kWyx8uM3GJ8Uc0zRR3HziRBSVXEq0r
         Di9slQdX9PI3bg7ZS1eK2s2enef8RsrulWwn83myEk2AnCUMmcpr7yqQhSfn/nPJXAVW
         68QKftHVvgaElHWojQ+tZImwsEhZdz0lhrrRqT6ketfqNHcEtob2zZ2JaD9+DolNFJq9
         6twLQWeqgMSsgnTtXZl9dntEjHJE1c4Gd0hxVei149CLek5sv9duX6VtpmsyHiqUuWh/
         NAFRYpBt8NKuU8lEJWjxigDiT+B55sCnkRR91+jz5jGVQscwFZ7Yh8zgsy24xkZxHxhj
         uGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471773; x=1720076573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38Vd7xfZ2owTTRAHxnXDTAjI2lq7xxr9qat0ZWdPVu4=;
        b=pYYAEwgLapmbthJCUn+RMLywH/4WGWYHuE922N3iYvAhw8mr3TxaygJjExyA5BARMQ
         xWhYSdSpVOVjSZ2qj52s8aYD83/iJf/V6Z8BL8Bu62/khScI0da98cIVEze5x5p88dTZ
         +EExTjzScDXJ67jKxsZwUAushFRtUyJy2rc1r+Oj579tcRODHLtdH/Hzg9nO1kGpWhCm
         HUTM355L6jRNydl7lvpTVXGumpN7qW2+640YzOPTP4lnAV1pKUz5is2fi/kKv2CyOK7d
         3KWNDBLBCbTo6K4oktUO16xQujFDIB+vUi1Sr4XSSVGbK2jwaj0CZ4vW0OUqH1cefwoL
         EoBA==
X-Gm-Message-State: AOJu0YzxRa72YwE3Rtq488nP0kz+iKZzdIoPbbFj4iUrOx2neOAoV16u
	tENzWpP4ZnD9rD+nCfHGjj6i0u0p7zpVPEIahwBVmeH5VAuPOZx9
X-Google-Smtp-Source: AGHT+IGJLJFxVkcMtV/6dDgoAN2wW3/p0K02RZN4Tt+K0rw62TZZWuDiJm264hXMPKFvhdL/HULS5A==
X-Received: by 2002:a05:6000:2ab:b0:366:ec2c:8642 with SMTP id ffacd0b85a97d-366ec2c867dmr8734887f8f.10.1719471772387;
        Thu, 27 Jun 2024 00:02:52 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357fed2sm892450f8f.48.2024.06.27.00.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:02:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Petlozu Pravareshwar <petlozup@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] soc/tegra: pmc: Simplify resource lookup
Date: Thu, 27 Jun 2024 09:02:50 +0200
Message-ID: <171947176072.1318871.356700535390579663.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240611075603.65118-1-jonathanh@nvidia.com>
References: <20240611075603.65118-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 11 Jun 2024 08:56:03 +0100, Jon Hunter wrote:
> Commit 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence
> for PMC apertures") updated the resource lookup code in the PMC driver.
> Instead of calling platform_get_resource_byname() and
> devm_ioremap_resource() simplify the code by simply calling
> devm_platform_ioremap_resource_byname().
> 
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: Simplify resource lookup
      commit: cfcd6c46fec46cac3bf6658838d3ea329aff37aa

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80720219A60;
	Thu,  9 Jan 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430191; cv=none; b=uUq46onMbVTx8RCoSA01+g4CM2/Eb0R2Bd5fpI9cHyCluB08WWVzAMYopN3RYruyfwiH8NyRtSNtHAQ0DA4ogtHFBa95DP4C35dkzzrW0sJaTw6XBlsHNcGi0ZKq8LRvvLGn+G8DLW187TkxcKz+OeeZPcjgumQeyFOoL1ouSC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430191; c=relaxed/simple;
	bh=qsXjmTldC1lOk0TqnlV6CcboVdwzJbGjIspYm9HrvBg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITghsOdz8zTGzOk793BgILRdrxol75ygo4cTqw/ni3BxCFT1a/9XdsSggUbZu84zry1+VmGe1blARzsihj6NPfRfN1urOgjPvptQNyx9zlXvpURX0oNay3NsdHNMBKlowK4RIKHeX2Hs5Gmhw6cY+ByWocOQSQxnv6MXGrf5de8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSJJeeuy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSJJeeuy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283dedso9800175e9.3;
        Thu, 09 Jan 2025 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736430188; x=1737034988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts6kTToSRHx3L/xis8ds8aWGtIZw2XwGDERqXzKPIIA=;
        b=VSJJeeuyOz1BYpRFNBIoWCe9BqIi7879Mqm5lzS7tR76lGSywDlgJajMqGgt+6WdDh
         5MA0YQI014EtS6mS5bcpIkEqyIQ752jSQZsdAUXH+CY6bKIQM94ZfMHjXzI2yYGdxXfu
         ZK7L0DD56mW2LoHLCVcPWTSDB1NXDaRUbh3EJTb+9N8jYtPrkL/71sL/ROPTFR+khB16
         ZCLr+PIBovEtmu6hrYfMsNxt6cMkryWfrRaXS2GQ6X9FQ5B8cni4hrzl41Cj57I/96Nk
         ThuDN1PBfPszmBCyTtYd07TRiS6Myeg/nbkfrLX1TDBhCWFhn2IXhk52VbxPibHLcseG
         aYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430188; x=1737034988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ts6kTToSRHx3L/xis8ds8aWGtIZw2XwGDERqXzKPIIA=;
        b=EHB5SSP1RLqABjFl1K/013fa7dtRp+BaOtmnAFSwYvocSeUmFqdQWl/YWT01+CaY73
         NhSIXzpWQ1zWgNanrQevci9Dq9oTc5CN8gheeNFR6W+eCMx+jGbKU8PmCJbd700vkOrA
         BwcxSrPJLUpOvV1u1mYAegMbRHB/Qp4G4jTmbv18ub7My6HzNMW2dF91PNxQ44kCb/DU
         kciwDlpsSTHTWTJ7PteYd44Usyryy+LnqTOzuzYtG1XjNB78+16O4J5eyoWY+C77+XtL
         vDm3sti9Us5OcTqMYrRUq+bf3ndd2ZnkQNaLj0BNGb2J6GpMl3ionh283tvsctvX7mGm
         46eg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Nokn2ifT37gMVsziV2PmQwZHKrzhYVOkDLFQdNE4LR7Te1+zZ9yZoO6Z/cuLC/maJMGqfZyMo0tduME=@vger.kernel.org, AJvYcCXI+xKcE9he3aKPpA9LpCQXDHFlO5H/xchx0F7g8bEVpTBfPLtUH3VfMRdaTz63sMaKKrcsx9z6bzs5KQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiG7jNAJMnWbjEAvZ1WNDfqZ7JdB9qFQlY2fdxNCY2DjtC0zT
	bvf/gLpE4Fxix7TmMrmfoMoIKxM6grNFbnpFU0Tz5Up9HtenCjTD
X-Gm-Gg: ASbGncuKr8xshnM2hDSqETYYAEMfnCUJBbSgyH1lXXMgbm0wzfVJGqMDjXW7Ghv8zxI
	N8YeDdm+VRVod7fGKyxh1hdf4e7vBGSQ2kr0ugieL3s5lL1VS7wU34MlMEwECz0z+qhXUqL13KU
	z68QQHf6YgrKagraiW8kfWRS/I1rH5Wk0FRfSvNd5e4F92nY9qYoXw4hmSIBibTBR2wCKyNYzDg
	DQ3qlxA4CJtSaEe3OkxmajP+0oDJDhZt2qDy7UApCdpHrX3iY6QWCDUb+FxtYljJaH4+zLoiEpm
	xZYezdnmuDnwPW8ipoF/s0sW5orXzr00dHAIDWPwZrRKo00a
X-Google-Smtp-Source: AGHT+IEnZLafI5EQBICh50MzZn5sPfhyHkeO14Dk93vcXPSCB4jIgiEGIR6V//B5hax803w5+7qnoQ==
X-Received: by 2002:a05:600c:3544:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-436e26ae55bmr60396405e9.4.1736430187603;
        Thu, 09 Jan 2025 05:43:07 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm56337165e9.2.2025.01.09.05.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:43:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: tegra: cbb: Drop unnecessary debugfs error handling
Date: Thu,  9 Jan 2025 14:43:05 +0100
Message-ID: <173643014777.2614613.8206840332572954978.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104141958.115911-1-krzysztof.kozlowski@linaro.org>
References: <20250104141958.115911-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 04 Jan 2025 15:19:58 +0100, Krzysztof Kozlowski wrote:
> Kernel coding style expects all drivers to ignore debugfs errors.
> Partially because it is purely for debugging, not for important user
> interfaces.  Simplify the code by dropping unnecessary probe failuring
> and error message on debugfs failures, which also fixes incorrect usage
> IS_ERR_OR_NULL() and Smatch warning:
> 
>   drivers/soc/tegra/cbb/tegra-cbb.c:80 tegra_cbb_err_debugfs_init() warn: passing zero to 'PTR_ERR'
> 
> [...]

Applied, thanks!

[1/1] soc: tegra: cbb: Drop unnecessary debugfs error handling
      commit: 74d4d7c64d89aaf3e08aa06a6967dbc540b72c06

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

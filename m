Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894C1519B4
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760315022; cv=none; b=g/bNSnpDUZ47v9K8MruOgBKMKExd3MZO0vap5J3KVL/jqFMfuQj+BO9X/V3ZpL8Tyo+aPB9Ti4DJhoO1CSsTZ8xkAN7jBODlGxG3iuSKg2toBjJ/zbmd5hOUX5Ww5IzQ4NomlNU89Y8xk1PygpetVNzFfc5MwL5VJF7J6qPnwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760315022; c=relaxed/simple;
	bh=a5RwFLO0o9BBCKHa/xHutaciS3/pYIetjEk6CL5xcIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IdOHF5BUwYiqzhcu+9IzDhRIKNdIGiyGInqkmoavmFsZ/k2WuWt2pIgZZyXf7vf34AvLqvbWEfuGRu7rUBquswsevwRhLt6GCxAfw9i1cEMT0/DxZAMHMMOGQ7cqWWs15Sjr7aH/ug76Kpt+F32l7QZyoXL6ew19ao5W8R+f8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHvkMy0H; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHvkMy0H"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-269ba651d06so5754785ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315020; x=1760919820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKqus6TNCmFF/5x9N32QOMKyU8zghS5JwdNBvL267Es=;
        b=hHvkMy0Hoeiy5OmqXer7bSMTtL0VgfxvfLYaeJEQQb+bu2FWKdBEE25/j70IXs3VyQ
         dd9moJPdfyKipv5LehHrJswI/w1LZFowCvd/Cv/mptz8wk/cpDIWvYEt33KOzlApO0B0
         tcAnbxapNYndh6a0ECMRfTqwOV+mZvUq9+/i/iKyOvSqaMLWjIMmLmCtWwj03bIH1Llq
         2Kf0S+8o7JMyOvmUedMVyOyRsUq6CC18R3epH4Gdn++hNfrtltAlnJuJb7t/SOCtIHzN
         vMd65PE4PTBd2s6yL1FEKHEk0Zq7c8rDlaRdLtGSyfItZS/XcbVFrVMI/U+M5XzQxSJC
         +Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315020; x=1760919820;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKqus6TNCmFF/5x9N32QOMKyU8zghS5JwdNBvL267Es=;
        b=QGpT8ERgMX/PXxTb/KWJyDGludEHvGex1y3IyimSKYYLqZpXEen/EejmSAexeih2Gl
         ezay2FlfxXE7apDfko/DajzxsRZJQiWVFbkfUFLrpzzR6psHcJaxXdwoITYuReoDo4FY
         vIUvoR4jSx2MoTIApUi8u026xaMAlOXw0j8gX/OuWh50S1fbYZ+qpnWyV/tVV8CsJ3ck
         wQdL/m6mrmKMhbfS+ua2walbgrxSwVANWz5Ob+t1LgpLKUwF3odIvbkz3m6Z8XZo4J4L
         kp6QoLU35SDnOnVjJUtPTVomsQjGSUnj/4D6dyuvm9ax8RBvzh5SvoJwWtPKikRcehnt
         EoGg==
X-Forwarded-Encrypted: i=1; AJvYcCWMe4LLJC8mAgjrYFEMKXmhKfcvCcVyCJwF0Z0a1o5qJuaxp9LiY4EgbHvtZxStUeNoNZRZvx0erBO7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyETTLQc77RT9YSXnOPPiIIIiiESpMHqmphsgZmZnz34YJwLdtb
	2hr7rtRJ+dWpxCp6BDwi55gIDVHS4gItN9OBhCOiF2kMWmxuibNbgqKtDuNHXyNRMVVNWU2U75n
	/pXJlX1U=
X-Gm-Gg: ASbGncvWAcasI4uLJUZx+EFmUtLRKXkVv0LVIfIC47CEOceats4uNGURiQHL/D6tBVM
	X5fcScesTGU8EfkBivFmU2sx72o4pVzTFXe7j7hFRKrQrVRmxu7HUej0hA0ykm+OV9OQR4/cU6r
	iFONym4xJLG0YdMeN1SgzGweSWLdVt+OKI41GH8AjzneVk2ZveOrHm2p4UJlW/SbvvGW3P5KFou
	Pq9PTpfB6EIJwA866kvlDsuEduvAr5U9fpDQ1kOj/Ajkf1pvHe1CGCkoNLzzUmma6rndLvca8dS
	pRVOhB4VHYnDspIWXZifkqVnJDL6Z1obj1BIJReryIuSlKKbngmkbeNXwebuUokokv67JSbr5T4
	GoK5Jb7+jtu5qppAsrU2FXXNMN4Q1g3jtuRe/0tctDYrzTrOunvwnou7/vRRBo4MMKW3hp1A=
X-Google-Smtp-Source: AGHT+IEwhnyMgQZCD5nHRbinCVe18U8JEIiuV4xUcpNlnYoVb8AqvlfFcy82JBbvm2Dk4975Tv36Mw==
X-Received: by 2002:a17:902:f68c:b0:267:c4fa:e269 with SMTP id d9443c01a7336-290273c4cb6mr137398585ad.1.1760315019880;
        Sun, 12 Oct 2025 17:23:39 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07d51sm115557775ad.69.2025.10.12.17.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:23:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
Subject: Re: [PATCH v2 00/13] memory: tegra: Several cleanups
Message-Id: <176031501653.10491.5665652686495806453.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:23:36 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 11 Sep 2025 11:43:11 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix commit msg copy-paste in the last commits - proper number for
>   "tegraXXX_emc".
> - Link to v1: https://lore.kernel.org/r/20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org
> 
> Few cleanups for Tegra MC/EMC drivers:
> Deferred probe, few simplifyings and function name unification.
> 
> [...]

Applied, thanks!

[01/13] memory: tegra124-emc: Simplify return of emc_init()
        https://git.kernel.org/krzk/linux-mem-ctrl/c/da722f1c9d605dffaabe2526e3e4cae3ff53401d
[02/13] memory: tegra124-emc: Do not print error on icc_node_create() failure
        https://git.kernel.org/krzk/linux-mem-ctrl/c/1c9cce8a0e0bd4f383a04655bd3a4f650fc1f20f
[03/13] memory: tegra186-emc: Do not print error on icc_node_create() failure
        https://git.kernel.org/krzk/linux-mem-ctrl/c/515498a3f58485321a1fa03b4eb5e6208a816e06
[04/13] memory: tegra20-emc: Do not print error on icc_node_create() failure
        https://git.kernel.org/krzk/linux-mem-ctrl/c/e215d91d66a2c8c7ed8524ce6b261340149c10f0
[05/13] memory: tegra30-emc: Do not print error on icc_node_create() failure
        https://git.kernel.org/krzk/linux-mem-ctrl/c/c0ca941c93527a9e96f3ba58c0970cdf94670203
[06/13] memory: tegra30-emc: Simplify and handle deferred probe with dev_err_probe()
        https://git.kernel.org/krzk/linux-mem-ctrl/c/db2bd7ab1ae8c1f32a553b6eb36d6fecea41aab5
[07/13] memory: tegra20-emc: Simplify and handle deferred probe with dev_err_probe()
        https://git.kernel.org/krzk/linux-mem-ctrl/c/57c9f6e29ccd44db882b943df2e72a4e54ebe0e3
[08/13] memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()
        https://git.kernel.org/krzk/linux-mem-ctrl/c/a52ddb98a674b01b6b5f2da1ed70a9f30d539f6b
[09/13] memory: tegra124-emc: Simplify and handle deferred probe with dev_err_probe()
        https://git.kernel.org/krzk/linux-mem-ctrl/c/f398631b769c43fd3c575ad6270bb0109a04b85a
[10/13] memory: tegra124-emc: Add the SoC model prefix to functions
        https://git.kernel.org/krzk/linux-mem-ctrl/c/e6e50496b7e77613ed5b610877f34e1197ce62da
[11/13] memory: tegra186-emc: Add the SoC model prefix to functions
        https://git.kernel.org/krzk/linux-mem-ctrl/c/4ebcacbb4447cd3b05289e1e0e199a5e8ea0c6de
[12/13] memory: tegra20-emc: Add the SoC model prefix to functions
        https://git.kernel.org/krzk/linux-mem-ctrl/c/5c8c19417c9777aba1bc9a1d93c95edec48d8b19
[13/13] memory: tegra30-emc: Add the SoC model prefix to functions
        https://git.kernel.org/krzk/linux-mem-ctrl/c/50c833c5cd9450c8c67d32883ea290dcbd633ea0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


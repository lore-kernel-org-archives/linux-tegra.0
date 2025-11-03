Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE526E6FE
	for <linux-tegra@vger.kernel.org>; Mon,  3 Nov 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762178042; cv=none; b=FzHSSSkFSIoYqpeGIH6R+YYkqQFz/C3TUdfSvRzixWBNKHFxZoDEYdU5dKhZAFfWmoCLrBtQimjQZMRD6Mc7lTYd62ulL9BcNyGsGm1hFMzjCjVuLzVimBMSD7M3Uxvk1C7PtM51c5nKY7aEBbqoYIvOdLtkXy+l6cN4XRYvyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762178042; c=relaxed/simple;
	bh=x724Nb6nEhXoOjmexUcOrQsHjcK7h+Y8uel8EraJB8g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XTQmw1Nz58V332CEu62oDD7Zx740HjACg+9MmDOxl1hw4Xt0lf9VFa4bczdM3IJvCKHSMl7NZeL8fJ0Wob4hkIJ/w9gTb/BdRFeHzbB9tsEayrD92lmBs+AX8zhea4aSawp61hTzvR54iihlm+QlYZWg8vbwWYhpvOBPj7jci3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPqd5QE4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPqd5QE4"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64094a79237so377107a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Nov 2025 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762178038; x=1762782838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRIRnwbdNF9ZjW9ua81MwxcmBt6wB2lb2Cyijxdbhus=;
        b=iPqd5QE4mq14LJgY4v31xvAVDaF1T7r6KYZ77ifbKEB+j6lYWUziB6UmvwZ9IqjphH
         M4YXl4Iit2TUMRnIxQLFYqXUHRUMAL+B+YqaMJX6kNaEO72eKAxfx/MDHv48GaQ6ByMr
         /kHTTszrV4mwUb5/bljlztQ3tun3FOZxBELiJgR4VYLczcGpgU1ZdUyAlIsXl2iJLdId
         fpuJUzXEZRrpULxx1Zgtuhaf1wbjeoUufxeLPxRSUNVBkpCx02mRcejGrw93AKL/PH9m
         3QRXnMig2ngk5uRrAXkeQUlQSsR6J9EGWJQ6XT6qy82ATdj+ojJCD/gS5Jvv+5cptFm4
         I2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762178038; x=1762782838;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRIRnwbdNF9ZjW9ua81MwxcmBt6wB2lb2Cyijxdbhus=;
        b=N0TLFuDAKz/VMNEyQiCqVYJYGhWb2BAOr7vTyIGtpGRAMFWtTLdkX9MBOLIg5v0nXa
         ImnDe0QBPEa9u+PHx1PszM6g5gdIhk4/xqZpecHFbQAUDlG5TEy4+/oTmlKVVem87swz
         c+uahLFvpP5g55kkRqwso84BOUKhPggboJP7cTt7PONFZvXFlOScXA1Ny1nDoycduwd7
         fUzvGA5jZ5I5Res5uUx5zupdXpr7pFAXSv8s+YgMFruYrny4znpAsseM3ln6OxV4MDbW
         pE1kNf7eUjKNDh6UyVLg5rKKSXBXYXhookUg7IijNUkXfJdTV3Nh4uu8IR8P4DmTeLTa
         GXgw==
X-Forwarded-Encrypted: i=1; AJvYcCWwgv1U5gxp2YBHL/r3oZ/bAy7y6+XCdA9mgiU7g3CrAmkDtE2mbdykyGI8RduUwM5Fn+cTGUU/+h25RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQiCSni5YRkGlSUj7FXdNmi0RASeZaXu3igaRBz35vWi3spD2C
	OMXpI5h5rda5mQLEbX7v6LYGcePRhHtrNTpWTjC4HkI+Z+acMp5kXTfS9aUBx68oQeU=
X-Gm-Gg: ASbGnctFUlMs+b5xBFocr97mg6szRnHZGWJzkE/98pbexXDoXBgbGRGJAF3w1S4qrgu
	HSX1ahu9mZAxAdv54dlt8nAmsiKlRpY1mFCd94RCUSrJmd7B4m+o5k1A9PZBJDzt+qUi8V8AAco
	hzsBe4H4MTz1jxVasc0uYIxC/xKCx9MxTZF5ziiorgxxDmqUYkJ0tF2TmCyncuzQfg8pRjMXKpo
	Xet/n//Lp5TgMCCoMfqDWFnFF94oMu1GVp1oDZ10oLR3TM904mtBdX7w31hX6+s9MC6NqaMtNYT
	tTFp9aXPjfctjwi66A009tTjumAf5OQHPlbTP7PZE127z9FAwW3yZiqivfyPVOexeFDQGm5UAxD
	LDvrLSK7qrZeBiksRWKRjm0FevqgBrORsD7+YmDcpn2aASSSq5eZ/uJm01vB8CA4DWEUpFMBvXI
	e7GD2UfRJgCtiLHGAr
X-Google-Smtp-Source: AGHT+IGcohw3g6w8go43Dqq6WKUdsdhcXNK2fPK/3nXDm7ojzpory2cMU7iQJC5/TBRgrekfuFJPKw==
X-Received: by 2002:a17:907:3e03:b0:b42:1324:797b with SMTP id a640c23a62f3a-b70708ea28bmr670598166b.9.1762178037820;
        Mon, 03 Nov 2025 05:53:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70bb3f336csm392100966b.6.2025.11.03.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:53:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
References: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
Message-Id: <176217803519.188953.12459486939589625513.b4-ty@linaro.org>
Date: Mon, 03 Nov 2025 14:53:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 27 Oct 2025 12:48:18 -0500, Aaron Kling wrote:
> This makes mc and emc interconnect providers and allows for dynamic
> memory clock scaling.
> 
> 

Applied, thanks!

[1/1] memory: tegra210: Support interconnect framework
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b33c93babeadd04a7b1d77c3e58243f413bf2948

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


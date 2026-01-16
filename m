Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9964A1EB5C2
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566566; cv=none; b=UQF3BcyXUfzlRe2ZLyPe/sjmiqTL8Eye7rnWK7EeWFfo0GQhhzrzlPbXiaXW7UQLeGHuXz+D58eVAT8a5AKJujPEsxDf++xhosG9o7HcvKTP9og6UQ/cbx6cAIzWIIadh5jw39GYw893SPl0eHUZyxETnRsi6/cdVgEsbkfjTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566566; c=relaxed/simple;
	bh=W1pZWOxlRlkzEuWI+e1xN01zktHHreQ7/laP51tm0eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yv8iQhSuaz8FmhexxcAsmyG/h0qSqY+vhmXZvB8R2LhG9cMRfrJSMd9hRrXHATl23ldKUg1cS7bWEhEwYSJ4EbZiTPQBFENBRdaste3bsDOqXwIj1e+I7JBqgr+q96egwqlfpMJ3kmnWGnazK3FzabdqUFa5F4kh20d9uui8P4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6721NLu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6721NLu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so8032375e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768566562; x=1769171362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hK4wVaEyQpuYFoDlRuWKw7EwWqpbvxTZB3Pzyw6EZe4=;
        b=Q6721NLuAYa0Yx9xfKZlionzxLFeGWDEct6FPR0QeIMca0LjlDLAQiiYgNvAoPEpiA
         251ApUD1B9KYQLAvpqlxPsT4EmXoRqJSM4on4+MfWNuiC4MuzmqL5r++l3fvAkXuOIju
         RmKjQ4HNTjNV5muvR1y6OOdhFo5Cr22opSX7KipK74czil7bOY9jE9RAfY5Y07KnM0bF
         yml2do7Q+fv7Jml/qHaOkWaCk28poYMGRPSDfXVSmvnPt6dVB8ilBCtvFNf8Bdbz5XGs
         Nov0yK2nTwcW64/aJfkn67LvWcJrr1Qsqg8mzXI2rGqOCCtNHcVFfeRPiXzRsTS7pxJK
         T6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768566562; x=1769171362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hK4wVaEyQpuYFoDlRuWKw7EwWqpbvxTZB3Pzyw6EZe4=;
        b=JYRvOLjWSfcr67+iWhBdiiL/gf3UeBgCcvOlymr0sZF9He8Oux9aov5gmm57gktYCD
         iR1n4TnDePm018ZqxGtAURrKMEgKzEAA81/8alq676pxoJiqsRS0+AbTJIzDKqxV85QR
         khe97UX03tYiLtDxQv790fk529gYPTSVFuA6zTlCj/B6z5/hMhNWuCgLibUqGcTf53us
         b/IPFdTQjTl9g4SCGyXyGVmOtl9hNHRHSBt4229EVkUHE2WDArR0IfdNbRHnh+FmoSp7
         MJmUNWSVkOViUPonQeBs1rD2mZBaVQgVrwLgq6ZPq4upUqLGgqGkF1/jf43Fu+SjEvzD
         UOQA==
X-Forwarded-Encrypted: i=1; AJvYcCUyMLveQ3UbkUo32Rw9Zj2mEZv6yC+Q/yKmkKuwcsDKkGWClxycXwqZwRLDsA6cWWzvr1Fn/fAbXfbs9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ZJNg70K8m8o0DHjgj2ZxcN/o9UIslEsC3DAn9ShjLGNYF8vt
	f9DqHTzI+Z0zzd6u6a3i3NrnjcMi6R8VGSQMId+qc+Z0Sz75y501JfdT
X-Gm-Gg: AY/fxX6BZtu8fT9ExMmHt+RudZXSebe66umGtkwblNuOLKwlSLAyfMJw0A6vUn6/w8S
	BKYJafTF68mc+ecigbRU5Ansr67V2qP4fBO0SUYU7ssz2wXdLpS3JI9Qn1eUR4zGFyN/gIuV+oP
	sKdtaQxrLmt6rcpQvbaOuttgoHtYJhDtRlYFgmixegQbB/LQtzDW6Q/v/WbMoo1UqxF3PHor6UL
	08xOei6LAxqjlRHRfT3Mg9mcwkXoBqh0KuKNVGkucG6mFLvsnjQoMSMkfKvRKGqginHQr+/b2iw
	EXZDPxhDtFifFOAPJEdgs/LuaCmDH3kjVox00P2RTXn9R87DY331ej6C5ZfEDmPRi9w5r5Bp9dS
	Gsoj5Ec1ExUQc6b6XV0IFz4cYDMvrEAc8DfoS2NABOU2KQpoIeBubCxhPWhx8FBRzZjzlpzD+dg
	H9HNTo+8DKxFYCdi48+Kgw5EfQgBvF1SBzrOQufIEBhSNwM+8WIu+AnexYrmt4+3GQVMgRHW4J5
	HOTS1/ycrrVXAms4w==
X-Received: by 2002:a05:600c:4748:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4801eb10a4amr31763535e9.27.1768566562111;
        Fri, 16 Jan 2026 04:29:22 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm5095532f8f.3.2026.01.16.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:29:21 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: tegra: Add DBB clock to EMC on Tegra264
Date: Fri, 16 Jan 2026 13:29:19 +0100
Message-ID: <176856655186.139432.6919318227218814446.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251105195342.2705855-1-thierry.reding@gmail.com>
References: <20251105195342.2705855-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 05 Nov 2025 20:53:39 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> Tegra264 requires the DBB clock to be enabled anytime an IP block needs
> to access external memory. The external memory controller is the right
> place to put this logic. This short series of patches adds the DBB clock
> to the bindings, adds code to the driver to use that clock and finally
> passes the clock into the EMC so that it can be used.
> 
> [...]

Applied, thanks!

[3/3] arm64: tegra: Add DBB clock to EMC on Tegra264
      commit: 07fda289af91768ade466f9360ca474d73418dd3

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

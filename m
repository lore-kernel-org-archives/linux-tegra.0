Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452613D52E
	for <linux-tegra@vger.kernel.org>; Sat, 21 Sep 2024 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726952107; cv=none; b=q5qc17Dq2FurQKL/pt/mX/3ThmG/Dk5Fn/y4pbctVYEqql/i7mno4305Chkp2HIZus4iHMh8i5OhJwtFDhkjDOFBELDz3CL2bSBTuyf3ceIfU51Au4OFQKUxeaBcSyzlqVynLLKg1iotgywTsXk7YXLJshgPHGSQVlN2pfwRKpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726952107; c=relaxed/simple;
	bh=zCqpoS5w4f1xCshb9HIsD+o5plreKKm3k8RGLBVK15c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCyS+sYh4P7fphE9/OQ3NfULZE87X3qDw0PYkEpoCo7KZPv04pIYhmPzlxRQ1U4zqNHZut3OuS9H8cyCoKbIgS5gv5Am5zWxiSwwHg5/VeghxMOa1QMyLeWuw0+MauKJ3m7ZH8Xb7oe7Zxk++y1ILqJ03edXRZ0SLmLxNjfRuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxpVQvgO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxpVQvgO"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso31388611fa.1
        for <linux-tegra@vger.kernel.org>; Sat, 21 Sep 2024 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726952104; x=1727556904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bTCsBF5k6hiXd0BD7pAzfGo+bzmLOlGAZbycow2IC0=;
        b=cxpVQvgOnB9RYQhW9bksqm+HgslffbiariyRDN2827fPUA/gYm1P/3JbCzNa6LSmGV
         1LVJSz/y7wLgEAHvsadmRhRMT38LeBt9R61RRVtiwHHzHeZujmRneFgsQOnnUeDVWLNo
         7A5/+kz+sFKEqvAnrsOHCB6XPcIqSOQ+hKbRXmp7t7+GfkMUIRSDlChk+Nan+IRoACGI
         NXCeMoubInwDFPDqeZt2EoYHBudBSQDA4u9NAgN68URmZ2uYmJXKexfd5k7K9QJSHCrV
         RSdTmQ2MnTjXIGnoMiwzu9uuKl8SLI3AIQ3ZYwxQBPT/ywA/H8hywmuRWTVRHYgRJLeq
         vFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726952104; x=1727556904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bTCsBF5k6hiXd0BD7pAzfGo+bzmLOlGAZbycow2IC0=;
        b=JpcmYxQ14i18k1AwuNROCLe4S3KsErPuaEkPw8Zy9hNu5IEEeGLlLg1bRDiAOErmKt
         afleNf3cJwFglvx9uJY+MZuLCTua2iTFoLTtS5W3R/qb5orLvDI7APmtysqeNXQVxsv7
         n+M818FNadHgC2VVk/kTNvK1gswaTox6WSz/buBxMyn1IAr0QmbpEFJGVFEZ0K2ujMZr
         OcGNWub6Osf0wLFdb7kr2OVZu7WgFPb+dd/+M5mOXy3qGPUUnJ1GWxZ9jzGGjzSJprNp
         K0xSbb4X90r/QrJx2bZrSd310YHD+AST/xmtQHg/i8wLwlrFHAPav3ohBypPgjgSXe4Y
         wzYw==
X-Forwarded-Encrypted: i=1; AJvYcCXL3VIKitWPene7wI4AX41ilfaT0ZKfGslyEHmzLIkuIb4bZWxw9j0Xyqn2I89QHJihoUK6oswhrNmltg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xdT3K0JlHdacJehtRZPoNChaz6xmiMAP7QOdSCP/ye/bdHwD
	cZ6+d7k471KEvCBAfQPu94+yLxQQr8eoEeOVy2dWr57GmVX3h1jtM0ahkQFr9F8=
X-Google-Smtp-Source: AGHT+IGkE/CDmDZd8a6qDrSxzq4ke5KBxWqmH8ZKD8+ZcMk8xb1LBGvp0UT4UVMQ7i9Mrzn6JJ+Flw==
X-Received: by 2002:a2e:9dc9:0:b0:2f7:5519:7130 with SMTP id 38308e7fff4ca-2f7cb360708mr28339491fa.31.1726952103966;
        Sat, 21 Sep 2024 13:55:03 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d37f6besm23986731fa.94.2024.09.21.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 13:55:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: laurentiu.palcu@oss.nxp.com,
	l.stach@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	robdclark@gmail.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	quic_abhinavk@quicinc.com,
	marijn.suijten@somainline.org,
	thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	agx@sigxcpu.org,
	gregkh@linuxfoundation.org,
	jordan@cosmicpenguin.net,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH v2 0/5] drm: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Sat, 21 Sep 2024 23:55:00 +0300
Message-ID: <172695208396.1339964.10365625478619096144.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912083020.3720233-1-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Sep 2024 16:30:15 +0800, Jinjie Ruan wrote:
> As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
> said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
> between request_irq() and disable_irq(), interrupts can still come.
> 
> IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
> the automatic enabling of the requested interrupt in the same
> safe way. With that the usage can be simplified and corrected.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/imx: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 1af01e14db7e0b45ae502d822776a58c86688763
[2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 4380f8624b8bff3637476726351ed7bb8850188a
[3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 40004709a3d3b07041a473a163ca911ef04ab8bd

Best regards,
-- 
With best wishes
Dmitry


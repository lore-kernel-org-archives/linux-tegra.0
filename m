Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFC218837;
	Thu,  9 Jan 2025 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428731; cv=none; b=FOdnMeVt0BZNe/uvJ6lbPKlplXKN264w+JB+SzrqIwTLgBpv37TC5uQ6NtXvX6V9JgjjnLAfggK8/0bUFlIprxA6Gy/2SbVrD3ikUkuvtLCuDj4qf1p046F2j7TOPs6+putjeypJCorAP8a7GfhinEe6IDTIFZEGTP32qDdB7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428731; c=relaxed/simple;
	bh=v/kw0jIJLiQuz8n2NHFlIyyvmguTEp6kiWKMCyvjSCQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdIaoolHsTTI9F5iahsQRKtsO/3hPysnqZNtHt/z9+xaj/RwNOVyZMG+vFaNM2YlkUPCxVGM6jOozgmjehZvuzdtQ93IRGkFy0xfi64t31oeCr7YEwRV3hTK7XkVE/vkUaRPMAfr8b8mc7RENYOjgvLRDwuJ44D/IDckNu7Dd/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/z3xCs6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/z3xCs6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283d48so7415425e9.1;
        Thu, 09 Jan 2025 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736428727; x=1737033527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZotozH3x5iN2YozEWujn4mUiYgBsiZjsZYAEYfPiEno=;
        b=B/z3xCs6+29qR/7LsVChmXyBYfIPCK8BRsHmzcD1AK81Y6qQvSeEKL2OgIwWucPlxx
         WxaNf+DLBYCuDpB07Uhnd3OcnOKpMcpTfjvcuWegd5LzKpkk0uzhp69AUJJzZ6qC1vVr
         eeXxZbo9tfjtJYnq07jEhzhYHN0W4b9OtWROkG7GHrHbTSoAegu2oC0jG+T7ybOcn92R
         UYXpQQzVVUzIjRtcD1DumL7oDWlqHQZapozFmbAuz0xqcxHJnFI/5o0G+OvwtZrxfPNi
         quz7OERvXCk3rnBEx8NU5DKKWWNdmyNXJW76k5je+DdYNBhF/t+JC/dBq641h4lMm5lc
         MPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428727; x=1737033527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZotozH3x5iN2YozEWujn4mUiYgBsiZjsZYAEYfPiEno=;
        b=sh8f4r5oaeGVjA4cXNlz5rjBN/5D7lUFCf/y2Em6CMMnRqPYZJYCwopEPpT3nUaKVx
         cXuMCbkC6/6fwyIBeJYA6wd1wl9D3xAExfwTd+Nozo9g2jpNRXDgjQmZrT7qGNcpXqFe
         16fiBPc8lgw3czua/ULBTxflXCVBWUh+ChdS1W12grSIrgDNklmQAuLYYDtg7Q9WbB/m
         qirQLGna/xp3CDCFhqKGxrmpxEjleS2Ke032kB4M2G9QSvc8/Kdpwhh1oGq0nes+hzso
         ccA60PtjMRJKQKbozylM82w9ld4eyNZocEsANxHouolGLzGX66YQp7ZwYm88GEINEd2m
         9AXw==
X-Forwarded-Encrypted: i=1; AJvYcCUSlm16VMTeiJ5ilZfS43NQM/OX7xNmeoo1h42XTcGQNqsigtuVQ+MtYhQSRHQXHXaWUS2K5T1xOumS8Yc=@vger.kernel.org, AJvYcCUeVBGDG4WXWKf2wPPJBeqdH28VKJ7mwMKFE1rpzZ7grkIk2+m6PEmgr+dXHtMXuOyDWpG9DqL8Y87tKQcb@vger.kernel.org, AJvYcCXeGsHbqu0HFSMTbwLse5AiHNyeCb0FPmcQ9KRfMo4dExwGMKQ0nCpH716LMuyzyQTQo5s2vNtOoGqj@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGVkuJvNnzONTVEK1G48CqUhSLyF/I+eKIZ+3msd8ZbR2bhnz
	OBLHXvbQJ/RwMZO3pafp/2NC/6AghSalo1xFHhdJeKdO6iE1q7RN
X-Gm-Gg: ASbGncs/RytLWLvz4hdjMGMuNIc/hutudztMU5zZPOSANPEw5IIeolfriEZtmRmg0So
	FJ0ZpJJsPjrAoC7FZ0bDpy9qCwUFBnVpBoCyoC/bpqsprF78f6JRgCQRFj1Qn5YRDokqDxitxRl
	dwmFrTAot7pAGUQAd8xLOJMX1t7/yVBOuhciW8MZys79KhGAyXHzHQpvQms0L5Pr9SghsPSmrYU
	JttoiHchd5Bw+ts0wPlbrGPTjIXQrahIUDszei7qLEgNb6AGobJsY7uKBmAxia/VJUApXwPPKcA
	HOmMoFxQRpuZv8xfDoTpJryZm/OSdMsR+me6jKG/WlztKzoE
X-Google-Smtp-Source: AGHT+IG3IM8q9kDj8xncA0MUzh9qXJjqrx1uUUIhMmPj3pKbDo/sVTa+pfWq8HYYl/fFEJmnimv2uQ==
X-Received: by 2002:a05:600c:1384:b0:434:f2bf:1708 with SMTP id 5b1f17b1804b1-436e267822amr59066005e9.7.1736428727248;
        Thu, 09 Jan 2025 05:18:47 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc14ebsm54559395e9.17.2025.01.09.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:18:46 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	thierry.reding@gmail.com,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Fix DMA ID for SPI2
Date: Thu,  9 Jan 2025 14:18:39 +0100
Message-ID: <173642870286.2612387.17014914286506205755.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206105201.53596-1-akhilrajeev@nvidia.com>
References: <20241206105201.53596-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 06 Dec 2024 16:22:00 +0530, Akhil R wrote:
> DMA ID for SPI2 is '16'. Update the incorrect value in the devicetree.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Fix DMA ID for SPI2
      commit: 346bf459db26325c09ed841fdfd6678de1b1cb3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E7218AA5;
	Thu,  9 Jan 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428732; cv=none; b=XA0S9SRIuLyRSWQXtMOZ3HqSYtTXT23rQQO0QkCjJ4uenxEg7LFxZe6KNRNfo239IhWZEsjCiVLNiD8xvJlZQLHrwnLWl8CT7AOT9ElEY/dFUIelDPai8xZRN8GuddEmIeSG49eZVNZibT8xhgBG2F0UiRyb/VqrooJX4Vnr/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428732; c=relaxed/simple;
	bh=aaAdhIzKA78xC2paqwvEjCJViZA9UpaWCJZgCILa4dU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqH8Ge9EI8eoHs5fLrjKbwVAuMyUYd87b5VszbaGzW8xyvLoH0V9L1eF1clgUynxngjWAigHH8QpTaLfoHYP3pOAa1n4ykxd5OJmqpxC6FhgLKuE0LcSEg3Ll9WxbNySN8RxgZjPK0POCnUIofNJJfiYuPzmV2Vm+sofBxK8Zhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXiPYGIx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXiPYGIx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso7209675e9.0;
        Thu, 09 Jan 2025 05:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736428729; x=1737033529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geH8zqs5UHg7Rn3R0KPP4iOdZUnnE1Hnpb/c3/QF4ZY=;
        b=nXiPYGIxqbTCS4nR29Mn4OZpxaX1Vnl4+FlS3ysRPOz57vmtZDiGXEyjV8jEKL0lhB
         /vVQye4h18CH/u8/4O/JbWN+/SKFc1/yXbQIqHPjS61BzugnvNKdI66+gzRPKe9bWMk5
         aDGgwXftsiVUEkEFAzoM+dXqUqutshYPhdxbF054096G/yBjbfp6YtrtH3ElG3/zY5zw
         nKMIWUkICLo7p/BCTtY+GPsgEyQHrToxMARkJU40PuFvUUKPa/2Wdm03TznAqTw4vzUy
         Yl0chBhDQuV2QOXa0rSqVkO8SARXKLrYz3xQ/lWBInz+D65a6PB5y5meb6t08ApeCkQY
         /ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428729; x=1737033529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geH8zqs5UHg7Rn3R0KPP4iOdZUnnE1Hnpb/c3/QF4ZY=;
        b=eyZyqK3xSyWC+gQqfWusI/SgYKFsk+bKJz46Kseg/Tjdp796aSfIcJSonruPB+t9fl
         d1OhySiNEtTYGG7gLlS26yA9VvnK1LAq2DM71NSmGHThjcCKKZocAxkiruzpAMyO3fn3
         BFkcps4/LnF56Z/pfvlst13DJhifgN2eEmHRFkP/DtUHk/St4aU4lQMZDsYiChkE8w0H
         WYkp8+RMn4+SNFiaO59yNDhvsgPLQRTF9xX8K4ceTUs9UkwqhHjJmZxzOz1mOuOmCe9n
         yoXCvcUqo97EYlxa1STIYqQxP5nbZ9iBYx8RQADTExB3cqTVGLRS34i0Z/1KyrIeReKC
         R0mg==
X-Forwarded-Encrypted: i=1; AJvYcCUWAzepkeR/MmoQ5JuqiOuXh9HdTedcUEiFEWTwsfyCT3lXtMBMtpu8k98KuGV8loTm/xS6nzaDygNp@vger.kernel.org, AJvYcCUwBYQThr6HKEOqdHrgG38aZEkLPw+fihZ2L3XhBrSDcqxsz5ho8vjiuSju27vWO7MNnSY1LI229Dr5axs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwBQuFPNk3dLH8fE2pYWV79o4dUVSEp6N1FdqKMCnV5n/KPeZ
	62QxOqKWD8U7guCy950X3okH9Gp17laF2QJXL628uUcSQL2XNSRD
X-Gm-Gg: ASbGncvXXFAiN8CzfQj0QnuP2R93OHCTmxua9HNdP9LIQvyCzR6QZWo745FB7T5m5kE
	raGeGcOQPfFDRV+vDPtAVL+G+JOu3pki5VdjdH3GqvxwR8PuzJIrP6+zYvzjLMAQ+FsCxUfmXCh
	uXCXI0SkX3T72y9s8ZZMQUr9CJeecdGp7pL5vSwM7eNMSfCD5GdH+0zHddHUpFIQea7PIpwtAOT
	Mf6mypIsYLUQypNBz8AgtKtDAIPhr/qUUpfJs1TYTvpwo6IEvw66toSDWrgO+RZ4CnjNlnNGpJh
	sB5LV0k3PG03zFIWWvEzAxI9cNekdKM5Mf3dZlDttGp3Hi8E
X-Google-Smtp-Source: AGHT+IHMOuDwHD6Wb10sgnNvXodwERFLU4HYJAJJ+5x54X5pGiI+63vCh/mzBDwiXTwj1vMVoHOAWA==
X-Received: by 2002:a05:600c:138f:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-436e26a88d9mr63535475e9.12.1736428729154;
        Thu, 09 Jan 2025 05:18:49 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc08bbsm54761245e9.12.2025.01.09.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:18:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Brad Griffis <bgriffis@nvidia.com>,
	Ivy Huang <yijuh@nvidia.com>
Subject: Re: [PATCH v2 0/2] Tegra234 fabric fixes
Date: Thu,  9 Jan 2025 14:18:40 +0100
Message-ID: <173642870288.2612387.1935592889756224857.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218000737.1789569-1-yijuh@nvidia.com>
References: <20241218000737.1789569-1-yijuh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 18 Dec 2024 00:07:35 +0000, Ivy Huang wrote:
> From: Yi Ju Huang <yijuh@nvidia.com>
> 
> These patches fix issues related to sce-fabric and dce-fabric nodes of Tegra234.
> 
> v2:
> - Add explanation why typo fix is needed
> - Add fixes and CC stable
> 
> [...]

Applied, thanks!

[1/2] arm64: tegra: fix typo in Tegra234 dce-fabric compatible
      commit: 604120fd9e9df50ee0e803d3c6e77a1f45d2c58e
[2/2] arm64: tegra: disable Tegra234 sce-fabric node
      commit: a5e6fc0a10fe280989f1367a3b4f8047c7d00ea6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

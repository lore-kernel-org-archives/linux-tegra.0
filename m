Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429865197
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081565; cv=none; b=S4r6rD5qdRA1H8MU9WwUT4p1ASmNvd0YSi8NAVPYLSia1JtEyS8+jzv3wLP+zJ2SaCwCt9tPlawmCRkISnMiwdIOnRbmDpWF/Nwt6wMfnadW/WfF5pSNY9MfaJf7bTzvCX3XmwMc3uHhiMcZ2On6n3cez+/kz04VEmzzaGDcPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081565; c=relaxed/simple;
	bh=x9bKLU60dT7kMfMcv1lh1nI4jnCiDK+uJPwH1I+e1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FocRUP/V0EfKfTHip4OKhqUVRYGgR8Nhjy1Rx2Con7HbmjsbFbMKQOaMWaalPl+xVCKWIzHAG9Z+gG0LBRE00eJ7Ghonh7eSgr3cFZJu5lhcpOs6IzNaFM4OwtW/obeXwPOO4wQLjDNlLyyd8X1Q9rxdZ32hSJxmDuqBW19kRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqm/siwd; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqm/siwd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3deb3f563bso39750066b.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081562; x=1708686362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3Or8krd2YFOAhH3Nud9Zbh04Bmiq8FPCwaA0GAp9nc=;
        b=jqm/siwdnuzjPIV5QEQqfol2FoF8+1T2Jrcziz9Egi+kMv0AH0KMdbnWHXs09zruKC
         Eh3jT59DOpUCrr6pCnoZ02TvdiXiIPwR3EILFGhwRRwo6aiepUmVs1quSaLaD/TRg+mm
         /qahtEENSV6HExvddFzzo+plBxmh72NNCrDKZCUoHLOZ3rLnZAyPcmDxQm0ASfuaqAzU
         m4+wCbPs+WiuSemUPrkubgMWl7R85fOR5uzw3nYww+n3qXfcU6LIEDxQtRaDko2eInjc
         xM3wqOmo9X38ETmWhKUlgNRojWo2HdS/SBRc0MoQtQ2YHNvJBThXXPe8ah8Rtkczz/FH
         3ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081562; x=1708686362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3Or8krd2YFOAhH3Nud9Zbh04Bmiq8FPCwaA0GAp9nc=;
        b=r29VB4dMeoTF33lZTZ0M80AMFZq2XBLYi8TzzVEVdsxnmFmfF/aMRHf5JVmGdZ5H5M
         ckW5QQ6B9+TSFS2EBMGTJGKAvBHYyaWICovhDTo8GO+WeGlL0Ck/H7Ffwi8WT9BtNdx0
         SdNQbA/OVirK9gyzKM1vfvTlHv/oX/PNpeSY42Tg7IBA4T5+RlCg3pXfItArFOc2eaZJ
         bdX1JTGmtcg+AB6Gr0zRjCaWU7fbUwSG9FwXjvdhxVhEHhHGh2l/vHSnBwz0Ipq3WiVs
         NWryKIvMNrLg26LJOD5DWW/TG0RfV8DaHYj2tEIXqFp6Tr7yiNB57FGkTYqVUj4p+bNA
         3pnA==
X-Forwarded-Encrypted: i=1; AJvYcCVvNH1JuWkGI5lfOVMyAUVRwAA+0OGAHHylrj8Al13/0+MruiYTX0U+516zfzxS7lrG5Qw8vtpm8xvok9n987j6tSggCigY3Huu5DE=
X-Gm-Message-State: AOJu0YzI/RVm2SCo86C2eI7bK5Qsif9bM4r56YvxFtejAu4wsgAyTn/5
	unoqhznRJ6Q1h9gqlb760cZ6xgeepeFcKTZG38D2QXhm5Zol4e0x
X-Google-Smtp-Source: AGHT+IFGUFgSIL6pUjIGZ1Gpn5Uf7Uxh6+cT7MQ9bL93hEOTzLMPVXCZL0gbf3Frz0Nv+QRWFL+Isw==
X-Received: by 2002:a17:906:7fd5:b0:a3d:b100:cdc1 with SMTP id r21-20020a1709067fd500b00a3db100cdc1mr2269821ejs.57.1708081561664;
        Fri, 16 Feb 2024 03:06:01 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1430788ejp.195.2024.02.16.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:06:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: tegra: Set the correct PHY mode for MGBE
Date: Fri, 16 Feb 2024 12:06:00 +0100
Message-ID: <170808154582.192868.9388966698624134440.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202100812.866143-1-thierry.reding@gmail.com>
References: <20240202100812.866143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 02 Feb 2024 11:08:12 +0100, Thierry Reding wrote:
> The PHY is configured in 10GBASE-R, so make sure to reflect that in DT.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Set the correct PHY mode for MGBE
      commit: 4c892121d43bc2b45896ca207b54f39a8fa6b852

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

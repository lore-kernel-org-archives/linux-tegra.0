Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01C25B684;
	Thu,  6 Mar 2025 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287801; cv=none; b=Eo8mTpxjuGW/sH50/7NvfDRNxh1+JJWPzygW0KvtUGT4axwXQnTo+y/Fe9pEPluuKKYj0SL5rIVv33PmsdPUOW9UdEPaOYc+AJPhf9hHOUr4zOijbE337xo0sBIsn3gRAHaTXo/dpz96fuE9VO8OGfjEOAdHaeMYQZq2bl2ZaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287801; c=relaxed/simple;
	bh=39be9Ofs8GFpoenbJPz4bsOb4N6IuNsBqg10/8JTJ/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MB/625wOp7nkwOVj7rz0tR4MarYCKpGwNT91Of9E8v17eqAF1lDlzjEq8JvWdh6t2i17IjOfiaLTW28MhRqS3xLr4cPelV2P7rcP3jNlW5AQQsaZaR5klMD9cDax+F4hiwNswCF7gcU412MSwu9RTZjZIazxwXfDKU+cUDfSLnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7KtSNSu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7KtSNSu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390e6ac844fso920837f8f.3;
        Thu, 06 Mar 2025 11:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741287797; x=1741892597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FqjM4XZda1Qi6XK0AQo/cqJYpdg6ZfaEHPlEBsFRNs=;
        b=J7KtSNSuJy42qBD9IBK9M2EN+9WLYjyoQbgUolZNVdXcMdINAe+FWiWJ0Yx18riA6F
         p1Qo+dry3rfOKem196MbT3NDfgfWvWwEQNAhEyTxwnbEQcUJZ1e4VUaUzG+qSEeOsZkk
         2q43ZsZuWJngXtwOLfDOIAIlyohs0U0BFeKerfG9OyBcuX9C4ML+QlJKWjQYSqjtzCJB
         iS/TmqhfowvHegDwYFP5zlzKBYlGOD7gICgcFEPMYRKMh0lGKvBHcqNS+fXknZzGgP7o
         7ZMcXTUL0iC6PNdAlyXvya5K2YvsqhAV8jKWQplNKJ9yvxbZKHN5Fg+XRBK31PtpWKzz
         aMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741287797; x=1741892597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FqjM4XZda1Qi6XK0AQo/cqJYpdg6ZfaEHPlEBsFRNs=;
        b=KhgGGt/KDCxFQNjpp73Mhbse5nGc0dBcPOlgmBgxgNgErLELfVBStoDWgdpaM6ma71
         JYt7Je3a3PsTZ8h27/xf/cq4GAFCT9uapDm+YC96TkXlG8gKTPQfYkEmNSAzcd7uOhrg
         A5Sna9tG8VjWf5oAYcuk7mCtOtNpoByddPAYvKsjMKBOm3vTHkKj6UYB4zyhjtUVwbGo
         VhdwDB+Aeduubs/TylHAVE004ug6DXcolgIgu7waJfafBSVVJKPK4yCkeYUQMHOQhU/h
         Z8zMc0UBWyeGGwyiXJLMxjs6CkAj/Dn0aeiFqoGhy8OLRFLJgDlox+nIJiIAoD4AFAVL
         s6cA==
X-Forwarded-Encrypted: i=1; AJvYcCVRTsmLH29ZjHaV/4QmbA07DUZ0APs/i8Rm7ZUDNS2iotYenc535QeWj4ksj4BlhJNDt5SuYHV73wxjScM=@vger.kernel.org, AJvYcCXacaYby+B2KBwwHTsgz94lFzO88GaoQ5F808IZoB/zOSjkMyD6xjHFuSx9ONC+fQWhegg/eyQ1EcZZLI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86vfleSuCbdzxC3PV/0eAIEsBlYRpLhXiAgHR/v7k3fMTosPp
	H0Dn5roEt3bvG5Na6tsNN2IDYR2N64pYUzjlTYq3KaAR5MNXGtdr
X-Gm-Gg: ASbGncuOgj2SV8U4BUqeRakd5WIAGCCV52wdKFuYV+XnuEGuQ+uV28x1vSWRLKyHdFU
	BN/1VIZIcSY8lJkB+gj5vBcrXtyuGxDX59UAztAXq1pIhYQKGdUuUXDV4Jxb3ozzdSj6380qxYk
	x0E0qTl9Gk53ti3hxi3SLMMZUDXHH/HrbHtE1i4nOcigrUMw49f4/+0SjW11YbSGo2DK9GolMwo
	kJaFYkN68lBARUkOYqMsO++0IZj9oMmeHpKYv9fYD7GP93LOvw+/rmQaIhpX01gj1lwQbzsp88R
	+Lv2C+Ijc80EEJ9Pz2RwZorMaeFrqvSReZbCzeS/PMBxDNldvn5LTgzpkK6WIyOl0MLfrknGE3p
	nUwsT/l2PN0f/nWXOOtCCmlBV5D05pUxpI1ca
X-Google-Smtp-Source: AGHT+IFa30Wb8i14Xv2k3lLksiopR7zLjpUH2B5X15/VfUHrv4Zs66eToIC6jNaWdnkpmgL72gdgKg==
X-Received: by 2002:a05:6000:1844:b0:391:3110:de46 with SMTP id ffacd0b85a97d-39132d98a83mr300704f8f.38.1741287796598;
        Thu, 06 Mar 2025 11:03:16 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42c588dsm56776545e9.21.2025.03.06.11.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:03:15 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: thierry.reding@gmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: bpmp: Fix typo in bpmp-abi.h
Date: Thu,  6 Mar 2025 20:03:09 +0100
Message-ID: <174128778107.2032886.16331329031511967858.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241118022928.11305-1-zhujun2@cmss.chinamobile.com>
References: <20241118022928.11305-1-zhujun2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 17 Nov 2024 18:29:28 -0800, Zhu Jun wrote:
> The word 'traget' is wrong, so fix it.
> 
> 

Applied, thanks!

[1/1] soc/tegra: bpmp: Fix typo in bpmp-abi.h
      commit: 27321c788b3aa238af3c3234dc722a30b62d8dcd

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

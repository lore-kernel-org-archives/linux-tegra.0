Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B29213E77;
	Fri, 10 Jan 2025 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736531573; cv=none; b=RzBsjbQbD8xP0WZaNN+Ku/2d7cOXdwrPmfvmyJdc6q4GdNQObnsLZA5PyjIXwp8yV/GNtl6Xh5GLx8HNlNkdwoXdaEVzRLwI2BsxRYR0GhL6hOn5i6d0lxfbsi/VroYZUGxjD4Vohs9IczCuqrS3ioqQ12KjoxMnepQGJYZFHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736531573; c=relaxed/simple;
	bh=qCS36lzB+9hwDG5Dur/2dX4CVhG4E51a4Au6gnAVfrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVvQwdQKohV4OIf7lH5RWJAyFKlpAwa7CIjh/j7zSI8Js/qjAqS+C+BkDSKu3GoumwtTGnOdG/pnCQGIQFhTv+z8t6kCkgXidYvgqi6MC01poaDdkwr7r7leDNK4eB7Q0uoNDiItibKDR/6//RAbk14o9bN6nZVSMgOS7WwclXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2vMYJ7P; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2vMYJ7P"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385dece873cso1284422f8f.0;
        Fri, 10 Jan 2025 09:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736531570; x=1737136370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQqTCHALLMU9YHZTE8T7PZhqdQE6PsAWLBHph3N8DvI=;
        b=W2vMYJ7P91tOQr40sV38tfO+zxvMNwzADUc1JRxtlosVfceDiV0bnmvNyGDcVwA6AA
         bzIcWe8O4ASNyce3gcnjI1xi4JUWQPNsYQF2lkRHRkU7qaY1SdOAnlQu1tYlD0bh4Wd2
         HwffLEtxDvDQOgXeawHR3GiN8mq6eHPZqH63yt8M+rWJSDm9Ox8x2BexmGKvsQO9guV2
         5ezSSYZxXfkO58VUkcEvkfMyfdrCffn2hQxBPscBEqzI6qsnr3jaZ0IyxCiqEweU9Tt7
         UcezhZI/QCL/zdWzLl8in13XsqT0WdOL8kA60H012/LREi2g59VwbkMSyPenA9faP++u
         cr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531570; x=1737136370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQqTCHALLMU9YHZTE8T7PZhqdQE6PsAWLBHph3N8DvI=;
        b=g45bPj1xfxNLJ6rmw+N0cvd9nSKUnhPYZ+mfldr5xQPnTQ1GPBIp+DkkzRCpmbqEBK
         1cADNINRRhqlpsKZa1yn0kDKYckgKJ1JwQXAkKeydFkLNxJdyhy1ZFJZFBb4u/s5otf2
         FIkqthJF0IKQuszP2BFx9Q7ydzMiQD0TFpb2v4i/r4HhcKPlIEOtSuXl+eYfN4essxVl
         IZZVCChhE1yvaiar2MDmrOR5w94n2uRl/qHql9HT/8DcfUVE/Gvpv98JW+Tz/gGmhfe7
         8wErX8DNcv/gh7d7CxgtPUizT62hPVcSlYw/KPu/AXvHTFaZUGr3Y8A95V/+7aZPo0fy
         HzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUglruz+esNTQCKmxQeQc3rbztUXn6Ei/h9KLQLA0mZv8fn2rmI/gxhpmrs0CY5EIzVYFyzQoKDdPvjI3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBFynkLuD4VDpoaw9IACjNZdSoEFHOJAWJ/hOGd/NVRPkpC1x
	nLO+v/DEvsMLvc2QLtihwsFvqh6HCg7cgCT1KFBdC1sm9GLtT6H/6+oSKg==
X-Gm-Gg: ASbGncvP1SnIECNjr2dvC9qaaXbdJd7k974/dW+5ZAuE7tf4Ucy33gJbMzESdsgQjxu
	GdIxMj3//Ubyjn4maS2n0eNYVspfWlCX6Q8aHrZpayS5qBdBbM7lkSU+yIDZ+tFi6hn7SCApqEr
	dN6QOQdGF1NP/8MnzsY7pcAa0zAOnGjJps5h2/uueOVcnF8aRGMCFJ2RKSzna5bexOZGfW/Ztey
	Men1oAbd1uX0ZCnauEaq43WJSGmpx5Bdf2im+ojlyv7BWz72CrPmksJvRekTiBCLO41IBZsJJCz
	ztvQY1XYPVkny+byCmsXfpIQxVmj777UzdXx77hMJHFssljW
X-Google-Smtp-Source: AGHT+IHZdm7ahfELNyWIxjU38hyUwZHm/P6bhP2weRExqhwAGNIDVN19b+6fowYJTjUpf6WnCAkcZA==
X-Received: by 2002:a05:6000:1789:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38a8730394dmr3831280f8f.15.1736531569614;
        Fri, 10 Jan 2025 09:52:49 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1daasm5191810f8f.93.2025.01.10.09.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:52:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	liujing <liujing@cmss.chinamobile.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: fix spelling error in tegra234_lookup_slave_timeout()
Date: Fri, 10 Jan 2025 18:52:42 +0100
Message-ID: <173653154336.3488930.17604059106059548405.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209055148.3749-1-liujing@cmss.chinamobile.com>
References: <20241209055148.3749-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 09 Dec 2024 13:51:48 +0800, liujing wrote:
> Fix spelling error in tegra234_lookup_slave_timeout().
> 
> 

Applied, thanks!

[1/1] soc/tegra: fix spelling error in tegra234_lookup_slave_timeout()
      commit: c475b68155942cc2142aca02f3fc19f6e730f17e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

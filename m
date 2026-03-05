Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC1B39E19D
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715714; cv=none; b=NC99Ku+Unb3QI0m8Ltukr7GKssOopSkNusbBEJWakkdq0DvbbTmPpCRjcW2Gewl+49WbAc4asZ/UN5IWwISnpdAsNiSPjEnYRNQMJ3RR4lsk3vcvGRtVOjpdUsc2ZgUc62yi8X676njHnLqfIgDDCNLYP/LAt1uZ4SRBmItHWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715714; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htrkm7Rh2SjVBdpLtkUzohfD5uLM+ksyoLffbaPN8wlOJ0uFGnwa/M0RX5ajy9uFcq9Aok/6BYP9Eim3RF0gZnOPrBZfM3hVjwt/hrE/diL4hUeQ/6PgqdRym+MqoISxjzt6vZ7XDewDAcXcP3tBKwnoAaJEbjId5wNXUuR9w6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae43042ea7so53424945ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715712; x=1773320512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=XOh2DY8Pj8h7mlBr1/krC0B9S0RSHI537K/QWzTiHccZavu0BZQw5U8fmmPlqY0TJD
         F7FBYBfjUfuf1q6hFzuFW0TgQfiFeZj3oijRRXT1ODONvhcjlBRsYmeZ7svktkDCxigi
         WKyzzcfrtC2Hw2ME//H7cxJ6SNo5HV3ZB7FtJZzFyRCa7QFkKhzybHFO7vlL4jh+j+po
         6oDY93MFT3GzMjW8FDH6tpu561MJfOAgxL6erqQX81l+TwMxlWrdJkHdw1UMdmXnOIDn
         zaJNabCqt47ipd8jwBUODt/uz+LOrxZy725fbqTxL3X56auzTdMGpUTe7VRvZxCgXku3
         +ovg==
X-Forwarded-Encrypted: i=1; AJvYcCXsRL8s0/EoBF8dkgrJyP/uKD6P3JyTg5AH2WJiokYtOerPgN2/OV46DT0Y+GgPQS9Jexq7S4YwF9xhDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUjMuzBw6rz04H8+LqUs8FWIMbsxjB60YxHBwKhs67AN6juwP
	6UK7bjfIbB+4Kq3rhcEBCozZ7Zu8HmCKZV8t90sSGSsB7Kk+lZ/HfmQ1
X-Gm-Gg: ATEYQzxe3CsMKH4GdTYCS5gJ7sfamoHcrvTnUKKw53tSF87H2ztZrDOcRZD3W2CnsK4
	Nfqkdxoy1pxBe7Eiim/yIw8hLy7/XUlIwhM6WTVqV+GphM7M/x+O38nLJ3gjo256roKSux2gdJg
	iW+XuSiOhPzsi1EorpN+1lyvO+IyqrTWPAgxEGl6oNf3YXewwQ/wxc7b7mJH2Ftdnb5sXMwXtq+
	U8nC11fzXQth0H5gel0prsTYGqQxSPSq9QUK//7puMTV8DpjvrjDmIb5KZnER3fGXPcZzN29xmT
	6xp0rYE0SzTWH28YKREQQXSf6+vMbe2a6ufUYuDPxE92EXwr/aSmNBDKmKAc4PvIQW3Zu9Skwu7
	8rw99kXjZ7q+O0jwIOhhE14tNkRmKPKpfmutqMg525hrqqmAe+NOFxFkdqtgS0zyB/to0b//4XY
	qG3Dmg/dNqvP+ol8BveH6o1izalmoYr2cKFjErGYezYy9FAvvHnnzcd4KV1RWxfWCMgNGBwM7pv
	4kZYI6gzv/oe2ktCtMSUJQrq8fBz+2Y4g8dWct3qJ1PQluLwvtYL74vkqCOmg==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof

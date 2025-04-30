Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97AC29D0B
	for <linux-tegra@vger.kernel.org>; Wed, 30 Apr 2025 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033868; cv=none; b=GFqAGDU5/8JwCjAIGB6KRGakeTBpKRedFBcbzpAW3WTYZE033ksr7z6VOb0TzvQAWZU8uE6sT8g4XQyBekLEKlQQNUavR0Rh5U+9uiea9fn84ATDxOQY3vplqyCY8D9RWLPleE1O6bp0XTtnmN9P1XK8WDKrjrTicF88mDC83DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033868; c=relaxed/simple;
	bh=mMZAlErZ6zeNrhp3KAdn7ICynxIviBAECZy9aocNaec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8d4zF6HYNr7PTsG+wXk2Mi4KCGh47HTDxVAxN7TYZLfBRD1PAVFthQnum2iavuZYTVFvcCC3oAFQ5UXyrYi8F4FBkCuvxwwc1fM/6A7UjwDwxGp8GmgHTPrFxSzhwK+nXqOp6643LKOpG2TGQ5YlR1m3VikYNFBLQaHTQde9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hENnRGKD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hENnRGKD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39bf44be22fso26389f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Apr 2025 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746033865; x=1746638665; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ayaaH32OR9vWgQYDr3r7ikDeC22kKOnm+kDUQdBlQOM=;
        b=hENnRGKDSte8OyPd+RfsRz8j+UC2tHDyUdXhSYUvePFQd99vHe6jQtIGzlRz7qvc0t
         WncimjjJb3nHwEUItB9z2nNnKFsOSaA7Loz0SQIsPBqYjTkvjGTx0URW0mmMx0wfBm9a
         O3oG4Yo36rVDBga+EupvuVNiqdHtOkPO+6H4VfVU1bwXKERCImw6aSXc5MRx8mMLJ5/y
         De1R4jIP7Sc201Q0e828FYX4P3jI7Oa5bLsn5Gtl4dGn77Qupucug4MdeG5kPk6zWmdm
         veOboqz0WK0xt4Ek43+Qjo4fzOqShFKdOy3u6sSGzM7AmALEuLlMnULCWOEjfVmfPy6z
         vuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033865; x=1746638665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayaaH32OR9vWgQYDr3r7ikDeC22kKOnm+kDUQdBlQOM=;
        b=joXNn71vs9A3IhYXXu2csK8mWMLKtc0jr84OmEPftuv4zL+l/j7oABLRz2i1Y7bznQ
         dxgcDSxMfiMij4gkVyPNYVcj6sZSE0OKKYManSMKld/UVD6Rhlomb35f3NVpN1GqRmqi
         ihKPpehns9Ybi1OA4pRbilUWtMCo1tD36cOcB2jScmxQL+ncYZKTsdrt8nD+sFYNR5rL
         77tk5weBDCsmX/pODEzIrWm6KO1z/fB3XS5nhHXrwIM57Fjn47TasvXj/V5XVAxCyMR5
         jMHQ//xCO54nCli4WYPY2eEUpXaPMq8DZxAfz/ZUUZOgCpEthWO5C74sx1EOCbRTdLWW
         t5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdmAlqqrQFofs4TxGM4DciMn0915fx5lA3sSBET0qgGf4iFJUJ4kakOMCaIK57gyZVrjoztQWPSP+BTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCnpJhSFlUL2sAL85BtfrQlnq6ByRb3KDutRhfLEl2nWN3N9sp
	DaI4Z9YvTmfFBEWSBJUPPM+ewe7PeLki75amHuXg1P8cPooKwyA5VTSR8eurSG8=
X-Gm-Gg: ASbGncucM0RAj8MwNG3EIvH7THzLGWpFxO+mpwAlyfN8Mvd9CZRHE6zd2Qjq5AJ3aMJ
	vkoJM3Q/Fo5WWlZ+mit2jLlxAtnWyaIXhlLPiJ9C4AquC8LVql0rQn6KuhHqUWQdGE7+J6tOi4j
	8JhuYOxM6IgiAHrSqaYgnlwD5MQgd+ic85Y1EhICMUHHo21KuUfCZxKZBR5F2tmRJ52rFcd3jed
	yB/OlYXZB08NshKa3tLKpjaPiecp5CZAz4DTU38GogHZToKFH3OvOkr1+Zu87A45Y2uMzc4uH1d
	KlaoPiE1NRnThcVS+jPF88rJ7ZYUA7pOTS0OGdU7lsxjRrw5ImIv1JLswKW7OHVnt/wyLBdol+n
	1ZGbmnk9GKSAG0Q==
X-Google-Smtp-Source: AGHT+IGOhD9VTEP3B95PCaK57gP5L5FqVsVm5W5JWQufEnZgC4ns/6K60KiF/Cb9Oj1M6oJruDEGDg==
X-Received: by 2002:a05:6000:2cc:b0:3a0:8c46:1763 with SMTP id ffacd0b85a97d-3a08f7292a7mr4154159f8f.0.1746033864978;
        Wed, 30 Apr 2025 10:24:24 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d60asm17897655f8f.18.2025.04.30.10.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:24:24 -0700 (PDT)
Date: Wed, 30 Apr 2025 19:24:22 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Robert Lin <robelin@nvidia.com>,
	tglx@linutronix.de, pohsuns@nvidia.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	sumitg@nvidia.com
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <aBJcxnOhKLUGA5lx@mai.linaro.org>
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <aBCU5vec0XMX5VRz@mai.linaro.org>
 <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
 <0fc89d71-6510-4ca9-a789-290e1818798c@linaro.org>
 <4ks74upuufmt2ibh5ur5zpazvfj66ak4gyq7v4rtz2zi2u5wsi@rls64ws3rukp>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ks74upuufmt2ibh5ur5zpazvfj66ak4gyq7v4rtz2zi2u5wsi@rls64ws3rukp>

On Tue, Apr 29, 2025 at 04:23:22PM +0200, Thierry Reding wrote:
> On Tue, Apr 29, 2025 at 03:19:25PM +0200, Daniel Lezcano wrote:
> > On 29/04/2025 11:15, Jon Hunter wrote:
> > > Hi Daniel,
> > > 
> > > On 29/04/2025 09:59, Daniel Lezcano wrote:
> > > > On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
> > > > > From: Pohsun Su <pohsuns@nvidia.com>
> > > > > 
> > > > > This change adds support for WDIOC_GETTIMELEFT so userspace
> > > > > programs can get the number of seconds before system reset by
> > > > > the watchdog timer via ioctl.
> > > > > 
> > > > > Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> > > > > Signed-off-by: Robert Lin <robelin@nvidia.com>
> > > > > ---
> > > > 
> > > > Hi Robert,
> > > > 
> > > > I realize that this driver should be split in two and the watchdog
> > > > part go
> > > > under drivers/watchdog.
> > > 
> > > Are there any other examples you know of where the timer is split in
> > > this way? It is not clear to me how you propose we do this?
> > 
> > Just keep the clocksource and move the watchdog code (everything related to
> > the watchdog_ops) to a new driver under drivers/watchdog
> 
> That's a bad idea. This is all a single register space, so we can't have
> "proper" drivers (i.e. ones that exclusively request I/O memory regions)
> if we split them up.
> 
> I understand that it's nice and easy to have things split up along
> subsystem boundaries, but sometimes hardware designs just aren't that
> cleanly separated.

Yes, that's true.

The driver has a lot of watchdog code inside and I think it is
possible to move most part of it under drivers/watchdog. Perhaps by
exporting tegra186_wdt_disable() / tegra186_wdt_enable().

Anyway, I understand that is an important change and I don't want to
block this series for this reason. At the first glance, these changes
seem to be fine for me, I'll just do a last review and comment/pick
them.

> > BTW, there are three clocksources with the same rating, what is the point of
> > having them supported ?
> > 
> > Is it not the architected clocksource enough ?
> 
> The TSC clock source that this driver exposes is different from the
> architected timer. It's a SoC-wide clock that is routed to various IP
> blocks and used for timestamping events. This clocksource allows these
> events to be properly compared, etc.

I see, thanks for clarifying

  -- Daniel


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191351C8604
	for <linux-tegra@vger.kernel.org>; Sat, 10 May 2025 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858284; cv=none; b=c/rUTqWBEJRoZrXUF9HVk+Dog3yl+nMu2MuVFGol7gxvinmLemn4RQWSJcbPsc+E9wSpmdGcAO1WqW7j+T/5yhbtNL5ytu8CMOX2VHAuXBzowNSHmZIy6PQeplXy0nOZ+fLOnTC13RiTSzYxPLrVTZ3Rqp7OnDSqYWBRdBpxxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858284; c=relaxed/simple;
	bh=vl+AOt0BU2R6hNp+CQD9RhKIWpBxQArmmyByxrztniI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liXiJhHqAztUjol8efF/x4MgNCfq9EtyGv/GpaNDRnOcq/Jzz/zX8zTLyAJCeSZEh+zRKXcKItIPTY/pH3NuHhM7KJbA5UkhTxFxPlyK8BB4HbVKsKZQGBJPEsYiF5JNDccNvlwV+4S/aGvNNR5KWOHGp3OwBRIOuwa6tXjLRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KaLLTkBx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KaLLTkBx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso27195035e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 May 2025 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858280; x=1747463080; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBTO8qR9r5F8w3Obc+La5yiFroOnF+k++qI9jWgid7E=;
        b=KaLLTkBxGL1Yz2Yvx30giYHy+vSjkPZ01gC91ab1OJujOvYaQwZ6WiyvROCYhv2vOI
         2NIxOyd9p0Fu6Krulj2NgVDmVhTsV8kCsIiXLFwWuvahcE2xOMVDwN8c7eB3j8ewGiRA
         9I3USZjbdlD6j6Tva3p9/CbdakD3UsXyDwTo3f/HUt7uBeiTdlsWz5s2cgCRfF4n/X5G
         TmMEwQFFFyIrGksCi3BOe+Vga1sw7PgZM5rSvwktO9g61bZkB8YR2jHqtJ3Ja6CQ+yUZ
         OakShT3GXTsMoWbYYip2NhDETmW39/ysKnBrXpEB/Wv8EEpcegz0di4qqO4qLyBAF2Ly
         z0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858280; x=1747463080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBTO8qR9r5F8w3Obc+La5yiFroOnF+k++qI9jWgid7E=;
        b=vsr7BnDGbn2UUhQ56v3R+OZmO6Zs8Ki3q2q4lsPgcpnfCmUpBxAAmbe3WdWgSGA5BZ
         0vKaS5BOEz+8U0Z85mqLrl+AFjyLyplGo0tPGV7q2gRD1I7mpas3JEoGSQ8XkNCcpY33
         97WhkmD0BCfDrxeTQ2Dfmjz2q+KT9+oGuq/isfw8K4QV1XPSdJGLc6/aXLI8FijjPhVj
         hkGgdEXtYvcrbvkew4qCe8Le2CmX/KkbAGHiTD42KXW8WYg5s4VwYvSJXL67iD3RGIpA
         Xmj6DowUYY1yjGaSJUcxwf50/KNS6nQnNs9mSemzDEhXqi10lbHT9fzBDWYUBFL1vWCK
         jMtw==
X-Forwarded-Encrypted: i=1; AJvYcCWCFYbITMny1p/V3DGgM7bG/8/km52aCAsOVoUhETj00oADm0vziFnijjaKJ3U8wh9ZCu1nUPRqCUffag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZ+PxEViIUQRggLZrLlTkfiO4UDUngmI6Qdn9sKV9L9BkhI7L
	QlPcrPkKBBT5hvpc5wsOhQVL2mQAD+Fu+4Z/wNHP+ka81go16XzECH+9bZDC7w==
X-Gm-Gg: ASbGncsYUReFXWZVe3wis6fx20FueMdL1JrqEr+Y1xOOwY+41e0DOf6qrppzSZK3SMD
	rXWYEW1dm9Pe+nTtQkx9s/fJD++swwnKqw1PE4uuvtbZ67n+fEEF/03v4HghE39P/DpEyyCDHKS
	IbPog3TJJXrtRFfgaSY86feHovDmZLcq8r8Zq+XtLzKMjA46ivt0Plq+GSbOUvrUFr5m5iF9kg7
	j+vPRJ5NRD/KSflxNmYh+PvN45jw4TNt0m5aLyHMNd4t0vU9dBEU34JO+E0pXwphhF1fcxHVRzv
	4FPYa6ttyEV90/NWPuaGbOC/xbCd0AZuZcAsmyfHZ5vH0w8w+cEiN3ZAf3HG7af1EZc0iHJ4GtR
	wujD2UTogIUnHbidMrzTbmqkwGznKPpheGg==
X-Google-Smtp-Source: AGHT+IE6aPukD2RD2HNvwjoFYIVsY0aQ7DwpcF78KaIvusCeXTqm0Brw2EmVkOjlr6jHptoV5VQcTg==
X-Received: by 2002:a5d:5f83:0:b0:3a0:b539:f330 with SMTP id ffacd0b85a97d-3a1f643a39bmr4921884f8f.2.1746858280381;
        Fri, 09 May 2025 23:24:40 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ee95asm5515805f8f.11.2025.05.09.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:24:38 -0700 (PDT)
Date: Sat, 10 May 2025 11:54:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] PCI: tegra: Drop unused remove callback
Message-ID: <nsldcdzdf7xazzm3dlb4jrjkehgt3hjlar7uc62twpkwocrer3@u5kirzyify4n>
References: <20250505-pci-tegra-module-v4-0-088b552c4b1a@gmail.com>
 <20250505-pci-tegra-module-v4-4-088b552c4b1a@gmail.com>
 <idddypjxxtiie3tllfk47krcydlno4lnhbkik4wakekcyu7c2d@iurtu6bjzeey>
 <CALHNRZ88VaS6zmmnkQg_WrBVPjMT4e2uPUPEQUj8ARL1TieZPg@mail.gmail.com>
 <gxbuvopbhum3v622gf4olzfspgihxt3dm4z3rsj4gquaabt2c4@peemxrxshjuu>
 <CALHNRZ9DHApwS_W22aD0uOFJKBk8WkucFo04_vjLRpnRjP4WCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ9DHApwS_W22aD0uOFJKBk8WkucFo04_vjLRpnRjP4WCg@mail.gmail.com>

On Mon, May 05, 2025 at 11:59:27AM -0500, Aaron Kling wrote:
> On Mon, May 5, 2025 at 11:48 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, May 05, 2025 at 11:43:26AM -0500, Aaron Kling wrote:
> > > On Mon, May 5, 2025 at 11:32 AM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > On Mon, May 05, 2025 at 09:59:01AM -0500, Aaron Kling via B4 Relay wrote:
> > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > > Debugfs cleanup is moved to a new shutdown callback to ensure the
> > > > > debugfs nodes are properly cleaned up on shutdown and reboot.
> > > > >
> > > >
> > > > Both are separate changes. You should remove the .remove() callback in the
> > > > previous patch itself and add .shutdown() callback in this patch.
> > > >
> > > > And the shutdown callback should quiesce the device by putting it in L2/L3 state
> > > > and turn off the supplies. It is not intended to perform resource cleanup.
> > >
> > > Then where would resource cleanup go?
> > >
> >
> > .remove(), but it is not useful here since the driver is not getting removed.
> 
> I may be misunderstanding how stuff works, but don't those resources
> still need cleaned up on shutdown/reboot even if the driver can't be
> unloaded? I recall seeing shutdown errors in the past when higher
> level debugfs nodes tried to clean themselves up, but bad drivers had
> left their nodes behind.
> 

Each callback has its own purpose. The cleanup is only performed by the
.remove() callback, but it will only get called when the driver gets removed.

> In any case, do you want me to just not add .shutdown() at all, or try
> to set the proper power state? Prior to the half-baked attempt to make
> this driver a loadable module several years ago, there was no such
> cleanup.
> 

As a first step, you can ignore .shutdown() callback and just remove the
.remove(). Shutdown callback implementation should follow the steps I mentioned
above, so it can be done later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

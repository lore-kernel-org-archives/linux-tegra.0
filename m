Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DCB396D27
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713801; cv=none; b=mJapj/K1SfctkjD+3OmVi4HJn7nZqgxY2gOXFNPm1uqmmqDtgN27s5M5B9AtXSahB7nlG0SYKurF3kLWDY+NXKww9iIgzhNS99Q4riW3yVi8qsVm3vjT6Ez82QV3Zt0x1oWIixUzcgDPEiqr7e++i8eUY3/1qW4DSrYPU5bA4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713801; c=relaxed/simple;
	bh=4D2Q39ZrE8YmvazKvKW3aF1/g5Cpv43ee/MaVGKVTBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUh5rzlX8ktIwReC3FqDg6u4PcUSj6zPhtTzp0X1ifp7SXN1W1vQxv73sFaUx0kxlYiHZV7Y/k2v/0rioi1BKas3WFTTkRHfbfDEHpiUwFcGlohVFolDw0f+tXu9W61hvAJXkc9JsQXM5JS2QbFMygvoUoJJngobeIEgL3PwIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2835024a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713799; x=1773318599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
        b=BGO0C8rxS0Yj1rvr3/U4Dljt/sU35W2Y3rhXPXb3g1JNGWQnk9acpGJKRVBWeYsckw
         NLKZnesyOKZkMLZppW+XTV6oz0Btval+bNtVoShLF76gSfYgrdfin/PWR1KJvurqBPNG
         +OQw6M43y7Odz7igJeoUyb3QffXtIINta7f5rc0kL94eczYDQjuSvj0sw51lDTBREh65
         bWXpq7sOMG5LzQ+uky3Th/jxhblUaTr/3DST2zr2+XSGeE0BLYBMJkE5WOkQerVIM1Um
         7O1E+qeP5LVlxE9JORrXwT9GGBJwJ/FwsBWszsococPTMclYKyRjCyqGY1gn5fzewZa4
         6EpA==
X-Forwarded-Encrypted: i=1; AJvYcCXcQviyNqHlpVFsFvQyHyLuCl2jiZaR3oBn/SdHelBX1fPW7rA+ZxWchPpwEG4FfyzDOukWvdnpRcBsCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNVjfOX4oPh9tqWdIgpVinq+RiR/XGTa9t/9L86bvcUmBcCFJe
	ZFboAu6wZsWi4Ob3x3pZexanYKFVlYMkVf27JAtI7jFEmpkFBYXlfvIc
X-Gm-Gg: ATEYQzwiW6H8jQ01bg0bLu3UEgTjnAR84yuh82VgSrqLzo2c4BGuCV7KIN2tVkNmYdg
	L92u4Ten1J8o6BLKuoSm2BA0iEMvRwy7pI9yUnAtwJtcNqMao8TTMjKsgoFHWakfAN42ysFCbZ0
	paJG2346bT1QMtTd5XTGF6VAD6mDtyf47Bum7JZTE2G4qA5JnTST3jENgppIUbkCiHrrezajjYu
	GLdTYdA4/d8GeaQoFU6hzsd66mgi05M5k7qSOin+dcWY9sZH0s24ROIQqnzFPS+7aiMP49g9PGG
	DZ4BQBW1AQF77hyD8H1cgHAj1RNt5mgaA28YTe91nqwtSEbxp8vY5+8HAubvPgF5ANtMYbM2AFE
	4rM3BwMjRGVRSGrL/M/bFCIvaxGBXHYBcDk+vn200mJcJsqDAbTPlNth/C21BCJqSOtI24H+t76
	wBjquFPNXWSRthBIbukaFLW5AE510yWVEO7QdmpKhm06nbFcy8qXRC/EOsKR2f/BJLypiVnTUHl
	qb/9AijBlsbON8plCeaygeoo2W2f3fGxNw3pHJB7qbDbgUDYjc=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017;
        Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
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
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof

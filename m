Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4393A1A3F
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715975; cv=none; b=osyvW7Lr6kyTh+ElpnGm0FsiU1MtxwbSOScMpNH+Tnb1DXOzG2Btv3g5I94JB1LL1hoVnZ/x6gSxOihGWM1w44Nv9dFjc3JYsSYHtSXMNQ4voWaldbtLxWpowHei6Dswvg6wpnVplfMFX84kkNiHZx/lFS0ZKywlPU/ZLJjBERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715975; c=relaxed/simple;
	bh=An6z6pGF00+43VUaOecTwb49LKqdBH2wGqINr17mp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S44yDGumbdutPs8x6BVDAHTiKGRB8v00TYFfdyn5g1aSnkhX22wkjh4z3zMCmDTGaRjsAklQYWJMoZ4P61jzi4TRt92tY76RjNBfO1Qv0XI/4Y5b/YUMhkuXaMxy5fffuTj2tku2NlpsqBvOlhrGKTaBEcY+0fHUhSvv5Q/JcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab232cc803so37831535ad.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715972; x=1773320772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/3ao61LTSp6jCCF+e+2SF+gp23jwVu9a+x2K0Dcxpg=;
        b=e+T+qd6y9eWYiwJNRp0zPUtgb6eiUKXEH/BojPKPfo0JEslfhlx4BnkZcyHre7BgVw
         YpgLRmdTUJiKJZkTmSA4YTkG9hPsjELXevuc1aKd+KVCjRlWb4LicQJQW5zQygHtgpaF
         9GJvcn8Ymg+u4hkxxV/VRdVLTh/osJ0uH8QWuuO+0qUt2O42tU7NU76tlQhPoC+4rSOe
         zOOdzCZppBMBQzcB501hF0Xz3tkT+6ap7alb60wl6ufy7Y4kmu/WW4CKEkGV0wTnUkPH
         fTsFQSeMNhBDyQ5GiN7H6PbIE5OKZQbxZ74RXELb/7Cw//mf9EeaDn5RJY3+vv8qMdht
         qtVA==
X-Forwarded-Encrypted: i=1; AJvYcCVfXEC+XMXd19vpanSMQN51+NFBbEBwTQ50EaiLfBcnktm11vkLiKjgvwr2yr4FOS7c7I8p5thaD2lqpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnAA8F0MJIAi/a2xfiebjj9nLr4aQYQSQKKz5q8Ws+27YMFI1l
	xKm/8fRLqYI9hxunt+tp7Ad+RF3ep3AdMCLECVqwJWnlnMRpP6y3eL29
X-Gm-Gg: ATEYQzy19OwwiUfGAVad3Qabd/a1z/STFi0yNY80X+PF/j/q/xtsMRuPnuDWUhoeDcZ
	GlZg18FB+NH7Tg8dU370UjrZGC0LOy0oAlwrcxQaFc+tzmBqYPjie3gQHxT9+yqNKtF0YtrSm79
	vWDoGXi7GpaDmGRuSs0tr0+wu/NmCQCFrdulCkMZpHMWrX7kiEQH1DvfLUcFGWAuDX08edaaJcp
	c4ZSdiu1+PHsN6jxYEtRAU6LFHeYRFADXnsUXVpemt/RpEwURDKKwcaUQSqCUGGswDGMZwuK7BU
	zL0xcN0/FfJjCAtn/tIW4Ih13NGITwb6y4KJwrt6cnLb1Qm16vsVu3jvzGFl3oGEYJecXbq0QMD
	h8WwgFOi34eonOAsIIzwjWNA/VWQwQmCPBhwYUUvKuzUzdMG6Mi4cA+5tDBFnGnfX1HuRzJhh46
	yteduE42q7uqBrVw/LUVIOAsnt+DiYmLAVoIzB6nNJPfF7PLbYuzHjgKUdXG6xZBrbthuMrUpZ2
	M0lIYkfV0n8sRV8OThU4sFovOn3HIBiE3FPr5XNKZuqE+YNx5s=
X-Received: by 2002:a17:902:f68a:b0:295:560a:e499 with SMTP id d9443c01a7336-2ae6a9cd41cmr53596975ad.5.1772715971749;
        Thu, 05 Mar 2026 05:06:11 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d19559csm154128355ad.5.2026.03.05.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:06:10 -0800 (PST)
Date: Thu, 5 Mar 2026 22:06:09 +0900
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
Message-ID: <20260305130609.GB1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123843.i47asdrjychwlgdt@skbuf>

Hello,

> > > K:    \b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > > K:    \bphy_(?:create|remove)_lookup\b
> > > K:    \bphy_(?:get|set)?_drvdata\b
> > > K:    \b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > > K:    \bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > > K:    \bphy_(?:init|exit|power_(?:on|off))\b
> > > K:    \bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > > K:    \bphy_(?:reset|configure|validate|calibrate)\b
> > > K:    \bphy_notify_(?:connect|disconnect|state)\b
> > > K:    (?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > > K:    (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> > 
> > What about
> > 
> >   F:    drivers/*/*phy*
> > 
> > or something along these lines.
> > 
> >         Krzysztof
> 
> I don't understand your suggestion. Is it meant as a replacement for the
> keyword regexes? Your file pattern matches on:

I was thinking more along the lines of using wildcards, the F: was just an
example.

[...]

> There are a lot of false positives, and a lot of false negatives.

Yeah, the "catch-all", for lack of better word, will not work here.

	Krzysztof

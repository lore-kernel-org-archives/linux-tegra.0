Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BF61DF271
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772511424; cv=none; b=XixYOUvAkXSqkTWz9Tgs88EgYRMmS4zOhrlCwC5YR0u+m/oX+GBq2dMtIVUUnXM/X1Z/17RxhQbj5V7vT48zYocD/fflL3yKSgO7rt+jYVdxjaHZO/yxQYzz41Do9BNHfaWjs9e2ZuyxUEApfGbFlukRTiuO+ywt7q3dwnUBAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772511424; c=relaxed/simple;
	bh=ZmweLOnXG4Le8DUQht02KQJMGF2iglt2HkQ62tdQNN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSW3cDHUX0fr1RLbXHv862lHHnq9G+mu0P0gVE89ZNJ91qz02PLD3MrtJj2XWY5e0R01rWZhBrC1qFBbn632Xw3VhOHiX3HzVhZQ5HXuU7XfXn1qaNq5fCYzK/Tc9ExBJr2AhusM0vC7VvIWTq1EM6hEztG0XbuLBTlIULIpCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbdCVLHe; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbdCVLHe"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70b69ced09so1379259a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 20:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772511423; x=1773116223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0KJ6MPLwz4hfSbB2J0YXeVoJBEVj7NgQK32ArZzCAY=;
        b=EbdCVLHeVDXC4C8QlPDla1rNO/jSTNF06KuTusk/Rq9qHioFuTWccxJJmqzNjCu/Au
         qerY1wnYdiijPeKtim8VKSiruTT6IelHCJtHcbUXYq0lR7tdRlCorgyxOiRxk8F6+Plv
         L7qt2WgRA90u2akNsEcEgQkAfneAG2hB6HzolCTeUDcrFgyLsMzp9V/39ihERvU2PCY/
         Q4tErl25PKTXO1X8a2IXn3heHlIxHaUjBkNcqHax+BQtAh8gNN1gqUavn4W7qoF1TB8o
         rwSd8AyI9CQujcQ3P99E7ZSeo81EMW06OisTonCmTtlCWq/zAEOF7WKMfX8AgeTuDxKI
         Dq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772511423; x=1773116223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0KJ6MPLwz4hfSbB2J0YXeVoJBEVj7NgQK32ArZzCAY=;
        b=svwUq7EihgbUJFzQXAV/msViJxEmjypf63jBn+EQ6sM0iCYZr4NT3f7FB/tlftUZyt
         8AzvIe0mXSd6WOqbnkoi+FFEOrUNZxdNtQL/Mgof98e5rWK1uQSvQ6m8++S4jTR5hqdw
         LjKXF+F/2ajr0Zj7qWS10PozsuNpEZG4tCgCPApUnXg4uP/4e0NTntBf5UPIPAQ251Hf
         lyv5TR9FW+BZkT91XEbLQQUP/zp1L/NTO5L+UXVzLwdxql8TSVaB199SRe2nuRB4QTuK
         PcY0XWP4H00TIG7VHHTrr5mCSOEyVxO+CGi92h/Xs4NmFfxyPYtO07BaUofTye/x5SB8
         sG8g==
X-Forwarded-Encrypted: i=1; AJvYcCU77AgA6MzkD5VBR+AeGlVzucGIUjr2yRmBX+7z+WnwijTOEX3ffXywg2vWg5734F1NQVU4WWMKrpMoNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmrr5uBsD/QExMPXEIsa9n9lBlqyad9bqKWmKuQGooQz5rCtll
	u7mbsUWK8/frDmgB2Q/A0DhDqGdY4bQQF/7wa2B+Vxyd8tUOmDhxjSYZ1sOUVQNQWXA=
X-Gm-Gg: ATEYQzxDQe8wA93rC3PRPGTGnMsamxGdxtcJ7OyVzxMT69g7PWg7KepIEaGIM7WuhCH
	rMD2nweCK37IRUmWvdF/iS2O7gb2XIinhmjKWI365gDG4xfzZQ7s5+ODb+1S4Nt1mYTr1qdfh2z
	P0oXKn5YAj3nUuqQddRFfrCdtJ28gfYyh4STt6dElQFGmdYAYBcn6QldA8CLQOP+7qoX/4FPnul
	dupyIB94It26OfixHMh7c1HVIRGXo+Ml2KX5Cp4OFAGxxvLx8GnXkOWs8FSlv2KgUok195qw3yQ
	xffDoLxKtmwawf25T42V2u2BDMsrwr+CjNrbMm7k9YPzyjrHW+KKB1eCGc4udubEgwKbsRn0peO
	X3Q2nqfjELOZf3S2GORHn0Gd7pu5GolZGLu2FKxZoJ4lqhHqt/PLb3lrs6yo9VaXx0DSqS7UJh/
	yLveincHq0XkPa5Rw1QgUkFSXO
X-Received: by 2002:a17:902:e845:b0:2ae:5102:3026 with SMTP id d9443c01a7336-2ae510250bfmr51175175ad.14.1772511422634;
        Mon, 02 Mar 2026 20:17:02 -0800 (PST)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae46500068sm70579525ad.52.2026.03.02.20.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:17:01 -0800 (PST)
Date: Tue, 3 Mar 2026 09:46:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: nvidia: Document the Tegra238
 CCPLEX cluster
Message-ID: <hsxkn3emukz2wafaaizqp7upjaa7vo74tjnjd6lxuypgowe6jr@cffvh7h2de2f>
References: <20260226151212.4067944-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226151212.4067944-1-thierry.reding@kernel.org>

On 26-02-26, 16:12, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra238 is derived from Tegra234 and uses a similar CCPLEX cluster,
> with slight variations but the same programming model. Add a compatible
> string to specify this particular implementation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> index 36dbd0838f2d..fe9c8791f227 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> @@ -24,6 +24,7 @@ properties:
>      enum:
>        - nvidia,tegra186-ccplex-cluster
>        - nvidia,tegra234-ccplex-cluster
> +      - nvidia,tegra238-ccplex-cluster
>  
>    reg:
>      maxItems: 1

Applied both. Thanks.

-- 
viresh

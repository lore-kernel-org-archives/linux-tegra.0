Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190440855;
	Thu,  9 Apr 2026 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721925; cv=none; b=IyEemCPee105Ytgx1r94KLx7QftzqaGFXr7CpafCiFKSfK0j3wCa7S6hfPU1a2bKDx/u5S0UKTFzTB5/ktZDBe2CXhFI5JIUoVJMmpIER9imdUGmMOjKvGL5cb17n8pzn1K6w8whcrRPjUvxQv+Ufq24J5x7L52aiwmY2CmEdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721925; c=relaxed/simple;
	bh=u5Puw/cggInhr1r7dEE6RXk220TFrmimBYnwunr9YAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo1/DjznZsYDT0+fkuQ6AF0aVHMkbGSDz0EWAkfJCGKK2sr58Y5BEmqDUrpLH7hF1JwB81B+5xuRF92608HRvAQMwdfN6FRfsqdOp397MAOYhBvdF9fMHrKgRD9R4NONOcv/TK/KjYtfMhYZTDwKtWei/gunHckrHV6He+waI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs+W8s7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs+W8s7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CE9C4CEF7;
	Thu,  9 Apr 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721925;
	bh=u5Puw/cggInhr1r7dEE6RXk220TFrmimBYnwunr9YAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs+W8s7ZnFPDtnxq5c1iJO/Dp92WRIQzudXCG9SZjRHFETjJJFb10Obj+4AOkn95w
	 e3Rv6FZzyb1jZBB1bWQ6mN1WnBbO2iCdEWTPC6ZhvhBEBHW72WuZEZhGLWaESQ0+Fv
	 glm1GlwrTCrR9L2XTJbKmq0jmruUnW5o00IFNDln6dID1M4/w2ETvIHK4tMwshY2i7
	 z9LPoA0Vey+JfTdwpgYxwXO1QcytRWBw2tVTCJi8Xpwwu/D+0H7LSUGv1WXAzQwf0H
	 mDgfru8x0EkmiJIp+HXfQ8+HDjstNOqwAMgqiTULkvQdU6bBMIhZIRpJ90x3BPlm2M
	 KdI2wgT4cNixQ==
Date: Thu, 9 Apr 2026 10:05:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Suneel Garapati <suneelg@nvidia.com>
Cc: dipenp@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, amhetre@nvidia.com, sheetal@nvidia.com, 
	kkartik@nvidia.com, robh@kernel.org, pshete@nvidia.com, timestamp@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: timestamp: Add Tegra264 support
Message-ID: <20260409-fat-cuscus-of-fragrance-9adbc8@quoll>
References: <20260408212413.217692-1-suneelg@nvidia.com>
 <20260408212413.217692-2-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408212413.217692-2-suneelg@nvidia.com>

On Wed, Apr 08, 2026 at 09:24:11PM +0000, Suneel Garapati wrote:
> Add timestamp provider support for the Tegra264 in devicetree
> bindings. Tegra264 has two generic timestamping engines (GTE)
> which are the always-on GTE (AON) and legacy interrupt
> controller (LIC) GTE.
> 'nvidia,slices' property is deprecated and hence not allowed for
> Tegra264.
> 
> Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


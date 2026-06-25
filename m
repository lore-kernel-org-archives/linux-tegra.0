Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFB326927;
	Thu, 25 Jun 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376574; cv=none; b=kDAnLTnRs/nc+sl9JtCnO71oey24zjX4f5fU6zs+nglkXH+cq46KvFvEFfNdE/gSKHoUeR4t+kDuu9mwSzrUsE/wgyxHHR3ilFs0bQOlYt+f7oDCCt3j17Ne2RKR+uZtQ7PQATbklb9kgD370yL+HqT+IwTG/bozZS49Nmq3AII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376574; c=relaxed/simple;
	bh=oD1VxhZq9697KH+qXgV3dLwh8bpLta0Equ9DdguzgIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i92QJWPgvHSMiOjZJvfj8sJx5kuiY1LRSfbwoo2TQ38PV7m3P1x13qBF/pi+gJHMnNWauKa7v1cJKoqIc/chBADV0DH23y8Hcp68+E+shVdHLh9CuRRSlzrIwTMdb2aAFo2MPB4mZW4WC1Bsz93NNAO/g20869MmyOlPtThGspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ1p8ohR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ1p8ohR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654C71F00A3A;
	Thu, 25 Jun 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376572;
	bh=oD1VxhZq9697KH+qXgV3dLwh8bpLta0Equ9DdguzgIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQ1p8ohRyKBQ7KY1xLnpE2A7CijIb0wV9ojbLnsIUVienGHT1LGanmRv+2U4ThS2V
	 mkpwyZ3vOHiyyezR2aygJo67d+CUufQWIbtoo/1nZ1pP/kztbpYtT1s6wU13ibESF1
	 2zl5YhqGRnoJqaQfkYe4qHegUAa/WONp9y8vLwDEcaX/Ie5YsbL5NDI8lYEbmUx9sZ
	 ntRJelUX6p77oOSWfPqa8fwvDx2xSkCWGNsqem87UFw7P1PO6sokYqv3GeKc14uVXU
	 6SU7+5Gvzb2Xa/+HF0uViYKJ9hVOZrR9/iiELgNhi6MUfFTA3sl2NmVCcosv1HsAg5
	 C+pxOb10VtVtQ==
Date: Thu, 25 Jun 2026 10:36:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: tegra: Add channel/syncpoint
 range properties
Message-ID: <20260625-poetic-heavy-vulture-7baabb@quoll>
References: <20260622-host1x-nohv-v1-0-65bc682a617f@nvidia.com>
 <20260622-host1x-nohv-v1-2-65bc682a617f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622-host1x-nohv-v1-2-65bc682a617f@nvidia.com>

On Mon, Jun 22, 2026 at 05:22:51PM +0900, Mikko Perttunen wrote:
> Channels and syncpoints available may be limited when other system

What are channels and syncpoints?

> components are using them. Add properties nvidia,channels and
> nvidia,syncpoints to limit the range of usable channels and/or
> syncpoints.

Why isn't this deducible from the compatible?

Also, nvidia,channels is too broad/generic. This is not ADC, right? And
channels is a common term in IIO. And in few other cases.

Best regards,
Krzysztof


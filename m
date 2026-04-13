Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA433D6D5;
	Mon, 13 Apr 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100667; cv=none; b=luZT/z2nMPceb5KFFXHv28FeWe+DE8FSohrtGxoIyda9lzJ4KvdVrtkst0J9u1HymXQIdhby79XzOHrdOsOmp4yFV844W5v9ZSWornOrLcAMJJkzriCtcfiCFq4TJvM8p5LSJzQKYzBBeKOkg3NPO5EBaYiqHNkbZBdagmHLUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100667; c=relaxed/simple;
	bh=zqGratdcxgapw7SS8IffSRfnik8afWXdzTd3mosfEz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrFEYqEXha3Qz/hLINZlf90HdjN6cFZ0JtKX2d25MoDJS/gBHfPumI1+OUUJohD8OJuA0zvye5m/AE6g1jDY9TJaORJjTDpOLOM6wwz3TPzSxvUQBdkj4GrrT4FZV4G9TDMMlWHZtgsMVrVkBMbVPX1lshVBvMQT+5ZCTlrk52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt0wjp5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt0wjp5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15227C2BCAF;
	Mon, 13 Apr 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100667;
	bh=zqGratdcxgapw7SS8IffSRfnik8afWXdzTd3mosfEz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gt0wjp5UmjoF0q/M3rWOvt5FXzhrk2ihwExKAyOfdmCYgTmLMTpV8A00feWej9kdo
	 H7DlSOm25KI8Ft1/Jm0i3DX416gtJ90hr5Kq6O3f4Iftu6GrF3pv86mVl6aj3knlwT
	 gLrFu+JzmsjpyoauaBFpmmfWy969Enci3nAB+e0wqCuuZ9Bh+3KxMg7FXxEJoxP4YY
	 Cl9sM5b6sPktIYswt/USmcsa4VDab5J54PeciRRq19cJmWYZnp/o5Zt77KGoj0UQu1
	 EJUhmpI1G44xuEjOUsFcM2AZ/GzU9t4CivR6vQBQ0/juu5ofov+eft994V5IUyA9LJ
	 Bk8KOtcoo/RBw==
Date: Mon, 13 Apr 2026 12:17:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing
 required block
Message-ID: <177610066469.3066647.8560667150226878953.robh@kernel.org>
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>


On Fri, 10 Apr 2026 13:10:48 +0200, Krzysztof Kozlowski wrote:
> Binding should require 'reg' property, because address space cannot be
> missing in the hardware and is already needed by the Linux drivers.
> Require also 'compatible' by convention, although it is not strictly
> necessary.
> 
> Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin controllers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml          | 4 ++++
>  .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml   | 4 ++++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EDC2931F4;
	Sun, 20 Sep 2026 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902221; cv=none; b=m1UPRH1swI0R2JNvYUP6KBb5kN+38pE2mhbIyzDUu6eQJKGe/xtbXNRMKjHShgRR1RqOMpUT6OLftCGVTGz/5ohRljsaO3/EpC93tJAdmQ+rIA08W/Z+b5tLJbDUb4SmGax5D9f9O45NZxap74KdoyE7N+s7MjP5YnaLB/q73zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902221; c=relaxed/simple;
	bh=5woVyMhOzSYUGhrHxUaiAmoR6mZWcAIs2jTC2ISzFlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZkyHjHkVsBD60nVNrHd9BoXw12MQaJuAfFdJ4pNeybguBo9dL1VlREiWpGGMjvRvW7wcCtCvUTkx47R66+if/VcJHCaEH60qj1LvS8FPrmInHOnCPN8zQFNJjUklhHfqqqMhFrR/cwkkXlSqOAR7CXwfdOYe18gLRpa8rwe6Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3iFn4/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3iFn4/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148051F000FF;
	Sun, 20 Sep 2026 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902220;
	bh=wmiCn3Falc3kmGbVnoJeiFa88eIWlueA3zxNQNX38iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3iFn4/UL3Wj4ldPUaQAfPbKsWGcZwdFujMsM3jqYjDbbXsqn3G5G8SB29UrcN+F6
	 nIHK9AccEbQPi53Zi8diDDW5+14rMl3dbXBDqJ9JuRKetjd2GOHC5kKxphbUuNbyJA
	 +iP1GN8IvF8UbO4cGSc253Dk7gBUJC0BkV//xWngVNhUogL8mkq9o+2+R/dYqAAOeb
	 b4JMy5K+cB294bWQ/3nW6jGr3Fk+Z5ZdpGZHGVdAgA82C+pcT7nxVH9XltpiXvUmJ7
	 u07D9u3KZ8bJFkGp7nvNlG/+3vPs+N6cW+SkvG+It95dFPOc+du1jvST3kzO7r/HU4
	 pJl9joiZu1oNA==
Date: Sun, 20 Sep 2026 13:03:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: fuse: Document compatible string for
 Tegra264 FUSE
Message-ID: <20260920-celestial-scorpion-of-certainty-aa0954@quoll>
References: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
 <20260917-tegra-tegra264-fuse-v2-1-4936068c2168@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917-tegra-tegra264-fuse-v2-1-4936068c2168@nvidia.com>

On Thu, Sep 17, 2026 at 10:16:01AM +0100, Jon Hunter wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the fuse device on Tegra264. This hardware
> block is mostly the same as the one found on earlier generations,
> however, the exact register regions that can be accessed differ.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


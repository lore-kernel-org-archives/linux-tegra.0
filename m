Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A088239E8A;
	Fri, 11 Jul 2025 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221960; cv=none; b=MKK/Ni52IdbTSJHUi8CJZ/tYNQxNnndFoIwI/8e0u/8vKaRXutQzTAOl6C46tL5dLHdw3PGt70R25WF5Ha5iBoowf0bU8fj9rZpcx/GOr6sXIyE879hXNqY+KsgFB02ZcIp7jV5AxOm3tHTiD3o4lFlIKqJ+sy8HICrsJprpTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221960; c=relaxed/simple;
	bh=V3jxKjfzTwxvOHUVtiDmMg3cUtNkjjUxzoxMinlHiMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL8pEQ1Y8cUxab7PZix+E9MhFKNCSWigNxcptoBzSBiHgiSrOa+4qAbMQAZX30ODIUw2NMYwCU+jd5kKGWO0GNwrzK/tIWKfXSKZqsN3s1bPaa1VF1YGsWzm7VxoP9eDsORKU4169B+y9IoZgnp/j9Bxbz4zj0qR7UfmCv9SHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzdIeXUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzdIeXUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E39C4CEED;
	Fri, 11 Jul 2025 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752221958;
	bh=V3jxKjfzTwxvOHUVtiDmMg3cUtNkjjUxzoxMinlHiMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzdIeXUT3mx2OUYKTdI6WH3WbU0kcocM3xImbRaF52z3/NuwV3KZCPTHObzR4POQq
	 7L1xRi95QFGL9ZlfucS8PF3CcN4XoDorGKgMsnBrTpMxp2xAUhPuyk9z1U2Z+qvQrr
	 Ib6H4vPLlPOpbY87FlnEQpERU7IL70m7OTNtBafzCjFh70Pa4ND74qGw7CPb4kisfr
	 sC2WoWNAWFdUylPsOAwezsIFWeFneDvO8ThkCDyyY79M2gWdm2avFreBw/Q31JjRCT
	 Jj3SNlA3ptAbB2SrIP0ZY1fXZ83kflKUU/wuoDRgVcpDz6bzBEe7o63a7Cnxto+/s6
	 c01NDgz0RirCA==
Date: Fri, 11 Jul 2025 10:19:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: tegra: Add Tegra264 support
Message-ID: <20250711-noisy-mellow-reindeer-72a4fe@krzk-bin>
References: <20250709222147.3758356-1-thierry.reding@gmail.com>
 <20250709222147.3758356-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709222147.3758356-2-thierry.reding@gmail.com>

On Thu, Jul 10, 2025 at 12:21:46AM +0200, Thierry Reding wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Add bindings for the Memory Controller (MC) and External Memory
> Controller (EMC) found on the Tegra264 SoC. Tegra264 SoC has a different
> number of interrupt lines for MC sub-units: UCF_SOC, hub, hub common,
> syncpoint and MC channel. The total number of interrupt lines is eight.
> Update maxItems for MC interrupts accordingly.
> 
> This also adds a header containing the memory client ID definitions that
> are used by the interconnects property in DT and the tegra_mc_client
> table in the MC driver. These IDs are defined by the hardware, so the
> numbering doesn't start at 0 and contains holes. Also added are the
> stream IDs for various hardware blocks found on Tegra264. These are
> allocated as blocks of 256 IDs and each block can be subdivided for
> additional fine-grained isolation if needed.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> [treding@nvidia.com: add SMMU stream IDs, squash patches]
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add interrupts and interrupt-names constraints for previous chips
> - add missing maxItems for reg property on Tegra264
> - squash memory client IDs and stream IDs patches

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(also as an Ack)

Best regards,
Krzysztof


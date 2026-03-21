Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD527E07E;
	Sat, 21 Mar 2026 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090082; cv=none; b=Ga75lm7EFmjAlgw0LZvF1i+qdhtUtFS65EaxvFc1jCrpuMYbf5jrjTEUyfmxYHuSq+4ZklTEC+jgHyoDNCdZAZotatbCWR8UqQ4wjuPlAbwOnF04Ewh6LyluQd4Iap5+tODqkiB16nGH6e0x5frf6lYR3fPQRjkUUSKeU+TUZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090082; c=relaxed/simple;
	bh=qEFy8AnPO5qE2Uzt0vHXYvvn92a3GNoGXX3pnurY4o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhC6MKBDZeV7Z+kvB4X61IUTdUqUQ421vVyPWurBuQr4cn0j9Yemuu2e0qvewKHvVWXXrO4xSgA0uAKnbI4vJTBV+pr0vM72UCrMZ8kJf8h3LcSYJ8Dljn4/hfb2SyRHgcnfgr6cupaJIarJFLu5iUS141TnsmjH2dFJQ+06diA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHXiZCFh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHXiZCFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636A3C19421;
	Sat, 21 Mar 2026 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774090081;
	bh=qEFy8AnPO5qE2Uzt0vHXYvvn92a3GNoGXX3pnurY4o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHXiZCFhRMVIztnsDfbKbBv5+7V46d3NJKP+wC9tuKJ1YzH1MQgLUWNXfbzCuOZqu
	 DMND/Jm0Wcz2sXNva3iMu3v5WROYo1kMcfwbhU4CyAclskIQ9vJaHvlWP57c6jxSPV
	 z3FJF+aVlyiANoIEL0DhoHVDQMAFq//5r4KEHy7fvmzPwW8ula2mJUJW6ofqihYIia
	 402xDSOxgKeqpi1lTDCFhQiuvdYRFDdgVQzOEdgtgnlJjq3i8tHucZSZCWs9rmQhvH
	 1RFHMua2MTI7jkPIeyx2ewe0bgpUNt8BpY08i4JCGUcUF25rOVIreD6cacpJ1kRCa1
	 uWME9sM9OzI6Q==
Date: Sat, 21 Mar 2026 11:47:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <20260321-witty-fortunate-elephant-ce50fe@quoll>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320234056.2579010-1-thierry.reding@kernel.org>

On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PWM controller found on Tegra264 is largely compatible with the one
> on prior generations, but it comes with some extra features, hence a new
> compatible string is needed.

Extra features means devices are compatible.

You also always need a new compatible even without extra features, so
last part is just confusing. Suggests like you could skip new
compatible.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
> index 41cea4979132..15706d2a808d 100644
> --- a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
> @@ -16,6 +16,8 @@ properties:
>        - enum:
>            - nvidia,tegra20-pwm
>            - nvidia,tegra186-pwm
> +          - nvidia,tegra194-pwm

Not explained in commit msg and it's a duplicated compatible.

Best regards,
Krzysztof


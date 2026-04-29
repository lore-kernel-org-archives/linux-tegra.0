Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167733F8B4;
	Wed, 29 Apr 2026 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444851; cv=none; b=MRpRy3Z5UQW2CNwrjx8QJS4EBaQjYGvoG+eLSKjK++HGR0XZqygtK0aK+Q/F8wpXG1VpOWLA0/N8dONHC2nGO+90PL0O6aGCl9R1J/6FSKdZlwYeXxUgOhiWNANpS7j+rGvnkgaVkB20yi52n+8L/oPKkP/mEUxTFzCCJ1K8pXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444851; c=relaxed/simple;
	bh=6Y5IdxXSaB9wdrIYL2haAydS8fRyVU3e9IUii7SYkd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBzrltiZqfMks5MN6anX5mjPpx60SGLJYdkrDpZFjPmZ/bVrbB5UIXZtS2RYenV3m8yj7VF/782OqT+LPdmag4TGd3sD05R025xyXzGUT+DWguOklM2DrQMuj8CjSmiHEnYSfRW8x+N78/csbUQVHvZs03TDlYRIXWxLum092hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaGt6orr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaGt6orr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040CDC19425;
	Wed, 29 Apr 2026 06:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444850;
	bh=6Y5IdxXSaB9wdrIYL2haAydS8fRyVU3e9IUii7SYkd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaGt6orr7dbx2QEQOJzbp9oJNOlYTyEjRqV4oPncuj7nSxyl/9B2fng7Lxcy8ffCr
	 /dePC9qcglXndx3HBApfWMSV6/ul0xUcGeGL4okouCoRJrA29+RAbmXcCsfAiYHJa+
	 pDy4cp0TUxSB9o+bIF7mAkfrl7c81Ba/TNreSNE0W/pM23l9bXaIlPMzmKfTIRdY1c
	 P20n8S4JLZyiFTxgtKUo9W2QDMUh7x640mE2s7HRPMVxPYil2Btw89Hi03a2iVbzuP
	 tlI+DQGPDSYyebT1eYn3kyz4+l5foNtBwvh4NCiqHBvAqbPGzD5lDH6Rco6tKZewYW
	 /AfYdOcG3EPyA==
Date: Wed, 29 Apr 2026 08:40:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linusw@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <20260429-bald-myna-of-education-da4dfe@quoll>
References: <20260427134231.531222-1-pshete@nvidia.com>
 <20260427134231.531222-3-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427134231.531222-3-pshete@nvidia.com>

On Mon, Apr 27, 2026 at 01:42:27PM +0000, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra238 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v3:
>   - Wrap commit message to 75 chars per line (v2 was too short).
> Changes in v2:
>   - Add a 'required:' block listing 'compatible' and 'reg'.
>   - Switch top-level 'unevaluatedProperties: false' to
>     'additionalProperties: false'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


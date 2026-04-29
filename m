Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757D3822BE;
	Wed, 29 Apr 2026 06:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444893; cv=none; b=n9Erooz3qy8v3LgYL1BMq0K8880lfj4p/em2IYWHPr65x6iYlYWMIxW7jhUK38fEUlutxz9qGMK3rqRjbA2ygUUfXbh2ljwms4532wtzwaipGUeDTd9Njqt9CfRh1/kjvOd5tjG6BHjLkNYmcbVEg77MqD6YjYXJZWA3bgvj91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444893; c=relaxed/simple;
	bh=oKjb7C49gv0pn6lRPliZU0YnLLIFrT/1+bsMVpt3iiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyI1dqcNktTeTSJxV25ai9UTG62IqzdIK3KesuW/UURKbwjfJeHaH5z4mbv2LNwbgBDrOb5LNtuD0uzWgxMPfyRl6cVstpXwsWaDVu3Dy+SrBkXOP+ixDjRtG2wv8AF9yLNVOLcj7C0yGTKm19XUfX0S4oAeifnYFusvJkv/f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU+ksaYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU+ksaYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1D8C19425;
	Wed, 29 Apr 2026 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444892;
	bh=oKjb7C49gv0pn6lRPliZU0YnLLIFrT/1+bsMVpt3iiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU+ksaYf5HGGKUM44/yKZxnYujci/trSc+pNGMSXt/cLb0y+hBUczR/qj65ot1OTn
	 V0wcriwSJKLJzivysaBk9fl1mrb7bBkyGCKURuceQHm2WnXAh6R8ngotR7UocbWDbQ
	 4sxSFATr8B18uNKinOqb3WhvbedoDksdqJoekH9SKveUhBaQaTDxS28kZQTL1mRZUS
	 58tuvIDaFkZAHanJeklwgVIuFZZgQ6XSfydudI5gyOUqNG8seP9YLJfoOS5aHXTN1M
	 M/oalhzTG871ILX+oHimdtFLp8c1VEUZbDTmeaOkU67FBIGqEjTishW2HZgKIZQHdO
	 alanjcpOIN3rA==
Date: Wed, 29 Apr 2026 08:41:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linusw@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: Document Tegra264 pin
 controllers
Message-ID: <20260429-slick-intelligent-myna-8cba6c@quoll>
References: <20260427134231.531222-1-pshete@nvidia.com>
 <20260427134231.531222-5-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427134231.531222-5-pshete@nvidia.com>

On Mon, Apr 27, 2026 at 01:42:29PM +0000, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra264 contains three pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


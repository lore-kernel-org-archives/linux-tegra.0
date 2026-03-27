Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6F3C5DA7;
	Fri, 27 Mar 2026 07:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596381; cv=none; b=olbmpT6KdzWAwpA1WDS6UutjXAHq3ksY2zhGZPogxN4bzTqBLIry5gTfpjNBoKX+Lp7UsmrS1il2V3WX4k2Y3igaeF070gEgcn9epBo72S2itxMGZyFS+UzKVrHmghZYOFt2qIVQbVI1MhRIQ607OPyWGirAH9Yx6P4FomJ/yhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596381; c=relaxed/simple;
	bh=Be5FZJytZwUniGnw3/hX2bUc1+NUCwvYJMxywNXzACY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDJ+ws+b/9DFJOQKb3nvrds2YkP1bde97FWWZDS4gZbDW0qB27rVbfg9+mjkAHTVHPiPgWapPLWAm7GaQqqFRHnvTzXwMUXZ7HDqSQ1T22t8l70jLBsJ878kOJFIt64A20chTZTCCXGe9lHa+0EFhpnZl1b0qWdTQXqVITvLovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZfjzMTa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZfjzMTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B9C19423;
	Fri, 27 Mar 2026 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596380;
	bh=Be5FZJytZwUniGnw3/hX2bUc1+NUCwvYJMxywNXzACY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZfjzMTa0MFtD3RrtlBODF/+SJWqHs/uKI1AukmCMYqaqLdfV38Qf+6qKujsuXdjQ
	 2QK2+u88rC9C76Vb34FrKwg/GeymIM3EBtSM8iqYit2ghMjfpOGJh6w11AwwllKAlC
	 BLoSikcynqMKoqJKIRFCQqW6F59C9R30Lt43Wc3EWNP2a/CKzrnUOQ/TM6Oj7Jkb2O
	 y/riq8LTh6QhrnIwivj7d/k48guSpm0tK1kyYAxZ1aFX2l6QnVa1VHy+1k5IFzak0/
	 P5AXBf8AM4V/7MkI94phU1nEV6h/xA51CiZAjOTDAiQ2qQ6HpwKzXh3bJ4cYPjvNeq
	 J0kzVh5MgJoJg==
Date: Fri, 27 Mar 2026 08:26:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: tegra: Add Tegra238 CBB
 compatible strings
Message-ID: <20260327-funny-hospitable-gecko-fa3fdc@quoll>
References: <20260325125726.2694144-1-sumitg@nvidia.com>
 <20260325125726.2694144-2-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325125726.2694144-2-sumitg@nvidia.com>

On Wed, Mar 25, 2026 at 06:27:25PM +0530, Sumit Gupta wrote:
> Add compatible strings for CBB v2.0 based fabrics in Tegra238:
> - nvidia,tegra238-ape-fabric
> - nvidia,tegra238-aon-fabric
> - nvidia,tegra238-bpmp-fabric
> - nvidia,tegra238-cbb-fabric

So you just pasted diff contents here. What's the point?

Comit msg is not a copy of the diff. We can read the diff.

Drop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


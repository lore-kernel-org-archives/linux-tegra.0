Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717BC2264DC;
	Thu, 26 Jun 2025 23:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982035; cv=none; b=TnYS2s2dL8OLlkFog6N70Zg/qpntmW3/nECSxwGIw6uvckbteGIwDr1DEeLJPssJWFfw3ZgOY93jmNFFAKxzqlaYt6/lnFxYBUFeDapTbBBMoaJRTmAL9VkEuvMc5x6K/fJmvkcCPVdvpwuCxVXatyE0s8ZKFtzL+FmKgLc6JaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982035; c=relaxed/simple;
	bh=GJQFIPNcjCjdea83GzmCI0iha7RFTwP6k5rWzwQyL3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llYb6aR/46W6rdEQ0R0Y7LUxUwJMdDR3RMTJlvwKIc98vz36D5nVA1MxqUWes3ekpe+2FFNAOzg5j5GN9w5eUY5uM7PNx/OY0rBy1mJNWUv5340Dnasyzo4bLrtMTezD+7I7uzmvtOiB/0a0ill8Bugyi5BaQLEQhQnqBDMwxd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dweRtSC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dweRtSC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74A1C4CEEB;
	Thu, 26 Jun 2025 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750982034;
	bh=GJQFIPNcjCjdea83GzmCI0iha7RFTwP6k5rWzwQyL3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dweRtSC+jMFRp6ctSL3XZu+0OGiqiPWppYHw02QMZgrqbqgS3TQCCNra+hSFCyRgT
	 gMH72eUJnkl+tg9HJC9db/qLOrNor6H3YeYTVCdsbnO+SODZALtk31njg+oE1IUENm
	 3ArUCz+XmhaeIYji0kwuUJdmjlWmdaQK0A3EfZr9V/CYZEf2HTOFlZWCe3RHeKCal0
	 UHHCIJAspMk9Oj3/SMQtaAohU8utTMZrM83kdzH1Dt2L0uecg/Ve9PmwT2xufyApBo
	 mcovUgUBrkg0vLgfOUZzUrezaIqE0on1HSFHn7SmamZqm3JaPTpv3plh1TaFCQceZl
	 /q3XMaX9owy8g==
Date: Thu, 26 Jun 2025 18:53:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Ion Agorria <ion@agorria.com>, linux-kernel@vger.kernel.org,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus Portable AiO
 P1801-T
Message-ID: <175098203360.1431609.8731525287688873454.robh@kernel.org>
References: <20250616073947.13675-1-clamor95@gmail.com>
 <20250616073947.13675-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616073947.13675-2-clamor95@gmail.com>


On Mon, 16 Jun 2025 10:39:46 +0300, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Add a compatible for the Asus Portable AiO P1801-T.
> 
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


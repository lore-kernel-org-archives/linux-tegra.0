Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFD30C157;
	Fri,  9 Oct 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533262; cv=none; b=D4DNloQlI8qlE5GRq/mqcll3ZcUIGnZMN5e2PrVL0hlcPRbTYN5j3Bo4sywIOfOhrFTgFQ9T7W/XaktILbcB/I6Dv1mL+76CGbvvb3u17btdIqHdmgfIwPRKInZT3/LaLi+vd6NlD9VoE6xj1m4Iza2lTPYqxa2Ah6n/lNz+dyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533262; c=relaxed/simple;
	bh=/qqvs4XSDIENh5BFTmEIXbC7YVVgc7goDh6mscL0QBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH2yqUbbCz86+1GiEYUeq1QyV5SvE5awRydlMRSSXE1aOFGv1ZZq71b5WjTSSIkvH2Szx1as98AzcfYKejxuUoh6fUI6xQ1X1s+dJ6rYBs1cm73jPbL/aaWPB8YMgOo2u/pgkUrRoCKvP7BKGyBjCqPOVW/xoGiirRvdZRbOAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTwnynhJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTwnynhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4301F000FF;
	Fri,  9 Oct 2026 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533259;
	bh=/kNvVp8JCnz6l3mxn462kmLGkEwADtkdhDAdyThKQWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTwnynhJ2mbNCajjri09cvqUnOACHMgfWrg1HOStcTmcjjcH+9d+WmZAeVwhyRGh4
	 jxG4zMtAfeFNoon4vfW/eCV/6owf7seqRYpqmmNJmZxIbJ1gYKzlWAgx8j4GzLpHlJ
	 JnfRUhMeuv3ZjKecKansZNntPtru1QVRwuktSDeaTtXKDUD9Nv2YA33pePtIW5zwm0
	 zmcWDWmvCNQIT565yG0/pRes5JuejP18Vo8cBGSlEuqPoxwcERNPDorGhSwQVVnrcn
	 +JOIA8jk/1fRO/PmV4rfj4Uv54sPLPYOTFFaGU+rd75zK8ip3UwCxEveTPAKKvvjPq
	 EteXXs6neOmNw==
Date: Fri, 9 Oct 2026 10:07:36 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	JC Kuo <jckuo@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Message-ID: <asigyGqnlLUGpfo-@parshuram>
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
 <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>
 <y7p44oeut66usohn3hdfsx2fndlxhup6osok6uo27c5xreyjvv@uyk37kiedv3u>
 <25b96f0f-afc6-493c-9428-ab00a0bd9aff@nvidia.com>
 <576e4762-4ced-4abb-99ef-a895415e30af@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576e4762-4ced-4abb-99ef-a895415e30af@nvidia.com>

On 08-10-26, 13:09, Jon Hunter wrote:
> 
> On 07/10/2026 17:27, Jon Hunter wrote:
> > 
> > On 07/10/2026 16:20, Manivannan Sadhasivam wrote:
> > > On Wed, Oct 07, 2026 at 03:44:43PM +0100, Jon Hunter wrote:

> > > 
> > > This is just a mess. As a followup patch, could you please please switch to
> > > generic ARCH_TEGRA Kconfig option as done in this commit, 6b5e2f70a95c
> > > ("PCI: dwc: tegra194: Broaden architecture dependency")?
> > 
> > Yes that would be a good idea and yes I can do that as a follow-up.
> I did see the latest sashiko warning:
> 
> "Does this cause missing declaration warnings (-Wmissing-declarations or
> -Wmissing-prototypes)".
> 
> I am not seeing any warnings but I can also address that in the
> follow-up.

Thanks, would appreciate if you folks can get this sorted. I have picked
this one though...

-- 
~Vinod

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7F21FF2A;
	Tue, 15 Sep 2026 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515144; cv=none; b=sz480FnzVDjcNJHo7sWT2qNHqMhyUxJGakN6CLUWXvxeGdlfHnj5ZGsfatEAfCxqKXD9tN8dg9LEaQT6dapVMajm/UwfNqhvLr9l3uw+yZe70fkvg3GofGYZMMdp0fTB0G8vmzFLoxGs8w28kGyR/NgttFys8x3LR0IB1AlEVAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515144; c=relaxed/simple;
	bh=Z2JAWqgXpfwJr7+jDv7IvAocGIyOd7kewy0XNeNLSw8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXlduBayDVdSLybX99udw0ogwA6CiKuiojk3vsiXFKlBlxOWYc2XcLwPvNeScJnUI/4etpsLG0UuEv5YczNbkjNzY5aDmjTvf4dXShFR5YDYO7ZXAvE67kmLdnN1q5ruhRGDc4QCkToiIytBU+j9PbmxCpFvY+asbDwhJOMU298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRWTuTyr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRWTuTyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27461F000FF;
	Tue, 15 Sep 2026 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789515143;
	bh=u7tOSiJtMExOBOyjDsi7xD/TL5u5exguDky+X8Nqm9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hRWTuTyr9GYIjCssj+C3+iBtM0vXALX7+ecOt1iLoawNOq8fqqS0RSiBqgSZ/8rKQ
	 7PSAqh7IsJz4bS/7kiba7Jp6cJnybKQz0U6NCKtvWr1s+Idf8Twk8uid9L44RKiFKS
	 /Tev4NbfucxaQtECYpXQsXk/RyEiKrJtNJ6qHyQ2YGvQoUcEjli7+cki8t0ilgy2kl
	 Bbc8TSFMpwszwIiCMeaA3Egu8b8opjb0jmj6EB9EuBCJY+PZKjoXA4OoIY3kYlu45g
	 5ZmlttrfHF4AtVHzdUxhdW5M/1sIrRgd+QqWy4F+lqSp0rdRj6FRSgul0RTF7y9plJ
	 C1sdZ3g4OavGA==
Date: Tue, 15 Sep 2026 16:32:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <20260915163222.79e2d2e8@kernel.org>
In-Reply-To: <aqKL_UX7bFt4BrYE@orome>
References: <20260902003004.453960-1-thierry.reding@kernel.org>
	<aqKL_UX7bFt4BrYE@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 12:53:15 +0200 Thierry Reding wrote:
> On Wed, Sep 02, 2026 at 02:30:04AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> > nodes named stmmac-axi-config and phandle references to them using the
> > snps,axi-config property.
> > 
> > While at it, add the 10gbase-r PHY mode.
>
> Any comments on this?

Looks like DT maintainers are overloaded / AFK / both.
We only retain outstanding patches for 2 weeks, you'll need 
to repost this.

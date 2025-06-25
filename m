Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05552C15A3;
	Wed, 25 Jun 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868676; cv=none; b=AawL6b3ZHJh+rGEa6KLXdXqsRlx0xPSZ4LHpuYL/aLgpFgPmgl6xtmOxRUTnskeik2qNxBKMnUlmOUSqnFwaWiWbkNo06xtarXy3RVxciyFQnN3TTliLeBqkLWmtOta3zISntTX7nnymeRxRqGlCstroBMgbG5DeIu0sfeV5JbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868676; c=relaxed/simple;
	bh=/4ACtGNW/kpoUGSMkvHhi1ifdatRtUCkZINULW0p1jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwyL5r7YqVQcRZiMjtFn9mVwkAOLb0AnppQ+uAeFabmIOIKTFCfd5mZJVz58Sn5YteZcoAYwGthigt0kwxbqIH6ArNCvp09e0x4jn+GHqIluXOmcem+yubF9Yxzm3FMzdXLdP8wZ51gUTi5WQrioiD/B791gcJcYyHUIg1cTX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Q3GkIrz+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Q3GkIrz+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+7wYN+JWrEX2DiySLiFAD6+bfGgv+ghfIoHHTi5gyD0=; b=Q3GkIrz+ddO3ijUSB9rqOi0dkl
	BMPu60NXivpY/5rM1/UYb8eYYR3WRE6QJN/jYk+UoaNy4ec1hLdtB59IOoltGLq0gOrZ9PNa8WZKM
	4XyqUxkqXhj3m2XhYe/ekQe4hm3TYSawabSf/a5RE1LvkltaTepEP0BUXxOZgyBovFiM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uUSus-00Gwzd-Lr; Wed, 25 Jun 2025 18:24:06 +0200
Date: Wed, 25 Jun 2025 18:24:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	Alexis Lothorrr <alexis.lothore@bootlin.com>
Subject: Re: [PATCH] net: stmmac: Fix PTP ref clock for Tegra234
Message-ID: <4861a4cb-d653-4c5d-8d96-c7acac501004@lunn.ch>
References: <20250612062032.293275-1-jonathanh@nvidia.com>
 <aEqyrWDPykceDM2x@a5393a930297>
 <85e27a26-b115-49aa-8e23-963bff11f3f6@lunn.ch>
 <e720596d-6fbb-40a4-9567-e8d05755cf6f@nvidia.com>
 <353f4fd1-5081-48f4-84fd-ff58f2ba1698@lunn.ch>
 <9544a718-1c1a-4c6b-96ae-d777400305a7@nvidia.com>
 <5a3e1026-740a-4829-bfd2-ce4c4525d2a0@lunn.ch>
 <b54afc33-5863-4c8b-8d6d-24b4447631e1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b54afc33-5863-4c8b-8d6d-24b4447631e1@nvidia.com>

> > Now, lets consider the case some devices do actually work. How are
> > they working? Must it be the fallback? The ptp-ref clock is actually
> > turned on, and if the ptp-ref clock and the main clock tick at the
> > same rate, ptp would work. I _guess_, if the main clock and the
> > ptp-ref clock tick at different rates, you get something from the ptp
> > hardware, but it probably does not get sync with a grand master, or if
> > it does, the jitter is high etc. So in effect it is still broken.
> > 
> > Can somebody with the datasheet actually determine where ptp-ref clock
> > comes from? Is it just a gated main clock? Is it from a pin?
> 
> Looking at the datasheet, this is a pin to the controller and sourced from
> an external clock.

So the fallback of the main clock is not likely to help, unless by
chance the external clock and the main clock happen to be the same
frequency.

> AFAIK we have never tested PTP with this driver on this device. So the risk
> of breaking something is low for this device.

So it seems like the simple fix is to list both ptp-ref and ptp_ref,
pointing to the same clock, along with a comment explaining why you
have this odd construction.

Please could you test that?

	Andrew

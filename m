Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372B36654F;
	Mon, 22 Jun 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120825; cv=none; b=gDdbg8BS7T6fiZXh+XTVHY2VFr7l9/5/1/s3CApivLEm5saNTL/Bz6p3EC+81w1g2SvlPdm/fwvO0C1IqXNUzvla29uLF0Cc6EbOl9Y8oQsqyc1UUW4pptcl7KItwJ3W9nMWam7tKuRLCcccNbKl5xM+C/aj1YtzQoZOQieVO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120825; c=relaxed/simple;
	bh=bOIY2WZnm0CgqRfx/ETIxznLmtYfpjNr9KXBTiKrpO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoeljIBx6e18Gkb3H7G9SAKP6IPQr+azDT2e8gub97N4thz2sZ97m5Dnhoj0AgIuYvxHbUbimjhj27hcOXqdiF7d7KMQN0oN+pYk7IHbMqOXidLwlot71W3upLZA47/9bLLz8DlvPjmei2LprwvEyLDCPVJrMB76rDpGKRjo03c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=I/6TwtnR; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="I/6TwtnR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zY8qSZX255P9n9gI0VC5+CNzygwUeaNhjJtc3kB3B8g=; b=I/6TwtnR/Q2UXriBxj8Qgfk8Ib
	/AqFJI08mxJR7S8F82F1kp4VJ56TvF5DPqb3AA44pjx6K2x2uLg7XhlkLGUx8EGixjOX8FfLZVDTJ
	O1pq84SCnbj3nfBoCb3OP1ZjAC0bJh7rNXpPrcz1cHkkvWif8nyD4pYOrtP0atmIhNHguOmVrcdjg
	MUf5HYiqwlTDJHjLeAKEBeZiw+b2+WHjmkroIpgmj2ePfF3byeAdqObWs5Xa5QaOv4/3XMMvowX8g
	hZ8PbSZ2FVKJx2agXoUbjaUaYnIL0eWEWVJjz2GDZ3XOvMsgB03dgjz8/Vp0DsQ0R3kHGW2Q5uWeK
	Oj07gQzw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wbb22-000mHd-1e;
	Mon, 22 Jun 2026 09:33:30 +0000
Date: Mon, 22 Jun 2026 02:33:25 -0700
From: Breno Leitao <leitao@debian.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
Message-ID: <ajj-GEpENo8-7cxx@gmail.com>
References: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
 <ajAa4JAXyssMpr1R@gmail.com>
 <ajjfgOLpDXuVHpI0@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajjfgOLpDXuVHpI0@orome>
X-Debian-User: leitao

Hello Thierry,

On Mon, Jun 22, 2026 at 09:24:03AM +0200, Thierry Reding wrote:
> > Have you had a chance to look at this one? This is showing up in my
> > Grace all the time.
> 
> Yeah, sorry for the delay. You're right in that we now get the warning
> until we end up calling tegra_read_chipid(). However, I don't think the
> Fixes: reference is right. I think this started showing up after:
> 
>   8b8ee2e56f95 ("soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info")

Ack!

> I don't think we accounted for tegra_read_straps() in that case and I
> suspect that we're not seeing this elsewhere because we do end up
> calling tegra_read_chipid() earlier in DT systems whereas for ACPI it
> might only get called at a later point, if at all.
> 
> There's also this patch:
> 
>   https://lore.kernel.org/linux-tegra/20260514051252.2401568-1-kkartik@nvidia.com/
> 
> IIUC, that's the only place where tegra_read_straps() gets called on
> ACPI systems. Would you mind testing that patch (without the one that
> we're currently discussing) to confirm that that's the only callsite?

Sure, I've just tested it, and it doesn't hit the problematic path.
Thanks for pointing it out.

> It doesn't really matter either way, because applying your fix here is
> the right thing to do, but it'd still be useful as a data point.

Agreed, they seem independent. This patch fixes the issue, while
Kartik's patch avoids hitting it.

> If you don't have any objections, I'm going to replace the Fixes: line,
> but otherwise this patch looks good.

Ack!

> Also, I'm going to check if we can get some better coverage in our daily
> testing for the ACPI platforms. Do you happen to run any daily tests on
> your systems for linux-next?

Yes, I use my Grace machine for development, and I am usually on
linux-next, so, I get these crazy issues from time to time.

Thanks for the reply,
--breno

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570219923A;
	Thu,  6 Jun 2024 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697444; cv=none; b=WpVz2lI4DSIDFtmLPibOPBSh+pFTjv/x7j3aHlhqSS29cj9ykzHt1CLdB7x3Pt+5qaaFoFpT7ZKhS7plOnSyjlmbhfgv+vFrvfWHCl0X4FKJXffTu3DTEVJUsUlBd0O94WtdJ8uwUc2bATOd/VpaSACLrBX0+cfjJS1rZuNujDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697444; c=relaxed/simple;
	bh=BzBvKfRYf5H5w8Tr9gYhIFdphdps4vJOBgdCivkqei4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSeAkrRahBDyYzLklZ/5/mothGyDRSSPLkew7WvuQ9I9n5s2tZLggKjUMDfkfZ4LBmno/voyEAlfqTDL9xdTZ3EJHChwypsHrk61Um2yuTZd76HMIFiFpnBc92ruZWi1ms/5XAUSApf678e4HJo4B7iVjVG6YV84WumgunZp5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXYE+7+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXYE+7+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9840C2BD10;
	Thu,  6 Jun 2024 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717697443;
	bh=BzBvKfRYf5H5w8Tr9gYhIFdphdps4vJOBgdCivkqei4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXYE+7+96aKrBBGPngY+kWo816vcDRyPO2x7sjF0Ul7NhOOQ91Sy0uig2dXTgetmp
	 HSmmBVmnyqBwXwnGAnHxIOaQligPQhL5/nSDQOJDJgdS4/IZBA8jdAdg8cRbJcA2Uf
	 +dnO+pDdvvPRsVaxZ6FBvoJDglntiweXDs2DuZI2ohKLZT98GnYXMV5mqmiD0Qz4DD
	 kn+zoYdZ8B4blL3iUHl7ZiT/VxV5oX2z1CLxYYZuyk3gPH72loc0CiSpqoMttU9TB7
	 hfEE2Hrzfu4TwK+e6U15I4dke2xuc3rzSDPQrcwmXM/sAIJKh0D2//JwlnGqHgfbha
	 uJBUxffqiKssQ==
Date: Thu, 6 Jun 2024 11:10:43 -0700
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, andy@kernel.org,
	akpm@linux-foundation.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
Message-ID: <202406061108.1D3E64882@keescook>
References: <20240606144608.97817-2-jean-philippe@linaro.org>
 <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
 <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com>
 <202406061046.A2137C9@keescook>
 <CAHp75VfDjiOkvNxDXUkaptxmJNP18sfVKU-3H6p=08azzaD_Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfDjiOkvNxDXUkaptxmJNP18sfVKU-3H6p=08azzaD_Kw@mail.gmail.com>

On Thu, Jun 06, 2024 at 08:48:37PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 6, 2024 at 8:46 PM Kees Cook <kees@kernel.org> wrote:
> >
> > On Thu, Jun 06, 2024 at 08:35:13PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 6, 2024 at 6:56 PM Kees Cook <kees@kernel.org> wrote:
> > > > On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:
> > >
> > > [...]
> > >
> > > > Applied to for-next/hardening, thanks!
> > >
> > > Btw, is it possible to get this for v6.10, so we may start enabling it
> > > for others?
> >
> > Which others do you mean?
> 
> There are a lot of users of kmemdup(x*y) which I want to convert
> sooner than later to kmemdup_array(x,y).

Ah-ha, I see what you mean. Well, I'm not sure we can do v6.10 for this
because rc2 is behind us, and that's what most subsystems merge to. I
can land the patch for rc3 so there will be no warnings in Linus's
tree/-next, but conversions in subsystem trees will gain warnings, I
think...

-- 
Kees Cook

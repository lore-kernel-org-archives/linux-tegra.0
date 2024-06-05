Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB3A188CBE
	for <linux-tegra@vger.kernel.org>; Wed,  5 Jun 2024 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717592206; cv=none; b=tjCXe/1cYMabybJF0zzz18xIURMQeWalODj0gdvtCIsljMxiEJd6TBuvPG0oVPxxSpAzPePSCPqZ9u48MEF69V3u1zf7o78Qz/d9rEh1F1bL2k8n0/sYbXlhTesYejNlYug+AZQTNNcRYUVGVLXCyiaUSwPpDNGqvjflpkVKVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717592206; c=relaxed/simple;
	bh=jGzEddtQk5hB0DbppLPpb3NGlYBWqBx+t3ye8Q3Fj3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bjw71MrUMblgLIYYP2mVNJ6MGBFBhttueUXiAcSYsqrnQs+NTMi1JDd+dF/m2D+Mw/hokhjfGvuSq5NFT6fTMtfplgNBlqYqIpQcObRtXU1SK7m6JmKdhtenWF8rkOKeojhaKsEFffLNiJNaOWzlbxP8nYYY/CexB8008YzpqZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lyw116i/; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lyw116i/"
X-Envelope-To: jonathanh@nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717592199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HDvR2BJJ4XVS24JY6c7eVBrquWeT9EpRCNZeH+8pBFY=;
	b=Lyw116i/jSj1dQYfZGwRKdX7TRhpqZFdLtcdGrb5fEoG366WFjXUZGcam6QvkxL91MvPpS
	8FjIshTQsh35g8OkPXwS8hGuPE/ilhWhgbJMx7n9z/Mjwn4V5Q3OeA6ecKDspcghJHSoPF
	AJwa/UDrZDrLFujNdy7Zvh62+Wotqlk=
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-tegra@vger.kernel.org
X-Envelope-To: linux-kbuild@vger.kernel.org
X-Envelope-To: masahiroy@kernel.org
Date: Wed, 5 Jun 2024 08:56:36 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: kbuild: mksysmap: Build regression for next-20240604
Message-ID: <2b6llsqhqvsc3qrtsqlv2b6353kvuldwrp3xs5v6jistuskzeh@hnlhxbzpvwzh>
References: <21cdf8ef-e2fe-4247-9390-4b3d975f80a3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21cdf8ef-e2fe-4247-9390-4b3d975f80a3@nvidia.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 05, 2024 at 09:14:23AM +0100, Jon Hunter wrote:
> Hi Kent,
> 
> Since next-20240604 I noticed a build regression in our farm builders
> and I am seeing the following error ...
> 
> /usr/bin/env: invalid option -- 'S'
> Try '/usr/bin/env --help' for more information.
> 
> These builders have an older version of 'env' that do not support the
> '-S' argument and so your change [0] is breaking the for these
> machines. I did not see your patch on any list and found it on your
> bcachefs tree [1]. So not clear if this has been reviewed and if this
> is trying to fix some related to Masahiro change [2]?
> 
> It is also not clear what the minimum version of 'env' is supported
> for building the linux kernel, but these builders have been building
> the kernel fine for years.
> 
> Thanks
> Jon
> 
> [0] https://evilpiepirate.org/git/bcachefs.git/commit/?h=for-next&id=973eca8db5570dd0c3f2b3190867138cc446eb3b
> [1] https://evilpiepirate.org/git/bcachefs.git/log/?h=for-next
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=b18b047002b7d3b19d9fb905c1bd2a214016c153

I'll drop it, but we need a real fix then, my CI builders are broken
without it...

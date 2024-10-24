Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C08189BB0;
	Thu, 24 Oct 2024 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753700; cv=none; b=WwPpmW/oJ5StIMVlnv3YZQBCPzoXiAKE0tG70eQbcjqrJR3ccs4ogZY+tXy7k3PVbbN9V+OkoFuz82YiEEVrUEFoBkquT4WA4c+Ab5Mx8Zt92bpKBf1g5kDr2T+CTiuSRu6csITJpL+QH4/DnWxfrbNXXFR4WC6NMUJQzTilLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753700; c=relaxed/simple;
	bh=PKc1Ezq4d15KDwftSYsYrCXzavd/TwVvK03GAg5yH8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRKc1LlqHuSDnD9aeTRZBQCEDADe+3oL0lsj/JTXLaD5Uw75kopl9SXjXzS04hFM5MRDMXozLq2lSf8Wwtm19fxTbX0kSko9vAfJTlXnxXZKDAMYKiwZ4l6D3VX4JChQSZt0TpsEEUcd0YHwrwlJO3bGSxElTEP5Qy5s6RrbBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EXDsSjLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EXDsSjLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C3C4CEC7;
	Thu, 24 Oct 2024 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729753696;
	bh=PKc1Ezq4d15KDwftSYsYrCXzavd/TwVvK03GAg5yH8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXDsSjLYy/i5gU8PDLYZ96TpQdUoX/l3LzwwOhNGiQ1i+55LFSBuh0KUoAjION0q1
	 3/eyAr6Zj4/7bU9Gcyj+8Ai+3vS1gTwNeUYvxBUXoUwnGvVSURyPzfUtq7S8GHfSBw
	 CQqZiDGcF6YDPG6noOQlLhky4XPIh7s+ddxatdR4=
Date: Thu, 24 Oct 2024 09:08:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
Message-ID: <2024102457-manager-counting-ff68@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>

On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> Probably easiest for Greg to pull in these changes?
> 
> PSA: Do not pull any of these patches into stable kernels. fw_devlink
> had a lot of changes that landed in the last year. It's hard to ensure
> cherry-picks have picked up all the dependencies correctly. If any of
> these really need to get cherry-picked into stable kernels, cc me and
> wait for my explicit Ack.

You can do that with the correct tag in the commit as per the stable
documentation if you really want to :)

But why would these not be able to go backwards?  What changed to
require them now and not be ok for older kernels?

thanks,

greg k-h

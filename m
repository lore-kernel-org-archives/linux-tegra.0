Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32CB16EB56;
	Thu, 24 Oct 2024 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753624; cv=none; b=ff/IV2Ur4WwSXDQVjib6qL4nYyT+5+Yx4w4YETFRjACVRTTP8xa52XgIjB4+a2kZqwqBge7AadqgwV/BtzEpOiVvA8/TImOoFRkLlRzr6F+C2TcJ2yP54yFwCMv8wOocXXPaMlvn3SmGXEX5jq/UQMd6jIAimGZaHwmGasgO21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753624; c=relaxed/simple;
	bh=C569kiRrg8EBzvrVBxsDovVURiA3bvbD+xQMy8MTaO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOwK41zmk2bF7CK5sV5tEU9ncEpTqelfUsOP1JXJQH0VZz1T0MBiK2spJTKfCnfkTH4vzAT24FvaUrUPar7MHt5e1SHAlKiUZBlExll8JsyKskKPu9aw9C4pE7I2he2TulBdNq/UYnPTkeX9nUfDqz+mnToAcds7+41SpB00Q2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vcR+ON1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcR+ON1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE1C4CEC7;
	Thu, 24 Oct 2024 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729753624;
	bh=C569kiRrg8EBzvrVBxsDovVURiA3bvbD+xQMy8MTaO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vcR+ON1zIdm5O0maAVHBiW/e9Z+mDFWtdnlURA7545m/v7ld0MzrrHrbftr60A8UM
	 cjD/QBovrRyxNdG8dH117G4LKWY5cxmnP2FbDJKxlXLsajOk3QcxaeixwRbG3SlP5N
	 Cj8fmrhLFnefYYpBpd1lf0IK3VV6qe4wobNUPqdU=
Date: Thu, 24 Oct 2024 09:06:53 +0200
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
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
Message-ID: <2024102446-robin-outcast-841b@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-4-saravanak@google.com>
 <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>

On Wed, Oct 23, 2024 at 11:16:26PM -0700, Saravana Kannan wrote:
> Greg,
> 
> Can you fix up the commit subject prefix to "driver core: fw_devlink:"
> please? Don't want to send v2 just for that.

Will do, thanks!

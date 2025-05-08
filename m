Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FF1FF1D1;
	Thu,  8 May 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706669; cv=none; b=Dk4ZT+617dWnyY7YUv7CBhqPZxokn8rAsy5YCpaiqoIN4Z2emo1BKX3QZ2IXGQLwKnaYDqJ2Q9jJJk1hCtQqn3whb2bDHUOyo7B6VXDrq5PzZTgPX3eSPb247zZkCGYgeJEWHjbCXxKMSUnvlDNMCs+QRgGztOdLqiZ02HEWWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706669; c=relaxed/simple;
	bh=RR5XVvwaxIpv4tFRMJooTfhy90KlIV7GW4E2LebVt2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpOcsac3G9TirW/Z1zN4JhloZUnv1CQUi5pSm7jnto+RC9peGG1yNUSF1PcMXuC7VG1b+JCfmBoR7JvEBP/RiT5RZeybAZXak87o3DR2wp9Bh+mpazda2c8BtrFo+R3gDThLWsPx2gBsifdrsPyvfDAmV/4xB0UI0grBWo6ZdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAAKnC+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAAKnC+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87923C4CEE7;
	Thu,  8 May 2025 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746706669;
	bh=RR5XVvwaxIpv4tFRMJooTfhy90KlIV7GW4E2LebVt2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAAKnC+X3v4fephXxf1UX4HLMzCL+GqreG0J2d0/k/3vdv5lrVumDvEUhT/sul1ek
	 RYJgrr+bCjkFZMvJDHOEWBZXJpHuRGuQS2Iz50+xteBUXVcE/LLF+4Zz7adLy0g0+o
	 Vxh3OZOjKGC1xnt4+cpuyHd4qmoEZhNR2zPlZtbP1er3XtcioQxSGI+S6snH8BmkBb
	 kSZqMaZH8gnWozkBqIvyj6grMKXjUM0ngPH2F/0ywHm0MwYOIuKkLXKOuYfZ8XavYa
	 IUWbFTkS1bn4lQ1yOqqoTwm4bDScwERvbsr29vaN8wIT5iS5o/3nQsHJwPBfL4gFkE
	 o5FRaP9dN5LYQ==
Date: Thu, 8 May 2025 14:17:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, kthota@nvidia.com,
	mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V4] phy: tegra: p2u: Broaden architecture dependency
Message-ID: <aByg58pvj3onDveF@ryzen>
References: <20250417074607.2281010-1-vidyas@nvidia.com>
 <20250508052021.4135874-1-vidyas@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508052021.4135874-1-vidyas@nvidia.com>

On Thu, May 08, 2025 at 10:50:21AM +0530, Vidya Sagar wrote:
> Replace the ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC dependency with a 
> more generic ARCH_TEGRA check for the Tegra194 PIPE2UPHY PHY driver.
> This allows the PHY driver to be built on all Tegra platforms instead
> of being limited to specific SoCs.
> 
> Link: https://patchwork.kernel.org/project/linux-pci/patch/20250128044244.2766334-1-vidyas@nvidia.com/
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

Looks good to me, but there will need coordination between the
PHY and PCI maintainers for this to not cause a kernel test bot
build failure, if the PCI patch is merged before the PHY patch.

Reviewed-by: Niklas Cassel <cassel@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2184339901B;
	Thu,  5 Feb 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288434; cv=none; b=Tks/dv3Ehdf3joh8fP5h7MuxarvGI5172uQv9lI5qG54lvqEzNgFzY+5Xd8BZK1hfjXQHSWkuuhgVO0kb0108Z2sH0VRpfgHHk8StEfaZaWnSELAYHcLFunhChDg4rNjEfrHBheFR4AOZXWcYW05EaXVw1akKhAtl8yv3JJYEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288434; c=relaxed/simple;
	bh=cyVt6afG2zaiVIN3kLSH5igkx2J4j8ntDnijhQZLwnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W872uSFG4ODrkyIS1HCgE6aHBCd5cAd++yzNvEBLGeQvdol+XNoUYOjlRri0kYKyDhUPj0Cqw8NxLJCEPXuy9gvwwojOHOve8+1VDTKqc9jDDv4H7Y15vYjyfy5Xm7piijqiho4jIfa6ciRwjQTnRSieL/HONvGNeA2eIJOFjqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiR2eQ35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiR2eQ35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D1AC4CEF7;
	Thu,  5 Feb 2026 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770288433;
	bh=cyVt6afG2zaiVIN3kLSH5igkx2J4j8ntDnijhQZLwnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiR2eQ35AHoP98gASByoCdSr24fHnWNLA4uZ1jVgabQE2O92DdNST4ZI/wWLQZzNO
	 Z3wsT2yHa8Gj0G0K1RLEaIitfH3MbE3wKkx5TuZv3nebFRGVqaCLfnvsE0Rkrmm/Oi
	 CJP8fJBM2eznADOM1YwOlwmlrLbaHNYl51cKzoI228j+uX8ah04VJHowv/9IQQqpKe
	 IglDzm4plZJBNdJF/eUVG6Rp2Eg+SuKA+1T0W51Zp2mo5K9qrTh/mRiLAed/Ln6CAF
	 V8sXzh2tEpijs7dxGN+kQ5qYAZ8SrpCZXOKhVFkl1Q44JeU58TnFo/D/3L0MqM3pql
	 bZQQuPhOQP3Bw==
Date: Thu, 5 Feb 2026 11:47:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Don't mark devices with pins as IRQ safe
Message-ID: <aYRzq2n1VU-fTXaO@zenone.zhora.eu>
References: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>

Hi Mikko,

On Mon, Feb 02, 2026 at 01:42:34PM +0900, Mikko Perttunen wrote:
> I2C devices with associated pinctrl states (DPAUX I2C controllers)
> will change pinctrl state during runtime PM. This requires taking
> a mutex, so these devices cannot be marked as IRQ safe.
> 
> Discovered through lockdep.

I removed this sentence...

> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

... and merged the patch in i2c/i2c-host-2.

Thanks,
Andi

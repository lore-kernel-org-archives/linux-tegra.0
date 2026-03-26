Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47362DA75A;
	Thu, 26 Mar 2026 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565173; cv=none; b=m2vhwcoDnT+LUXLDEb+5dHtR1dB/Df08seGlW0Q4LwH11w+JQ64MZE9McMr9vd7tpOhQ6E0wriDmY/f12W3cRHFRuTZz8nUVaDR5eVRKM+BNn4Mj4he+13LHNhB+pVCdjnd+XLHJy8Xrg9xuiw6AcZZOfInknTaAKon79Cd+u8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565173; c=relaxed/simple;
	bh=09hdXevDu1/IwNG3Menqnf6eWM8T+7oRxKD5M3zx4vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq1UGUzXktwT8Hrsrr25MVCqfO4pN472CfznrMrsYAyJkbk3Fhg+NCuVlq/HKhe0fCLAC+imB3Un19RBV/VMF4dlDjRfh2K16E7wOWyXE595hzL6ftmx677E8KkcI3QvxN3RoI98H3FV0vvdx+Qfe86YlArnOb+vdYtyForBH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXWhVk7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXWhVk7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F054BC116C6;
	Thu, 26 Mar 2026 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774565173;
	bh=09hdXevDu1/IwNG3Menqnf6eWM8T+7oRxKD5M3zx4vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXWhVk7saJLTqVL3C5AxqZMn5XX5loYsQnzqf0Tr1phZnip9Nd+MCUKGp32lNsPb7
	 Y+pgcDhEv+I3tVU/b+OGkXJDxCCaGgvQ5A7EPIJwVbbC7x1uNs1eYXAg4XLVOU4/SL
	 V8Qy6FsnJCWaEZR9i07dpsdG60OjcPoR4mqA9a9lUE20vUFeD5OZJa4YevrcbB6uLW
	 R5H30SKVhWW+9plytTSktuMqSM4jMDtt39d4/gPalh//z8aPV4P4yIFWb4YCby7laY
	 WituCVPfbmI18CBgaxQojP9akDGfftxVPWoynIqmylQQ5WILFbB5iu9tjUhb3tU/qY
	 k1mFiDuQ/Yp8w==
Date: Thu, 26 Mar 2026 23:46:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 RESEND 0/3] Add I2C support for Tegra410
Message-ID: <acW2-1Xvp4VARppV@zenone.zhora.eu>
References: <20260324055843.549808-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324055843.549808-1-kkartik@nvidia.com>

Hi Kartik,

> Kartik Rajput (3):
>   i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>   i2c: tegra: Add logic to support different register offsets
>   i2c: tegra: Add support for Tegra410

merged to i2c/i2c-host.

Thanks,
Andi

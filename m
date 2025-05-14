Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095D18C011;
	Wed, 14 May 2025 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239489; cv=none; b=UUuLMAhGeknTS5LRDFtbADqNlM7P+UEivcbriTf03pGlwjtA+O122qJDLPL6ovwYRx6db0VL0gtDgMrwSaTzCS1UNVm0siD8L0bw/L1xuij4CUhFuAlyDyq48cxRvKqpU3oRwQyH4grB/IwxBHDt9xc40/l6GYQ+51s/4iTZ334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239489; c=relaxed/simple;
	bh=9FKUWOJipi0rvxqpVFsZ5LYqcVI0NRqJ68uKB0gVQIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boQxXI9E/46+TrDjkd07J/sTdahgd3ArNeyDlJsMMEO0l7Ch++CiA2NVaut3n0aGVaYFVEfU9KbFuZ8L+tAy9SnDCRFZAJlEhEgpDQhTwiPccA/md81mS/BVMHxAoGwVhAWQJfgpRpWsWBbx5/sZHqHAakq1xzRI2BABNo6hzuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euaCr+8A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euaCr+8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2C8C4CEE3;
	Wed, 14 May 2025 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239488;
	bh=9FKUWOJipi0rvxqpVFsZ5LYqcVI0NRqJ68uKB0gVQIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euaCr+8AKPHRyz/S1xRm+eifwxkWnvCWj6ryx2SEkc/es/8/TklpQ27Apc/7mPCYn
	 ek6zQnZ5gjOkys6Zd2bOW7CxnIQQ1jlXU6BmqSHyyvsG/PChkIa97YSO1GFA7yMYWm
	 0LB0sxJB8L++cdbEmREWHAoam82GIh8/0eAHDMcsmBkBaDhMK/j9QAmVH+JRPOU2xa
	 cPRh1wWSYKaxPwTmSTD9CjiSrZdi8IKQk+rp9P9jIQgnE5H+KxI71ffQ9aTjdEqAiz
	 ra0FFH5vKpORB38+L1v02Ngl4VBHuyx2EdCQt/Iro80xSH4HDhvxkBm0Ml5tH2d49d
	 H2sMnC4juA9yw==
Date: Wed, 14 May 2025 11:18:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 05/11] dt-bindings: misc: Document Tegra264 APBMISC
 compatible
Message-ID: <174723948656.2532633.8102674613984687601.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-6-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-6-thierry.reding@gmail.com>


On Tue, 06 May 2025 15:31:12 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


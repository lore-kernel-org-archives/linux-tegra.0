Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AE14EC73;
	Tue,  8 Jul 2025 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752006064; cv=none; b=rIGvE+YB+IuLgNmWLeTP4YMzvy61vb2jL3E05sXWfS8zN/zpM+1y2zRHB76iNd3Mh0Do81SAfIUWo7kEDcm6jognH6s8WlFYw69ADq7+jfZWfl3MxpovOa7CHPbdfYd68vEG2B6ZDUl4ALj+yRxrRjUaccQgmlQclfFpZZHtn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752006064; c=relaxed/simple;
	bh=zqx/74K4jJO3iS9rVGq5D5oA2ZIFzpVGZMwbjqdUJ7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNTCOGEqCWJCg70BuW4VERHJcFHX28m3o4WmFnquaV+vqgmMaxDZl8R6CAsu2wcAQL/0fy8JUgqFp2V30l+oKFhnCMo+FPJSpUx0RJV+QHZ4PZGUnrTUIU4NhVTMKRxgFAgcXfy2yIFyOp1bsO4fj3sx6AH+4HSkz7W6FtZFbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhDrxV/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhDrxV/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68255C4CEF1;
	Tue,  8 Jul 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752006064;
	bh=zqx/74K4jJO3iS9rVGq5D5oA2ZIFzpVGZMwbjqdUJ7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhDrxV/r0/d4Qt/l6j2cg6nVvYTW6x4u7+WFjvoVRbsnKdk8pTk89x2OxovWcD7Pr
	 VsLTLprp9+kXpOAlSvcFFy+CkcKSBYu/N9TFEBwG+Zj4ULvhLA6HqM4pvRR/ne2dSC
	 Hz00yz+oSX2tFJNq6pQ9CP9vezQ2bUUfTeUQqrlRZjdeDrQiqnI0GkA9mk4ywXZ51P
	 1cBQiGDGxlIyqqNGZZIsDwqIiuWFbuM8FOrAXwbvEFq1Pnp2thEBb1cnNNd62DVVXc
	 7F/cgE83diZNvyoY9CVTNhPqF1XzoPBq4V+mfnA2P6GvxuskPJs1MsahbdcUC8T6FH
	 6eKhGEGJETL2A==
Date: Tue, 8 Jul 2025 15:21:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: Add Tegra264 clock and reset
 definitions
Message-ID: <175200606285.904555.15042694527619353999.robh@kernel.org>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
 <20250708082814.1491230-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708082814.1491230-3-thierry.reding@gmail.com>


On Tue, 08 Jul 2025 10:28:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The BPMP firmware on Tegra264 defines a set of IDs for clock and reset
> resources. These are not enumerations but provided by hardware, and 0 is
> a reserved value, hence the numbering starts at 1.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop -reset and -clock suffixes since they are redundant
> - include all known clock and reset definitions
> - drop U suffix for integer literals
> - add vendor prefix to filename
> 
>  include/dt-bindings/clock/nvidia,tegra264.h | 466 ++++++++++++++++++++
>  include/dt-bindings/reset/nvidia,tegra264.h |  92 ++++
>  2 files changed, 558 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
>  create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


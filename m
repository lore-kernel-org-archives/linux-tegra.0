Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D163CF;
	Wed,  3 Sep 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917928; cv=none; b=DOyWEkkk7xUtgxUFF1QUi0XpyCQXKVDGS+13YF4KVDaf4hfe8ZAcVQaJ4BykUWShH/FZ7Bb3yMSzyfG0PWjayLTFCMBmgPP+fqtk9G3QNwPUYe1nNxkYZqmdkDSCAm1OnyBWTF4ms37e/ecU53QBH/iPA0cGh+VxeTo3uE/FQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917928; c=relaxed/simple;
	bh=1QCnhHk4YrbcljgZa4CIM09QqYheSpXKbkWo83aUiBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1DFl4qmxOatHOPI/VhD24duE+S9Sn2mPxns2ynNrLtryRTSzkC5/fPquGnfQr+hisJvTgu+6vYOBW1KLyYw3zIB/v6+ai5dbfwVg8VnrMiSZ4sR+krB1SzwD8x8bOKeBkpHSSG1OYco/UF0f6+19t4QKP6eJCLSL47ADfYYbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkWhlLvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkWhlLvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4FCC4CEE7;
	Wed,  3 Sep 2025 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917928;
	bh=1QCnhHk4YrbcljgZa4CIM09QqYheSpXKbkWo83aUiBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkWhlLvRnJr6ayb4Mng7/14tuavR02NoAo9XeCgTB/5K3v5y26XRy3pL1nHIvzpVo
	 Dn38VyfEu5u4ggHiuf1rlqoblQScmF2gjYxPS26gnp/84X6prefSXBDc4SGcU4jVmV
	 GgByW2YTigHjEiJ5pghcpSJ6FL20HQZZiwYDM9E6Is2l5xL/z2SlqQrmZyd62mHfef
	 kHNH2kx4gOmI+ozktvajibFsYx6syJhF5oL43UkIn1HNWfgVDoQJx6Fyv2lTYgnXUY
	 Y76w5eD/VP6VjR/Rgij0/nEUdUcV+LE/WBEqS2iY+YWtX/nGpN5ubrn9oP9U7/I1j0
	 7bgomSEmNytEw==
Date: Wed, 3 Sep 2025 11:45:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	Brian Starkey <Brian.Starkey@arm.com>, linux-mm@kvack.org,
	Mike Rapoport <rppt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/9] dt-bindings: reserved-memory: Document Tegra VPR
Message-ID: <175691792593.2483010.8132765871876943036.robh@kernel.org>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-2-thierry.reding@gmail.com>


On Tue, 02 Sep 2025 17:46:21 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
> region of memory that is protected from CPU accesses. It is used to
> decode and play back DRM protected content.
> 
> It is a standard reserved memory region that can exist in two forms:
> static VPR where the base address and size are fixed (uses the "reg"
> property to describe the memory) and a resizable VPR where only the
> size is known upfront and the OS can allocate it wherever it can be
> accomodated.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra-video-protection-region.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


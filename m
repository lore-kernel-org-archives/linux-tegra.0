Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D423BBFCA;
	Mon, 20 Jul 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555052; cv=none; b=CdFUqL3YQqtIftMHDo34ZBxXQd8/UmP9gSXyqaRFOvy2WC0S5m7qeN0xHO8RnMa3z1LZQRjVRguG5WMyZSZzg582UHRw1bDqq+aVwj20XjWtZeJ6v7tzolCBc4X5U69BlF6F4Ttar6/xUGWPIuau/MHxSrh3ZvgV9Ypru0HqmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555052; c=relaxed/simple;
	bh=XGFixbbiOwAdsy2ypm135i5ZaCOaXMSILoIypCiila4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXlzED/S58n/X+kd0qTqPGqlQPBkuTBNLCuHa9RQlddDCiCA5LQHiEA32ZlB2KUAymc1bwaREHGLuTI2vuDfEfd2D0BoK18h8MEg4E2Ymf5iUbyHeAJ0BACC/WB/zDxvHLL1L7Lc/58aB73OpnkJ5mvZbCDCZKs1QgYPMZxPkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niFFJuBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niFFJuBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246881F000E9;
	Mon, 20 Jul 2026 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555045;
	bh=XqnGblZcW91SjoViuXqdn+jXGJtHKiqqNpxT/GvQwoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niFFJuBcFkiY0WKRIGo1cievzXRhwq02wDRO0m6vpBZo63FxLaNhzWbcjmbd/OPnY
	 uYl7Qx/ITXxt87j5bisFsyHnTa17ijUOreG34WHyBHY2TTQnWKq46/0RUzZJ0JcDfp
	 ZWq3WLt3UeGUaFBy7zhQ7DP+jyZ4R8hsp04I+SoY0k94avc1g7j+XDfhueQdjol77l
	 V36WEPmWmYa0FGXu2XzIwuC5HSsuWGAcOJ8liAWlmMbcRVlfEJOAo6Lvlxx616Y5iG
	 P6Azu6lA/En7xcRsmtAhXGLwY3YGPw3Y2hBKucGpZ7MJdYk+UI4Za52UNvNxXxHKGB
	 LardEKhki0d3Q==
Date: Mon, 20 Jul 2026 08:44:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: pmc: Document Tegra210B01
Message-ID: <178455504398.2730679.2251788276313602337.robh@kernel.org>
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
 <20260720-t210b01-pmc-v2-1-ca5317f8507b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-t210b01-pmc-v2-1-ca5317f8507b@gmail.com>


On Mon, 20 Jul 2026 01:31:15 -0500, Aaron Kling wrote:
> The PMC in Tegra210B01 is very similar to the one in the original
> Tegra210, but has a few powergate differences. Document this soc.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B2423E9F;
	Tue,  4 Aug 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829040; cv=none; b=M3omD/xutcPsnRngZa2Nbqoz9E+hs6Hj0EV+4GCKPrAE038YUb7Ru9YNkH5LbguIQhy7hp/wOGGIckBBhbi9MWxeOU14mGtk7YSYAq+byQX0ca6j6HAIwYAafe9qBtb7rapSoHHLDPlNUmJ6k29coQ7TZgyAuYOvUmu4aCvr35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829040; c=relaxed/simple;
	bh=fjIh7mJ6V69z2RFtgQaXtL+QwOUCeJWgVAYgLjiRRH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVB0lP7oAlU4SzQdfbFb6J6IG+EMvJBREcZ++uoBWLJ0TxRNc+Pn8/EQgZffzVaVrTD2wewbuCFz+f/m4sdZhfI3xCBEe+RNeX/Mm7yRM60dA/r6n/mrsH+DdqybLdWtCcscnTOxEH0AUWzkCdB9uy707Yr/POyZZxZfypDu4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY1qVYkI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY1qVYkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41661F000E9;
	Tue,  4 Aug 2026 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829038;
	bh=6csPkZzjQTHBxPIbRIi6L0kciYDQ7Fn1pno4mr0eBhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GY1qVYkIz4DRk/6LvJeVfewDwwGcYNqsjfdLtGNnXoJzP1EuOCwa/0Gau/dlWrCoY
	 /3O/9WlIgVljuDwKIA2I8nlY7XbRUmXZpvjZC8O3hMA19S2uQ9opxBajVYjn62Esxa
	 aQxNWqHkeZQofL5UBtXfitet+scvEtzpTXrzkDo6ZQ1IS+9S1mvok7MbobpqDApWfU
	 orL/8LoOODKNXPIFg1eOuWB4t3lH/39uhnDXULxk7A3xwXPr5XowMPbYJMBJG+0RfG
	 Fet1fO/7O9oyo5tge5p6G280FGLgvEN3hjR+8xtf1tcJk4DwHdZWcgDDlofMiBUfip
	 Q6dBNbn0Bvklw==
Date: Tue, 4 Aug 2026 09:37:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
Message-ID: <20260804-energetic-gracious-python-a6fe54@quoll>
References: <20260727141121.772110-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>

On Mon, Jul 27, 2026 at 02:11:20PM +0000, Prathamesh Shete wrote:
> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
> 
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin controllers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

This will break the users and only for fixing naming style? Are you sure
it is worth beraking ABI?

Best regards,
Krzysztof


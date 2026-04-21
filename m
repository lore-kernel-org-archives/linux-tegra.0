Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A3382F2A;
	Tue, 21 Apr 2026 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760065; cv=none; b=l0WPRfelaxNsiUQDuf3IYGh+ZUH5Ev5tu1zYYX1zsHF4jZ8ifMvZb1WcZDOVWx7dOslnvjqHaZeSqE/PQiGSyqX5A8V73zM7eAYRTaAFfPR78r4PBRMRM/7UKmHdnrNHYRfcMRW7lJpn+YuIS7Jwz87tsxKA+cuFYx/agm8327s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760065; c=relaxed/simple;
	bh=Re6PkS27tsd0yOjTlX5oqKCbdMGe0cLK39Tfpi1LFns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHszNonVy3kh0rDYoNWKTPcBRhLlEraL83brLtONs54lM87ZEXW0h4saudHFz+3r6T36c+tyWkoFY34Gn3BHAihFUgRDq6O4QTS9JThGClAffl386yEywo46EZyCiLJJstIjypuXBCSWTZfJUQ/Hr3CZzHx1WM0LuFuCBnJaUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6sNplOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6sNplOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0A8C2BCB0;
	Tue, 21 Apr 2026 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776760065;
	bh=Re6PkS27tsd0yOjTlX5oqKCbdMGe0cLK39Tfpi1LFns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6sNplOHjl3MPJz4RBuiI1fZVKluN1vPPulDXGFloOdsu1+/szvgdI933/vv1DljJ
	 DkUqKW3MCckF6Z+DpxitVLJqfSOIKEBb4r7fb7SDMcbT1Y7U36ANe9Cxuje62b71+o
	 +U3zA2ptDWnPnm4RRkczMDNKJd6c6I11+qbkcgxmiWWAWQdgiyLDK/QXtjJ21XxEf7
	 bW/7rKLWJFvIaTTqQRyz6QIZVmIL4emS54aLG4PHQK5pn3hOJKnYtzKq3rdkSbo+mb
	 P/MkHHeHCILCIOS7ehij32k9WY7To2TyftDuzXI4nZPJMkEU9ptF1WqczIkyATB4Wr
	 QikR+Htdlb8/A==
Date: Tue, 21 Apr 2026 10:27:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linusw@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add pinctrl nodes for Tegra264
Message-ID: <20260421-great-prudent-hippo-7bae33@quoll>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
 <20260420100601.343707-7-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420100601.343707-7-pshete@nvidia.com>

On Mon, Apr 20, 2026 at 10:06:01AM +0000, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Add the three pin controller (MAIN, UPHY, AON) device tree
> nodes found on Tegra264.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>   - Replaces the v1 "arm64: defconfig: make Tegra238 and Tegra264
>     Pinctrl ..." patch (now unnecessary thanks to the 'default m if
>     ARCH_TEGRA_{238,264}_SOC' Kconfig change) by adding the three pin
>     controller nodes (pinmux, pinmux_aon, pinmux_uphy) to
>     tegra264.dtsi.

What is this doing in the middle of other v2 patchset?

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4855471279;
	Tue,  1 Sep 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257198; cv=none; b=KXq361RHoc6a7AvuhRWR9tWNYGHgUjYeCoZuNx7kqrxP/16r6oxr00bhKjfqorViQCvfBhB/mU8wfkTO3poqmaa4PX96SY3ebEx0xBn8UJCKceo3oXywSPPGEtpZZ9jZNlUw6aLsZPOUtq1iofj3/vYGfBpVheuUy5sDeE3q+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257198; c=relaxed/simple;
	bh=N6vsrlm2hMd38203aM1W4fiuSrY4VcnvkKHxIfAHuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZR152sFyp7eL17TglIJ1KpvINvq2qxLLIWrKO4oD2SQs8siwH2NbkdLHjhmyrr5AZLHpeuZbQJekjtT439UxvOxI1ahOnpUfiwcMbhJaL/JLPOTygD2K+lCabzUrbViHz60q1MGPEP273FuouJrYdCd+5LraOWu3bZKymLQoOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iegxtGDk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iegxtGDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926F01F000E9;
	Tue,  1 Sep 2026 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257197;
	bh=N6vsrlm2hMd38203aM1W4fiuSrY4VcnvkKHxIfAHuGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iegxtGDkMCtYK+3NeX3SQQ8VBgA+JKB6ME8iqXiHmwoXULu+5vMFYUxzR8J+uFUsL
	 CNVJisI/VvwBuIHu3w4qPHfHy6fwWoywU4UNM5ngqHZu1/DGjM8+6Hetiwb1+vpAB+
	 e3ZfrVcJo06bBwIUx+9o7Dd4B3FvgPJELQqTTF9uqKfMlJtnKOqYYfiA42G2Wzz7mE
	 06mnl90V2inBYORlS/etIKXfQGX35qCsAr726exxEQDFL1WYdSmnJsdPJ524EJrNsW
	 VxAWo/KZPzwpRgLRRl5NyuEjymwTT4ScjmNm4nF4sZzn1fz+4ta/PjABXiptx3zDKs
	 OWv/kxo0SJ/4g==
Date: Tue, 1 Sep 2026 12:06:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: mathias.nyman@intel.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Message-ID: <20260901-heavy-sweet-pillbug-366318@quoll>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-2-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831185835.3732707-2-waynec@nvidia.com>

On Tue, Sep 01, 2026 at 02:58:28AM +0800, Wayne Chang wrote:
> Add the compatible string for the Tegra264 XUSB PHY.

Same questions as v1. You will get exactly the same one at v3 if it is
not unaswered here.

Best regards,
Krzysztof


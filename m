Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B223803E4;
	Tue, 21 Apr 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760318; cv=none; b=IqivSh/F75yGyGcA1WuUxXK1thh5rmbPhvDx59toAddXOXfdzokXmhork6ZvPZY2L783PqVTtOGLyBbrIdUO61xZXqxs/3FnANHSuOHXtQqpoqNUVceuaqjftva5twqSijqdBOGxQvS5YLFVN+ozFCh92VrjrLi9wOiubTHrBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760318; c=relaxed/simple;
	bh=lSG5mZzz4ZVxjl+XwgMwSpczw/DmjPVqEDVpkCtBrig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv0ghByqesTb6/NTAd277gZ7btJwGC9g2Ar1G0II11/aDU1pTDH2bH3xnOadfwucrRMe3uCRCF6n9jPllFTfYVbGRzVOgRztQNVfnbF/FCmKoChrjyGEgxTfn7Z9rvWlL9ZI89ABC6F/XDeU7lB7uH+JCBDRXDb7NwDnyjTp5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjoCr8C4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjoCr8C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343A6C2BCB5;
	Tue, 21 Apr 2026 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776760317;
	bh=lSG5mZzz4ZVxjl+XwgMwSpczw/DmjPVqEDVpkCtBrig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjoCr8C4ijUDzBvExFv6FJut8X1ldqhuxZGgnJCGCjMk02dnb++mabrhXLKHofcmu
	 jXtBRM9TSD9/aJC5XkHRutqj+KxWZwo3hksp8IEAGoE/RLWgRjEWg0iSqoOAPhWUYD
	 fydjW+Wy0GTGpGXjTwGw6z+Q828uQwWCU8ZGJuCmM1vc/O5xutEzjqtdyvrF8ILf5v
	 UVdssxPVlMS/ylcnfvfI+AUfdMWEuno0pmFOu911EL72SDpFcUM5Mv6gJasxDO1YqI
	 2sklmfQnTfy0TMxxR42knhmN8IW2TzdpZQVhAeJzC4o1Am5Mow56epKyjfnOtMfgny
	 sSR3QghOeFhEw==
Date: Tue, 21 Apr 2026 10:31:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linusw@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <20260421-spotted-trout-of-satiation-1dab00@quoll>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
 <20260420100601.343707-3-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420100601.343707-3-pshete@nvidia.com>

On Mon, Apr 20, 2026 at 10:05:57AM +0000, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra238 contains two pin controllers. Document their
> compatible strings and describe the list of pins and
> functions that they provide.

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830


Really, just try yourself:


b4 diff '20260420100601.343707-3-pshete@nvidia.com'
Looking up https://lore.kernel.org/all/20260420100601.343707-3-pshete@nvidia.com/
Checking for older revisions
Grabbing search results from lore.kernel.org
---
Analyzing 22 messages in the thread
WARNING: duplicate messages found at index 1
   Subject 1: pinctrl: tegra: Export tegra_pinctrl_probe()
   Subject 2: arm64: tegra: Add pinctrl nodes for Tegra264
  2 is a reply... replacing existing: arm64: tegra: Add pinctrl nodes for Tegra264
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Preparing fake-am for v1: Add Tegra238 and Tegra264 pinctrl support
  range: 59c488f24a80..90c14406cf64
Preparing fake-am for v2: pinctrl: tegra: Export tegra_pinctrl_probe()
ERROR: v2 series incomplete; unable to create a fake-am range
---
Could not create fake-am range for upper series v2


Can nvidia finally start using normal/expected process? There are tools
for that for a few years...

Entire Qualcomm, which upstreams magnitude more patches than Nvidia,
uses b4 (basically "must" use otherwise we will complain). Why it cannot
happen here?

Best regards,
Krzysztof


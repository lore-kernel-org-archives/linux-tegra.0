Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F53D3AC;
	Mon, 27 May 2024 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804937; cv=none; b=AhDTHOa4XsZP9mwAjUW39JOJD+GfAu3BJClIeEvFi+jENI3a3LK1GIrIphHf25FNRYeTl85ulY8wS09EJviGNBIK4NclUIIqi9cGu1lwIbwUBYoIQHy8kjbzqWvTb5Icf2HgSRF3qnOitIyhFzCYqgx1TXPSRHl1toLCEpBGiH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804937; c=relaxed/simple;
	bh=hKQGqOfpn1kHUXG/cujpVXBpa8AmXtm97t1U8PSTt/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuSEeJGspSjk5ryt6allachslRcATHD9lcoqv/WPt4newAlh3ceSNqpA2Op907CIvHTGq+i27f8DILYrYb/n7b6k0N+ofNrbVICV7uVdKEtUZAmVIeTUMXaSMh2HjwM5ZGBf8+QFJdiGwnl5VNOVKzsT1+10Ea1UETZZckDaK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=qxBKqiXL; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="qxBKqiXL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id ACEDE6001093;
	Mon, 27 May 2024 11:15:25 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 7d9KWrlX-sm2; Mon, 27 May 2024 11:15:23 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 605A06001095;
	Mon, 27 May 2024 11:15:23 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1716804923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FuHgaQ1v6Wp8uKnCLb+oHJPZpAb5D+hwZBNUulvhdaQ=;
	b=qxBKqiXLcVlvkSdT5zBvl8/sr89kdfRQrJSADLnUFTJni+De4Nr39fbPOX5PA2tU6lLLkj
	X24N3zBL9keLXkBEEVepm2Y3DZo+2eJ5j7zGEVDOxOEwwrsVa/6MBP0GwedQ0ZK75N6mB9
	DrvQsqAnBy8AAcHsJLk9vsx+YNa8OxM=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 202FE360096;
	Mon, 27 May 2024 11:15:23 +0100 (WEST)
Date: Mon, 27 May 2024 11:15:13 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH RESEND v3 0/7] Cleanup Tegra210 EMC frequency scaling
Message-ID: <scjwzfj3jiyqh2hgomlfpdxjpyurkhiyy5bks3damficnn3bc3@vogn5wp5exoc>
References: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>

Hello,

On Tue, May 07, 2024 at 10:30:43AM GMT, Diogo Ivo wrote:
> Hello,
> 
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.
> 
> The motivation behind these changes (besides improving readability and
> maintainability) is to make it simpler to add support in the future for
> frequency change revisions other than 7, where we can reuse a large
> portion of the modularized code rather than essentially repeating 2k
> lines of code with minimal changes.

Gentle ping on this patch series. I think this version addressed all of
the review comments, is there anything missing?

Best regards,
Diogo

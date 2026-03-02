Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46829AD24;
	Mon,  2 Mar 2026 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415862; cv=none; b=VzytEQT7jwVScp73c1puyhHgYWup3yuY+Kg8fgpz9bGem0gnArumWgQsRF05K6LDgsJCLnjQ95uNXVuEGEhG+y/PonUOi95CSU+Am+yioiRr+RpG45gBn/+F8+Rtib4hlBWGa9JTsS2ncllzYgxe/l29WpEtyylIG5DnfH0K9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415862; c=relaxed/simple;
	bh=zWyo4+FBMrEpXIw4GlJX+AnFXLDDUU4wgTagxUsYSis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otcE5uczCphFtpJCwC/YvJbuB6KL4G1oUIpkzzF856xKY1vJtet8Hat7NXzUnL//+EUMY/JEw/c40TTwcTakoM+3doXtbKydO8Ifolg6n8VPDQbiea5NzbBLIAv0CL93uOWWdEkMQQzHd5bzZjZBKsVMV6U9yqq6gp0FVaYLRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T6wP22+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T6wP22+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98818C116C6;
	Mon,  2 Mar 2026 01:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772415861;
	bh=zWyo4+FBMrEpXIw4GlJX+AnFXLDDUU4wgTagxUsYSis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6wP22+aWkJft5sdu5Zb378pmJiG7dfAUUss+tSPHlJma+GMZ53s2RpRxNJKlvQAP
	 T/+sQXIgd+gwvKsRFvawr/xxjSrimcEfxSmiOh+gcWrTINUDS2Pa3EBBXJP+7BEfWB
	 78zqltVB/+yajjiOUS7ur+rtWG1sbxrMlElZbBJ8=
Date: Sun, 1 Mar 2026 20:44:11 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Afkari Zergaw <afkarizergaw12@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Message-ID: <2026030143-next-plug-fcd5@gregkh>
References: <20260302013610.3815-1-afkarizergaw12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302013610.3815-1-afkarizergaw12@gmail.com>

On Mon, Mar 02, 2026 at 01:36:09AM +0000, Afkari Zergaw wrote:
> Add missing commas after "e.g." and "i.e." in the KVM API
> documentation to improve readability and follow standard
> punctuation usage.
> 
> Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Any reason you forgot to cc: the actual maintainers for this file?
Please always use scripts/get_maintainers.pl for who to send patches to.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64B49B5A3;
	Tue, 13 Oct 2026 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872107; cv=none; b=E90mihSwJCk8+ksBJlje582xEVDtPT7I3FkKvV2/KldqVToBiyL1CkuoUuKLox55suPgMAUZ3nCoJcO2SyFKabK/GeoArLRo70FoDRrg+mzfQKjQelAa76Ziiff/S55dmjBcAzF5cB2d9GhhZNfsuh6aCDfAukIR7UE5VmCdq5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872107; c=relaxed/simple;
	bh=B4TLxFoA5fWGo+aRQuYubbWnjGZ23wQ62C9vjrtxZrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7YEMi1uJjAn/PTVAhowx8kmZ3yirq5mR76Bw7IjPf6JID5jxxFzeMiaoSGcKTd0YAyeTr9hL2jHk9CHQ4B5D/MGPm7qiqB2TLyuxMB1S65jmGGKQFuLjvwgaESaLf6/5O5h+A4X/WCA45XH1u7sp9sVKQ3qLjeUwyRTMYs6YfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j1j/+2z1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j1j/+2z1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D301F000FF;
	Tue, 13 Oct 2026 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791872103;
	bh=7/HTcd/ghZikP278E0wslLpipCm1hEHgi+NqiFxc0II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1j/+2z1Ywm2IjgdeSC6wnOBeckzqqQCEyrm8eUUw7oreNW/mpC1jINTyAdFWYTOh
	 Mqi0HfS58D6kTgyefnu6cbSgtx4cx7KSL5wNYcVuMcpqMZlE37/V9zqoqkrK0QY2Qp
	 lczB/+6W8vDADXs/nfjtETfbz/puZAcLz9dr9iRY=
Date: Tue, 13 Oct 2026 08:15:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Dean Clifton <deaner92@yahoo.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2] staging: nvec: use guard(mutex) in nvec_write_sync()
Message-ID: <2026101335-expansive-veteran-c4d6@gregkh>
References: <20261012222926.7754-1-deaner92.ref@yahoo.com>
 <20261012222926.7754-1-deaner92@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012222926.7754-1-deaner92@yahoo.com>

On Mon, Oct 12, 2026 at 10:29:26PM +0000, Jeremy Dean Clifton wrote:
> The three return paths of nvec_write_sync() each release
> sync_write_mutex with explicit unlock calls.
> 
> Use guard(mutex) to unlock the lock automatically on any return
> path.
> 
> This removes the three mutex_unlock() calls.
> 
> No functional change.
> 
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> ---
> v2:
>  - Reword the commit message to state the motivation and to make
>    clear that removing the mutex_unlock() calls is the result of
>    the change (Julia Lawall).
> v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/

Please read the archives for why I will not take guard() rewrites of
staging drivers (nor do I want to see you use a LLM in here either.)

sorry,

greg k-h

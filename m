Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB62E11D2;
	Mon, 27 Apr 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261834; cv=none; b=kZsYm5qOKhb0zPP0a5cxj80IR7wDOnL1KxDlG4oWEIPdlqYSxTN6BdX68fmDQgqABFuOPbMyWDAtrO5+aJOOnjCtFp/rBwGHRk2nQcF5KcaoQOMAIkEtv7gf1uVY5P1EP4ghuce8KFojD5XiQmBjg9Yj+M+e2pQVKNHQfGVhljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261834; c=relaxed/simple;
	bh=Y5Lp23k3zJJFlxttZ/VmDA9hu3eVLe+0AuwRcDx5wEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSbLPQ9fMSymCgrWUlJksfWbpKJ/vAuA/GRluVcwKLYc68kbT8QtjGYeCMYZfftRGXvL03fkm293IbFeeuI/iTxajmTgAZgqMWJu2wEJmYQJ7I2anS8e/DH1rETmYmkJZGbUrIbD3MIvx5+UWZhbOOHVi3+wKsZeocotYPyNcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sze+oJxS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sze+oJxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6257C19425;
	Mon, 27 Apr 2026 03:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261832;
	bh=Y5Lp23k3zJJFlxttZ/VmDA9hu3eVLe+0AuwRcDx5wEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sze+oJxSHGomxtCIx8Cr6fVsiRmDQ1EqmUNCL9WTGuSo8cREkFY9j0BzXBndFSLZN
	 cWdccKad7YuF+vb1/r0l/17F9lC9011wI1jBP4cBCTv8B8lj2ubmE9UrTT4gVnQqhw
	 CL9I+IR8old0PwBGfFcs5bi5xlYjipOpI98SaA/U=
Date: Sun, 26 Apr 2026 21:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, linux-tegra@vger.kernel.org, marvin24@gmx.de
Subject: Re: [PATCH v3] staging: nvec: fix unconditional pm_power_off teardown
Message-ID: <2026042640-cultivate-flagman-0665@gregkh>
References: <20260413151236.612404-1-hossu.alexandru@gmail.com>
 <20260413200203.726726-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413200203.726726-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 10:02:03PM +0200, Alexandru Hossu wrote:
> tegra_nvec_remove() unconditionally sets pm_power_off = NULL, even if
> nvec was not the one that registered it. This breaks any other driver
> that may have set pm_power_off to its own handler.
> 
> Replace the unconditional assignment with a guarded check so that
> pm_power_off is only cleared if nvec was the one that set it.
> 
> Also remove the stale FIXME comment, as the guard addresses exactly
> what it was asking for.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v3:
>  - Drop incorrect Fixes tag

I'm confused, I see lots of different patches here, with this final
thread looking like this:

 Apr 13 Alexandru Hossu (  51) [PATCH v2 1/2] staging: nvec: fix use-after-free in nvec_rx_completed()
 Apr 13 Alexandru Hossu (  40) └─>[PATCH v2 2/2] staging: nvec: fix unconditional pm_power_off teardown
 Apr 13 Dan Carpenter   (  26)   ├─>
 Apr 13 Alexandru Hossu (  42)   └─>[PATCH v3] staging: nvec: fix unconditional pm_power_off teardown

What is patch v3 of?  What about patch 1/2?

This is really confusing.

When redoing a patch in a series, you need to resend the whole series as
a new version.  Otherwise I have no idea what to do (and our tools get
_VERY_ confused as well.)

So a v4 full series please?

thanks,

greg k-h


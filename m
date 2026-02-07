Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3B341AB0;
	Sat,  7 Feb 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471697; cv=none; b=eITX8w2boEd/fmHLKR4fjglXLu+9LMG2myd6EaS/lpJQhsJhDFqMXeGb5bVTQb9+Ebn49lHLCA+a2jy30JPPn4Dl/G5aJgmrvQxt5ZZzZLGMkPbnXkzHhbqg3A0o0j2KYtUXebphhajB+AYVUQTIHWiWpitQuPhZOEbxxbVs00I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471697; c=relaxed/simple;
	bh=4I2vxLMvMa/4tBkb69vcMjaYvVnfV7MPwo11euXXKFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSqgyRYPXnECp3LljqBIy18eH1wyiIbTl3RKbqcVpkThQxRjreLAteYLl3VbIlkMEIgIPJJvuSAmr0vReM7T09LPILqDT0xZ4Ptz8bwFydm1miE6GRG97ii3cXYtd5G7hWemto2QyAAyIazOcWpQNO8LpHOYyLUsEtKo1Dgyk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bLRbM2YY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bLRbM2YY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9243CC116D0;
	Sat,  7 Feb 2026 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471697;
	bh=4I2vxLMvMa/4tBkb69vcMjaYvVnfV7MPwo11euXXKFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLRbM2YYAawQcevk4TO2T4zWaZAmmyIlZ6oPbZTJP2y32HLX7bebx2qPtpdXV2VRp
	 eoeNp3dAvL1qt/eCc2S3nVCCNXET+ug1B+MFr2ycAeLFNEZsqwux/VikKPJH2zXKlh
	 /HvvLjyFh/rnSnsQM9uYMcSiAq6OKFhKkXZ/HUDo=
Date: Sat, 7 Feb 2026 14:41:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: use strcmp() instead of strncmp() with
 magic length
Message-ID: <2026020754-finalist-unbent-f4fd@gregkh>
References: <20260205234632.1964-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205234632.1964-1-iprintercanon@gmail.com>

On Thu, Feb 05, 2026 at 11:46:32PM +0000, Artem Lytkin wrote:
> Replace strncmp() with a hardcoded length of 30 with strcmp().
> The bat_type string is already null-terminated (set two lines above),
> so strncmp() with an arbitrary length is misleading and functionally
> equivalent to strcmp().
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/nvec/nvec_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
> index 2faab9fde..89dd997aa 100644
> --- a/drivers/staging/nvec/nvec_power.c
> +++ b/drivers/staging/nvec/nvec_power.c
> @@ -207,7 +207,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
>  		 * This differs a little from the spec fill in more if you find
>  		 * some.
>  		 */
> -		if (!strncmp(power->bat_type, "Li", 30))
> +		if (!strcmp(power->bat_type, "Li"))

Now the checking tools that look for "strcmp() is bad!" will come along
and someone will send a patch that essencially reverts this :)

Please just leave this as-is, it's really fine and is not broken, right?

thanks,

greg k-h

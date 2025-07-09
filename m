Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4C2580D7;
	Wed,  9 Jul 2025 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059165; cv=none; b=YL6aV8BjBLMFRprR3StsqwjD4CtxeueV+S0nGBJYZRRZ3arb2bIanUbxOvyLzCeKSk83UwYNS3BQi3RlEvH+OCdtYSDrqZ78zP/GFkBt2iUr2FDfOIf6/O1FfYRIPossVBfTm0PuauXa91VZM+YdgrYuqvtp6TRFqCpciDK1Evg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059165; c=relaxed/simple;
	bh=4VoxDg+122c2K2gnuT4+FeK7BlVbqegWDVw05YJfIjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvzdfCknp/En2CotvkUUOrpDwgmHT8Ywr9DYXEXODyNAWeBzFx9D3T1bd3ZpupqggwWRcVouTwIG6fHXhIQ1otEBenRMG2ok9k3N3npePxIsO/VvzC85q+tnDTa+kdNZTX6ZQ3pnp+yRhuPHCcuIUXJs9eBiuaYPEt6L1NasW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lCwwm8v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lCwwm8v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BC4C4CEEF;
	Wed,  9 Jul 2025 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752059165;
	bh=4VoxDg+122c2K2gnuT4+FeK7BlVbqegWDVw05YJfIjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCwwm8v7AaLG0lBfKR7hY5JLAXUr3d1tjQ2lGfk/DmpaPbsoaHSXkpVWImTdoIaQ8
	 z9f5lJWUvtfpGfyU+SvbCysgrkJjJMaJZ9/nMgD9SfcU9CQHKGsdWpBumYF+kkro8I
	 p9kQEHbzjmQPHR/i0q3tjVfY5NcgHrlfQvhC9Loc=
Date: Wed, 9 Jul 2025 13:06:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emre Cecanpunar <emreleno@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	marvin24@gmx.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: silence macro argument warnings in
 NVEC_PHD()
Message-ID: <2025070914-repave-feisty-b44a@gregkh>
References: <20250704152737.14315-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704152737.14315-1-emreleno@gmail.com>

On Fri, Jul 04, 2025 at 06:27:37PM +0300, Emre Cecanpunar wrote:
> checkpatch.pl warns that the NVEC_PHD macro defines unused arguments.
> Use (void) casts to prevent unused argument warnings when the macro is disabled.
> 
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/staging/nvec/nvec_ps2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
> index 575233fa1677..38e736b3761e 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -28,7 +28,11 @@
>  	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
>  			16, 1, buf, len, false)
>  #else
> -#define NVEC_PHD(str, buf, len) do { } while (0)
> +#define NVEC_PHD(str, buf, len) do { \
> +	(void)(str); \
> +	(void)(buf); \
> +	(void)(len); \
> +} while (0)

This is really not needed at all, sorry.  Especially for a define that
will never even be used.  Can you work to remove NVEC_PS2_DEBUG instead,
as that's not a good idea.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771B275AE8;
	Mon, 18 Aug 2025 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498991; cv=none; b=TtoKuOtsahtLiLhuKM5/KnS5mzZExA/Jmo5c2a0tuI1GmZ4LP7ikiDtB0wCPFdL5M0oO/uiDlqp2uTdtibZBcqSmmWerWBNuY+SfHliwVXjPBjl8+UyWCoIN9+kOKZJueXQoAMmB6ugSZNj8uYo18UbQKq8O8/V3604MnXIsf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498991; c=relaxed/simple;
	bh=LiA38k16f5PzdEc/NByEG7vfa2ClKMQV1Lf9NYZmUG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUjWiaB03KSkLyJFYj6+YhdX5iCUKNQ+/XbleOATsY9I2qFu5VttSlrhBb4NPtfKPafBsI1HnvrupkSMIW4QpCnJ4hJGv1EFMhFMTOH5BqE1F9DvOaYYMqeTrwWaFGZtcIcWihf/3fEgXQ7AcG3Prig23Cu3VZutOpMlJ0k/EtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N50zQrLB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N50zQrLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930B0C4CEEB;
	Mon, 18 Aug 2025 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755498991;
	bh=LiA38k16f5PzdEc/NByEG7vfa2ClKMQV1Lf9NYZmUG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N50zQrLBbGaAmus8p+f5ywsHuEmgPcmdJwQ3YX89L49/AwQOreXFoR9pH3TM/zvqB
	 ZM0ny5broyb7G/G8xHyaphLTGARVuNSFrz8TpQkhelbdxq6Et6XGQtayj2dg4Teg21
	 xT55Zh9rL5T3mPvu4pThlLV4+WVVOB7eMN2gr6CU=
Date: Mon, 18 Aug 2025 08:36:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
Message-ID: <2025081859-shabby-sanitizer-100d@gregkh>
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>

On Sun, Aug 17, 2025 at 08:24:25PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro was defined with three arguments (str, buf, len)
> that were not used in its empty body, causing a compiler warning.
> 
> This patch silences the warning by explicitly casting the unused
> arguments to (void), making the intent clear without changing
> functionality.
> 
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
> ---
>  drivers/staging/nvec/nvec_ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
> index 575233fa1677..7accdcafeeac 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -28,7 +28,7 @@
>  	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
>  			16, 1, buf, len, false)
>  #else
> -#define NVEC_PHD(str, buf, len) do { } while (0)
> +#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)

As Dan said, what is the warning?

And this isn't the best/proper way to handle this type of issue.  Best
is to make an inline function that does nothing, as that way you
properly check the variable types.

But, I'll push back and say why is this even needed at all?  As
NVEC_PS2_DEBUG is never defined, why not just remove them?

thanks,

greg k-h

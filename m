Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5C38DC76;
	Thu, 30 Jul 2026 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397049; cv=none; b=V5M7klNhijTsuHcBdWE62QMnwJj1R2KGO/sU3ukA7eJCw0Uyx+aICIi/VJF1S6OZD1mFQ366hdtf71BYW9daJaIkSdPBQGQQYAeozW5HhxrQ2UZg/eUcGmhmloVjEA5nqy4AqVbwpxB5eylc2u+5nIx4SEOUDVMevLlAFokcgcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397049; c=relaxed/simple;
	bh=sTXWlrJxI8pfdS+DYW5UrjBR3sUgKDeMCcZURiaRlUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9N/lmS524Q3RR1gQQmtBZZQ/jjmEw40LFYSErDiLgkAfsYqgNx7FhBt5C48/Wmr2h2wX2sf8YFelT3mP4o/hbSiCQrrXygOTThwyi9Tacma8xQsNfc2OGQidmLqaAxPLuZhZI+EcC6rPAmw0gQNcntPO0pYc0/pq6DwVobwnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MyaWkSq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MyaWkSq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E711F00A3A;
	Thu, 30 Jul 2026 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785397039;
	bh=pbhVyS0R521RsMNlGq20zsNsf28v0GVIwovNqermFz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MyaWkSq7Eeq0B1F6hliIkTd2cPAkKt4NSYeHmKQF7eo4k8KfkEgyOUX52ndfKoIfL
	 7yRhptNeDLdhr8ZHnANzh3hLjjp94pC581pb8OqTIuaN4gZezqWzHZuBiOt4pGBFnG
	 QIyd1WOFvXcli746ooHj+smCJCD/qQNDY6hJs/To=
Date: Thu, 30 Jul 2026 09:35:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dang Vu Duc Hien <dvdh12707@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luquijeffrey@gmail.com
Subject: Re: [PATCH] staging: nvec: fix out-of-bounds string copies
Message-ID: <2026073012-unshipped-sketch-1de4@gregkh>
References: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
 <20260730041220.1064608-1-dvdh12707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730041220.1064608-1-dvdh12707@gmail.com>

On Thu, Jul 30, 2026 at 11:12:20AM +0700, Dang Vu Duc Hien wrote:
> The function `nvec_power_bat_notifier()` assumes that `res->length` is
> both >= 2 and within the battery info buffers.
> Technically, `res->length` is provided by the embedded controller (EC)
> and is unverified (ie. a malformed response). If `res->length` < 2, the
> expression `res->length - 2` evaluates to a massive size_t value which
> is passed to `memcpy()`, causing severe memory corruption. Conversely,
> `res->length - 2` being larger than the buffer also causes an
> out-of-bounds write.
> 
> Introduce helper function `nvec_bat_str_copy()` to safely handle these
> string copies by:
> 1. Ensuring that it returns an error to the upper layer along with a
>    `dev_warn()` message when `res->length` < 2.
> 2. Ensuring that it provides toleration by copying as much as it can
>    along with a `dev_warn()` when `res->length - 2` is too big.
> 3. Guaranteeing a properly sized, null-terminated destination string if
>    the copy succeeds.
> 
> Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
> ---
> Note: Coincidentally, I have been working on this exact issue earlier
> and had this patch prepared just before Lucas Jeffrey submitted his RFC.
> I am sending it here to answer his protocol validation question with code.
> ---
>  drivers/staging/nvec/nvec_power.c | 41 ++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
> index c514d51a9e57..12699515356d 100644
> --- a/drivers/staging/nvec/nvec_power.c
> +++ b/drivers/staging/nvec/nvec_power.c
> @@ -117,6 +117,32 @@ static void get_bat_mfg_data(struct nvec_power *power)
>  	}
>  }
>  
> +static int nvec_bat_str_copy(struct nvec_power *power,
> +			     struct bat_response *res, char *dst,
> +			     unsigned int dst_size, const char *prop_name)
> +{
> +	unsigned int len;
> +
> +	if (res->length < 2) {
> +		dev_warn(power->nvec->dev,
> +			 "battery %s response length too short (%u)\n",
> +			 prop_name, res->length);

So you are allowing a malicious device to spam the kernel log?  If you
really worry about malicious devices, this isn't a good idea :)

But this is a platform device, built into the hardware, so you have to
assume that it is NOT malicious and we can trust it, as we trust all
platform devices these days.  If we wish to change that model, then we
need to do more work on Linux than just stuff like this.

thanks,

greg k-h

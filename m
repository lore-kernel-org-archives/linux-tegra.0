Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D44503B
	for <linux-tegra@vger.kernel.org>; Fri,  6 Mar 2026 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773314; cv=none; b=J8tSzs8NhcFUywecydaXhvt+6d07h7CCS3xy8phwMl/bdcG+Ki3eTV0Ha9UWu+bP9SLla6x6sZ7DCrhS6iJya10NkywJpppuLrQ3d/+hle4mfTsEfoul6w8y/qJUK33/4fdfLm1AvvKt13LzTeALQDpz/pE/uGjkb0xK8oervgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773314; c=relaxed/simple;
	bh=0FRD0QRHdzRldm1DiD+yn1zQIPJEYy90DqSX29PA5Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxX7MH9O130gdljT03T643cLPDYb+tKJZacKZRVIpfdfQ0vwAeqTVgqEviCt/TIDN6dOuBrMccGBn/J7TX6fnkwSPWJcvbge0cCKrH1klzEPl3bt9nPKpIYHjDgkHTRHzFKMFMig9cEgyxs6Lp77GZIytt3b8za1nNLo9iKC40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSOp1GeM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSOp1GeM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso4545243b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 21:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772773312; x=1773378112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2NSHn3l4Sdh0HRvlD9q+A1JuCJs1Cpida7EqqJ+gJo=;
        b=RSOp1GeMspNm3SqQFMrdMkKmKTW4bcCkmol2BYVU020M65JK3lt/SHKY5N5AHkMSQV
         +za/6/LscE4xe4XJs4beLLavqWqubB9OL8CKaEkWAsl4M9gGJNQXDl58aICrmosIAa9L
         k5pb9WYo3JGtzYtKfz1/GZE7RXE5CgIlXvRsvFfFCuk60BaJHR8LErImktmve1G6V4uQ
         YP/79zp+BhS5yfJjisGgbeyseYFRjnqzt02YtcpRBsnRifcrNl6aDQ4iylUSoVHI538e
         dmzjhQfo0kdrCA3bQAXGcP80t2JI2niZKxBkc0YQA/wbilSxrqIqYbsaw4xOJndNFt9M
         owVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772773312; x=1773378112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2NSHn3l4Sdh0HRvlD9q+A1JuCJs1Cpida7EqqJ+gJo=;
        b=XL9numBr5L/G1BeqzP92S/wmdYRxQruaicQ3qV2sKkIk0jPwVvJVp96nNfvLquf5Ua
         kRSXg9MhzLKBeygvxBM2VGkeJpTnr1mfKWpJvgecwgYxXN7gosEwWvRqaHhOTcGUZ7dR
         cTbjf/+TCelmoNum0WVnFyzZKPFsFNlxk9oJcp2tIIsuibvOcVfwAGAuvxwqNiBMqUiW
         DFNHB5WMdr1dW4acnL+synyH3H8lk5/4EaBNa2XZvLIMcFOS4vBwVbNXBh386QM/PMi7
         AzC+0eELvbbPTwvUro8Vtku8L6puZ8CtdTQSDl51wLQCPEq9auxec7Wl3kNTTy60B/11
         N5+A==
X-Forwarded-Encrypted: i=1; AJvYcCX6Z6g0ZdjIg7jXbk/d72a11j3TH5fN63nElRXpPIqcbRawzI7Amg8T0EYbXgNs+hEceuAnkgs+xLDmqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6nYQKdDfcbg0cKbn2zT3NGca9YBoXZdIAK9C55bWTzLYu+Ry
	Tt7Zb2WEgs5Unfa+hDp2oZ9eU+FHkEtR3JJPZ3iiGT0wYz0iITWGTyWL
X-Gm-Gg: ATEYQzycOnWsEUVVMkXxg1vQShWZTla7RJgQ6HZ1b/+Gibs7ZQRrGQjFhEXya+ohSSC
	XMAmKRMH13fWq3U8utTcUWJl0SCEfizHPN2B5JHevzt3VU6Vl32jsH0JhKGWltnSRpz7bOSu1Hk
	FTgXXyxd8CMtdb5a1Mn3/AXIddUz9WOHsi0sWhpO45aZ6JxirVi8xouGQUz29ZX/XsGR3dQ9bIp
	tKml+ENZIIXL6yXsIiHtnMt6dMzy5WPhYlNdPEG+6ArosKEIGyH58JFwjsFVC2IPBma/DAEH8rL
	cEiFTOQZJ6RzzH0O3TT/sXKzDMGScGrFupvFI+LdEYJ5ZSqmygfWGSqwRaszyJ7grK5Q/Z7/cCH
	fDr1pmi+Sp4YyloRc2oMwnfwU8KOiU/zP3h6V6czMRTML1GBgwoT7S5pCBFMRXcZ5zOdZm+XtD5
	qth39n7gHAp4mBb7Zv86dVkWEfNQ==
X-Received: by 2002:a05:6a00:8d3:b0:827:32dd:59d8 with SMTP id d2e1a72fcca58-829a2db98e2mr870478b3a.16.1772773312001;
        Thu, 05 Mar 2026 21:01:52 -0800 (PST)
Received: from localhost ([2001:da8:e000:1218:8c58:2092:77fb:d72e])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-829a48a5c72sm341965b3a.51.2026.03.05.21.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 21:01:51 -0800 (PST)
Date: Fri, 6 Mar 2026 13:01:48 +0800
From: Avon Hermit <avon.hermit@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style
Message-ID: <aapfvNobk8atPbyY@general>
References: <20260304054727.70113-1-avon.hermit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304054727.70113-1-avon.hermit@gmail.com>

Hi,

Sorry, I didn't notice the earlier patch.
Please ignore this one.

Thanks,
Avon

On Wed, Mar 04, 2026 at 01:47:20PM +0800, Avon-Hermit wrote:
> Convert a block comment describing the AP20 hardware bug workaround
> to the preferred kernel block comment format.
> 
> This change only adjusts the comment style and does not modify the
> behavior of the driver.
> 
> Signed-off-by: Avon-Hermit <avon.hermit@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..736f11942174 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec_tx_set(nvec);
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
> -			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			/*
> +			 * Delay ACK due to AP20 HW Bug; do not replace by usleep_range.
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.47.3
> 

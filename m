Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FBE16F8E5
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973645; cv=none; b=HL2E/FfiKKIN+QsJo8oN4xhHczWkSCKVZfhlPB0w3GxnDk9S1rNwrdUF24+3Bm/ySEGv+FkwHG/Qol1A7JOS8ZiyQLgmbZxQeVHESrKbjoTmOoEWlTkRgMMdrvpHTsD28RbunMdnJtbakCmj76BQDJAmf2lm8hDBHRAsg8P8YOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973645; c=relaxed/simple;
	bh=rD3AJa/sm9PmeCYaTHhDjRKPgFI4ycYyijxoyHiuPMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxqbUG4PSsM1KcrzTGlWD3XQ1VCmIZVHRKsO84OdXnUhO8Q1OrXFAVzptxx/Weann+Lzm7pU4rpgN7azOagW6kqjfAnSrIMBu8gILdEfJgu7xAMnEpfn/cAIPMDvHAAyMUOwk2JVrrpbGD+3vgUdrrEvRd42izcatn97lDLaS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4vEXdj6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4vEXdj6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742af848148so3950793b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973643; x=1749578443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=V4vEXdj6bnhQdNr4eaHwEX7Ue5yHP5eOqBmXxyCLaMmLZ24ECttvcKKOk/HgoMCksv
         FpYR36k9P4uYboBd4MqX3ZLavbKSiiIV46ZRssWXkql/m8PFhBN397OmRBypAk2kFRoy
         BtZMzR466VaAJxpKGCWbu1SA0qtx9APBqiMyfu2bndwo3L9gngROiUMI3gqc3k/Xcxdn
         Qed6WpEJCtCy3NeQdy6xVhMi1hNPVmhi8egiJP9r38HsmkQhcF7kc2NSNYLbrro1OYGt
         H8jWHivYcoLla428KCADi36Lzvb577QiyHzNDhMi62SrNEubZVRM3pUsguVPFl1ktBF4
         TcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973643; x=1749578443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=eCXiIvSMwW0d+JTpgOmSX0MK7mdkIYuwK/4TWDiE1kjnTP4DXZdOz1FBPi245ZEWNB
         5Y4pH6wbtALa3E07qfZYPfXlf7UyarwrLjJfMvDzjRkxpfWvHxZETgAxfEfOdcNxSrD6
         CseRi3lMehsRZL8C4kWbgwJhmUbW/m14BHW6fkrazEtqrk2MK2cRvK+IyJIEiY8idvTC
         CUwSRAebirw+IQ4tJ3Kqv4n+JlVXohFaA1BECYAquNuYil7Y/4QhRwvqAa47qdUcBQDZ
         4VTNMgqtWrtONdE/z3BMStm4daz1x54Q1EjEStKXW7UEflyB9WWCmfYpoWxt1tgJJOns
         zy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTtRmYWRZG3XS0nifsmwG0LprFgr5QE2wG23b2iCrZ93rfyBEubyKp2YQD0qFmk2cBJRyENrKcKtMMXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzkgBsY7VEmUe7644wS1ogaS1IHXwlBZ4fLIsehEXedIUURIOK
	SAj3R+iCS0SoEo+A0heiJDPXrJZWTPXz378tgPDAqQWuja059e4PordR8+CaNrTU2A==
X-Gm-Gg: ASbGnctL5Sclj2p6+8XMbMssMthiKmQGqkC/l3iDKJRofmykGr8EOXDCARJaeiz9qC5
	sXEjsDobgcjiHqvcIZFnQwt2j3KCQ0Ks0yPX0x51ocZUyhE5VOjaMP9SHqP+sEfpkPf86bp8vlV
	PGnXWI9thLPGb28RmteTN3UAossG3KCefJ4l4hxVuhv1JmIvZC+G1Gduibje2dJU+lHN9CS/YWk
	ucS844mMJ/2J8L34P6yl69jhvbD1fnAYsQmsy8dkHj2GhOIXuOF5ANlOzcv8e7autNVnF1+6WBj
	sN3kjQDpSXgompgJK6xnee7ia77TMpNXZ8uumT1FpDI63Hi3koTP9O7ZLrA9OwcRtQdDDidNkij
	sJ7Pq0ivWPHzxG6XupiuAtgpHupI=
X-Google-Smtp-Source: AGHT+IEodTIVtAPtf3Z5cQ4Uq1uQBXjGOn+G7Y9GhI4s+r7QBMKm7jSlhasASzLhvPxxrzys9RVm6Q==
X-Received: by 2002:a05:6a00:1a8d:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7480b1f6371mr74882b3a.3.1748973641368;
        Tue, 03 Jun 2025 11:00:41 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm6427681a12.74.2025.06.03.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:00:40 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:00:37 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Message-ID: <aD84RUX4Tt4jg62m@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-7-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-7-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-cs5535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
> index d47acfe848ae..8af666c39890 100644
> --- a/drivers/clocksource/timer-cs5535.c
> +++ b/drivers/clocksource/timer-cs5535.c
> @@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
>  	.tick_resume = mfgpt_shutdown,
>  	.set_next_event = mfgpt_next_event,
>  	.rating = 250,
> +	.owner = THIS_MODULE,
>  };
>  
>  static irqreturn_t mfgpt_tick(int irq, void *dev_id)
> -- 
> 2.43.0
> 

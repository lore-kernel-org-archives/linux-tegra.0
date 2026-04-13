Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF9A36308B
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067735; cv=none; b=mUDpF5Wu1uouXQVuBZl1jPXVMgRnPXwZfME72G67YLjGi0RO5q0MPr7qpLfdK3I6qs0x8khZXPemjZ8V9fQtKll+Q6ncSX3p/08lohQ6N4S755c/z308c0t0b9LRxcqgvVpFaPkq1UshfrP3LgPhPhIZjEelxgUfq4Ix5uY4FHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067735; c=relaxed/simple;
	bh=07XUjGti6c23bhhuDREuvLhUWrCtiIEv05+fAHNkL7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXvo+kwwZHP2A8tvdaDlgRMSpTUUY5/hLyeCg4GTfT6MZJY2RunCVr/Z7D7eNm8rw8CbQ/NR3zB7aGdZ+SAUTWnuesnj/aGYp4IM1q5sO3PYtorV0IMfJBsmMFzPNg2QfPkBeKzDoSGeBUGT5H+Zb7q+cduhIXHwuVcA3SI0ISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebu2IRcz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebu2IRcz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso64635765e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067733; x=1776672533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqvPWwnQajWp/ZMSh8mExyk1McDwKxudtQ4kJAZDswY=;
        b=ebu2IRcze+SbOFrNtx8fz/7PV4WyK8UCVUDHJ+n5u0BsucIci8s3LTyo8WRmKH2lwH
         nIdn5jgaNuNTkvELpjjQ6u4MJEohE6mhKMd3kQW7/4Yt1owyHIbHHaEoJ2nz9nn4jOtp
         r4hwv49BFS0PB5hNjHhY9tqEwSu3FJ7f5xD+KZgs4HV7NVch0fvENGFvHmRbPN5SCSiF
         UJHo9LgMBfAIAVfKF2O2bK/0ZI/ewHoIQeNv5CURdHwdvvKSDTZw0/x7NY3DLwx/pLbw
         VPeDfiqPqpnrbP/hI+I4x73lLpb342SCuEJEXTpGDXeuZY/GchosKRA8k4htW1e/pfP4
         nbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067733; x=1776672533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqvPWwnQajWp/ZMSh8mExyk1McDwKxudtQ4kJAZDswY=;
        b=HFYqewU7mfD6fGOjOXMdeTtH5ihmHNTKqR/UfaRowpNF8jG5IpD3jRJW+3/wwFZ4v5
         X8JYl3o6jvdounnvGyB9i/IiEhJDyZ6CDmg8YOB63YWbvpHFC45q66LfA/sSugMjutnn
         WkMmX/oXUSKPmcrtaAAAr2DuBtn3OuE/0HdeTN7yVBGmuNV0QExYB7vnohWN+xatY3SC
         OvuecCOzHaC4zZwBEMTX1za/H39QPgngYhuvmAeASAyUrlKwrjUpEoojJsSkmVp8caiL
         zK92LaHRighKr6/Hnkhvq+6qivDYEIxZJ9H61tdhToGgOjyVGYDQE94/wqP5QrfRq7O+
         f8iQ==
X-Gm-Message-State: AOJu0YwjwGTarMRviw5ZJWeyo/rrRaJJjxJyBqQMrTzhL/7zAURbOYFd
	ToxBmigXzhT0OkXWE7cKaVqHTENWZK1UE/EupCOFdtlsQgXsNelPQLeu
X-Gm-Gg: AeBDievNCUtSAYrpNpbMoJiP2sPoVvU5jm8bGLkjzl8fihKWEsAMzjPSXsORBxADfCH
	S0eZN5SlfSjhaiQyUAJ8ILcMhhPJ5F9qjb9DWhh7NstxkrpfXWtBxJnj0TvfVYJ/0dY797ZEqZo
	bOC19rBvRXwC0OkcqZWRfvshxp/Wdov9reMYrqzRH5io4shrYqVXIsIiZBPJBcFv1qGK20P6mom
	MxdsZZra1t63YU1NaMZoMmw9jICn44qKaUWbKgkeYGxYzWMYVqM1eodWxsGQdYjuoWHpZRkp47I
	YeQKpabhHMFRFc7iFsrniP0S2HjtOpACqVs35PODqgZmJquIhB6o1yCkDQDpwgAwlHPCWbhCYeW
	nhJCkf3HFxeUNAuSsALvkcmOOYuog93KDR9/TtTzfK6jvE1/GOEVavyLcsd+VgA5M47MnguYmCk
	dSMzHTu/Tl/YgHdSFPrvI=
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-488d67f4c4dmr185375045e9.13.1776067732487;
        Mon, 13 Apr 2026 01:08:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d68712casm91433755e9.30.2026.04.13.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:08:50 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:08:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: nvec: fix use-after-free in
 nvec_rx_completed()
Message-ID: <adykjx57doahzkWH@stanley.mountain>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205117.387125-1-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:51:16PM +0200, Alexandru Hossu wrote:
> In nvec_rx_completed(), when an incomplete RX transfer is detected,
> nvec_msg_free() is called to return the message back to the pool by
> clearing its 'used' atomic flag. Immediately after this, the code
> accesses nvec->rx->data[0] to check the message type.
> 
> Since nvec_msg_free() marks the pool slot as available via atomic_set(),
> any concurrent or subsequent call to nvec_msg_alloc() could claim that
> same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
> freeing the message is therefore a use-after-free.
> 
> Fix this by saving the message type byte before calling nvec_msg_free(),
> then using the saved value for the battery quirk check.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

Add a Fixes tag.

> ---
>  drivers/staging/nvec/nvec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 952c5a849a56..75877038847f 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -498,11 +498,14 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
>  			(uint)nvec_msg_size(nvec->rx),
>  			(uint)nvec->rx->pos);
>  
> +		/* Save before freeing to avoid use-after-free */

Delete this comment.  (Obvious).

> +		unsigned char msg_type = nvec->rx->data[0];

Move this declaration to the start of the block.

Otherwise, it looks good.

regards,
dan carpenter

> +
>  		nvec_msg_free(nvec, nvec->rx);
>  		nvec->state = 0;
>  
>  		/* Battery quirk - Often incomplete, and likes to crash */
> -		if (nvec->rx->data[0] == NVEC_BAT)
> +		if (msg_type == NVEC_BAT)
>  			complete(&nvec->ec_transfer);
>  
>  		return;

Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CBE1FAC4E
	for <linux-tegra@vger.kernel.org>; Wed, 16 Apr 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812791; cv=none; b=Sx/UCfD13wfD3hZglGhjPmCGnAakf3qkx+yEfBrGpJgwKPcFWSyhacnZK9I8fFYYZLUH13HMndbNKD6ty50Y3KfkkE9JMU/Swf7oT1nmUP0v168Ruqcg3ZyNVT0VrMxxPuZqyS/03JXNkfDtVWo/LhSJvkigyEZ7UPYa8yBGjYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812791; c=relaxed/simple;
	bh=als+rfk6oCyvduGa+aQFEMQSki0kbRznKDEXbNApUMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhDzCvck97yhsZSUB9NIeDds9jVjTZKN3oFmouCYYQ3PAox0kI3g7W0vIHEQZpvxckw2pxZv3CBqD03DFejzsoFZxyS17rMSeUwxk5nW90/3mz5Xcrn3+hrsy3Ww3SQyU4wjCNhtvOcy0raZyqj6w7T4Q8NgnhUtRme9GCFdP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HaioJZAF; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HaioJZAF"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5c815f8efso623077985a.2
        for <linux-tegra@vger.kernel.org>; Wed, 16 Apr 2025 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744812789; x=1745417589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pks0t2682ixEDV+rKJC/2pXrF3RbV5mK870WF9n4hZ0=;
        b=HaioJZAFjTstRFj5iBqS+lq9/N9uJR7kwucLiB9GFQKOaUXbTrFxqwi9rq/VBQAHAH
         f0HHX9N2qoE2/V1WJNmEjbBchs4eVlpkt/aaDlT6Jh4ee0/4NYqnQuJumu1Of3717n7r
         pEVoWCoJGya7HsbKbEx8t/0mzGBpibMyfwBMZerybJrf5nX/z62NtvoiGYFh0O7TbdCg
         13urAJxJxd1GvxLKQ0MmdUuqrPlSu0MYPjAUSwhJBj2wJ0A9iVONeWf5NrnNuyP7G8ne
         84onzlCCSpwwmMSpI5vIvxCo9AVq40SdYs2kthx8ssXXMRgEhWP1io7N0sU5HSdDJvDA
         uChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812789; x=1745417589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pks0t2682ixEDV+rKJC/2pXrF3RbV5mK870WF9n4hZ0=;
        b=ZXJ84+9guaohSxeIgIyYA6Eva7uaiKBoh3Fi9ZF1+mCYfQlyANrStYAeTMSGaZq8D1
         +0ABYNQ11wCS3bJo9b7KlEpaNWU/7xsQU06y8WqLJMVHxPCqVNfDcUuSqtuquUutuAdn
         50IuYLKiKdctYuW6dcCUNjzYBexYckAb6ra4JQVztkAEW2AMiydXDqFGk7P33AkIS6Jl
         EWmc9n+/OtLuXwoygJyy1uYFYUrqawGVjKye+AXH8yIPOqUqhWcA1EobW65/UvkmAve0
         7uevBWiMr3aysm5p29+gitYYCQOTdV54uu3DShb3vJ7skwe/kbhvDj/434Cyuh9vslqa
         88kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4nOWaM5bWAG3m2oxYAZfizDbWbGL3nEueu7B12sYOHGMPxjSqr4xGx6vqrDkBmBW1L2VC6a0JQ4IyQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTC4MX1XorFZY2jDQmUZ6kYR573mDCzXYQZ1InjTTTTyr2qSTB
	/TB3BX50gdKXqapRI8FiV0kEBIMuFK0pgYjSaOyHFe9xKoviPlj5cHIrmV5udQ==
X-Gm-Gg: ASbGncs0rvg0f7UJbg8wmv2TT0fUJ0mdPDCigQSGV+SeMsyGoAHiXAANC1ghd6n570P
	2nq8VNJhm0KTlrb6lI/vXT5gd9xJOMDMwv2Pzz7z3iGoicBgaVG6da2iMw0i2aGin5BZLLF3FOk
	qAa73j91j9O9odUhHCPv6gm4E6Efvp7m9quDtp87jaEFPcmCc3oIOoIcu8xriojd+AMPEl3Udku
	iaALeLzkzL49uf3Ymmhz8tdDtGjSpk8dCE3G6/z4i6CsECLYg9Fp/mrLD3vX3APLPVonn4i3yPY
	2a9v/0pQYDgYppBksvVnxNi/Buu6AEV1v1jDMbgskzRm2AyNAXaWKbbQ32A=
X-Google-Smtp-Source: AGHT+IFQVfFHxsUSyybMpwGTdG8vsHYAdEt7pGJ1yLJInbTaNdDRC1d/nfkD2HwTdo7V4ul8wPDRGw==
X-Received: by 2002:a05:620a:468c:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c918fefdf6mr240846285a.23.1744812788810;
        Wed, 16 Apr 2025 07:13:08 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0e5e4sm1058184485a.104.2025.04.16.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:13:08 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:13:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <f17d63cd-14a0-44bf-af9c-358d2a36b69d@rowland.harvard.edu>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
 <20250416120000.GD27292@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120000.GD27292@altlinux.org>

On Wed, Apr 16, 2025 at 03:00:00PM +0300, Alexey V. Vissarionov wrote:
> Check ep before dereferencing it in trb_phys_to_virt() and ep->desc
> before dereferencing it in tegra_xudc_req_done()
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org)
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index c7fdbc55fb0b97ed..d61a0675e18f448f 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2658,9 +2658,21 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
>  	short_packet = (trb_read_cmpl_code(event) ==
>  			TRB_CMPL_CODE_SHORT_PACKET);
>  
> +	/* trb_phys_to_virt() dereferences ep; check it here */
> +	if (!ep) {
> +		dev_err(xudc->dev, "unexpected NULL pointer: ep\n");
> +		return;
> +	}

Is this condition something that is totally under the kernel's control?  
That is, is ep always passed in by a driver and there's never a valid 
reason for it to be NULL?

Then there's really no need for this check.  In real life it will never 
trigger.  And if it does, because of a programming bug, you're better 
off getting the stack dump that comes with a NULL-pointer dereference -- 
it would certainly be a lot more visible to the developer when testing 
new code than a easy-to-miss error message, and it would indicate where 
the actual problem originated.

> +
>  	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
>  	req = trb_to_request(ep, trb);
>  
> +	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
> +	if (!ep->desc) {
> +		dev_err(xudc->dev, "unexpected NULL pointer: ep->desc\n");
> +		return;
> +	}

Same here.

Of course, if it is reasonable for ep or ep->desc to sometimes be NULL, 
then the checks should be made.  But if that were true, I don't know why 
you would call dev_err().

Alan Stern

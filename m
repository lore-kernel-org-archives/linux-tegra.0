Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A22DFA49;
	Wed, 16 Apr 2025 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797241; cv=none; b=WXQvR+gORUMSWGJBSLbPvprz3dDoFlOuAl5j8dk6NPd57rf9A7Fnunkjk4VEcPTA51Wvq/J9MuJmSH5Yx7UrQ3/XI+zseklFJ7+L8WHzLBHoSd4cHYsXDQQ8ROsNYhxkZ6AiZ2WrfJxhigSoJus+SSrkJoWUue0qf0WziCdDAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797241; c=relaxed/simple;
	bh=hGLrw2MTqSWv3Oqqqg/w/sBCjqzkqmtxtqy3UASIx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=julC4un5mdkC73P3tuNZz1zzK1kIcfaZeRIiiF/xVeeEc3mysoGvi2lAYPLsQ+DVDIadsPa78+e4gwZplxQ8QWGWaKp5LbXCbnnlV4xw0KtVJCgTrwNzTUO4kK/Gz/JGqBAyQ4ePkxX9rspafe2bk1HttrEIOOtxG68HywErKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 971DE23339;
	Wed, 16 Apr 2025 12:53:51 +0300 (MSK)
Date: Wed, 16 Apr 2025 12:53:50 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: tegra-xudc: check ep->desc before dereferencing
Message-ID: <20250416095350.GA27292@altlinux.org>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>

Good ${greeting_time}!

On 2025-04-16 08:43:58 +0100, Jon Hunter wrote:

 >> Check ep->desc before dereferencing it in tegra_xudc_req_done()
 >> --- a/drivers/usb/gadget/udc/tegra-xudc.c
 >> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
 >> @@ -2661,6 +2661,10 @@ static void
 >> tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
 >>	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
 >>	req = trb_to_request(ep, trb);
 >>
 >> +	/* tegra_xudc_req_done() dereferences ep->desc; check it
 >> here */
 >> +	if (!ep || !ep->desc)
 >> +		return;
 >> +
 > Looking at the code, it would seem that we should check !ep at
 > the start of the function, because it has already been used at
 > this point. Also !ep is worthy of an error message because that
 > should never happen.

Agree, the check should be performed before trb_phys_to_virt() and,
possibly, there should be two separate checks.

Any suggestions on a error message?
  dev_err(xudc->dev, "Unbelievable: ep is NULL\n");
(and same for ep->desc) looks ok for me. Or s/Unbelieva/Impossi/ ?

Next version of the patch follows.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

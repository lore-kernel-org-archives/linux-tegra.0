Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7930723A9BE;
	Wed, 16 Apr 2025 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804463; cv=none; b=k+6pZP0ng0XEzR41AX1hjpwk6XIaD0/NW89EMkl4JnbLoxH+Dnl2jJUNGMIDFKoR1FLbFHbTSv9RuDrwxyb5q2UjDp2gQxGvkXyWd0ShAYGZdivIJXoRGNgj16LBMoHDy0fWBs5WKu7Iqgd/BjL/AHozBIDptk5ThuADVyZ0Bxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804463; c=relaxed/simple;
	bh=l2wQCuPf45yikHLhbWv39uKEgsRsCbvTGTAouNnyJ7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ku8XzobcMApUmogSSRWf8XNwG6x9R29OrmzNQhC9fCWrQcsBCWazmDCLLuHd0IfbNwYdssdUbyboTHIRRA2wwvZqKvQhVbqFDJfQZY7XLbFqUXpmBexOqoXNjkh20TB28MD70SUWFrxT5rRlaOdOZruBdPX2KQkJQuSuskCEPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 1136623372;
	Wed, 16 Apr 2025 14:54:17 +0300 (MSK)
Date: Wed, 16 Apr 2025 14:54:16 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v1] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <20250416115416.GC27292@altlinux.org>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>

Good ${greeting_time}!

On 2025-04-16 11:20:10 +0100, Jon Hunter wrote:

 >> +	/* trb_phys_to_virt() dereferences ep; check it here */
 >> +	if (!ep)
 >> +	{
 > Please make sure you run 'checkpatch.pl' as I am sure if will
 > flag that the above should be ...
 > if (!ep) {

ACK.

 >> +		dev_err(xudc->dev, "Unbelievable: ep is NULL\n");
 > I quite like the 'Unbelievable' but 'unexpected NULL pointer
 > for ep' is also fine.

ACK.

 >> +	/* tegra_xudc_req_done() dereferences ep->desc; check it
 >> here */
 >> +	if (!ep->desc)
 > I am not sure about the error message here, because the existing
 > code just skips this. So it is not clear if this can happen and
 > could be expected.

Now ep->desc is checked immediately after tegra_xudc_req_done(),
where it is dereferenced, so it was somehow expected. My suggestion
is just to check this expection earlier.

Next version of the patch follows.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

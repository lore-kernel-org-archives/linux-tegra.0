Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29521DED5C;
	Mon, 21 Apr 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248061; cv=none; b=qm7LbrsdbCDcLKzLM4TOQwf/NDLmlTLqLWsw1fYukAiqw29OKQ2NLCu9xCuLJIfxWPEX39Ej2DjyESk7hqxbo/q2DcMABUN4x6L/KUwaN0qhKgABc8nn7NteyISXqpynYQPUv40litdBUGBrNBRNf0vsjEzEGpOr5O3k7SmN4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248061; c=relaxed/simple;
	bh=dHbVgEuyWkzTQSqE2pRdwKjE+8/7vGcWKbOPvfMXWx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPH2w5o7WCBHghXbwtLrD70OmMHmUjwGWn+WVzo/BXlMOKhr1LDlRfjY2nvE89XPEpkpuU156NylRmmXbHvagzSmovqpRqw04q9Cq9mv5EW1I0e6/27w0j/nR6IX/YC+y9FNuUI+7GcqaFqaL68BkU9oBMmw4JZT8Xy2BGzxRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id A0EB523399;
	Mon, 21 Apr 2025 18:07:28 +0300 (MSK)
Date: Mon, 21 Apr 2025 18:07:28 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <20250421150728.GA32725@altlinux.org>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
 <20250416120000.GD27292@altlinux.org>
 <f17d63cd-14a0-44bf-af9c-358d2a36b69d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f17d63cd-14a0-44bf-af9c-358d2a36b69d@rowland.harvard.edu>

Good ${greeting_time}!

On 2025-04-16 10:13:05 -0400, Alan Stern wrote:


 >> +	/* trb_phys_to_virt() dereferences ep; check it here */
 >> +	if (!ep) {
 >> +		dev_err(xudc->dev, "unexpected NULL pointer: ep\n");
 >> +		return;
 >> +	}
 > Is this condition something that is totally under the kernel's
 > control? That is, is ep always passed in by a driver and there's
 > never a valid reason for it to be NULL?

IIUC, the endpoints are reported by the device. But the device
may be something like STM32 uC with malicious firmware.

 > Then there's really no need for this check. In real life it
 > will never trigger.

With real devices. But ready-to-use STM32F103C8T6 boards are sold
for only 10...15 CNY, so one would need only to write a firmware
and to flash it in the board using 20 CNY program-and-debug tool.

 > Of course, if it is reasonable for ep or ep->desc to sometimes
 > be NULL, then the checks should be made. But if that were true,
 > I don't know why you would call dev_err().

This was suggested by Jon Hunter on 16 Apr 2025 08:43:58 +0100 and
I've agreed that would be wise.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

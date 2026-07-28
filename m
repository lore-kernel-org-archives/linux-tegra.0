Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9C3DA7D0;
	Tue, 28 Jul 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228554; cv=none; b=PbfZp9F2RzdNu79BgPCjmKmy9H4li5Lwtd5LV2G56XHFSrzQUImlYt7eVuWLRAbIOTebvFsXxnwT6HhR3ffdrdlNJuxMMz5skdqNJZ4Y9cnSOK938Lfe9vqsPKeGC7rCugJo+3syFud+asfX+uaF0vIk41qeUl9k8MKvqASH/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228554; c=relaxed/simple;
	bh=AjQD5rUS+xsDW2JjaR/zqY5vdq/iNzhRkz8Xge7Wogg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DCYw1KMQ/FkaW/Fb+oAC+h+xO7dy8VvZv/jWk3XCaqEYG9pXPsZQJA/EmxFT7gygT0n3eCkll5gS7lFTse6PCB4DXPNs1sWJ2P3i4Uy1236GGqWyHpkl5gRq+r8aWUJKe+rOb0jA8tfqvAs32higYr1JrL7xg0CEsr87/LLE2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=UktXoTBi; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="UktXoTBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785228549; x=1785833349; i=marvin24@gmx.de;
	bh=grC3FzBW8SDAGvLDIMSriyFH6YiZ95JZvQwMQZT9DAg=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UktXoTBikLYC3+elPTbLbVaLlAuQBnIKKccHtDsCoqtcN6BsTRftSIrO6ii4k28R
	 Bga/R/iuKwVNK1CiFxFuESJGAYK/aOqgBCCqYZSKy3R7D3a+SocFVMR70zJP74NDF
	 sC5YCVYEw/20w1cHBOUSdfE3j5C01AohAXdfC612lyPUeeKOCnn8crYtpZ4dRKdzo
	 O0HW+60b7EIvxdhAiE1o3cvk+JE3xd2zLcX5blKDeSl4n+F0lruFULLfXtxFLW/rU
	 U0LrjbNm2AhwKX6ZzX14iicE9ZRn8BQI6PfslUS1YbH5dpPqGq43AJEXNiNS7nf/I
	 nTn1LlFLQnL+l/scVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGvM-1wRzWV30Eo-00Jse8; Tue, 28
 Jul 2026 10:49:09 +0200
Date: Tue, 28 Jul 2026 10:49:09 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Aayush7352 <aayushdixit924@gmail.com>
cc: linux-staging@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: nvec: fix power-off path to not depend on
 workqueue
In-Reply-To: <20260721095646.80663-1-aayushdixit924@gmail.com>
Message-ID: <1b0eb1b7-6105-a861-f83f-541e68b5b26c@gmx.de>
References: <20260721095646.80663-1-aayushdixit924@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:1uiaOSDvHudXzASePUX/mx9Co+8HHyIBMoqdjw8txk72dZCWcAs
 2NHm1nwybK+Bej1i7wdxqbFgkD6ixheIQkw4WINxlDgnkoylo6/4gTjsHd5fGLQYCYDhbBo
 oxg99wDsIp9qOBHH54RqfNRuj9+t+dwy4k6+BMD5uyglx9oOe8pUEWj2mwh/rJeH842Vv2T
 yJxhE1gxXaoFwaKNdEPwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gbfKFGYmXYo=;4qSYWryhGqlSbPVtTRNOGzlPOEg
 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
 =
Content-Transfer-Encoding: quoted-printable

Hello Aayush,

On Tue, 21 Jul 2026, Aayush7352 wrote:

> From: Aayush Dixit <aayushdixit924@gmail.com>
>
> nvec_power_off() uses nvec_write_async() which queues work via
> schedule_work().  During system shutdown or reboot, workqueues may be
> frozen, so the AP_PWR_DOWN message never reaches the embedded
> controller and the system hangs instead of powering off.

right, but not only for PWR_DOWN but also for disabling events. Best would=
=20
be to move the toggle events to the shutdown preparation phase.

> Fix by calling nvec_request_master() directly after queuing the
> power-off messages, processing the TX queue synchronously in the
> power-off context.  Also add a NULL guard for nvec_power_handle.

This still won't work and cannot be tested as long as the driver does not=
=20
support atomic i2c tranfers, which should be implemented first.

> This addresses the TODO item "add atomic ops in order to fix
> shutoff/reboot problems" in drivers/staging/nvec/TODO.

No, atomic ops means to implement irq less i2c transfers (polling).

Marc

> Signed-off-by: Aayush Dixit <aayushdixit924@gmail.com>
> ---
> This patch has not been tested.  Compile-tested and checkpatch-clean onl=
y.
>
> drivers/staging/nvec/nvec.c | 17 +++++++++++++++--
> 1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 88c416ee0..938ea8f34 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -774,10 +774,23 @@ static void nvec_disable_i2c_slave(struct nvec_chi=
p *nvec)
>
> static void nvec_power_off(void)
> {
> +	struct nvec_chip *nvec =3D nvec_power_handle;
> 	char ap_pwr_down[] =3D { NVEC_SLEEP, AP_PWR_DOWN };
>
> -	nvec_toggle_global_events(nvec_power_handle, false);
> -	nvec_write_async(nvec_power_handle, ap_pwr_down, 2);
> +	if (!nvec)
> +		return;
> +
> +	nvec_toggle_global_events(nvec, false);
> +	nvec_write_async(nvec, ap_pwr_down, 2);
> +
> +	/*
> +	 * Process the TX queue directly instead of relying on the
> +	 * workqueue.  Workqueues may be frozen during the power-off
> +	 * sequence, so schedule_work() from nvec_write_async() may
> +	 * not execute, leaving the AP_PWR_DOWN message unsent and
> +	 * the system unable to power off.
> +	 */
> +	nvec_request_master(&nvec->tx_work);
> }
>
> static int tegra_nvec_probe(struct platform_device *pdev)
> --=20
> 2.55.0
>
>

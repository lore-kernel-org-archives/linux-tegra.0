Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D883290B1;
	Thu, 30 Jul 2026 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391114; cv=none; b=DxHKxYCAixPbm6tqhBW6EhYuBp6N4F5Xw6BsSsfZrTBN5EV5t/7lreFXfq3u482WnySHcYNiXShJv+IrDpXMDp9X1X4M6LnSnHQwnJ0ZOeeFINjl6dLDkMvkggn61zCNfnWyRH8dLP2Qb0xkIdypLKdDkL7GvD3Zmvx+9zn1wyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391114; c=relaxed/simple;
	bh=un52Y5ytqKTXxuWC9lsn6S8NL+m2fHtUrr+94XuLY48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClWTjmz4j4R9UkfYovauRI2TsuWjIMqXiy1zBSPOii4iS9DzdcCawF1NidFMg2V1NqGdHe9FGGw4l7dPfq/WHD1hgyzjqMB6nGq+rM+hMfwa3LoE1KCgOuzrfZFICdDpnXND21uCYHp6Mix0hdpCncYPZiWmKiaBbZ43Kf3kxmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sGIH1I2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sGIH1I2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B6A1F000E9;
	Thu, 30 Jul 2026 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785391110;
	bh=zYRaQsU+lJFibNVhjhO85r9BF3r2QJt3MSd5Lc7ZXO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sGIH1I2ZER6jubK9avtXVMt9/wXWxHwWaFO6BHAguSd0731zsAituGgzZldAk3CJM
	 CY0ZejN/4aQSDq6+bLvVMX1CJjrLA1Y/gb2ggdqgulpj/6x8kBu/KdB14CjYnIs5Mz
	 jIIzxgeP4g7FdqFP1XdCfpPLMCUY6vE3t4c+csrg=
Date: Thu, 30 Jul 2026 07:58:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas Jeffrey <luquijeffrey@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC] staging: nvec: possible missing bounds check in
 nvec_power_bat response handling
Message-ID: <2026073001-bunch-aloft-63f8@gregkh>
References: <CAObkL7OJBp1OkXud7cJvp-a5qA5ozZfE2Ee8j+w6XdfoXZ0z_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAObkL7OJBp1OkXud7cJvp-a5qA5ozZfE2Ee8j+w6XdfoXZ0z_g@mail.gmail.com>

On Thu, Jul 30, 2026 at 12:09:01AM -0300, Lucas Jeffrey wrote:
> Hello Marc, Greg,
> While reviewing drivers/staging/nvec/nvec_power.c I noticed that the
> battery response handler uses the length field from struct bat_response
> without validating it against the destination buffer size:
> nvec_power.c between lines 120 and 220:
> 
> static int nvec_power_bat_notifier(struct notifier_block *nb,
> unsigned long event_type, void *data)
> {
> struct nvec_power *power =
> container_of(nb, struct nvec_power, notifier);
> struct bat_response *res = data;
> (...)
> 
> switch (res->sub_type) { (...)
> case TYPE:
> memcpy(power->bat_type, &res->plc, res->length - 2); //res->length is never
> validated that is in a valid range, //according to the plc field in the
> bat_response struct it should be smaller than 30 (...)
> 
> }
> 
> return NOTIFY_STOP;
> }
> 
> 
> The same patterns patterns exist for MANUFACTURER and MODEL.
> My understanding is that res->length comes from the NVEC embedded
> controller response. If a malformed response contains a length larger than
> the destination buffer, this could result in an out-of-bounds write.
> I would like to confirm whether the NVEC protocol guarantees these length
> values, or whether the driver should validate them before copying.

The hardware should be trusted to send the correct data.

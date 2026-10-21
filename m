Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594425;
	b=HFjsfLo/TRT5a86E8xmV0aYaeEyo74LFQkv4sHhbx34jJr1q0+e/gvagiyLnYPcDFanu
	 0Buny1WP27hgtaeM/aXMQpgS7/wl+48IhyFD8Z+xqghRcORP/kmdDH3kVhwagFxPCrLxy
	 7xo+U72glEFMeCmT5CTQYq62riaSTIQ8YQMrswa4mBBGb2272u1XQ6rbEJKSKIYF1qLge
	 vSzQ04rb3rix4pAZkCFAdl/0XhV5Eg7gzZHzZc3pK6ACBNJF35VOgzMUxe1XE6EWGC5qE
	 3aYZWyppfCorw8HJqWU6jCAtYm9w7ryz17hGweGlf1cITthS7gl0Mro4SzSMg4iRC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594425;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=k7ZGLplWFKaB8JY5T+15czx4UcwJP0brOC2Z4Smd6YM=;
	b=HFBHFCouIL7rqRM1u4WQ4s52SYWzQ3C4DKuQVBlVfgCz7addew8x6k5xlROdE3AdFiR9
	 04KcqjbmXP9MOJ0QaNjYobTRfjshuYW8Z4cdwVQK5bTK6ZTMBtQih2jefCIyXYtFIuaF/
	 Flv7tzLJN7OULN4KXLMutGs+489jP2vPPvQV9xS2RX6WeINP1ZSYnRGk6Fr6n9Smhiulo
	 Q0p9gznryDDlXXKNlRN6CEmDL9itAn4sUZFQbveugyExyjcyNWEZlV5Oe4ygroSoEfzrl
	 HqxNcnvd1ibIET9IPCwLamNptL/2xAEy8YfKaWl4Bb6XtIrpX5O+6z0TwguC9/UTjRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gs2WEUGm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8482606A31A;
	Wed, 21 Oct 2026 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gs2WEUGm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4F71F000C2;
	Wed, 21 Oct 2026 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594424;
	bh=k7ZGLplWFKaB8JY5T+15czx4UcwJP0brOC2Z4Smd6YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gs2WEUGm62ZAxSMTfnoYtXqKE0RhuPnkUxecvljB5l6U1FTMYeHfmrX+ob6l47l65
	 Phc793AjwVhxmGPH8d3WaeGwXLv7NxRkYwv1n4PFOSXBWX1Job+eEpY06+4zuCWbRc
	 0CakWSkKDyg/6CDnORverYc01G6GX1xDlEbCN81b/IJl9I4mpUri9X5nP5rCUHHx1A
	 ihuwbN4yDcNUcP3Gt4ahNTPeK7otJ/+GxO2edRlMd1i8OTD389VK+ULVp8wa5Qe0aN
	 3eEnu+XPxSw+wgmrknS/k1sIwutHZpmmPBdZNFDY+ZylESVpu3aGmVdBaObU/TSwrF
	 CvVA8SIX36g6g==
Date: Wed, 21 Oct 2026 15:53:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: David Cemin <dcemin@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Compare notify_id when looking up
 notifier callbacks
Message-ID: <20261021-graceful-refined-lizard-1efaff@sudeepholla>
References: <20261020220902.611138-1-dcemin@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020220902.611138-1-dcemin@nvidia.com>

On Tue, Oct 20, 2026 at 03:09:01PM -0700, David Cemin wrote:
> The notifier callbacks are kept in a hash table keyed by notification ID,
> but struct notifier_cb_info does not store the ID and none of the lookup
> helpers compare it. hash_for_each_possible() walks the whole bucket, so
> any two IDs that hash to the same bucket are treated as the same
> registration.
> 
> With the 64-bucket table, hash_32() maps IDs 2 and 36 to the same
> bucket. A driver that requests notifications sequentially therefore
> fails at the 37th request:
> 
>   ARM FF-A: Failed to register callback for 36 - -22
> 

Nice catch. I dropped the exact same change before posting the support
on the list. For some unknown reason, I assumed there will be no collisions
for such small sized buckets, my bad.

> because update_notifier_cb() finds the node registered for ID 2 and
> rejects the new registration as a duplicate. The same lookup is used on
> the delivery path, so a notification for a colliding ID can also be
> dispatched to the callback registered for the other ID.
> 
> Store the notification ID in the node and compare it in all three
> lookup helpers.
> 
> This was found on an arm64 laptop whose embedded controller partition
> declares 38 notifications: the EC driver failed to probe and every
> EC event (AC, battery, lid, hotkeys) was lost.
> 

I will queue it soon and send it as fix at -rc1 or later.
Thanks for finding and fixing the issue.

> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
> Fixes: c10debfe7f02 ("firmware: arm_ffa: Add support for {un,}registration of framework notifications")

Is this because of rework we have 2 fixes tag. Need to check how backport
would work, hence asking. I will also check before applying.

-- 
Regards,
Sudeep

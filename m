Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A443F4D5
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625974; cv=none; b=TtOEDkBNqMh/+BoXnknvuuLrihKv6/n6AAyKSACRXeKJIo61SqIVN+N+PQrGdAhPHFtHas88IPuMk+hmj/Ja2ZqTR+ao3JJG3dXf+/EF+eHHfXOpgHSE48feSYO148CCJ4OKgutXQzHnAqYMTsifsLukSAhZte+QmhCHqoysTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625974; c=relaxed/simple;
	bh=z1WTWDI5f+jBI0QjxNyN35KTkHvWiSM9N6fRXjgPnm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSnR9ihXwjwEdqEULzV0Ok9EiGv1xPFVF5CFBM+hUDj8JSfosy3hJhHJfDhRO2Yrq+12Gihb+3qv/Zq6AyRcbHSDNfdVvDW6CwL+vlHiZhs46qDojm23WlTT3dLpnkIh6UiTbUehvSjEIEKj1JKbbN7LkH7qYuWme/YP/dy8XDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr1nqt31; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr1nqt31"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso7987062a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625971; x=1785230771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbuX/Z82/a1Q2XE+uXfBweexF5O+JFRWQ4hhLAZ4P+Q=;
        b=gr1nqt319pGKziQaJo3LhJqpe8ImF7rZ5DTcbvkTdU/vB1U6MnsVbSSzyEUyhbU98o
         ZPo3ug0+z3X0U8gb/iw065sUZwjFpqQZswPttlCaf+SJ1MW07xluSEUuqJBatd7hRCAA
         4C+PPU2737E/BSFjtUjH8bqL4Cb8Vpgyd46jY4Tej8GBs5cv5/aaIJlrZSJCVFDAxALi
         PymNULwAypzi9l6ukqus9PNs5iVq5UeBZfMnaGuGtzh429KoOPmjnszfLELPr8uU+pcz
         V6joRPg2XyDrw0zTppP56scRtYTvP1rK8h5sWaEH0UgcR7U8abm2ZhJh1beTsH6lsAYG
         jkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625971; x=1785230771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbuX/Z82/a1Q2XE+uXfBweexF5O+JFRWQ4hhLAZ4P+Q=;
        b=OKEh4c5rQiTZLolfv48FRxbamCkPGEvsVXQn9rXZh7sJfCDNKmkkhLjvMTd9Pocgpu
         w11mtqMwcKtm7EY/AxCEQGHDF8crNuNzpMvur/5urX/eGhfn5c7FeYwq/IZ3wHpHS/56
         iM1/gQPIIkI6Z4gULTS3BB2xQL214faZV+zn1UWuZVj5bWB4FbJQBfU21R3+HqzIeT+5
         WamRY3lPkfioDprheQfS4rBxS+mYlRkGIUlypixOKATvEIiCAE3MibDeYbIRQImAaUam
         fbBm3XewkEpNW+pzmNj4Sk/fEXHPl3FAUQaTd6X1h6SvXhccZBadmMRABuBAsNrwc2Fm
         OExw==
X-Forwarded-Encrypted: i=1; AHgh+RrYEB4TSz543Aj/S9rpgNcjG0y6nP6TijnkerESb5+cdOLhHzf3L4pcWPuhOtKm85TzC2NVUc43SzhoNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3uxUG97YYx5YtjG0hnB2Z2eGuKQ5vq55PVRiIUjRje04IAzc
	jH0UyrAPTqq1YXMbtFqm/lorNODR2CHtLDQD4xwIn6poy8okXYeM0rvQ
X-Gm-Gg: AR+sD10rjgZDQP0zSQPOQXBc/UlF4LLdErP8rOduDB8vNntaXxDiQdwDm/ujxMKOzmN
	HTRjAwJambDi6z0z6ATxvO868lL6Ec8kVQxCkbG3kSaf+n2UptdbxipXC1K4j7rtn18piFWWwtE
	nRSRmbR3vCUlyScw1vYQjPpdt6Cv+Nb5oQ3pa7jUBdcdivQxPf9dcDXZddiH8Jep8D5wtLiPlvo
	Bwv3pL5KBPowLmhUuvMo6tpW0JDPk79M8UloUujMUmk7SOF72JFqCWtjHZIcagwJ9MZrzxvl+mC
	Fyr4T7b3PEOCOVtF/n7n0AmvadUL794Uder9Lu2tUVILxYVSaqM5IL2Yzmd/D6HJRPvaQab5jgV
	OcfF//MVQxQr0hSRNRrwu1GJBuOZ3DUjGq7koYwtHQtM3POsDznx7WASDLQvEIqGB17clyYhiAw
	==
X-Received: by 2002:a05:6402:a505:10b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-69e921305c2mr2757943a12.13.1784625971092;
        Tue, 21 Jul 2026 02:26:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm5662961a12.30.2026.07.21.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:26:10 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:26:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aayush7352 <aayushdixit924@gmail.com>
Cc: linux-staging@lists.linux.dev, Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: nvec: fix power-off path to not depend on
 workqueue
Message-ID: <al87LpFW487A7DXH@stanley.mountain>
References: <20260721084727.79305-1-aayushdixit924@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721084727.79305-1-aayushdixit924@gmail.com>

On Tue, Jul 21, 2026 at 02:17:27PM +0530, Aayush7352 wrote:

You need to use your real name.

> nvec_power_off() uses nvec_write_async() which queues work via schedule_work().
> During system shutdown or reboot, workqueues may be frozen, so the
> AP_PWR_DOWN message never reaches the embedded controller and the
> system hangs instead of powering off.
> 
> Fix by calling nvec_request_master() directly after queuing the power-off
> messages, processing the TX queue synchronously in the power-off context.
> Also add a NULL guard for nvec_power_handle.
> 
> This addresses the TODO item "add atomic ops in order to fix shutoff/reboot
> problems" in drivers/staging/nvec/TODO.

Missing signed off by line.

> ---
  ^^^

This is a common thing where people ask the AI to fix the todo...  You
need to say under the --- cut off line that the patch has not been
tested.

The TODO is kind of vague.  "add atomic ops in order to fix
shutoff/reboot"...  I suppose this could be the fix for it??  Anyway,
Marc wrote that todo so we'll see if that's what he meant.

regards,
dan carpenter


Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5731327F
	for <linux-tegra@vger.kernel.org>; Sat,  6 Jun 2026 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779829; cv=none; b=Q+pJ99wl2yYa/WYE50+UTpeMqlTIQn4x9z4PBkqKA1e8XBPw/fTjWEhyMxFciF5XM440/UBxEIYfMxqzxHAQGcffeHEWnwtf8KdqhDqfaMxSHCFRxhAABfXHL272yIljd0UfRCcAjCsBtMUI8HlgoSu4qTdWio0Zf5rtYwpmC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779829; c=relaxed/simple;
	bh=8aQsvQV92fCNEJtI42BLGSyXug3KVyb8/WsuBLmztq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8CEtgRipJegB6uYe65Ht2MDUDCVi0qBsFAF1ZQBNEXwusCcOnMWU0WVMPibYAFRje77p6XcQ84BVHuGcR2NHU0Gn2DJ3UyYlWZXX1mfcTdt3BBF7All1W+NaNxL7W06vSeKuPq05HQDeFQN3pLjpMK5WDrOOUcWyu0bgd4kaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyC2BOm7; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyC2BOm7"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso5301321eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 06 Jun 2026 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780779828; x=1781384628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=gyC2BOm7S5VP72mgnsTuhnN9AFqyGpSdrXsm683Sebk4NIWJ7aOvSj1RrBs8RPIALg
         ZlNdaZ6jaPPQp6+QNBHKWny3CXkarbqoUaGSz5nZFfgV0ETia4Zz6BiXd1JOg4UmlgeH
         IuJxGxAfRFywUbRFS1iclf3mrzxm5/YMbwIWZh/Zvc2KUwvcPfGzQ1jPQS3SxbG4rzpd
         I1JOn7YF+iLVtAt46bifoeGncS+O5KRdu/D51wKDROjvP6s93+ODmZRsr7ztmDXC/aAq
         6gEML85fg84YhetACuEBdxXki7T3+TQ9/FzXnXlw0NSKYOaRFV/LYo5zSa/cyeDPxFUS
         HWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779828; x=1781384628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=HE6pVekDjgHxiBZWSaLBpneFKcUvt2LMA4PQIOex0B9FQuny/xyELU7rWlHu1YEgyj
         JWnP02DTOwLwavvgxaolw5oomWgAYZA/oZsNp0atlARYzTEgBmpmz8Vh4myfkVIODwnk
         DfGTah/1DD+1tJvfPPMOvJSU0WwVaQF65YK/+g53QETLMC/WIp6MjGivhzkEsNMHz9IW
         IQbYRzQUDHA1OjsfZLtC/d+uh/qTP6sfxyWV32YmG2868k72QGBVzP91wU+YGd4u4WWA
         w1LoMEh68auZkCPodMTXP2530oHCnE7VH9yVpMiLU8WkesyRO0SNzN9MAqaguH08g5vv
         Kmtg==
X-Forwarded-Encrypted: i=1; AFNElJ+hbVs0gtSXW1OGo5zPGNWFQfQBpOQ7EVNDp3VUNQCXgrXm25ugRMFQOOdoBDk8xPIDa2UsMLop8mkWvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5frUzzpkE+F6tWDIbaTQABuOvAkWELOancLfoY75E1F9jIjZH
	u8CuVaRSndJYq1VCEm3CFPIhaIa5Hz4q5UQyDRNDvtVYwDP6KLSzS6oo
X-Gm-Gg: Acq92OFsDoESs33iQwHWO27dbHoz5Ldeho2GcdRsIzdUKtZTMJlM0VmRRBtFYHgqwdy
	RBO2GIVZSi0iVpVOC/WC3PajvJi2awBTbvZw3TPQeYCLsgqFv53uKRdre7h4rX2OdEmCxpC59yT
	7VnefC1CpMuClB1gVljhaD8EY8MG/IPrmZbKtppemZNUbAEI8iKzUCQGaCC/kOGN0SAaoxaIJnL
	p9OqyDmvLKLmYiZWDnlxmHr7YNOih4KWYelRnszwymVShXhpQli2HAfllAoWmoshSGrBmEWx2fc
	EEEV+v7QVgbXgnNs4qODC4Cf/mdt3qRADspKtgTz3fH80M+cw7KQL06E+fVHNdyn3iGypIiahVl
	ZQxngHGnuc+63dZkoe8gymXPzaLFq40gbGLD/8iFiIpj/9qbbR4pddIbTL2CdO5bDBWPKW4nXjw
	Q+C+LvixXO/qf8r6Z3MsNp+ecjqOX0Eq+/uaw5DcB+/+Wu9n/pWS1CRXI1RRweGQuTJK2AOB4Og
	RahFRwOpTbwLQ==
X-Received: by 2002:a05:7301:5f0f:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-3077b1de34bmr4945899eec.22.1780779827609;
        Sat, 06 Jun 2026 14:03:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bb2f:1c0b:386d:8909])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm11772015eec.19.2026.06.06.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 14:03:46 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:03:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org, linux-input@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: input: remove obsolete
 matrix-keymap.txt
Message-ID: <aiSK6_n4ZnB_KRd8@google.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
 <178052559618.2296868.8781332297681333925.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178052559618.2296868.8781332297681333925.robh@kernel.org>

On Wed, Jun 03, 2026 at 05:26:38PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> > matrix-keymap.txt has been a single-line redirect to
> > matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> > Convert matrix-keymap to json-schema"), which introduced the .yaml
> > schema and reduced the .txt to a stub in the same change. The .yaml
> > has the same filename in the same directory, making this redirect
> > unnecessary for discoverability.
> > 
> > Eight instances across six files still reference matrix-keymap.txt,
> > forcing readers through an extra hop to reach the .yaml. The stub has
> > not been touched since June 2020. Update all references across input
> > and mfd binding documentation to point directly to matrix-keymap.yaml
> > and remove the stub.
> > 
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> > v2:
> > - Patch 4/4: corrected commit message (eight references in six files,
> >   not eight files), Sashiko review.
> >   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> > 
> > v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> > ---
> >  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
> >  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
> >  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
> >  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
> >  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
> >  7 files changed, 8 insertions(+), 9 deletions(-)
> > 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Lee, could you please ack for MFD piece and I can take it through input?

Thanks.

-- 
Dmitry

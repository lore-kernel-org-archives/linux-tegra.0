Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25A357739
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 05:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056286; cv=none; b=c2gXUdWTdsr+CD1diGWbpYyuVT62R+Y15euHiKUBc48ABfajHjEuD7yC4JK9uZWhox/HgNhzuVWNJLWe0eENpTPLOMmqstvpk+cLa9uQUn2X8SJ4k2WC8tFhvZkZXCJMMdc4iuVr6q58uk+gSqVQ+QZkZfCBqXjB/LI/V5gLkO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056286; c=relaxed/simple;
	bh=pVm9pS+PVo1sWY7zlCDKGAP+Y0EYCctZHYBMrpl/GZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVi1eU4IqcGpxRt2EDjuCl5pQRq59qs9KMWq56IL+XNnWoM4t38/V2swbLg4IEQWwNwQ3aGjE1RO/3GpmJTsSzUpOlOyGfSfp+/bsTv4HthD+5tZ/E2aJMFp2CXxjIE3CDy9QvsZFWHa5xfcAKY3wVNNDzjv47K7lsBVZJBrm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXJ4pZkR; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXJ4pZkR"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-497e6956acfso199335b6e.1
        for <linux-tegra@vger.kernel.org>; Thu, 02 Jul 2026 22:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783056273; x=1783661073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ku3ZZ8L4tk4M+xljq5uIH94V1Fi9oyEnYUJ16WQL16A=;
        b=KXJ4pZkRaWMoCDVsHoj7F+5BU+SKV1XiAXTHMgr1/EWdolktKmWF1LSM8xlg2nWQKR
         eVySg5h2jsIpESxZ45VId3YPfPcSYNhF4yzO7BRhpsNromS69c0xiliPF6nWYl+0ryd4
         OSloI+O+LZOrVxX3Tr40bX56ZbjZRWyu42G9oq6UgUKjvPd6tdG4NcHjKZIWTThiz6kg
         eohHoZClM+JOTQoYJvAmKdT1s2wR7hk5RgpbPmElLqX/r7efOafuSUakKYsKBWe8m5pi
         oBvoav1sNKlPcIhLupQAfY71WLp1aWXkFZZosD3V0bqRvYldfrEkxQZaVD9m8DMq7BOK
         i7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056273; x=1783661073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku3ZZ8L4tk4M+xljq5uIH94V1Fi9oyEnYUJ16WQL16A=;
        b=qo5FSZTaDQZ70YtlZPrz9UwA+XaLj9Fk/bynXVi5b5I/AD5sol6jclwCW41Cz9CsC5
         e1JAV8N2WdvYCkygKuQYPmKs6r/tJUzB/sQqBKWOjXEFAjNh0mdnHAf/mQYt+YDQM2yj
         3l4kag9AhAcHSrRxPA/jYRR1YlPr4tnASkJmBuw7zn6+PYTgHfCpsXOU+F/5cB5KOrEa
         Y4kgO/OCndArNZrgj4v3PQHn+GLohkXxY22jVc4/JmtbbRVlYnyrVFSRUHoMCnE9Ruc7
         JvJJJO4ubtzV4jCNRjWLn5S6Q6sUroEH7zYXtuhy6agnin97SVORgFsfWIxKBgir2wwR
         sTlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QLae5Mb2rvm+sbHFch+GBOJv0nKsOj9XfImzAxpyaISc1uMpX7NeZui2+QNRzLAgvCz1zyRYpmuQFXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BLrrxOkQwuh9mQCQ+r4mFDceB5JXSUQBVkZAxrPo9xvsrErF
	QtZouC9B7jX52nDvQhp7xdRT2xDV3aBhDTnJya0Be06m6SrWNrZjNpmJ
X-Gm-Gg: AfdE7ckSjbZS/EmAiDG2/1nXImYC9EptHkFbanGKq0ypk20KgftgwkT2iEUJkwboPbQ
	NGU0xgVRGz2xOB3ZpeaUErC3D/WImnqYJYxyl1S684YHcvncO7aOGHMVBX9y5U4uHLt87yJgz6+
	6HmDyzcNuf/Yyvr5vUHjCM63qR/9pp+DatpimfSSY0QQr4tm9TCGgEvotlTgaBcB3SC0rnDoo2N
	CUZ+m8X7vnB46NsWsN5zIzrEhtuGzo6afrVYdpNK5MlA12f7DqdQB2H6zyU35fRWMeOiy7rxvGA
	1NjU8tkhs4OSUSsT9N+6hJFGOhKtHEeStmKFKQrGGPuSUY/fBDwi1hFa6jRtfwNG4eua+c/NwPQ
	N+XyNmPrJg2OW4UaEYSTt+RXPLkkPiQ7vqCRYtsq8dqvrAGhLLQaO4htuaidfRqxcJdPRmAW/eO
	PSKt0E2TPoBQyo4GI6xfdJ
X-Received: by 2002:a05:6808:17aa:b0:496:6b1:cc7f with SMTP id 5614622812f47-497e1bec6ebmr2160066b6e.3.1783056273105;
        Thu, 02 Jul 2026 22:24:33 -0700 (PDT)
Received: from gmail.com ([2600:1702:56e9:4b40:ff21:65e6:6e3:5b43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-497d1b77a11sm3272472b6e.17.2026.07.02.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:24:31 -0700 (PDT)
Date: Fri, 3 Jul 2026 00:24:28 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
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
Message-ID: <akdFQ3j6fDW4cVIp@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
 <178052559618.2296868.8781332297681333925.robh@kernel.org>
 <aiSK6_n4ZnB_KRd8@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiSK6_n4ZnB_KRd8@google.com>

On Sat, Jun 06, 2026 at 02:03:43PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 03, 2026 at 05:26:38PM -0500, Rob Herring (Arm) wrote:
> > 
> > On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> > > matrix-keymap.txt has been a single-line redirect to
> > > matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> > > Convert matrix-keymap to json-schema"), which introduced the .yaml
> > > schema and reduced the .txt to a stub in the same change. The .yaml
> > > has the same filename in the same directory, making this redirect
> > > unnecessary for discoverability.
> > > 
> > > Eight instances across six files still reference matrix-keymap.txt,
> > > forcing readers through an extra hop to reach the .yaml. The stub has
> > > not been touched since June 2020. Update all references across input
> > > and mfd binding documentation to point directly to matrix-keymap.yaml
> > > and remove the stub.
> > > 
> > > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > > ---
> > > v2:
> > > - Patch 4/4: corrected commit message (eight references in six files,
> > >   not eight files), Sashiko review.
> > >   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> > > 
> > > v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> > > ---
> > >  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
> > >  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
> > >  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
> > >  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
> > >  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
> > >  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
> > >  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
> > >  7 files changed, 8 insertions(+), 9 deletions(-)
> > > 
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > 
> 
> Lee, could you please ack for MFD piece and I can take it through input?
> 
> Thanks.
> 
> -- 
> Dmitry

Friendly ping on this as well. Rob's Acked-by has been on v2 since
June 3, patch still applies cleanly.

-- 
Thanks,
Akash

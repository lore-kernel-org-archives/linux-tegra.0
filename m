Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9235677C
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 05:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056109; cv=none; b=aOpU2aNLOGqWUr5RNyDds+dBqxPN3JLR0oPHvDHeitSlWBfIkKj+4xAWbFxr5BFz7FSMzBu3r6KnhgcaH0rzh8GKMG5zKg8hHU70/q6JEtX+CJu+ECSTxWO25Aqks2TWfra1XxzAjWRmilnsR4vpfmdoGsSz8aLIlMXFW5M6UTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056109; c=relaxed/simple;
	bh=ungXM+pGccTPmY4MYi+TOmQLabp5apMUzorBXrm5qVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq1Pt0kA+cqTaDcZ1JRyx4BTsYIuWIaevwnvE52tBt52WS90tleIqe63SePW5v0lk3neI2awrWkB9YY6qvQoHBI+D+InNp2ruClPVxH0t6vwh42ysLFyEscaSU22bCddIT+cjKAniLFZO3+/enhJFWNZSax8MokQuZaEJL4jvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+kVEf1z; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+kVEf1z"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69ec2ebec61so68645eaf.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Jul 2026 22:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783056101; x=1783660901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rbrF5PgluXo296yF8wu1iDrFOX+6QVWi9u8cpBpxPXM=;
        b=h+kVEf1z6+OUrrAyxKRdwJjeEEDGg+rG8cF484EV4vUNX33SgP84/tqzO/tWZcxZZG
         lLqZtJMpLTplvc5dNg09j5raiJ0qFSOMpngjR1Cv6YoO3+WP1vyenhsHoRMwIuZ05Cni
         lC4VzpI+njML3iNw5w0E1aZRA2T5eOaRJU7uJAUCKhYf19vVLw/ZrcnDdS+qUtIZ/QG7
         N/lOKYdlgHJeQ/VntPRGTXyJ0y94ci6Xk0T3JrQKK687yEEQ9s31ZApWcpdii4Y2hIq3
         OLRIe7iHrAQScSLI1sg8oT89oDNPl+JGr4b4NaU7P2mZTofRTSCTvnLQK1JcV7XKomx9
         Pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056101; x=1783660901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbrF5PgluXo296yF8wu1iDrFOX+6QVWi9u8cpBpxPXM=;
        b=sfiqIZiKJV/RAzuwgPG84huVqQBD56RSd+ka9ZPMvNh5/4wQQXSbc2tRpJ+tKBDNwC
         5zXtZNw5K3iQrzL1gAJRr2YPWYxDbiCt0ebKrK88nNU7trWlXEgoRwNSQBg/bERlxzQM
         KPqrgC+b6CqdObvNdi32gnH5vittconsKF+xSqjzBVu1W/aXMIMkfHmyiPqnd8IOmwnf
         qLDiUOL9UkUhKsCHc8IRvA8SC9C2jwwGx3przbC0NpGbWR73Ixry8PBcRU4izjPJoaxP
         JYQi+2a6P9SQxemlmMuDt/K8jYdUJ1EzhvteNzr2ieZraHw9K0DTtPmYfBeU7LX1ccH0
         xrcA==
X-Forwarded-Encrypted: i=1; AFNElJ9vqcc6wLaH8YHC3X+njELZIKNULx7hqpkGnbrYj1Hgf0xofRaEeAF1cYixoHRkjcUMtHP/RxfZG4vIDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWv9gniLVpWzeb9QV0RVXnameHTYCAkm2Et9tQwIV5AX8+moq
	WminHVdV0KhOSX8lGLt6Ufqsco4CmNugDYaD7dqHMs67MuoE1YTPMehS
X-Gm-Gg: AfdE7cm/HZCoXMzbrJge0CUnLPNYUUXi9f+uZPZ5wbp0Rhr4yBww9TW5+1+NvNFlzJi
	aYfmo/mP4v6bUMYZ3tLioWevEKiURNrckP6YzB6sy4AVhIPTulC0EpGkzZS89VbRnPCB1ldDLGE
	Q9fpbtCds2xxkIWrIthBrOWzc/1OsKzpH7+6EuMwZzLhmJlMG9T09Ucu6oJjYA9Nd7YGVi++hul
	O4a94Fv+wnmqi0qJSqLFwjRBD9gq43FnG9o02BxKZuz0zg39a4ZsOWzOMxTdlJEpBeYXPqV7fLr
	WMNXkAvcGzEtC3fzKztO7iZ36Ung6TqogRfxioOleWFfgrcX07CvDgvvLyuZAWWtz7NrWU31Cpz
	8K6NqjVf+Y7JvlRDMaz2/5ec1yF3DHkDoQHg+Lo3z+cqLbBliebzxUGom0INz0Fo71SutOqPmX5
	Plk/3SCNnJrJCatf/NaQb+
X-Received: by 2002:a05:6820:4c01:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a30d887c40mr4436494eaf.38.1783056101413;
        Thu, 02 Jul 2026 22:21:41 -0700 (PDT)
Received: from gmail.com ([2600:1702:56e9:4b40:ff21:65e6:6e3:5b43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d011asm894391fac.8.2026.07.02.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:21:41 -0700 (PDT)
Date: Fri, 3 Jul 2026 00:21:38 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: remove obsolete rc.txt
Message-ID: <akc_pO_ctTiZmbFw@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-2-c8c19876ab64@gmail.com>
 <178052520503.2279647.12293343206224505400.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178052520503.2279647.12293343206224505400.robh@kernel.org>

On Wed, Jun 03, 2026 at 05:20:05PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 03 Jun 2026 15:42:19 -0500, Akash Sukhavasi wrote:
> > rc.txt has been a single-line redirect to rc.yaml since
> > commit 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for
> > the generic RC bindings"), which introduced the .yaml schema and
> > reduced the .txt to a stub in the same change. The .yaml has the same
> > filename in the same directory, making this redirect unnecessary
> > for discoverability.
> > 
> > One file still references rc.txt, forcing readers through an extra
> > hop to reach the .yaml. The stub has not been touched since August
> > 2019. Update the reference in hix5hd2-ir.txt to point directly to
> > rc.yaml and remove the stub.
> > 
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 2 +-
> >  Documentation/devicetree/bindings/media/rc.txt         | 1 -
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> > 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Friendly ping on this one. Rob's Acked-by has been on v2 since June 3
and the patch still applies cleanly.

-- 
Thanks,
Akash

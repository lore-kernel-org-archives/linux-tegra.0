Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BF1DA309
	for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436174; cv=none; b=a7oLVDU6PMwPWFXpuvHgWCOyrBydFhXTf7ZXoZTQrLvH0pv+fbflrzAN/XpDX/lMvqSQ8bVhDLSaLJMvkQkYWh0fEOrAvHxkauV9TjBuIBU6Xko1VA5+Y8RgydguBT1ZYbfrqRi+P+76SIkhYKkBeYYwE21ZsfMEX5NZhTn3Fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436174; c=relaxed/simple;
	bh=J98H66QvpBiOUVzghexOjAhZzIEmuNg9zEQR8fzFaHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce01tJttb6lEhfhwp+HDCJ+N9dSz1xGd1TCPW3hYCMUBv3VpN2/cETDj13VFpOcjoi+XRGVhngqumzmcBsfZh8zCPmQXZAfph4mPA3TB6VFrfDyV4NgNQ6cmLgmRO0w27CoWG5KCkdoQwohUuINFWjEwQjE0t5DxnkLxc6S7gI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYUBfNJ3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYUBfNJ3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a68480164so849407266b.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 03:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436171; x=1735040971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zORJ2k1lXTvrlTstikDzURXTShm44pzjFY3LvL0H7D0=;
        b=aYUBfNJ32s2VTFFptR3wTOjMgN8L0qpDjvnpmKJrJDgACzh4NwUyusnUK1tEGc2mTO
         02oDJHhCoV3UR8zpIUlnZ8VDbreTkrBZ8LYJSo6znSRvgAMkuI/zNuMDdBhF8m+zbdQ/
         plfWvefn1yeubbGL4b/EYMEICP0jvNGsg9ohn67xsJUN96COn+losdDhkY6qQuKXGrtE
         CsgDbvSYcDNUxvcxGzPcdFiM93cPpi2sBBcxKkWgKz9/B1b+8CFx2Uw9b52RO7IHeI+K
         LOD28zI50vMJIyLFvt3r178m1ky/Zq3l5sONDBi8xu2mt4Pd+rqlGJ2xv5k+B50d5FUB
         69Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436171; x=1735040971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zORJ2k1lXTvrlTstikDzURXTShm44pzjFY3LvL0H7D0=;
        b=N2jvoXEP9Yu/3cBtQ8s9huHpz9nv04cLMHVGIRXZU34m3nWrKDWPI1qjLzvUthVpi4
         lhvoEam5KmijJWfUfeQTe8OwiwQ77a7SyhK285sVj4oZkFl83XDcFm7FmI9DXpX8R3xw
         66/nBHrLWGg+evVVusKk0YPRRqW+5tfvMhv2pwFRqn/r6d6uh18mK22+qcgN8HhvYi19
         QtvMxKBqZWOfvTj+frprayo7Yav7sU4q2BpK8SXY1k5MgPPeSETpW0c4pVB40rVNdUqK
         HoN8wx8aLEXUAgvlp3F9BcxejacVZ2oYBcIztC5VlGMX9/fgdt8sFRnALyeUUtoJjp4D
         1tnA==
X-Forwarded-Encrypted: i=1; AJvYcCV3L8CfW4o+/pNmRPzLN9rm1gAskEapfWuLDsHztHkymrzi/7aBcLS5chll+9P9tmuTro8m90jKxoIplg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrj9S5BaDxEgfJMjqMQOYJvYmOzSnv0TSLSUTDwInhPFwOd28d
	rVwS/NjMbA+Rvbt2yj5pVyBUwZJrPX/nLuvtLx5yTpchDadA+caaAOvj0CrhguQ=
X-Gm-Gg: ASbGncvM7xrLmr6+VR68+lMFZGSDp1kEF7305KvBCKeiHnA4X7u4t+bpRkA9wYtpHmJ
	jYPckPfonpG3fWE4qDLnQRm9PyfU1OuJ772qdXJogA+fyOKhfs4QegnbwKKLbV4MRpRBLU8cQu8
	vGiw/1yaBeKQ/mtR4oiH8/6PgOnFr5VSUZkxjjqgYUORGF1XGD2uEdScidQX+Nz7IG1CqmEXRg7
	iO6Kdq1AZdQuJLBCDshWr0vydFUEjya1MxdLf7BMJ3/IAcEdDoLbCv6KGfQQQ==
X-Google-Smtp-Source: AGHT+IHik5NZtf1maETB9LL0UeAbWUFe7rZNPCo6/7/JNOv+fkBFOjV8UsRzuPn01Wawml+JDgL40A==
X-Received: by 2002:a17:907:780b:b0:aa6:7ec4:8bae with SMTP id a640c23a62f3a-aab779b3e7cmr1319167066b.26.1734436170599;
        Tue, 17 Dec 2024 03:49:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aabcab0431dsm179534366b.196.2024.12.17.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:49:30 -0800 (PST)
Date: Tue, 17 Dec 2024 14:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
Message-ID: <fc0b53bf-029d-4505-a50b-8108b0788eca@stanley.mountain>
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
 <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e21d04-75a4-4361-8623-0dbadcd4ff2a@kernel.org>

On Tue, Dec 17, 2024 at 10:31:23AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:14, Joe Hattori wrote:
> > As of_find_node_by_name() release the reference of the given OF node,
> 
> No, it does not.
> 

Yeah, it does.

drivers/of/base.c
   927  /**
   928   * of_find_node_by_name - Find a node by its "name" property
   929   * @from:       The node to start searching from or NULL; the node
   930   *              you pass will not be searched, only the next one
   931   *              will. Typically, you pass what the previous call
   932   *              returned. of_node_put() will be called on @from.
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   933   * @name:       The name string to match against
   934   *
   935   * Return: A node pointer with refcount incremented, use
   936   * of_node_put() on it when done.
   937   */
   938  struct device_node *of_find_node_by_name(struct device_node *from,
   939          const char *name)
   940  {
   941          struct device_node *np;
   942          unsigned long flags;
   943  
   944          raw_spin_lock_irqsave(&devtree_lock, flags);
   945          for_each_of_allnodes_from(from, np)
   946                  if (of_node_name_eq(np, name) && of_node_get(np))
   947                          break;
   948          of_node_put(from);
                            ^^^^^

   949          raw_spin_unlock_irqrestore(&devtree_lock, flags);
   950          return np;
   951  }

> > tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
> > use, resulting in possible UAFs. Given the DT structure, utilize the
> > for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.
> > 
> > This bug was found by an experimental verification tool that I am
> > developing.
> > 
> > Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")
> > Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> > ---
> >  drivers/memory/tegra/tegra20-emc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> > index 7193f848d17e..9b7d30a21a5b 100644
> > --- a/drivers/memory/tegra/tegra20-emc.c
> > +++ b/drivers/memory/tegra/tegra20-emc.c
> > @@ -474,14 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
> >  
> >  	ram_code = tegra_read_ram_code();
> >  
> > -	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This original code is wrong.

> > -	     np = of_find_node_by_name(np, "emc-tables")) {
> > +	for_each_child_of_node(dev->of_node, np) {
> 
> I don't understand how this change is related to described problem.
> 
> > +		if (!of_node_name_eq(np, "emc-tables"))
> > +			continue;
> >  		err = of_property_read_u32(np, "nvidia,ram-code", &value);
> >  		if (err || value != ram_code) {
> >  			struct device_node *lpddr2_np;
> >  			bool cfg_mismatches = false;
> >  
> > -			lpddr2_np = of_find_node_by_name(np, "lpddr2");
> > +			lpddr2_np = of_get_child_by_name(np, "lpddr2");
> 
> Why?

This drops the reference on "np"

> 
> >  			if (lpddr2_np) {
> >  				const struct lpddr2_info *info;
> >  
> > @@ -518,7 +519,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
> >  			}
> >  
> >  			if (cfg_mismatches) {
> > -				of_node_put(np);
> 
> If of_find_node_by_name() drops reference, why this was needed?

The continue statement also drops the reference.  So this code as an
accidental of_node_put(dev->of_node) and two accidental extra calls to
of_node_put(np).

I can't say if the fix is correct, but the bug is real.

regards,
dan carpenter


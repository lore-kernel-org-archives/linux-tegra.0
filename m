Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7E2BFC7B
	for <linux-tegra@vger.kernel.org>; Sun,  1 Mar 2026 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402169; cv=none; b=R8T7IVA1qFqFJCTDYnrVTNN7eE4XDBf+eubwLrFpLm26cs3egfKROe7tekTMAmtNThQ2XmgR7Qg70jX7F5EBs2pC9c2xQJoSJxJNwIUiqPSN9YZYQlcp7LET6KnV5EoGCTXIlJz24rDmvJdSbyhrsTDVwulGUHqlILVKb7BahiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402169; c=relaxed/simple;
	bh=7KcWMTg7IAVdO0nLU/h50zMEUxSoooideYRvPqP4BmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLNSgUfIkKJEx0vR+ypsiZFMRd4hMlMt7wbfVkzhr5zgh3Tb9Gz+E5bmAvvxFg1p+Q753CJIh6ey2551JR0MPtYMVGt8ssBZoNYhIfHIMhWEaPnFnxiu8BjRdhyUdG3Jv6cTddj3babskR5d7ETDMh/UGiO+p9/QYEyjMGMtaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym8Z3LJR; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym8Z3LJR"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1275750cf9cso2940162c88.0
        for <linux-tegra@vger.kernel.org>; Sun, 01 Mar 2026 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402168; x=1773006968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIacLwhje9cL0wv5CnP9VaDZyNaAAbXizVI9qFdiSd8=;
        b=Ym8Z3LJRq8qLXdwlUoeLXyIgBNvRgJOSTEc3s/AR3g5qdENx40dWKiZsHd1bh+Gc7G
         fK+/kEgr0jqwwf0NCuO+GppKLje9h55U6GlViOe+QR5azzMXV5rCcakgnuhmcNE1tagY
         ZfbiQBejqblTA+P60ju424KWGeUE1s8AuNdEhvysex87G/BEuSd16S+YDck8fLkcNCqP
         vH/CZ30J4M5xuk5La3BUpC566PoU6mzXdyZr7rXODQD7acCwOeyI2EMhdv8NsbsW/si6
         ZgKX5LeQONqGV3hTsf/op8pnsYABuji2JSKBx2Fr8pTcvfNOcc1HBQibGx07Pby8ilqE
         naEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402168; x=1773006968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIacLwhje9cL0wv5CnP9VaDZyNaAAbXizVI9qFdiSd8=;
        b=k/piYOQ+Ift5KOZmLGTW8VMgOWRkhDdWmVrTEGgzl9nhJt88Drjr9kQJ+4KHvXZrcy
         oe2TeZspUsmxoOpp4r99XqXxlR3oq621VxRyKgReY07bgYWcH27uMPzIayevjfwcjXLj
         lAplZJ8KDw92ehWLbjHGPnzn0eQku+28lyytloYcfL9AF3hW+ftuebfmeG58gsR/yl5e
         1bVP0pYHUidJw1q0nD3sFPJB0o88cET/e3QtEdY8dYnNNOI82kdLgM41udK/CdPhLcY0
         okrrn4xCw8jneSCjn3Ude9tkch/pI6XOZ6dQXiWrrfThVihzruSw+8riE0a2DWANEUwo
         bgbg==
X-Forwarded-Encrypted: i=1; AJvYcCUdl+GEoUmkUzWGAlHOEMKW0s8/1t2SgLztduoP2ZCY9fCBRIkCVifBh66P6VhKxzbDTI1PZsNH34FP2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyollUjYoMTBejdniKiM/3DI9dHUcUYKY0rZvrpYJrb6r3tIArS
	4AbqP/YziqXBq+BiQAJEy7T/nS1LcKrdnIQmp5XmoB8/8VAHzlXOEVAD
X-Gm-Gg: ATEYQzxnz7RXWNyEX2ackYJcnhaG8rvlP6VPIgOkuS7hLj8BILkalpa3xHUcQjfG6ly
	KFs0KEXMeGPLRYaEKkm89l1xmAaWaiutFI9Zuf74Zo8WElKpPjc7Y1KW5ZUuWJQ1rRcpLASBKj/
	AacmpaaC84+UTV6iu6+CIJryAZHu1hV7BYeEc+B6RCSY+LwCicGUluds//mYZije0HzaNRr6brJ
	oysY8bepVRBC1kCAPOyZ86bsS0EP5sgKcmbgCBcccDS3fmvbJfJa+HAlL0nvzzBgDArDU/VhZ0Z
	Rzc0XPc1Q2DGk5gYu+m6UUI82l+VzNjstPMZex+fadrhET6COqaCuKkMZApDP1OMtywC8nwq/Jy
	TY6YYZkCk0GeSTFso/PKo6Y0F+L4POpIt0MeBgeJIqi5Hzd8QbQ4HPlY6dPewPITHHMhDnPxnD9
	6GBKdgNVtKPoGUkuFhahGM9yAJvqci79ny/ylMDo8N5mmaxTwlG7npN7iWXMMO5nJX
X-Received: by 2002:a05:7022:1a81:b0:11b:d561:bc10 with SMTP id a92af1059eb24-1278fc95345mr3745869c88.41.1772402167752;
        Sun, 01 Mar 2026 13:56:07 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:864f:8513:57d0:4064])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm4048586eec.2.2026.03.01.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:56:07 -0800 (PST)
Date: Sun, 1 Mar 2026 13:56:04 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aaSsgDqmTLEQQqK0@google.com>
References: <aY_BpRQmLdqOOW2K@google.com>
 <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
 <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
 <aZvdDIYlCjg8sVGT@google.com>
 <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de>
 <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>

Hi Marc,

On Sun, Mar 01, 2026 at 09:55:45PM +0100, Marc Dietrich wrote:
> 
> thinking about all this a bit more, I guess your approach to just convert
> the driver to device-tree and not change any functionally beside it, is the
> best solution for now (and good pratice in general).
> Maybe I can get access to a machine with bluetooth (or some other user steps
> up), so we can try to find a better solution, if required at all.

Thank you. I believe your tested-by is applicable to the current version
of the patch as well, so maybe Thierry can simply pick it up.

Thanks.

-- 
Dmitry

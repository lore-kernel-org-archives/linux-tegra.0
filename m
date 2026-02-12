Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231F22301
	for <linux-tegra@vger.kernel.org>; Thu, 12 Feb 2026 03:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866543; cv=none; b=ZPrO4zxG+N9M7w9NdiaLPmEGXqQsKeE4YmrlyLEdLDebrncb6xtdoFHfpCWdzi4GJNPgoNLor2Eqx4mlk+0jw5vKjBCkEuk6hpqU9BtvAfIMzatnB4vO0yaZ/riPFTEmn741FxWeMDij1rhJ41Mwo56isgJRYTy1aNr/A+dRBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866543; c=relaxed/simple;
	bh=uRY58qhwJ0eYbSZ5xQCTmPPEhShMVJg7sN+/KK0QL5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3cvxdEd9rm5WtoTNBdVr9ISLQIphp0FsORuFgtAgxAPFIT3UybQ64ihxugoL1A/I97+5a5Ww92CwEBcLPiBzq1fr2qY1kf8qw3Nd49Otz3ka7vGDLF0gLU9fPNgF2EyTjEIp9BQ+BMSLD0x915G/pa7DM0zfSVN1dyJXkpw89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn6h3DVD; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn6h3DVD"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271195d2a7so7075642c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 11 Feb 2026 19:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770866541; x=1771471341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkQH6lR076Cv3HChv/fjJLbF2dz8iGJz4V6MPQQwk2g=;
        b=Kn6h3DVDSfBE4Iz/3bfwKOGARmT1XxkTgfnyUwpAD9IRE5EzO2y1s3FbO7NTJWj/9X
         NteQQ4niZNkKOqNlQxWaUOTWJ+8WzpSvGvdCXjDjpQy12YS1yMezHv0fsrelxHsyjoCy
         e3KkyQhSBuVXeYX+SOvhRg8/nOlZbcTtiN2dyQvpAgy3hUTNaAX+RW00ATq325DgYzfU
         EfXGG4qjCyHMQP51cLDdroN8wpBrAMSDv3G6sGvPnw8lXNbFMJ71YSAt7ISQmuR7CSwc
         a5cAnqRljr2O1MvXyKGnLZsOjcuydGr4POYpI8AV8LhIMd0WAntJqGxODDrXpa+VWVT0
         1ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770866541; x=1771471341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkQH6lR076Cv3HChv/fjJLbF2dz8iGJz4V6MPQQwk2g=;
        b=igFwySERD0knKjJYx9MHjL6yL68/SngvkKhCaXh9t5XHNruoF+Q4Z5CQ3YBtLbV6JA
         9VMysmgc2yIoIpYLDrVOZkDeU/nazgOru25QozlV/I/kbVBtACkXeDc8UG8yaLx/l3if
         q68BTlCaYM/rLUSJFFfpTxi9J3vh0T6bOLQXgPSU7Hf45sN/7C/f4cmNTzJllxe2/XFt
         SOL3AoloDPdJ8GI9EqFmlP1t1402gklojXIN7huiQ2hpLJvermBZ7nEHZoS197DnC3XR
         QZIcg5PU9JIiLRh5h8H6TxvZUlUP/I6j7A4CLCsW94sCGnOPMpn4/xlVuuycoFQL8DO/
         5Odg==
X-Forwarded-Encrypted: i=1; AJvYcCVe4SfZrwNtUEIVv76CDptDMppdgI1eNl6Ig1IM84T4GE3oW2hgC1m8jZwlE/Keod/sQwkRTKHJU2l3pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhxpTG1aQvmje4tjjHQlaNvPbiB5ttPfND75BtdURq8FLUgxg+
	ET7jvmnQjOvcc0KnatUDNzvkVdex1ytBGd97QJ+8WQNxe0TuLfYQH9na
X-Gm-Gg: AZuq6aJfvHDCbUqe4LFE1YeISrkbrbVmzFiw+RRW1gaWbisoHdFn2662sCTU38qBZZU
	YlaF1bUCIm2+XYamH3+dj3FsY9+iVuv3sPjL2wXLJUHT+N3+pXrx0yVYNhYi7gJumnmeOi0Dhqv
	WCn6RV+kZ8cttTNeqk8JXp1VSgxRhe7C3If7nz/X6ht2FoYfvNTjQw0w6nbEFoWI3dp51u0NfD+
	D00+JgSYWrYUZDwSRtlNkz0FRDdzeHP0cS6ZN4KqvNneEUmVmLPAWJ3ulu8Y9AfY6WJ/knC5wk7
	PbdQZhy+CkiAZjdMcBebXdywWnVgn54ix1J7tbfm+u49J5TbIoisuV8JtJkbNr7hpksxRrJJKo4
	+IdrJaES4fduopoYe/ah27662NkmwyfkexKWELzKBuJtwdqDuMyTMUE83gemGo1vCCs44tWzKm0
	nydcRmmAsR7RzvP3//eedP6MeT6KAoGQ/0n6EEV1YowzVMaNRIYu043khGyv7u03A=
X-Received: by 2002:a05:7022:513:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-1272f73b92cmr628906c88.7.1770866541220;
        Wed, 11 Feb 2026 19:22:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6fe357sm3507870c88.16.2026.02.11.19.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:22:20 -0800 (PST)
Date: Wed, 11 Feb 2026 19:22:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
Message-ID: <aY1GZQJLKAF0fsz6@google.com>
References: <ZnzulZBukibZUXKM@google.com>
 <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>

Hi Thierry,

On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> 
> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> > Complete conversion of the WiFi rfkill device to use device
> > properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead of
> > a lookup table.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi rfkill
>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880

Do you know by any chance why paz00 does not simply configure rfkill
switch via device tree? The driver (rfkill-gpio) seem to support device
tree...

Thanks.

-- 
Dmitry

Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164F1A8F90
	for <linux-tegra@vger.kernel.org>; Wed,  4 Dec 2024 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733340666; cv=none; b=ngPQoaVLKIzdKAkR3LlDImbJ47+fV0IQWqiz95V5feXQbdnkRJUURuNPFsZkMPrWo/oyN4BrgVvQLBbDUjSwvGPDkdB4Ge8zxAajf76BzZ923tA4mUyIbBUnhUqlqVSYjhoQ09cSOIZvuMWzsTC61QCIFFAdNL6W2FWiJQdi3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733340666; c=relaxed/simple;
	bh=5Wmc0FN97C26Lyr5nte64RTZNnJSHXevW3OWTbK0JD4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxO41sFjtbkZ42BBRiQv06nXptUFN93s4i4Ng3bUOYyYv3tp4ImAgI3cVagNqyqxETIpgcGDTfE3ApDKKv+/DS1G8nQEtBsVL4jBdwUhEyxW12lLrX7NY7+gPDvW/DMLwfmEHMAuYuc/SWu/TAOPqBpDegatElHNwO6O9QqhIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFRb4LB9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFRb4LB9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e224bbaccso10263e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2024 11:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733340663; x=1733945463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lluttuTh6ERVqm2v1le1MoidfHgvqcBrllLwWWjR1R0=;
        b=kFRb4LB9RM33Xnwf/2CWQhMa3h1k1IQyfB1WiBJIXbT10QzDYkfr14QtaRltXx6oYD
         r5tKAIyty+jweiYSct+gShzghRXY6du2XgQyANueR4UcPLLuzlKcyFfR4FflQJ4H2F57
         e90wotP/+gXSPEgDm+OEWSmc/Wx+gqrSPt2BiI0k+6M9WF8ySxzPG3M4kvToZzX6wlTr
         N8Euy/Urtlx0OZgiRJbhxvggn3RNSysrl94HRFE9kx6y7EX5qfze9rNDYAj6INgqt5r/
         opDu+7Mu24UBUuKLoUTW7AOLVMSNqsOVs43hNVldUy2NjLtDqiGEmsKVjbaEXUhm6Rc3
         MG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733340663; x=1733945463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lluttuTh6ERVqm2v1le1MoidfHgvqcBrllLwWWjR1R0=;
        b=Ef9q9PEFOb2Xa7cnfiVgwtSBiSDzpBNZhC5l3P/oqypRgxD34FEfpT9LcwCPCqYId2
         zUL0zXZTQjai/0a3RUCygtavi7gDuuw18eo+gIqfo+rOadNjKufUcth8raRPKy80p65f
         D8tL8hIcu34cK94HCiU82WEFsqXQ4Ybh6cl/uwqnwQWp+YPV9SOYqdj0Gw87BAYC9HT2
         Xt9ITB/jQpXzzG5/+VyeEZ9+v4AuotxN4n8/17GpBb0wK8xCvPHkGcV2PBbO/lefXr0P
         P1l3KKionzHblx8JqarL5QAPSDD0bhVFJuniY2h89cyt2RjfdH7SjGXqkEEdHm8M1L/x
         V5yQ==
X-Gm-Message-State: AOJu0YyQFT2SfBGP6dJoLxgCjdUIHY58SEMnf0Y4Z9wLdfMkY5F+eWCn
	sqP7Wk8TDYKpb+77JdhGXN9jZJucj6EXvsNjsSVyrU4pNyCvZT15
X-Gm-Gg: ASbGncvPUpYexwG6HPZcBRAXzkaXCKUtTWPmYx16P0yR7YSh+0Q9lWXEzuwal2F6PR0
	2l03cRCMl/zSz8YO+uja4sVljGwIoDHQFHXKmpoM2u1ulaXGxRyYerGa8vBicPyovp9oKFdwcQM
	w2oBKV3mCzqT8INbXdun1/XQ2dTHy7HkpYV8nlNGx9FtyhbCjq0wQ/KHa9iad5FH37RkMKZ+qDr
	Tr29ImOJqcrsevox5/ddhcgw+OiqSk8oaa94K9aZBcPJhgtNWOGDgxCqpD8Xev/0yc=
X-Google-Smtp-Source: AGHT+IEB0kmQnCDTesIYJ9Nr/m0PxR2ptI26NdKIpMccL5sWeet4aGRi5jvzc+Y+HGTExAdZlX285A==
X-Received: by 2002:ac2:5b92:0:b0:53e:12eb:6c2 with SMTP id 2adb3069b0e04-53e12eb08d7mr3383929e87.2.1733340662715;
        Wed, 04 Dec 2024 11:31:02 -0800 (PST)
Received: from foxbook (adqz254.neoplus.adsl.tpnet.pl. [79.185.159.254])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm2326376e87.136.2024.12.04.11.30.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Dec 2024 11:31:01 -0800 (PST)
Date: Wed, 4 Dec 2024 20:30:45 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: Reviving Nyan support
Message-ID: <20241204203045.487da970@foxbook>
In-Reply-To: <daqxykyvmd445jtai6oyyz6p623bdhw77ml45463xrupwogptg@ub7mo5utl3sv>
References: <20241108014603.219a0cee@foxbook>
	<daqxykyvmd445jtai6oyyz6p623bdhw77ml45463xrupwogptg@ub7mo5utl3sv>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > The kernel came up and userspace got to the login prompt, but then
> > some issues appeared:  
> 
> Okay, that's pretty good given that we haven't had testers for a few
> years now.

I had some hopes because I saw that NVIDIA still tests new kernel
releases on T124 Jetson, although I don't know how much is tested.
The kernel seems to be in pretty good shape, save for those issues.

I found that graphics are a bigger problem: X is dog slow, and I get
black glxgears window and some 150fps, which doesn't look great.

Do you know if it's supposed to be like that or if it's a regression
or some screwup on my side? I have enabled Nouveau in the kernel and
installed X11 Nouveau driver and xorg.log shows that it loads.

Are there any other options besides Nouveau? Perhaps some newer L4T
release which would work with mainline host1x driver and Kepler? I
suppose anything that works on Jetson will work on Nyan too.

Currently this machine runs Ubuntu 14.04 L4T and 3.10 CrOS kernel,
so practically anything would be an improvement :)

>> SPI
>
> I'm not sure what the right way is to fix this. The values in DT are
> clearly required to be nanoseconds, so either the driver needs to
> learn about those or the core would need to convert somehow. The core
> doesn't know about what the driver supports, so it can't do a really
> good job. Maybe a good compromise would be to have the core expose a
> helper that can convert to clock cycles (the reverse is already done
> in spi_delay_to_ns()), which drivers can then use if they only support
> clock cycles.

I see that a few other drivers which bother to implement this callback
convert ns to clocks, so options would be to copy-paste their code or
put that stuff in SPI core. I have never looked at SPI before...

> I think LPAE cannot be enabled by default because it would break on
> Tegra20 and Tegra30 which both don't support LPAE.

Fair enough, it's not a huge deal.

> > 3. Some more warnings about bypassed regulators and missing touchpad
> > supply (but the touchpad is enabled and works, per evtest at
> > least).  
> 
> Not sure how much can be done about this. Unless you can find the
> schematics we'd probably have to do this on a best effort basis.

I actually have the schematic from some shady laptop repair website.
IIRC the touchpad runs from some major 3.3V rail which is always on,
so I didn't bother fixing this yet.

I also learned something new, that platform drivers can ask for their
probe to be deferred, which was responsible for some other warnings.
At this point I'm not sure if anything serious remains, but regulators
are another subsystem I know practically nothing about.

> My first step when debugging suspend/resume issues is usually to pass
> no_console_suspend on the kernel command-line. That's really only
> useful for debugging consoles and it probably doesn't work well if
> you've only got the framebuffer console.

I made zero progress on this, and frankly didn't even try. Serial ports
are only accessible by soldering to the board. I suppose I could try a
USB dongle, but it will go dark as soon as xhci is suspended.

> > 5. USB is power-cycled on boot, which is a bit annoying as I'm
> > booting from a USB connected disk. IIRC CrOS kernel 3.10 wasn't
> > doing it. Any suggestions where to look?  
> 
> Is this really the power going away and coming back up? In that case
> it might be a regulator that's being temporarily disabled during boot
> and then brought back up.

Yep, this exactly. I have fixed it already.

Thanks,
Michal

Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74C3597A;
	Fri, 28 Feb 2025 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740766520; cv=none; b=H46eIbuo+XJf6TEDujuhl351v8rPMSCCFHJuSgU7Jv28WwsZPTAPl87cYrpijJRMe7wKpDvndmM7cmeHQu6IfSe0M3rR3flf55clQ4PYS/aF1V/H8vVoeslxckRvypAlhiAj/+aL9NAzSWotdNE/0vqIzc6hdWHZ4lpB6C2COVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740766520; c=relaxed/simple;
	bh=l6WxGstKOaHkSCjCL7FVTNPClaGsas7YSIZ9Pcq1dCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozxnNl5KUFiDZ7xcJqFim+A0Xc7mpuhglV8EiAPE4ntZzVzX50p6ArlDIZt9Oehh/ngZyWQRzSY7a+9M9uBMByqTN31PMOlcx0VZGLlm3rmiJLb/ESVHRGBwrpk08XrUZx/fJNJXHoJqHMWP36DhTb78NM8tbfiCZJ0Mg5OElag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=jeewhwQR; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="jeewhwQR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=blulkBB0PcOmhGQ1VzOHFSAX2JRkc55UE2z0mfUu07I=; b=jeewhwQRdJjQWBDd
	y+6E7x9Nt5ALcKaXuaF6yOQTUUYY9uhLPl4ZtA1aNO0aJIH6VolHVJxO8tadyW/RSfD5Aeg/NuEtQ
	Gizd/xeUrNgD++6lqT1oH5pCVZpb2Alj3MWxA0AYN8A+lYM6dwZh6hDdJoyqV3zDaqI/WS+uAHtBb
	qQfRT9ECF1cX+mGSjPuFnqJNhJMM7mZCuE0q/EN39LrX1U+CIeDdkwgy6GM0vJieAFvqYTPvg2ja1
	Fs43xYk3UU3J5NOupUQqHHoULGEY5flgQtWO1B6qBz0Gkd9Xi3HAan/sfJMSIwGc1I9CJ72mmBkIY
	E1P9NwGgqLVg7fLZdw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1to4tF-001iUc-2Z;
	Fri, 28 Feb 2025 18:15:13 +0000
Date: Fri, 28 Feb 2025 18:15:13 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mperttunen@nvidia.com, linux-tegra@vger.kernel.org, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <Z8H9MaLZf0dnsXSu@gallifrey>
References: <20241215214750.448209-1-linux@treblig.org>
 <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:15:02 up 296 days,  5:29,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Thierry Reding (thierry.reding@gmail.com) wrote:
> On Sun, Dec 15, 2024 at 09:47:50PM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > host1x_debug_dump_syncpts() has been unused since
> > commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> > fences")
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/host1x/debug.c | 9 ---------
> >  drivers/gpu/host1x/debug.h | 1 -
> >  2 files changed, 10 deletions(-)
> 
> Applied to drm-misc-next, thanks.

Thanks

> Thierry


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

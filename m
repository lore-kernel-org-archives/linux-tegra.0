Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A5BA27
	for <linux-tegra@vger.kernel.org>; Sun, 20 Jul 2025 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753034615; cv=none; b=m2gzCZbXhV7g9a7aMTuP1kIpS9mQXkLcKQHkd5r4UdVWqeopjapZYi2xNp2HdB16alWhx6+/yYdiPMU01dLeubeOmLx3BcCcq5Zl9FWW+dKxwCboL70epo4lFKAPfUel1ObWF8vk2TGk/v3ZM+l+/HaPR53o9m+/PkbfSaHv6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753034615; c=relaxed/simple;
	bh=bhtDgzKsiFjwXyxsdZ/4h48cFPpB3WRr/3arOlv70uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbhSweK0U7o+BYBqb2J78udVY29QTUIL9HXtx7HYrrPfpJ//1kGg7xif0g2mq36AVIQ6WypfQgxvMLX3r0tHs/DNCTgeU6Y7HH22+8GZoe4xt+yLfFgH6xkhsk2qWjSxFx9j08wT2iFQt0e9DXgsWs+XLa6STeWYPERreykLAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBH2ZkKe; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBH2ZkKe"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60d6303a11eso1579478eaf.0
        for <linux-tegra@vger.kernel.org>; Sun, 20 Jul 2025 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753034611; x=1753639411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1fiTpYldSHzYxGLzWC3f8B8z2BwRBsV2K6tEBNsuDs=;
        b=xBH2ZkKe6vZ2SWaBOq16rKNtLXvDe+1ddpP1IF5w2qw/f6fVdPIfnfjrG2rfHkT73/
         O2U/hk+BcXh/p88yINlMSSyAHuzyuVR7exeE7aTPM6Jkl1u1uWasiA6DzLLy5TQtT1Vw
         DlvSH49dPcQmsvSF/MDhf79oNU+lG9GmCUQ9I62QUExzviuTa2SO9qbPxSXjQXpLw84i
         IuT/Ch1poQkzE3rG2r6ZaCNhnANV2AVCCauM+kdyyR0n1OSR10kYlbVj1Om7+W8R3LMd
         tQmBXicF781wCjTHXBqBNQ36i3kEc6KmwCwQGiQAhAX9YJcQSjM9C7Qbw+1vr0SyfIh5
         T+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753034611; x=1753639411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1fiTpYldSHzYxGLzWC3f8B8z2BwRBsV2K6tEBNsuDs=;
        b=aauqxD5KinXTvaL/N/1kgO6NQ+5jt6DGgYLC2+H/Aj5ryvu1Z8dJjDb/4CvRUGWbLl
         0ou5qg8KkOzvaFy7hUoZX5WEUh9feOxyov4UADIXr03hZK3GbQQ1PU05GlkNJOqFp67+
         1+Rv7a/zdJvt0hYbTdXJb/Cxj/GmBfkPtKFZd56Dxse/qn5nx8g6Xz8vL41QvumlohyA
         sA1VEobWJ5kJdL9tz9CrhxhuHqlq37obfCNb72bvY0wxXKMJKh7hk9k5Xu1sA11r1Nbj
         TSPBtu8SuI1F1Ac297V/fpf1/OrJZFK55HEEsaOsDOH38MnoGsjLPHsyoVNjQdPKMwYe
         1wPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYh/1+AzZ0wcHEHNQglNcAbKC4yfwiqK7xYYwSpYjuYrFAjxA7rZT75aEid6Mk5n2GQdahsOsiukEpQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9z6WQujNhjIjAlpZcsEV0Xu43x9Oj98SBTW8EzBNXt5I6Gzwd
	3wFFR2B5gMP8SjaYrmKguX2DHeaBlTC9j71kzbwqM9OwlAVx4UkPVuiYHihjAm5YjqY=
X-Gm-Gg: ASbGncsVpzdk4yL3N4zVpgFK536uSo94uqMAilri42F52VZo6wbhXXoGZreWgknY+NN
	1OsrYKrUA5Qs/AmgYg9o7JLekXlTqfTkouF/y0UZN5sedimxL4P3R8oNXvYA6VcZ8pOL6qHnNQE
	0jY0vOmvC7iAnYEdjHmsmsdfIwfFjK2LdtXX/be9oPNt7Z5ftSApZq7HGwZD5Mm6DQGx1JN2woP
	1lF2TfWz0RnaFWLvz/Asj8hxqoonPlvERsYIPk6IZelBgcFq+s4g7qfudw4HuPC+H+LuahPrpqx
	I6hD+YsC2QmMUPR3WIt41OXQlv9qGOLcyFq6jnxHScWvQa2xGSJ2VeBXXRf9mSfgYvDHK35AMXe
	dWYyxr7Q8S+E=
X-Google-Smtp-Source: AGHT+IHtyPmRdW+ZxMT8HYDvH7uiKoz3hDXI6p99r4O9UHXEQkAF6dlxkNSdIENOt/+CmTUNtnlwhQ==
X-Received: by 2002:a05:6820:1e84:b0:615:c779:eaad with SMTP id 006d021491bc7-615c77a0d18mr5159784eaf.7.1753034611515;
        Sun, 20 Jul 2025 11:03:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8369d595sm2250474a34.25.2025.07.20.11.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:03:30 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:03:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-staging@lists.linux.dev, marvin24@gmx.de,
	gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Fix incorrect null termination of battery
 manufacturer
Message-ID: <45476946-f717-49f5-8d21-34ea146bd624@suswa.mountain>
References: <20250719080755.3954373-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719080755.3954373-1-alok.a.tiwari@oracle.com>

On Sat, Jul 19, 2025 at 01:07:42AM -0700, Alok Tiwari wrote:
> The battery manufacturer string was incorrectly null terminated using
> bat_model instead of bat_manu. This could result in an unintended
> write to the wrong field and potentially incorrect behavior.
> 
> fixe the issue by correctly null terminating the bat_manu string.
> 
> Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Nice.  How did you find this copy and paste bug?  I guess we could write
a static checker rule that if you do a copy followed by setting a NUL
terminator, they have to be the same string buffer.

KTODO: detect copy and paste bugs setting the NUL terminator

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan capenter


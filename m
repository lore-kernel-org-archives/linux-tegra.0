Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B6D251793;
	Sat,  7 Mar 2026 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772906159; cv=none; b=C1e0+Zl2t1AdnIQ++1faX1LhTKZpBusOyUmSgbFcVsIoujev0bWoPorXoSV3VmnkxrsMnpExlyXlRHnxC7sd+YWIB4JrAuayJp1l5E9cSPc7f0TvUQQT7A2DSYA8rrsb1J6oDlCpisETWz6Vd0QiKDsbp+ZactD9VEJUyxAaf1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772906159; c=relaxed/simple;
	bh=JixTgKowbvz3hPRSaIC4iVDhGP7BrzeUbOYe9GLtyyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XN/xQR+Pye7zpbx+q2gMYgfWQcLVwVVvrYLj0qeXZGiF/b/A9lL5+Ksx+cKS3aGNS+1cN7Il8Bw0OARAgdqdLUJ7Ma2eyD6NESWb+sKhcxEKobqrW72vDHDXs7sGy4inojLkmEDC6MxUkku7vsRB33FKgHfFoLQjzJRnvMVUJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=gpPmwwQm; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="gpPmwwQm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Taf8QKd8++5heUK6i/mGRj//WC4gBXj3LSLau58JkDQ=; b=gpPmwwQm4pUuWz0Ueam5wdwjts
	GeramEceA9tkDM4cQ1GLn1f6XcpqWM2NIkRuYzNtEa/RkDwuwZJuEQvOmTQTS5jkj9n8+pHC01GSY
	ZRVCuIDwX+DhN6A7B9HlDdc89CquXWCTxv0V2G0UCZxhqdJbisyg9+D6bMcBv+32N6wthSVsLhAzz
	R3ddKzMY+X1mTp4hIe1dIdyXqIlmdvUk8nsJji7ZlSFl9/gvxgN0XYadb5OCIdd7fXopz/PWAJ3M4
	kNXblVrEAQO9HKXQ9fY5XqRksXaSsh/kBTsXzTumbl5VaQkazf9FSAU0Rh95q3XNCsbFHlIooXru7
	kLGC0eAQ==;
Date: Sat, 7 Mar 2026 18:26:10 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li
 <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Bartosz Golaszewski
 <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kalle Niemi <kaleposti@gmail.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-core-base: fix devicetree alias handling
Message-ID: <20260307182610.48cae8b4@kemnade.info>
In-Reply-To: <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
References: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
	<9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Mar 2026 10:18:09 +0000
Jon Hunter <jonathanh@nvidia.com> wrote:

[...]

> /sys/class/i2c-dev/i2c-0/name --> 3160000.i2c
> /sys/class/i2c-dev/i2c-1/name --> c240000.i2c
> /sys/class/i2c-dev/i2c-4/name --> Tegra BPMP I2C adapter
> /sys/class/i2c-dev/i2c-8/name --> 31e0000.i2c
> 
> After this change I now see ...
> 
> /sys/class/i2c-dev/i2c-9/name --> Tegra BPMP I2C adapter
> /sys/class/i2c-dev/i2c-10/name --> 3160000.i2c
> /sys/class/i2c-dev/i2c-11/name --> 31e0000.i2c
> /sys/class/i2c-dev/i2c-12/name --> c240000.i2c
> 
> So the subject says that this fixes device-tree aliases, but it appears 
> to break it for Tegra. In fact, this patch appears to have the same 
> problem that you reported with Bartosz's change. Reverting this change 
> fixes the problem. So I am a bit confused why we are seeing different 
> behaviour.
> 
Hmm, i2c-tegra.c was forgotten in Bartosz's change because
the code looks a bit different.

There is still
i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
        i2c_dev->adapter.dev.parent = i2c_dev->dev;
there.
compared to 
  adap->parent = &pdev->dev;
        adap->of_node = pdev->dev.of_node;

in omap code. So I think, the easiest to get forward is to
also adapt i2c-tegra.c.

Regards,
Andreas

Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7DA196C97;
	Thu,  6 Jun 2024 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695354; cv=none; b=OzuwRr9WULWcgg2JHmG+zs47QsbZbsud+VYt7ZEbR/ZWQALbJSXEjMEIybSsu5rxy3UNoU3CE8n5Skzo+sTTihDiRdM7aDnyD5Htw/Acjtc2VUY3KLqdLeNVj7V/yft+AvN5jecxLpDfNZa2dT2OepQh5DpMc0Vxss3rr6o31rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695354; c=relaxed/simple;
	bh=AesbCLY3C8Wl5ZVWOlcwMITxlMcAhfqxhvxuq5E+Yrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqUgISxJY9eH8QsdxmORn5jC3DAuA7rI0yVzeznh6OGQrNeoU0moj0GhuRHWyjg8blnu/DoV07hVfCpqzNIszRCqSjJeHDAZnNrK/qMh5oo6a33BmpcwCBYZc+R1eswK/Fo9nseNQ0f0csA9A99TDNmGW3yKjdnWLESuYSOwnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtoARRgm; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtoARRgm"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so24756021fa.0;
        Thu, 06 Jun 2024 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717695350; x=1718300150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AesbCLY3C8Wl5ZVWOlcwMITxlMcAhfqxhvxuq5E+Yrs=;
        b=gtoARRgmFJD+6GnYgHX/5oDquJ/IPbpztHsjTPXxe5ZxoaTg34IaJoy/s7ViYB/Q43
         HrxPRDdOro+ZHvt8EMux4engLsVSG3dGr6YwVmRX15je1DNHwE+mm4JNSOylrUFXblVU
         JoosVd1ab1k8h6QSsgTB7y65czmMi8SSRRIRBo+evbohCgVNeHg+iFgbEZm4/+VEfIEF
         /ISNFw6wSqr3aoz+8/8ZmIBd+gLI/37JkNRUt/BscTQ43AyWwc0MxiiQ64sPm319WuuF
         Cy9CdSIQhSy1Qpwx63/GELv7HbK0NH4t4Kd995IYU1IFcdb3XV9tGwLo/mI3B0krq1xk
         wUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695350; x=1718300150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AesbCLY3C8Wl5ZVWOlcwMITxlMcAhfqxhvxuq5E+Yrs=;
        b=Y8cx73GzCZoMFJXQJqc6uKIdAIgXVNmgBSnrEUuyhcq78kR4ySRsQq5wYEZ9KrEz+T
         GCK+dqeMnzZVuj4tAkodj5JJDE/NfhJHQbT4RU7Tu/ZpTTrBU5oqfk9DubXPbj/koj0s
         tmh4qcOKWGu8G84hp7RlMCAxufhJc+lnW3So8lL74T8Q0VM0JLhdY7CGXD44vkRcWQeq
         D2aLmCSuysOSqg81YiUMQLveXha8Q/rZnLFpUzUgw3I+WrMX+zTwQ1VZIea+JNZiVaPe
         Jeb78RQ9uF6MyRmnRHQG0V1swoJhw9R0MMtrzFvwPfk+d28r6DsVaKYyC0C4a596TTMH
         gqwA==
X-Forwarded-Encrypted: i=1; AJvYcCWQXiSWCRbyZ5Vls9LWQzWvNUzyw96kLgWg+ZW1Tce6V1CCsLwHO/eKG9uvQwnIpKK5vJ+mHWwzaXbMxAoA482gSLr+UgsjaqLLJCYBZUHdspfWlhYfZYSd+Twlpd02IyyuDV1yrtRAjWvSrU4=
X-Gm-Message-State: AOJu0Yz0yh5hCz9d3z20QCyCGR15Or52mAFf7GQQc/gb/LpnHYnH8Lze
	PIOkFdEolINZte7/ehgyaimj1jbwNYXyX8eiNhhJSN3ZNcxb1VItaSz/Dn3POmj3/J6MHdIzfNp
	VzxxM+SpRKIQwQZpN3m3eZfApxYs=
X-Google-Smtp-Source: AGHT+IHpYZQDgmwsdi1Eup8UsmFKcDq6w48zCdT+QkZMDNgd4sGW+4p/3TRMwgv5J3E58Yv0eIPphQdbHLw4ZG+ZOD8=
X-Received: by 2002:a05:6512:404:b0:52b:8ad9:cf0a with SMTP id
 2adb3069b0e04-52bb9fc5e89mr219837e87.51.1717695350387; Thu, 06 Jun 2024
 10:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606144608.97817-2-jean-philippe@linaro.org> <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
In-Reply-To: <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Jun 2024 20:35:13 +0300
Message-ID: <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com>
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
To: Kees Cook <kees@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, andy@kernel.org, 
	akpm@linux-foundation.org, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 6:56=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:

[...]

> Applied to for-next/hardening, thanks!

Btw, is it possible to get this for v6.10, so we may start enabling it
for others?

--=20
With Best Regards,
Andy Shevchenko

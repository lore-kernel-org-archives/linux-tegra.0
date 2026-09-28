Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEEE4BC00F
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601604; cv=none; b=ZPgFkzgWQdNC0IOvCxvOJ1HIzQcmHYHUoYASyUASYm6F7/a+xO3Idsk0cUSa05BHAXC9MHLnKgxwcsJxdtzhPWwHbW8jXNQiQuZYG8CAGg998UqRujakcMYJKbSWWLkwG1Cl63r5G97UCSjPLwUGDNt/KaH406CetfdazZqBCl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601604; c=relaxed/simple;
	bh=hjcSuw2cqnvjI5NI1/o5uMksKX3PcnQ52Y/4elq2HKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8MFNO2IXAkdwFVizIav/LFkLAgQO8fwY56PuIzeeB9uioQ8zsTGsn0JYpb+Rh7PcLg1wBqGD9X5aKYxpd07DQ+ZdoPmSWQ16XhkhpTskS/bLYFJmDVBjFgvcHrMWZXtoa69gbWIcKopCsIxZoa+EvvWR+uOzzwGcg9TH1oi9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so2343475241.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 06:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601601; x=1791206401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2hurtBCerXJa7Ue1vT5vjNfpc9Jv9KHDeVjKG0g9dQ=;
        b=QHahKtH53fkxmCqRhSOSITAjcgShGHKS7vlNKu/UqZjVzfnog0gK1AEInaYev1SFkl
         zw/DbVzja3U0H2KDVXjBWje3AwpsE/25TgpCoXfF1XjGvQLwDr0RgNQ7kJccmYCB8xcf
         zPXwnz/e3/zQqREOrTS6LmUYMb8E/SVsWj+znT6SC/biv8sUMmZKC2G19aOKtdehjvtG
         mGyjoHHK3+/I4ud7adoPjUznQQpmDZRu2CcfMvgPZjn/ynHroA4mgBkjaooiZ10RtVeW
         SLqKAd/ZjPlO7jduCoAwgmsRIsgTROa4M36hpjZzKT07dJ8zD0f0Yem3sDI7EaqNMk1t
         5jdg==
X-Forwarded-Encrypted: i=1; AKwUvBxhbx1KxTvML8O2fRA4NYd1x1mZjt9gRfiu/P0erhUBDPXn1LDK00ivfcuulhmix0GmgSUVFyJKnjZizA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLewnf1vxP0S8dWBpjHV/MgKcmVFHzFoVVndt5xtQF/UdcJh6/W
	phko5ROSQzzq7WZLiuN2INCmrmPE552jLusxKp2BfH0M+HJ9bA6B+A8Oo6LivrH6
X-Gm-Gg: AYBFou1Jh1wqlN3gYkT3XRNfqbIR9kPEy4mJRWx0c6UA1z151rTv1WgFaKOz47EzFFW
	M+M+FYTncN88hC48Dsb9zNL2tvGkbvUkkpE4Gk0Elwnch/0fiYxSccT38H62Fwue4V8cohP3aFi
	y3/avZ5nvg1zP7MxhdOnP3h/bTTq8k7Yx4n17ZW3MPy8jzrJVAzaelXMTbXAt6MEngFuOF/A4Ak
	4cOnlSA7H2sdxk16AaS8iuhiBHQ+1Uih3H5F9IODrWlDg01O5dvZRwS8k+XjBFstRlgSdxRHzkL
	G2QDpjxVGYhf71caukq5slzO8DpoI9pCRVD+1d7KdyLkuOkf79DzCrXBKXyv4CUGImXhUaKXuM+
	BLeAce36s8I2NhnC7Y92A9dv89Sk7h3Q+z61U52s0dG+AzF3eXodX4oPHgjbf2mUVtFuaj9Tep8
	5U3QABNxqTM9oY3nkzIX40+qMBo1LAo+BD8WVHH0JUkPyS2O7itCA9QaZAMt5lbebBpGU91m5Vh
	4N87gQ2L6q9EwZe8WTR3vHrPFiv5kzyI+6new==
X-Received: by 2002:a05:6102:510a:b0:7b3:84b2:78a6 with SMTP id ada2fe7eead31-7b384b27b7amr2018213137.19.1790601601500;
        Mon, 28 Sep 2026 06:20:01 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde664c06esm8837800e0c.16.2026.09.28.06.20.00
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986e0b83340so1894456241.2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 06:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9RDO6w1jQs7stFYkI1cMWxA3ne5a1xKDsljq45lpo0WOw3WXeg6pz09Z5B3ND2tbQtgQLQ/ssoEmy3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id
 ada2fe7eead31-7b50b51701fmr1113412137.26.1790601600212; Mon, 28 Sep 2026
 06:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com> <20260924111856.622898-3-yaojiale02@163.com>
In-Reply-To: <20260924111856.622898-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:19:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
X-Gm-Features: AclHuK8pd1CvWEg6B7NRMA57BAKjQ57ly0DPVmCMPxitEFLoUXEoVyNz-CP3Fng
Message-ID: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiale,

On Thu, 24 Sept 2026 at 13:19, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map and clear the output parameters on every error
> path.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>         ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
>         if (ret < 0)
> -               return ret;
> +               goto err_free_map;
>
>         for_each_child_of_node_scoped(np, child) {
>                 ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_free_map;
>         }
>
>         return 0;
> +
> +err_free_map:
> +       pinctrl_utils_free_map(pctldev, *map, *num_maps);

Nice catch!

> +       *map = NULL;
> +       *num_maps = 0;

Is the resetting actually needed?
Only pinctrl-generic.c, pinctrl-sprd.c, and pinctrl-tegra-xusb.c seem
to do that.

> +       return ret;
>  }
>
>  static const struct pinctrl_ops rzn1_pctrl_ops = {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

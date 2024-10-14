Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC97156F3A
	for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2024 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894304; cv=none; b=TR8mWi57bwtIsiKu3QtDFdEtuOA/FDdS2DX3i++jfuQIEep3+anVb85KKMZg6wLPX3yave9wS3xkX7uCrMRlgaQBfevf/oPQjfKJSeIuvAqj7dsHTYd7rKbDJHmPPUvolrqib0JhNKKfZjrLrnRFUYkXXtBsDANJylfw1CLavPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894304; c=relaxed/simple;
	bh=bSrAWudPARldXiHGKpyEAcNe5O1DAJpIzRa/IHav+Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxEoiQExSLirE+llOwmvpv1HHuibX67H5Lwe3AAN2RilucbfPBYNkJG6CAxW+mGBFOBZO1bwD1+7oyOnVs7HVu77W0D3uimoJlQxE8JK8hNfJYU5/vApvMBEvFB5uXahaIS9xjVzFBoSDs4LKJH/K2NUKbMZJJUXLBNUWChGUAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fy3lN9uL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fy3lN9uL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fb49c64aso396959e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2024 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728894300; x=1729499100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hfW7J9erMIlvZVwH40xlH7a/MeCGU64sFdySDdF9nk=;
        b=Fy3lN9uL80qP27J9QuVJRSZ8ci7oljt/rjWTQdrM5Qsu+NVrTHkx3jLiWRpNIUvZRW
         DXu11c/Vtff6CBJRwHpTrus/rO+JulBLTukZ+EPpGT5jwh/5vV1xo3sUYVQPEjO/DBRN
         yCO7fD7C/CzAP9QEbElJ/GmKSSHGQcsYGIpCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894300; x=1729499100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hfW7J9erMIlvZVwH40xlH7a/MeCGU64sFdySDdF9nk=;
        b=oDktY2iFVQezuh+3mHBJtsAGgrdad0WsJl6XdlPgbwFMnCVFNoFLiCkXBKa3vAytCf
         mf97vzZMpBWHtkIhV/FQUG98bNb3MifLz10jiQIRlZJtfih7FgFmPLtUAnXIsBY0o3nZ
         fCf7kVtaFIy5vEFIZpCeQAMhFRPqNur2fKnQQ10KyDU2pjMhW2Hh2HCl8JOOz/7L0mpI
         X3zgJ/HHJAZdyMJ2VneZyHHDU4hfGuczfrW4Ea7Q//WtHKIfvvvfD4U93kbh3Fg5v9iI
         bbfjK/6d1oN4lyzI6C7RVmgKSJS/1gnGKHopWySxtbu5zgbOWuB7au2YOOLgApcC4JYU
         vQog==
X-Forwarded-Encrypted: i=1; AJvYcCUPyrjPM9Q2nu5re1UZXGpBJu6f4OJE5u/ZMTabiw167bqJUFRM2b6943Bia5f3bm48SEUvQc1qqmMgzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZqmlz1Efcq4JvTmNHsUhN46XikJXM0qQ9guBJZO36FmsLR5G
	hof0m1FPAIw+Tt/7/v6yE8PIQTCxvCsqNknc571e7YzIXcoq5JRgjc+WVO2Dl7YEjBhnW0TBOZi
	0Y2jJXXWrYVskxxLgdiCaU+C7FCS38mWOU7J8
X-Google-Smtp-Source: AGHT+IEy3zplL4+qLOG9nz0L5a8N8FX81DMds6yZSQeoAH/iFm1yiRg+sf+trJRZ9wYaT+OFA6JfzdNx+UxUjfbOmPU=
X-Received: by 2002:a05:6512:31d2:b0:539:9155:e8c1 with SMTP id
 2adb3069b0e04-539e54d76cbmr3219847e87.8.1728894299616; Mon, 14 Oct 2024
 01:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
 <20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 16:24:48 +0800
Message-ID: <CAGXv+5EJvy6KwJZWCUTNQiec03WdB9m-XeEp4yicxD8FuWVrMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] thermal: of: Use scoped memory and OF handling to
 simplify thermal_of_trips_init()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:06=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Obtain the device node reference and allocate memory with
> scoped/cleanup.h to reduce error handling and make the code a bit
> simpler.
>
> The code is not equivalent in one minor aspect: outgoing parameter
> "*ntrips" will not be zeroed on errors of memory allocation.  This
> difference is not important, because code was already not zeroing it in
> case of earlier errors and the only caller does not rely on ntrips being
> 0 in case of errors.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
>
> Changes in v4:
> 1. Significant change: kzalloc() also with scoped-handling so the entire
>    error handling could be removed.
> 2. Due to above, drop review-tags (Chen-Yu, Jonathan).

The additional changes are the same as what I had done, except that
I used "return_ptr(tt)" instead of "return no_free_ptr(tt)", and I
had reset *ntrips to 0 at the beginning.

So,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Changes in v2:
> 1. Drop left-over of_node_put in regular exit path (Chen-Yu)
> ---
>  drivers/thermal/thermal_of.c | 31 ++++++++-----------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index f0ffc0e335ba9406f4fd858d6c561f9d23f4b842..37db435b54b124abf25b1d75d=
6cc4fb75f1c1e5c 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -95,11 +95,9 @@ static int thermal_of_populate_trip(struct device_node=
 *np,
>
>  static struct thermal_trip *thermal_of_trips_init(struct device_node *np=
, int *ntrips)
>  {
> -       struct thermal_trip *tt;
> -       struct device_node *trips;
>         int ret, count;
>
> -       trips =3D of_get_child_by_name(np, "trips");
> +       struct device_node *trips __free(device_node) =3D of_get_child_by=
_name(np, "trips");
>         if (!trips) {
>                 pr_err("Failed to find 'trips' node\n");
>                 return ERR_PTR(-EINVAL);
> @@ -108,36 +106,23 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
>         count =3D of_get_child_count(trips);
>         if (!count) {
>                 pr_err("No trip point defined\n");
> -               ret =3D -EINVAL;
> -               goto out_of_node_put;
> +               return ERR_PTR(-EINVAL);
>         }
>
> -       tt =3D kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> -       if (!tt) {
> -               ret =3D -ENOMEM;
> -               goto out_of_node_put;
> -       }
> -
> -       *ntrips =3D count;
> +       struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) * c=
ount, GFP_KERNEL);
> +       if (!tt)
> +               return ERR_PTR(-ENOMEM);
>
>         count =3D 0;
>         for_each_child_of_node_scoped(trips, trip) {
>                 ret =3D thermal_of_populate_trip(trip, &tt[count++]);
>                 if (ret)
> -                       goto out_kfree;
> +                       return ERR_PTR(ret);
>         }
>
> -       of_node_put(trips);
> +       *ntrips =3D count;
>
> -       return tt;
> -
> -out_kfree:
> -       kfree(tt);
> -       *ntrips =3D 0;
> -out_of_node_put:
> -       of_node_put(trips);
> -
> -       return ERR_PTR(ret);
> +       return no_free_ptr(tt);
>  }
>
>  static struct device_node *of_thermal_zone_find(struct device_node *sens=
or, int id)
>
> --
> 2.43.0
>

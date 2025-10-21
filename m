Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91B34D4CD
	for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069503; cv=none; b=ny4TMbCsiG9VdHt0FYnESzLKjfzd2koJSIPJkH1Ies+sMqKMAnGYMEkJIc3ASKe23vR31HVKpKY+e+xjX25gdA5/+dtIgOZXG2+2SncZYNVBlB3n3sRdzrZIscyfJ43Avrv3qP6+0E4AJUI0BR+MCyL/oM7tdtMDVGijjg9RJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069503; c=relaxed/simple;
	bh=G47MvJWvuOhJGsJjH6oTOX1ThsvCSd/b1SDd+h4dpKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMD0x9i3ve3C/BbZYH6HBzMH40s+KiLHuUVsPyuJG5ngKb4NFMLdU/Psrm7g0sWgGPNWLMCbBiRmnygoyyFQA0GslGQymIg62z5wYMKD2Xf+YUoVKrS84lzJfMmbqph0VxpemJrN6Thf9B3exHUUafbRWtF4sgYZGnrWpANZO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4Mr0Ft2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4Mr0Ft2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso6851521e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069499; x=1761674299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOocNKmVfDLIyakQcVwyYTTBvpO95NrPUt1n/fTcY6Q=;
        b=R4Mr0Ft20d+Tg1bgvcdO594QJTjZ1dvyIxKq5sVpbqAYeEjwTEUW4kPK+AerqIzuvl
         fRdK3IqrHmPY44a13qS55JQOiCTbmt3NiMCBQ7eVRIzfc/B+PZ2XsrFqNdM04xUbITPv
         0g84ZLw1lh0wSSY1b+SPt/l0W2+baZt2Q8qnEvqq0E5lteMnmlvQf5LILSXh13WZ+YxA
         lf4f7tX/t9xG7ItYsDyxe56vPjzzi4Lt+AmMx3s3o/eje2qOXcoASSIDgluIiZLwZ89m
         tShleadB3byK6cyN/EK6n/DRSYDHf1p7vNVO4yk+1Jo5Eh0g2oSz299veeLSMCcjnp9c
         Mkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069499; x=1761674299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOocNKmVfDLIyakQcVwyYTTBvpO95NrPUt1n/fTcY6Q=;
        b=G7W8dTAmqnyxAHAcjYc7oLdqxiVHhi+i+l6HgILSLsgjTtwLd1pjD4U1DqrDYRl9Ia
         +w+JHKNcDhmKiQagMyqYc4rLTKGThjNGarB8H1hwv4WMqVQcVRpv3qA5hFy8MY/t+vgC
         eIlFqkhKcnhiH/qlna20ZGyhRCTeILWez80rVW/6XVif0PtS8vcRD7aqNnUx94F+FyNC
         EvOUsTpgoRyM2tjlfATiI4jU5MjgKtSXLlSa1Mr1WNOJjzENU5XE1JyVQkoiJBBWp/5q
         i0wMMdH4JI8ABE3FNvGI3P4rbDn+dWjT8iCBnI98n+ekEVE+7to865gyMOKlZFUrxcnm
         pflA==
X-Forwarded-Encrypted: i=1; AJvYcCVx5ACfIEmgXM77NRXFw/06tmohQWoVeBfnH8nPaJJqwTgcutogPukeyDokLtOxT0X4L9jhwAfHs7dMVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfnv6gWWMjB2bACKRaHiPASyM5uuET6lHErcnUj/wcuLwzVD/
	dHwcVqFxz6+U9BEHGeuPVKM7YaQ9a+RSFroOEtwvHOx4q03rk2jsgrHqVxq8in5OQeUcsvGD56S
	i4gv2Y1rZ6CPax9HBczmfP20y7FOPZ04=
X-Gm-Gg: ASbGncuW6Uk2Q9VSqOu5gJFhI4/REimaJNeegzMgblk7Z01NrwT0FxLiDysraFYbCwn
	5QC/NAcks+GBc73VRAf/hT8FJdGIeyl8UAMse+aPjyD1U0ccpKMVP77ukzqWLi05KdPU/24qbYE
	Z3xk5AqYYFMd/tHWMDTpciXf5VZLRbtjBoli2aAT8TBhJMc9GT0CP77ygXSMXR9oQfr0AaEDEik
	e+aTJEVvvk7FWx5cX64ZXUbLxlvbLjPwvhxaLd46OacG3fkDQ95C5FKlcI9
X-Google-Smtp-Source: AGHT+IGB2swM6EPMZAWJrbU+PYzr6bBq9/N58DfugsjDP4QfXY1a2mV6Zvt0xgfuUqpsHA0mxQibDBO32iQwd4Vsx3A=
X-Received: by 2002:a05:6512:1113:b0:590:651b:10e1 with SMTP id
 2adb3069b0e04-591d8566409mr5652069e87.44.1761069498973; Tue, 21 Oct 2025
 10:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-tegra186-icc-v2-0-09413724e781@gmail.com>
 <20250909-tegra186-icc-v2-1-09413724e781@gmail.com> <20250930103006.octwlx53p2shwq2v@vireshk-i7>
 <CALHNRZ84s8rxQKWZeF-bfS31nK6ay4_MspmYa4+qapf9gtk+Fg@mail.gmail.com> <5ind7yevxsrsd3ws5rkl5z3zuxw4yrqoclqg7q6beunc6kgr2n@qmgbgw5q2ltc>
In-Reply-To: <5ind7yevxsrsd3ws5rkl5z3zuxw4yrqoclqg7q6beunc6kgr2n@qmgbgw5q2ltc>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Oct 2025 12:58:07 -0500
X-Gm-Features: AS18NWCSSly5o6m2t5VO9WpiY4hgkm_v2vXdcycfbSTP89Bkw5Qe_Byc5eywF7M
Message-ID: <CALHNRZ-frshyU7bGKEkMhqjJfLBawWH_F-J8-WLsU2ezYpR5rQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] cpufreq: tegra186: add OPP support and set bandwidth
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:08=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 12-10-25, 21:32, Aaron Kling wrote:
> > On Tue, Sep 30, 2025 at 5:30=E2=80=AFAM Viresh Kumar <viresh.kumar@lina=
ro.org> wrote:
> > >
> > > On 09-09-25, 01:21, Aaron Kling via B4 Relay wrote:
> > > > +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, uns=
igned long freq_khz)
> > > > +{
> > > > +     struct tegra186_cpufreq_data *data =3D cpufreq_get_driver_dat=
a();
> > > > +     struct dev_pm_opp *opp __free(put_opp);
> > >
> > > The usage here looks incorrect..
> > >
> > > > +     struct device *dev;
> > > > +     int ret;
> > > > +
> > > > +     dev =3D get_cpu_device(policy->cpu);
> > > > +     if (!dev)
> > > > +             return -ENODEV;
> > >
> > > On failure, we would return from here with a garbage `opp` pointer, w=
hich the
> > > OPP core may try to free ?
> > >
> > > Moving the variable definition here would fix that.
> >
> > If the var was NULL initialized, would the free handle that correctly?
> > Keeping the declarations at the start of the function reads better
> > imo.
>
> include/linux/cleanup.h has some recommendations around that.

There was a request to split this series into separate series
per-subsystem. So I will fix this in a new patch, but it won't be
tracked as a new revision to this.

Aaron

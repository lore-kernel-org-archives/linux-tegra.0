Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2294AEBFC
	for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150012; cv=pass; b=fFZ8MS/b4W7r4S/P2Fwv45vMZtvb+Ge8zaLgPo9K7sulI9G6wF7Eoz3En6/IqdJeaVz+VOp7T0G0YZb4u1R8yqgbAW10wCpykZHPiE1GP0PdXR5SU2+32Sc7trPY++8hW90GAonmAo4nM0BTSntgkf45+COhjHptioqGgsPhWbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150012; c=relaxed/simple;
	bh=Z3h9XI7kiJ+Bqo8r6Fo9Vj0SHPTUWjUPGxb8jcZpMiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8IBp2HJriVthPbhvyZPKs+bgCy82QL101cSP2HcAKc5K1ZL0g0/FDenF0tVTyWM4hS90ubgfNgpJZL5H7Jn4EVAbFtZmTuXBURv3dTXGbnNIKpTe+VeFzt8T0jGWVw+neGMTs8h6Ond9nXNAyc0vVnZRfxbhSHeUIifjOH0mYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1Z4+O7K; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1Z4+O7K"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so287362e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2026 11:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150008; cv=none;
        d=google.com; s=arc-20260327;
        b=opK2XEgX0IqntBaCtJWSGzVF8ctmlJs0/4Wqx+5MBW+8QPcvRVa0JmX6yN5KVWsNNd
         JVTZS9j3897Vksw9UXi03MTysR5iVakvTJPygOsKAuJqJNts1M8JomNoON4fONEwm0uo
         5KaDpege1k4JCbDazfoaxxPcZZOQdAlvm9oUG4YDpQe/3hxA93m05bHcTE4IoBqGLQQi
         h2qdGbguwYZtpCWWYobWOBa/CZHs4CBdDojYF0Oj1coNtenHHZdBHt7nHPE/notxjUST
         QhXlqWoUijGrjLzpozRL1OHeP3HX72b4ZuK7sVXya/OjQk5D3GFADl2rMDxE6imFMGOh
         0wXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        fh=6anBg0SippMo0vowkyp9IVZsn71jixtY4saLMY2ADNE=;
        b=PruNQuKFEku18NdcrpKXZc3djAAB3KPcNo6PmxFmlim6Ylieu6wVwyB5HNPpy7yzhD
         nJdtTisSgSdQCzCsQUJOxrHajhuQbXxBNRcvaZo/MDhJaRwRsaL+vR3AwCjluBxQmhMO
         zZRZruIBAVZ12n0Ur3YV+XUeDofcFw6u+WSIOOMHfB0WrnqnE2gOK14POBUWIjb7zk7k
         /VeC5DSNXnB41NXgBMaFjbEtyqA7nDUPOLfDIpaCG4Wrx0jEKoYwg9xPH2oqNu6Qw+VO
         lhGfH6rZwBQ6J5pFk2AJIO5VeQOQxXotCnmIX1IUSAIXKClYijWu/+bfv55IhbFrFsuH
         l1Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150008; x=1789754808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        b=E1Z4+O7KcU8Q5ypI67McqYrTU7a32ZoXnWDEz8Ukc9dr9FX8nWn0Fp0zluyfpo6iJD
         jkVo+XWHcdoDlOk+Wv94+P8PbhNfU2Fs5Q7Vbfb71QZXeZgBIfw77WfUj9RcNSCE0u4s
         K4sjQeDEmUWTV6ot3tqqmNrAuGC6G8hPE+RG1Sy1ohq8MoaLTSEbJTCZLkzxlC4Nnu+J
         eKKd8Ocu2mzeHBgAt0Nr+B5Z6SY929iUxwYcr0r05P/1Lmth269xAG2dSVDIkXsbUJMq
         OLIvbXCBgjyW2AshrPv9FCrw9OqA5JJkh1yJjSxShCuF9KbBhN3fKuj47qok2qtPwgBp
         GZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150008; x=1789754808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        b=EnXvyZV55UFeGJ2Nt9Sz6iPhuYg36baOfF/VNkO8WI08OzIVTx7/1ziSflbEXzBuDq
         ASiAK9R/V5Ly89VivSnTerUmy+z995oBIwikZPkA7QKi0atdOvINUHVG36hzdUKKysQH
         7BBlfdBo+BRPloA0kxqTZcFrw2M1qeysYiPNt2C+dseQkZzjd7QXfLiyphvABtt0B41S
         22toe6V2o3C/UZ/DBZsAgifvD4UeFPwvRIWVZXrLt+1thlklb+uKadickY3s98J6GrJ3
         H5mB07aRCtwtYr4J3rsbvOFEAv/CjXkh//UmE5CzZpo98hRCYtQW41yeTQsxrk29FtpT
         PkPg==
X-Forwarded-Encrypted: i=1; AKwUvBx6uoAaMMnRO9nm0YBpKYKkdvggHYyZUvEb6/wJHiCH2blBUAzqfjb1MlxjdWLruWAhdy1QhMAHzacNTw==@vger.kernel.org
X-Gm-Message-State: AFuF++lqDz11AxMtGHEi+GGRO78H9v8pH+ZymNa6S9QDzYcVZHuzeejA
	Nscp/FQIC9IScvgWS8kGUPQ+6AogChznYDsvkcVxXo4UW4DGowCp4GFWIjZDOPPJ0vCD8gkFoXL
	KZWuMjXnvo7UC4SLEb2MHEaQauvhG0ok=
X-Gm-Gg: AYBFou1UU1nSOS7vquBUiXnurN0/fr5tLXCKxsYBrSp743GUvZQgW+ZNEf6bJBWR2ez
	GDwZGNVkL0GdFINHU/czcK5L6kUYzMj1vilVRaXNsDOtTHwseGrN691+WNaR5ad/rq7uic28z/p
	Oc70OONCXma6q4223EgPE6xq2AN5nOMjyAbFa6bX3uwM+ROi99HEPcpg9t+flaI+SWJaqqiEyZj
	ymbuV7eLgDrpAm5E0u0EFAXzsMo/4kpFdHuSxWLrmWuaB9brx/I24QYZ7C0ZTemZL8XflseSLYV
	bom61MXnJuoYpzPAig6N4pCeBDFJhDZNC8TASUziezjWOuM9E6zU9XvAI3DORwX5RmQwK0hKFCd
	TxUZzCsDVDM1qfOY8XWx3Yxn64KPXTrWydmx5LZgMTGc=
X-Received: by 2002:a05:6512:3da9:b0:5b6:425:4bf0 with SMTP id
 2adb3069b0e04-5b8a03465c5mr2526484e87.33.1789150008008; Fri, 11 Sep 2026
 11:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com> <DmzCZrobQoWdruuMTtwS8w@nvidia.com>
In-Reply-To: <DmzCZrobQoWdruuMTtwS8w@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 11 Sep 2026 13:06:36 -0500
X-Gm-Features: AcwNN1VZm_hPjJL24YX7UodoRHHFuG-Y9JMMSCQQAeSp8mAPuz3TLz36ftvkl4I
Message-ID: <CALHNRZ_xK7uX8njW4vkiiJS-sOnb4YO0HFqHXEgPx0xZLc723Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Frid <afrid@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 7:19=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, July 28, 2026 10:57=E2=80=AFAM Aaron Kling via B4 Relay wrote=
:
> > This series adds support for the b01 fuse revision, then adds speedo
> > support for known Tegra210B01 sku's.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Update patch 1 commit messag to be more descriptive
> > - Update patch 1 to set unknown revision in the major revision B code
> >   path if minor revision is not 1.
> > - Add based-on tags to patch 2
> > - Link to v1: https://lore.kernel.org/r/20260717-t210b01-speedo-v1-0-f0=
4a8bd4d997@gmail.com
> >
> > ---
> > Aaron Kling (2):
> >       soc/tegra: fuse: Support revision B01
> >       soc/tegra: fuse: speedo-tegra210: Support revision B01
> >
> >  drivers/soc/tegra/fuse/fuse-tegra.c      |  1 +
> >  drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++--
> >  drivers/soc/tegra/fuse/tegra-apbmisc.c   | 51 +++++++++++++++++++-----=
--------
> >  include/soc/tegra/fuse.h                 |  1 +
> >  4 files changed, 53 insertions(+), 22 deletions(-)
> > ---
> > base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> > change-id: 20260714-t210b01-speedo-07f8cd3b3aa3
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
> >
>
> Series
>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Thierry,

I see other things going in currently, can you pick up this series please?

Aaron

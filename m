Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4916087B
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788353; cv=none; b=pGcqkMTys5CrvKXNCySr/CRIQFvlVppGPuFx8k480VSaBuQlVSHJIZd0mReybPP1varU1Gh9mxVpnOYjsd9o3kajlwQj6Zfe/twsPMwiAvzr7gfy3ZbfEENFpPm2J87l2O4BM0L8fO3vIkagWNHNWsYTpGD2tBlmARqjkAtZetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788353; c=relaxed/simple;
	bh=IVjqsPa8/r/WWwqF0pevUJIDLCx/2vQIgGj6cc6incw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Emzwd74iBhLzvG7zhQpSYE5iKDzKtma+O6ZxrtK572xuHrFZeLLoDbGRkaMJshKmgR67PcHoH53CC443F2JJrrAMqYSEj1kPrPsRR7PIkGYRnqeOkbnKGGovdwZznYfgQEuzUkfpwOorGYL2bJ+g2R8+3M08diu7YXyttAta4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0lHL3ux; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0lHL3ux"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-656d8b346d2so721375a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729788351; x=1730393151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=L0lHL3uxV23s66hCG3n381zf25SGWVB6hmvbh5esh1vGVfE1jCcCfuH87o23W7zMUp
         MCsbwIVh+pv8QIdV9Gzx41fswV3kA3iKPoxzZPNkAzRlPXcgtviYRDbonN9M84YN7zkF
         JCUi0mwn4/vU0JPg4jsF5U4/+xccxXMWiVquRfIvhwiHK4ZQColiLqGiaC4ax8YMeJD6
         Z47M34j0jm+4ZsCkrhpGWC8FiB45rITpvByNUl202PuPwy8DROZEZyIEHyvlOq/p05HM
         XNLJKTIuDVB9FJF+d0hyUasS/nXlR/bPVIjSiFWgKwZ3NShONrMhJr9/xYkZEBh43nz2
         bp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788351; x=1730393151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbcx/f+avMo0nfnfoFrvHy0s7zMVYb5RcXeOKVfhBB0=;
        b=ngtZueiX7MarYmwG3Xh0HepdW3TRUausjSwrcsIForffy3n3L71p4076NDWbOzK1tW
         55BOY9nfhpV+gDJjDzriGY5ZCNmzGRucQXCli0NWJtotrk7BZE1AyrfkmDVgYc9AObtG
         emdUybAWwNjFl7iWr8mv+VblAJuRY7kaQX0b5GURknh8AeJdfSP9Ly++/9ccFaxNGVnk
         82PxhnO+3a6fFTv1O1Y5Sy0crLCwM69G1tEitzrCqGwqAlT0tbP01YCbATQ6ke1rsS0O
         LyP6rM3ZBy3eaTrravOBdRsNas6jcwDuZWLyqPa5kTTSHDvgcBp2Xp4MgbdzxKhb5tqF
         do9w==
X-Forwarded-Encrypted: i=1; AJvYcCXIohOd6N/rKVcyI5uXb88s+mPjs4Y3U/GzZ6gqV5CGDX8LGy2G7UiVCYE1AJ7YZ1YUFlWZ6GzoQYY6Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Z8zTL0XBoKgCxbirVnoAzhwuyunkY1ky/a1mFxb6UgAkMmiX
	3lgNSTAK9PEFz2jPQ7/pxAl/fX5rb0rHN+VWq1DMSAZLm+qsd+hpBHX7WnGxnjDSDApy40c9xPl
	ZHHKBoF15WrJae54qkYEN2B4fuGjV5YuU+FpU
X-Google-Smtp-Source: AGHT+IGyVGhrIax31DbYyaNPPps689qKUUGZ/dBmIonlf0Ms5Q31B+FIXf7PnrvX0k/Y2NDzzkEVUzrdywoXgv6bmrc=
X-Received: by 2002:a05:6a21:9d91:b0:1d7:1277:8d0f with SMTP id
 adf61e73a8af0-1d978bd6450mr8093124637.48.1729788350739; Thu, 24 Oct 2024
 09:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com> <2024102457-manager-counting-ff68@gregkh>
In-Reply-To: <2024102457-manager-counting-ff68@gregkh>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 24 Oct 2024 09:45:10 -0700
Message-ID: <CAGETcx_BD_G3oOHvT7aRr98Ag7-XvrMX=NW_wm9Cx9M5+qr-aw@mail.gmail.com>
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 12:08=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> > Probably easiest for Greg to pull in these changes?
> >
> > PSA: Do not pull any of these patches into stable kernels. fw_devlink
> > had a lot of changes that landed in the last year. It's hard to ensure
> > cherry-picks have picked up all the dependencies correctly. If any of
> > these really need to get cherry-picked into stable kernels, cc me and
> > wait for my explicit Ack.
>
> You can do that with the correct tag in the commit as per the stable
> documentation if you really want to :)
>
> But why would these not be able to go backwards?  What changed to
> require them now and not be ok for older kernels?

Depending on how far back we go in terms of kernel version, it'd be a
bunch of cycle detection logic, deferred probe behavior change, etc.
And those patches might have other dependencies themselves, etc.

He's one example of such a breakage:
https://lore.kernel.org/all/20241024-fixup-5-15-v1-1-74d360bd3002@mediatek.=
com/

-Saravana

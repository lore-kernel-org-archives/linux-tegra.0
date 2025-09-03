Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B2243968
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756925334; cv=none; b=YVa+8mg+56JjfBP1xz5U8pEPp9YjlNXFtDEIo0NYzx+E534lllQUcg9CR5fxM+DV0/8s94UcuS7oHgktWXmapgQ/p7HiqkLfS3YOrZc/8AhN+MRAa5GPrxCaYFTArK761XWLyp/GSzzIk83GHCGz25tNuc7MDKr/jtmm458mVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756925334; c=relaxed/simple;
	bh=SpKd2275sVbG0K2FZVdjWp6/Z18/FkDT3HL6WWRqaEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boqYSoSqPncqitfVZ8vE+AhYyqBZJTiZVqsoQYKFpWxoUy1qe2QFhYaxcLDx4V0OjqVne037M0+TuyVqgxAEPo832XA4GSd/NCoPdAXdcE+fu+8g/y0SmWGfEKrgsP77t1SSunEbbjW84FOGyXDy0irBW9Tk4ztify3BbSwC6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8NVAyIs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8NVAyIs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so159978e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756925331; x=1757530131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpKd2275sVbG0K2FZVdjWp6/Z18/FkDT3HL6WWRqaEg=;
        b=u8NVAyIssw3t9zRxrhEdCcCnI4vtKVD3XlZ8yldVYCetM4tNhB0ojB5yEjQxdYcZuL
         uFxVqeYQDEjhtuNrfOywtvaNsI6gXtpWnZlzB2hXk5AIEddfdLGLuZDRF+gCiJEMUkAf
         JqlhATiGlk7Lnq6JWFSlXJXDmCRfEua9X0gLEPfKI8WKslnejCzheeHVmE+Od2m/uoIc
         6vN/cRkO50PPj4x7WrupBb8vXri+i+HdeU5j11AudTTqqjvVXWwXsh/fV5qdOIVIDSRb
         /A8OVPt/C90ULjKekIvYcWxNBN/kncF+w5tANejOL88gaVainBq4Ay7i8dXHSwQnp+PQ
         TqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925331; x=1757530131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpKd2275sVbG0K2FZVdjWp6/Z18/FkDT3HL6WWRqaEg=;
        b=ZKwoOHyotIYkCksl50DKOagThru22fguifklElpQQZj6Ds5kfDKfvi62a/Rqafjjbf
         XLOP1rnJstWI3xyIBfYYZu1AEzz+aDGULVICOZoDSLCTvmxxeHMP5JLqMJ9rL4SQ9JNt
         /q8Nkd5TwKbSeyk44pq/OBYhLv9tA8UtTxgTJqvX8nagZXnK+UrJsl540B9CJaSku11i
         NF8cyq/eEpL8LBGbEAdmwuCYIQYbjZVh12iuTWCMobH6iiFMS0fWxlhpDmU7A25/3ikv
         R3B66Pp9AZXVb7vCP/mbenRCaTkzJIijiK09PpexdXsvkCqaKTQC95+AG19D8nCFMtlM
         cw5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5TtnHfxyECWS4o0WfMZxEFVsxUiJRJrjDW4v9mWSxnxoNefg6SnH0OuPcG/gzkH5gdzxjbG5Z11VBvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/3YoXGZa0BIhVeBdxAfF5639o6C+qODlrVerAw2sqcr0ZMjM
	JfrBCDLampOu3lLSK4+MaNzZnw8Duin36ODWcxH1Ia15E76eb8KXJQ5tIEeXMGeGPN9A5jfL9j1
	6DbTGRuNfKTFqsfb+IjjsXAI7sJAUWcK+VHJc7I0=
X-Gm-Gg: ASbGnctC+NK8WIHbFOP3eEmTbG0WwE/OJOGAoOIZPlZEUzpVIDaBDWWo9EMwEFrthO8
	5BdFXVNvqs0Ev9M0BoxqF3nchjyJEJ0RqqlD0VaKRTLNWeAWY8ACdUIz5NPMik01wsT46woDvU6
	Gu6Ec650uk7U8TnX9xgNXIQ73t4NwbTGc+39oQoXNzdZlufRBuWDxxREMUc2786UP9VFJeesFEc
	5waqTO5lJ/LHM5xdVwqacXsWApyEvTrFv2JzjDps4I=
X-Google-Smtp-Source: AGHT+IF5G/J215zB6F+3YqHgBGUMzaMxIb8FdX2l9xOBS14z2EjkTnAnD4URRw2r/tfzfVxdowvkPYNpzRoqDhW7JLg=
X-Received: by 2002:a05:6512:660a:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-55f709747b3mr4044420e87.51.1756925330683; Wed, 03 Sep 2025
 11:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com> <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
 <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
In-Reply-To: <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
From: John Stultz <jstultz@google.com>
Date: Wed, 3 Sep 2025 11:48:38 -0700
X-Gm-Features: Ac12FXyfpojM7sYEH_SV5iPkXzxCBmlghsM38HwpGdBEBMQS7yemN51cEMcgCs0
Message-ID: <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:38=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Add a callback to struct dma_heap_ops that heap providers can impleme=
nt
> > > to show information about the state of the heap in debugfs. A top-lev=
el
> > > directory named "dma_heap" is created in debugfs and individual files
> > > will be named after the heaps.
> > >
> >
> > I know its debugfs, but this feels a little loosey-goosey as an uAPI.
>
> Well, the whole point of debugfs is that it's not really an ABI. Nothing
> should ever rely on the presence of these files.
>
> > Is there any expected format for the show function?
> >
> > What would other dmabuf heaps ideally export via this interface?
>
> I've thought about this a bit and I'm not sure it makes sense to
> standardize on this. I think on one hand having a list of buffers
> exported by the dma-buf heap is probably the lowest common denominator,
> but then there might be a bunch of other things that are very heap-
> specific that some heap might want to export.
>
> > Is there some consistent dma_heap-ish concept for it to justify it
> > being under a dma_heap directory, and not just an independent debugfs
> > file for the driver implementing the dmabuf heap?
>
> Well, I think just the fact that it's a dma-heap would qualify its
> corresponding debugfs to be in a well-known location. We could of course
> pick some arbitrary location, but that's just a recipe for chaos because
> then everybody puts these whereever they want. There's really no
> standard place for driver-specific debugfs files to go, so putting it
> into some "subsystem"-specific directory seems like the better option.

Ok, I guess I was thinking if the files are organizationally cohesive
to be under the dma-heap directory, they ought to have some
consistency between them.

But I can see your perspective here that organizing the driver
specific debug files in a directory helps with folks finding and
identifying it.

Thanks for clarifying!
-john

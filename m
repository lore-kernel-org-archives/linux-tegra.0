Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB934320B
	for <linux-tegra@vger.kernel.org>; Tue,  2 Sep 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834036; cv=none; b=jGEweTuEY3yD1s+mgiHeUUHn71FyBUOA09cm1cjkJziDCyy6UlifZwSYQA6qyPqtfDX88k16LN4T6izbQYoGomyE9r6btCv07itxB8l4VT2DpGse6tymyqPUnowVb2WF9LBqV+Mqqp8A2Cc9oMGGE/9HXiDiWGHJvfcek8qd+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834036; c=relaxed/simple;
	bh=gkNbJDEaQQAvTwAgN26mob9bJhlWiUblqarXN/zX5aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7atdCmyj5HCIE5/4+ojkbnx4VxO38rJCCfeWzqC1XfB/s8M7y70G0j1o2VMXVihXQKeVIAGqWl2swhFduvHlhh4fgzR39OPCjhUbBoagTA8144PPUUaJxWF2xNT7dUWWgYsYvK6ddnZFm6msFiC7v0RB20NBAbY3grC28TvefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NHyhGZr/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NHyhGZr/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b2f497c230so23721cf.0
        for <linux-tegra@vger.kernel.org>; Tue, 02 Sep 2025 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756834033; x=1757438833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vtd7VHBua4ceoiPNxCebsTr+W/5i6xNmrYZ+hl6cZwE=;
        b=NHyhGZr/BGclM+u+cJtzr2m6jgnmwmYWcD+hwa0li9g5cJEMcxnaAqXxF4bUTMyncj
         +47gADrO09qC4u9e5xJoi5mBKFI4OJ0LFGDmYwr8dvSYIiZsEp3PsE81MBJgdoNs4/Dg
         CuJgZE1OkQ7kaOwQlDodlK07roKMidY3rmWSZUg8UXDS31ZDS8IO3k3dnmywokLC8rUW
         DkIyE+AffhBdxOWIQhLzE/QFDSIx+RbQhsZ4pZztcOZq4VLZdfBdr69NJxF9II1kRilm
         vAaEDCPYjZRtYbrdlsbpRRAZ2C76nEgGVbdqVAD+4uJKQECCDMU1+LYUGpfk27nRDKof
         lTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834033; x=1757438833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vtd7VHBua4ceoiPNxCebsTr+W/5i6xNmrYZ+hl6cZwE=;
        b=AfzTaTXQg/r4QQqY7BgtLXUU5QGyR5iBZEfOkqp2lVgttLLmpG4HYdMyhwk/uML4/+
         Uc39a2B1bGriFPZv9xVQarayPHWf8HTXXGtYm4QtwwvQBCgbzgIT/i0QZ4PebK61dDla
         u3r3X1NTUUZBuhzz6BKkfamQcMPuevuf470+ncFYwEHz39AjOwcCmGRFlLKlxQf1YzzN
         SCw7v7FIpO0MgyPN6FShXKeso6ejbdYlpFHICxzZBPzb/+tzVR+U8a4+4a9vt0BBbs8N
         EkrxTpkCsWEaIdD5qzldEURN1+suqK+UXNlzBD6CyaJbsifBjMcl4/W/G1GHhNj6fK/k
         BjSw==
X-Forwarded-Encrypted: i=1; AJvYcCWoZPiqPlSuy/k/1//1K4ODUJWgzvCt0b2Ccrzd3LFimiRtt8tNuogp5Cfxve1s1Jn6QfQA3DSvMmqT/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmdqUfn0eSf5d8nUfSP4XzjKdOM4iTzsQLBvMYfiB5RLK0tiz
	9h3IFqrlixMQVdb80C3fUmONFI7AtBNTih1iEPSZitYmmWBFAEsQyGJhuYrbEeZgxsLj7lWUkWt
	Bnc290ZcJWbOau2MycVyu24Fe+U7CwLshz8OJeTi/
X-Gm-Gg: ASbGncsQvdiYnz1C07Uvf5K8UH+Q4G3QSe/IX+b8eAVEbTeXzASMfUeV9GUuZP0XxHA
	+S0yraW2aHJVTtLhBiO/cL2a9k12LLpm/sim6tDxSm6IFkoXBlb0/ndgGrTwMeRbViu6TUA8Ob3
	SIAIpF/Mgc6XeTwy2n/VLEq3jJ7JlSqmBk9ar99/zCJPBq3A955br0WJxrXX+hB6Jp8phiFlfQx
	kHZHNZlVLb/tE5lPcNP3w==
X-Google-Smtp-Source: AGHT+IEC6y1tRdSi2UTqmtXyZZzRrZPY9SLNKXOIO98qFYX+T6uH0H7eN0bzXqp5gDwmp+jCKoimReIKubvN32ot1YM=
X-Received: by 2002:a05:622a:609:b0:4b2:9d13:e973 with SMTP id
 d75a77b69052e-4b48dc6d116mr536321cf.0.1756834032561; Tue, 02 Sep 2025
 10:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com> <20250902154630.4032984-4-thierry.reding@gmail.com>
In-Reply-To: <20250902154630.4032984-4-thierry.reding@gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 2 Sep 2025 10:27:01 -0700
X-Gm-Features: Ac12FXxFN3O8AlGVbL0n79ufqlqXNkpXNtbyObY0H0t07exhvNnrkMb8tnUsJCI
Message-ID: <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> There is no technical reason why there should be a limited number of CMA
> regions, so extract some code into helpers and use them to create extra
> functions (cma_create() and cma_free()) that allow creating and freeing,
> respectively, CMA regions dynamically at runtime.
>
> Note that these dynamically created CMA areas are treated specially and
> do not contribute to the number of total CMA pages so that this count
> still only applies to the fixed number of CMA areas.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/linux/cma.h | 16 ++++++++
>  mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-----------
>  2 files changed, 83 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 62d9c1cf6326..f1e20642198a 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -61,6 +61,10 @@ extern void cma_reserve_pages_on_error(struct cma *cma=
);
>  struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
>  bool cma_free_folio(struct cma *cma, const struct folio *folio);
>  bool cma_validate_zones(struct cma *cma);
> +
> +struct cma *cma_create(phys_addr_t base, phys_addr_t size,
> +                      unsigned int order_per_bit, const char *name);
> +void cma_free(struct cma *cma);
>  #else
>  static inline struct folio *cma_alloc_folio(struct cma *cma, int order, =
gfp_t gfp)
>  {
> @@ -71,10 +75,22 @@ static inline bool cma_free_folio(struct cma *cma, co=
nst struct folio *folio)
>  {
>         return false;
>  }
> +
>  static inline bool cma_validate_zones(struct cma *cma)
>  {
>         return false;
>  }
> +
> +static inline struct cma *cma_create(phys_addr_t base, phys_addr_t size,
> +                                    unsigned int order_per_bit,
> +                                    const char *name)
> +{
> +       return NULL;
> +}
> +
> +static inline void cma_free(struct cma *cma)
> +{
> +}
>  #endif
>
>  #endif
> diff --git a/mm/cma.c b/mm/cma.c
> index e56ec64d0567..8149227d319f 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -214,6 +214,18 @@ void __init cma_reserve_pages_on_error(struct cma *c=
ma)
>         set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
>  }
>
> +static void __init cma_init_area(struct cma *cma, const char *name,
> +                                phys_addr_t size, unsigned int order_per=
_bit)
> +{
> +       if (name)
> +               snprintf(cma->name, CMA_MAX_NAME, "%s", name);
> +       else
> +               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +
> +       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> +       cma->order_per_bit =3D order_per_bit;
> +}
> +
>  static int __init cma_new_area(const char *name, phys_addr_t size,
>                                unsigned int order_per_bit,
>                                struct cma **res_cma)
> @@ -232,13 +244,8 @@ static int __init cma_new_area(const char *name, phy=
s_addr_t size,
>         cma =3D &cma_areas[cma_area_count];
>         cma_area_count++;
>
> -       if (name)
> -               snprintf(cma->name, CMA_MAX_NAME, "%s", name);
> -       else
> -               snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
> +       cma_init_area(cma, name, size, order_per_bit);
>
> -       cma->available_count =3D cma->count =3D size >> PAGE_SHIFT;
> -       cma->order_per_bit =3D order_per_bit;
>         *res_cma =3D cma;
>         totalcma_pages +=3D cma->count;
>
> @@ -251,6 +258,27 @@ static void __init cma_drop_area(struct cma *cma)
>         cma_area_count--;
>  }
>
> +static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
> +{
> +       if (!size || !memblock_is_region_reserved(base, size))
> +               return -EINVAL;
> +
> +       /*
> +        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> +        * needs pageblock_order to be initialized. Let's enforce it.
> +        */
> +       if (!pageblock_order) {
> +               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> +               return -EINVAL;
> +       }
> +
> +       /* ensure minimal alignment required by mm core */
> +       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  /**
>   * cma_init_reserved_mem() - create custom contiguous area from reserved=
 memory
>   * @base: Base address of the reserved area
> @@ -271,22 +299,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, p=
hys_addr_t size,
>         struct cma *cma;
>         int ret;
>
> -       /* Sanity checks */
> -       if (!size || !memblock_is_region_reserved(base, size))
> -               return -EINVAL;
> -
> -       /*
> -        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement whic=
h
> -        * needs pageblock_order to be initialized. Let's enforce it.
> -        */
> -       if (!pageblock_order) {
> -               pr_err("pageblock_order not yet initialized. Called durin=
g early boot?\n");
> -               return -EINVAL;
> -       }
> -
> -       /* ensure minimal alignment required by mm core */
> -       if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
> -               return -EINVAL;
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ret;
>
>         ret =3D cma_new_area(name, size, order_per_bit, &cma);
>         if (ret !=3D 0)
> @@ -1112,3 +1127,33 @@ void __init *cma_reserve_early(struct cma *cma, un=
signed long size)
>
>         return ret;
>  }
> +
> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
> +                             unsigned int order_per_bit, const char *nam=
e)
> +{
> +       struct cma *cma;
> +       int ret;
> +
> +       ret =3D cma_check_memory(base, size);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +
> +       cma =3D kzalloc(sizeof(*cma), GFP_KERNEL);
> +       if (!cma)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cma_init_area(cma, name, size, order_per_bit);
> +       cma->ranges[0].base_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].early_pfn =3D PFN_DOWN(base);
> +       cma->ranges[0].count =3D cma->count;
> +       cma->nranges =3D 1;
> +
> +       cma_activate_area(cma);
> +
> +       return cma;
> +}
> +
> +void cma_free(struct cma *cma)
> +{
> +       kfree(cma);
> +}
> --
> 2.50.0


I agree that supporting dynamic CMA areas would be good. However, by
doing it like this, these CMA areas are invisible to the rest of the
system. E.g. cma_for_each_area() does not know about them. It seems a
bit inconsistent that there will now be some areas that are globally
known, and some that are not.

I am being somewhat selfish here, as I have some WIP code that needs
the global list :-) But I think the inconsistency is a more general
point than just what I want (and the s390 code does use
cma_for_each_area()). Maybe you could keep maintaining a global
structure containing all areas? What do you think are the chances of
running out of the global count of areas?

Also, you say that "these are treated specially and do not contribute
to the number of total CMA pages". But, if I'm reading this right, you
do call cma_activate_area(), which will do
init_cma_reserved_pageblock() for each pageblock in it. Which adjusts
the CMA counters for the zone they are in. But your change does not
adjust totalcma_pages for dynamically created areas. That seems
inconsistent, too.

- Frank

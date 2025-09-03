Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148D29AB12
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916070; cv=none; b=P7aXhSWz/oz6zK28kah21eryntCtvf7+BsT/Djn1F2hYDmC4swEl9KL9CsXGR8StKor2+WGhxd+KfWD7MdnW4of/ojEYXKzO6FodwUZv4r0B1l0gMpzPbh0pdqIsXPBuh0Dbvx9l1U/k+3bqXZgdGVmmTBhMaiMOIJudXPXLZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916070; c=relaxed/simple;
	bh=gjxPFC3HjovHgwlt0kv7nGbyyrTTFMVsFPAfgNJbK+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+3UYE7Ilrdsn51h9GlK2UW1ypG6eE6U3Kux0i9Kh96nZDo774lbQvDoyZZamebI/67TPSh2JOSfQQftmXK6SYc8L+lJDwCm1MP9bFHondQtuUb3m63cO6SF7AI7zOHsk0aslm5DW3nn3cSyVpqZBgNMeYhcH2vKlC2cYkzR1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NuXUBFo1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NuXUBFo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756916068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bzt9EmHzCNTi5JpIlfAxwaC9x9EuNT1d//8tcvBDG2w=;
	b=NuXUBFo1eHNR+/nSFuIMlrTCRCTzlxunKrVYWOHlzhK5iTWszBg20zzd0MdUc86K3sD+E5
	3x6sE7JFxb4fJ8J1Fsqa7qgLs4mOD1AEPFQfyNEgKggLcnYgKQwNTn9tBkLppYOxlm7Wja
	SM5BCzRlQaVts5iBdg5r/qPZCixJKrQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-KzeR0XUiNAKW61ZNoXCQ9w-1; Wed, 03 Sep 2025 12:14:26 -0400
X-MC-Unique: KzeR0XUiNAKW61ZNoXCQ9w-1
X-Mimecast-MFC-AGG-ID: KzeR0XUiNAKW61ZNoXCQ9w_1756916066
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so7989675e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916065; x=1757520865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzt9EmHzCNTi5JpIlfAxwaC9x9EuNT1d//8tcvBDG2w=;
        b=cLuBcRHZVOCV0MYXuFWHhg84ybXgETBfe5qxvVh/2kJpld6nLjSFeiVtrzFr84k1x3
         mAt1jnbz7Py7ROjPJSFY2+iG4DFWumY2tgMwpI6wa9Ds01D4H+SHskSjvAJ+uGT+0ArW
         wOhioqoFHdzSjXFW5Zhu5Nr6ar5u0X9B0rtg+dy6MdbYOoJHliPxAMxEBSOKFKZf2zTu
         kMlp8ewV5uF+zKS5DZX+a5LFWsz+/e2JuibH8uJo1ssIGlbuwGfJciYrtFJ2y+zItuTI
         CjNj7Hwrjt3eSzYRkQ3PpBv9KRcBB+Z7fGibkXO15sJp2y1a+etMZz4HKgj15iXX0JL2
         jCTg==
X-Forwarded-Encrypted: i=1; AJvYcCVt5aYmFh5o6vlxf0SOm9XgybrQAhGBM2h3lGQXYcbDOhx3+e0ah/BqZD+kVvnxjU6Soj6wtDVGOrzu8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YznrW3attmK2K5bRqQV6V1uG9IpCadbH9scmL+ys9wQ7Dnfbh80
	oZ9Ny5I9FNZ0aHJneTmVDaGcsBXCzmhok3NMTY0YZe+8xBb/GcYP91Kj7qdG2O7cHCDDU+Wwl28
	BU+p++dyiHbSI092MBLzl2qwBWS48trCjFnoXwvFWRtKDOmHHGOIcDqexeDue9dwy
X-Gm-Gg: ASbGncu/rgscTaw+hYCRxQBedIB+OoPvGiEtRpTD0LcLh5JWJOI5tSw6/BKGZtAPMLD
	R7UQP1TupgguK17u1yEDd+4VjyEwxHp6XlG/QF9QeIjVooIp4Q51uvVYm1zycLcvhNTBstWO7yW
	zy/dfgd8M9ipneaXSxVJeQhWvwisYFzjcniLt/jK5eJvqIkikFv6L6DowX0HLxE826a8Vf9VSNM
	Ah/viDpPQ9uacJ5MeQMvQwWBjcOum5Op6GxzNauzOds1hkzbqvrJT7I1qKkdjUJl6b3nIHn1l7d
	33OANCkf0SQTRMGTdxR+afm5voE1Op7V1l4A54v2+G9GdKrsUEyW/gMBQM9RoYaZILBlSiTHs9f
	i3JOWG78G+VAZ5r4NJj4tbO4XVLflxp7Z2e+TE+9BsXHGmGT/0XJUWiG1rfAddUouiFs=
X-Received: by 2002:a05:600c:c4a1:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45b8559aff8mr148123345e9.14.1756916065605;
        Wed, 03 Sep 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrG1gLsbYnBIn3I8NtcnWq9Wo53kgjPvmlGfN/iDdEiLF/Lvowr8NqtI002hGo3+RIVMQJCw==
X-Received: by 2002:a05:600c:c4a1:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45b8559aff8mr148122835e9.14.1756916065025;
        Wed, 03 Sep 2025 09:14:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f09:9c00:8173:2a94:640d:dd31? (p200300d82f099c0081732a94640ddd31.dip0.t-ipconnect.de. [2003:d8:2f09:9c00:8173:2a94:640d:dd31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm79703055e9.21.2025.09.03.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:14:24 -0700 (PDT)
Message-ID: <78b9c23d-98ce-4b06-9acf-d36c58777d56@redhat.com>
Date: Wed, 3 Sep 2025 18:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Frank van der Linden <fvdl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>
 <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.09.25 18:12, Thierry Reding wrote:
> On Tue, Sep 02, 2025 at 09:04:24PM +0200, David Hildenbrand wrote:
>>
>>>> +>> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
>>>> +                             unsigned int order_per_bit, const char *name)
>>>> +{
>>>> +       struct cma *cma;
>>>> +       int ret;
>>>> +
>>>> +       ret = cma_check_memory(base, size);
>>>> +       if (ret < 0)
>>>> +               return ERR_PTR(ret);
>>>> +
>>>> +       cma = kzalloc(sizeof(*cma), GFP_KERNEL);
>>>> +       if (!cma)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       cma_init_area(cma, name, size, order_per_bit);
>>>> +       cma->ranges[0].base_pfn = PFN_DOWN(base);
>>>> +       cma->ranges[0].early_pfn = PFN_DOWN(base);
>>>> +       cma->ranges[0].count = cma->count;
>>>> +       cma->nranges = 1;
>>>> +
>>>> +       cma_activate_area(cma);
>>>> +
>>>> +       return cma;
>>>> +}
>>>> +
>>>> +void cma_free(struct cma *cma)
>>>> +{
>>>> +       kfree(cma);
>>>> +}
>>>> --
>>>> 2.50.0
>>>
>>>
>>> I agree that supporting dynamic CMA areas would be good. However, by
>>> doing it like this, these CMA areas are invisible to the rest of the
>>> system. E.g. cma_for_each_area() does not know about them. It seems a
>>> bit inconsistent that there will now be some areas that are globally
>>> known, and some that are not.
>>
>> Yeah, I'm not a fan of that.
>>
>> What is the big problem we are trying to solve here? Why do they have to be
>> dynamic, why do they even have to support freeing?
> 
> Freeing isn't necessarily something that I've needed. It just seemed
> like there wasn't really a good reason not to support it. The current
> implementation here is not sufficient, though, because we'd need to
> properly undo everything that cma_activate_area() does. I think the
> cleanup: block in cma_activate_area() is probably sufficient.
> 
> The problem that I'm trying to solve is that currently, depending on the
> use-case the kernel configuration needs to be changed and the kernel
> rebuilt in order to support it. However there doesn't seem to be a good
> technical reason for that limitation. The only reason it is this way
> seems to be that, well, it's always been this way.

Right, and we can just dynamically grow the array, keep them in a list etc.

-- 
Cheers

David / dhildenb


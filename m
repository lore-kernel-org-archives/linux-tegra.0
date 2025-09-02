Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32D21D3DF
	for <linux-tegra@vger.kernel.org>; Tue,  2 Sep 2025 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756852682; cv=none; b=aH9kO+MTXDzknU+FalLhZUVe8lW1/TPkpgX/uWWHIdn3CD7Qh2VFtNRqFix+VSLMRaElyRno26VGi5EcteaMA8CQG2JDyIdXo9UwCbid002CLDaBR8oOD/I+ObvqpAEF08duITPbTHSmZKiKMkpVNPmTheIOdJ/9ocEbwo4UebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756852682; c=relaxed/simple;
	bh=C2Z2q0BkPqIY+E04bVXl2gU0zLZQjMNqg1qcdhYoTFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0LrC+IG45+E9Zw8KvjA85byW6EkTSURL9pSuiTnGUIx0d/+ZJGmGWjpPysqRAvopEiB5LqXU9JNWHEFiPkAMoAPbPxMsisfILWfOGXNG7G1QbPyNVNDd7tgjjWh33grT5P6kZ/NRC6uU4LuJCSHmfpQzDJCK4a0ilbBKCNd3Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2yUjVFNm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2yUjVFNm"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f691c9febso4906922e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 02 Sep 2025 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756852678; x=1757457478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2Z2q0BkPqIY+E04bVXl2gU0zLZQjMNqg1qcdhYoTFM=;
        b=2yUjVFNmc7wtcBLOIchJ+6+p8fPgyJwAGmSwsmhuvw5YAHZSWtrrXh7aMCZu7Xujuh
         vo0LlYoLMB44InIKUG52uQ/NSotxj7WBW91lIOx1fj+aAzznlvOJrYVh+Mde/CDOlRPS
         kPCpLxDPUiI0tQoiqFb3wEkSYHTpzQcNsbjeKSqHNa0SEX6V8xlg+4pcOi72odne3RnB
         1bXtVH0rR+K+u+48foCbGIFnikqkHkYcXOt9IQQ/dA/0f+n3SN+T6CshjzQzeGKa7MvN
         QF6rguYpHbZn+ppHqS4AFBReUlA153jz3fa8nu81E2WtYGVP+T4oi6Wj18TKszEbdnAn
         9Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756852678; x=1757457478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Z2q0BkPqIY+E04bVXl2gU0zLZQjMNqg1qcdhYoTFM=;
        b=eM1c3mgAfeJcDEe+d/pVg5hwreuSxe5+BJH+MpVifM20uaQVEJB44i2X0Rw3mNO5AM
         zpK99p0y98zk+Zq9nbjaKMsfIIxCEXa1BbqNqDEG+AGhlFWXKQQ91HD6fzAnVay8X4R+
         BQng190inPntQ8rG8QNrOkRKtrPhTFPmbkSioV9OQKDGa277XWQVUXof8S+zpgX2nh/8
         kM5M/sgWz0yZCL9WPpwKEnujnykdypj/T+O3SoGTWKeYJkW/kGGGOkxhuva9Le2N/lOw
         jkVXcT8N9jFzGlMrLwPaYBn4OI0fWB8eUBz0KeXblGlonTfY0AkgwzvCmwCFBzToew4h
         6u8A==
X-Forwarded-Encrypted: i=1; AJvYcCUcN+v9lGzSS6ca8zihLP+owU6/9+NmDez7tZYO++GVtReHXc+eGAvdN4gYPRGACshF5i29RhfgFo8W2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKda6i9opEM5g03w8HokMKzv6r4jbCJ4t9pzZJ31uMC/FxAwKf
	5rPbbfocyhuyaHlom96QsqQwRp8pe71H+J3z/te9oWLI+GBvr4XxgIGdufVoMsC6BHStMY4oCEI
	TmXIUeb1yFh2yC5AfO8ED1RqKvDSyVAW709wlurw=
X-Gm-Gg: ASbGncvjKpKg7Nl3prswe0q9hdJcD3BUiIwWBe/oUHb5lYqkbNVXHaIfKFkmwoHrV1Y
	il7tfxW8u4BAso4zFgUjrpR7fL0G4ybNhbZ1pryxXNPm9vWRMFFeLHwXBCjxsz2TvsvwC8EJvqe
	5ULpTRvGKKdjwsslEZNTi7mxu51kEjcIXBMibVlG+51CDUJJLnlZCfYON9xM5gBtkM0XYpc8Onu
	54lJzhz30Bduz3r+EuWM8vKNWw8XNXpLgGuyIX4eokAu4cqizVcRuZqqmQ+pcj7
X-Google-Smtp-Source: AGHT+IGmWy6Aq1ZCfTZaoiG4mkrbhZY4MfRXR19EYAWZXvoUsJvrpBj01w+uPYMLT8d4w27jw93YIe/anSgqxv5w//I=
X-Received: by 2002:a05:6512:32cb:b0:55f:3bca:b161 with SMTP id
 2adb3069b0e04-55f708db526mr4266129e87.27.1756852678372; Tue, 02 Sep 2025
 15:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com> <20250902154630.4032984-5-thierry.reding@gmail.com>
In-Reply-To: <20250902154630.4032984-5-thierry.reding@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 2 Sep 2025 15:37:45 -0700
X-Gm-Features: Ac12FXwG3iNj8EaL9OuUHyuMyacZ5I_i_Y3lylzCsdPDiddwbaDN3qJymljUZSU
Message-ID: <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
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

On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Add a callback to struct dma_heap_ops that heap providers can implement
> to show information about the state of the heap in debugfs. A top-level
> directory named "dma_heap" is created in debugfs and individual files
> will be named after the heaps.
>

I know its debugfs, but this feels a little loosey-goosey as an uAPI.
Is there any expected format for the show function?

What would other dmabuf heaps ideally export via this interface?

Is there some consistent dma_heap-ish concept for it to justify it
being under a dma_heap directory, and not just an independent debugfs
file for the driver implementing the dmabuf heap?

thanks
-john

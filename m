Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66F83A19
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708701996; cv=none; b=RCloi45PqKytKbxD7HHwx5X4WGYIrZHwwfmgFGUwN55/NXyxgzhhrRQMJSEfJSI872Tbrw892C8T5fZ+ycxQOCutkGNFB2ZHHdLEOw8W7VKeZeH9N3SOOlZUVibsLKHpJrhrraRQUCzgCAOoKNuk/ZNCcyVc555+7A9K1Z/fcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708701996; c=relaxed/simple;
	bh=rd/LJ9HZ2/EmpVAYamL3WgmigAo7rZPbhf6VVdZPoGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rPwE9NfipOgDcRuIDKz/RDp4Afp0AFc2uIaCmWZaoLmo7kOfnE8U+hXI5uW/xeRN2TKJrOZ0cpspmsakn0t3qk297nUJQ/H0M87pEdTdPBjAX/n0IwnM1B9MHs/FbmK9a9AUEpPZghxgRt3frGE7s1CWwj2fK+ki4M445VkPiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtXSJU0G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtXSJU0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708701992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NMMUmN0rsAKL+5iBGI5E5zfAAFbk9zQW3IiqyJQ5Rkc=;
	b=NtXSJU0Gh85K1PjZ1Ohkd6sSteMHWNtW1fORXXZ+ieKj+ySXo2RjpH0RuK7Fn2pa6N+KR6
	Cktbwl+CFrbynPLGNKSb/drc7zTZu/DWlOkQrWJvi+J6obWmYMwlyA0WbGEV20dcd0ZOMg
	c/Cn9uJDVbcPb1jDPfvqyPJ+d3T9J3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-VpF5n9rfPSuI0DFF16gGHg-1; Fri, 23 Feb 2024 10:26:30 -0500
X-MC-Unique: VpF5n9rfPSuI0DFF16gGHg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-41292f63945so2380215e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 07:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708701989; x=1709306789;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMMUmN0rsAKL+5iBGI5E5zfAAFbk9zQW3IiqyJQ5Rkc=;
        b=e87GYPfq5K6rlLjRrpIJj4Sc0w6waXP8eNpBVyOiQZdGj3AfoiTCAxl86PHLrQklja
         4uw7SujNR8q7Vy9boM4Oz7sg/df9dAvGcL8yN+ligsm1YpaQzRFtYkwgsi2oiIqrv1iY
         f+ZdNv0XSOgSDyk89zxKrhzUXh5q2L/Gcycv6UlfusDxlqhhMEH2scJZ9CzJ7YiBH9Nq
         fIqfWWqKPkQrIjjPwCPzNHFa2jOTvhFQaZE2j0ubSeK+rDkPrEkAMVJRhisroZvYv/ln
         1eWGicEj2YooMoozK56t+wuPRCvSth4qnjTRIUp5bIcU4drBHqkW7MRDb5PErae0EqvW
         fSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUVFCf+bfZ0rOb58Cg0fZXEByrVql98kdz/iqtCgKgP9hijXL586D1rBBFXrEbMHC43jLIC++ew+Mffnq1G+xPWl3ykZqufXI6yu2Y=
X-Gm-Message-State: AOJu0YwYIsmW/SARvSCSveEL7a9jxM4YFc1r+ypvcz8C+FRH5DfWQVjD
	stqL4dlk41vf4QpCvafI46wwIridTaqA+bf7HP5Xiq0dmt6uM/KMzFboGdN45/1hJBIgMOdZI2y
	09rqtruNgu5mQ88ZSSrAShdkwxQT3ISI1ZMQb+i27Geh1HH0BvV9Y3J1wkP02
X-Received: by 2002:a5d:5267:0:b0:33d:47c6:24fe with SMTP id l7-20020a5d5267000000b0033d47c624femr97469wrc.12.1708701989507;
        Fri, 23 Feb 2024 07:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrjCqKcGbCqYyjSk784Q5WPDu5Uj5ZfIqXNtJ4iF/sM0sITpc89qmAng+UPf7QsynuMGvlOg==
X-Received: by 2002:a5d:5267:0:b0:33d:47c6:24fe with SMTP id l7-20020a5d5267000000b0033d47c624femr97452wrc.12.1708701989155;
        Fri, 23 Feb 2024 07:26:29 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600c3d0900b00412945d2051sm2516910wmb.12.2024.02.23.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 07:26:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <20240223150333.1401582-1-thierry.reding@gmail.com>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
Date: Fri, 23 Feb 2024 16:26:28 +0100
Message-ID: <87o7c76w2j.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
>
> v2: - add comments explaining how this situation can come about
>     - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


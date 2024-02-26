Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6A339BF
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947377; cv=none; b=m/JB3J/uqccOKYFg7Tal8Pf7X1/WRDFkKVM+mH06cJOfYqlkau5y0lu21OGJs6ndfQVJcZjQrF1Ne+URPMSQyj8nXYD4QMzAZTtxUt+4cSnjtYXkvpeM5cyv1KZS5F4pywIonl8qA4GuFl7ED+DXloSuzhCeDqUbDvUe+nJqudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947377; c=relaxed/simple;
	bh=tlBeQiGzC3BFt5HQaT8KjY4Pr7SkT6+n9dnzsf46Skk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZsjkScFFAa3xBBApwiy3KOYhi8bGI9+K5htSf/jo4XmHj0eZ/yRKr7oNKQBnb72EImNASMcVnLiY5Z+5+CXfOHjFEmdhHHsLvM41vOVZtd4Uq2fp4BjtWn2epHJc7xJbRLQym9lOkANPElZhl4svmR1htklH31DdyELuhstJtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=agq/r/qk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="agq/r/qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708947375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiM5Ab3c2YEsIuh7FkITwyub7eTq27XaCaUZGe1oNzY=;
	b=agq/r/qkrXQe415xCLlATdnh/ZXkSWgB7aWgPMZTK0vvQX4x5oBMwQitQIOkuaSIBzqq+f
	dWSYOEAgK4648faqQjb6kVgzyflw/lQAcEfo4NCUr1/DQ11Qn9kgJL1Hg1BQZ0oZWo11tC
	g5me/rqPuIL4M+w8/CVobZ0gywaJj4o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-BMSNpBv6NIynYOYRpzGyhw-1; Mon, 26 Feb 2024 06:36:14 -0500
X-MC-Unique: BMSNpBv6NIynYOYRpzGyhw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-412a51d4cf2so4228775e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 03:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947373; x=1709552173;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiM5Ab3c2YEsIuh7FkITwyub7eTq27XaCaUZGe1oNzY=;
        b=v2NkIBzFIdkGu1P0Cumx3wwm1sOQvxvFlnC/jm8eItH5tx02OC6Qab6VME+U9sBuGY
         BFLHTmgAzO4C1A1ApeDb/J9JnyZ/BKmWdqlmX3xKRPfj6DKv0XSpKq7tFH0r4QYYoEXz
         Y6cLh5BczXOPqCKP8iPBFT3pidfbgLbKOpgpMEDpwylCCuYroeawL1ExDWbgU0Xskdm8
         xqQM6M31WNGZdEtYD1ZyiYauOiNq+u1W1/0qRU2VuE7FWIn6bDEAXCmbvbAHkPZ2ynRa
         swUTS8W1d/Uz5i3KRvSxGAhfrKY6OH0+OI0YtsptdewoWHb07Z8V9ZQKduxbAytlyXiw
         g5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWGe0pGHIF1vl5aiLTPHHmGyP261XC606zdQZA0eYCHK2fanCNNVv2qtxe9ZmysCWML5t3SYsmR8AiCuK7hxMjTKpEljVAuxuVoLJw=
X-Gm-Message-State: AOJu0YzY23nH29IOt8EAhVclS61FeQD1AqBvUimpuacySOoBDpcqgrDy
	EdoAUGK6KbtSzCZsYlrj3I7eZC/wBHNHly5EoFf8uIMQiC4A2fZot89oEl7prd+/gjWP+Nmw4bv
	19PPafAFWzehuQgPQEXbqyq2k7aFE3vKJZt3xbJl+fX+CZd+9ZVgrTm/mCYeF
X-Received: by 2002:a05:600c:3596:b0:412:a6ee:f02c with SMTP id p22-20020a05600c359600b00412a6eef02cmr1298472wmq.41.1708947372999;
        Mon, 26 Feb 2024 03:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR/9WiyuxbOSRTdu3HNLiiES+3vcXjXufzWFFoCAwoJviZIRa7spdFpP/3r+pUPyCBAYYA8A==
X-Received: by 2002:a05:600c:3596:b0:412:a6ee:f02c with SMTP id p22-20020a05600c359600b00412a6eef02cmr1298455wmq.41.1708947372688;
        Mon, 26 Feb 2024 03:36:12 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b004120537210esm11694435wmf.46.2024.02.26.03.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:36:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
Date: Mon, 26 Feb 2024 12:36:11 +0100
Message-ID: <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 23.02.24 um 16:03 schrieb Thierry Reding:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Tegra DRM doesn't support display on Tegra234 and later, so make sure
>> not to remove any existing framebuffers in that case.
>>
>> v2: - add comments explaining how this situation can come about
>>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Makes sense as far as the aperture helpers are concerned.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

I believe this is drm-misc-fixes material. Since the tegra DRM will remove
simple{fb,drm} for Tegra234, even when the driver does not support display
on that platform, leaving the system with no display output at all.

Are you going to push this patch or is going to be done by Thierry?

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


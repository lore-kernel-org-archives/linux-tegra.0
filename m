Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C9D19C556
	for <linux-tegra@vger.kernel.org>; Mon,  2 Sep 2024 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280766; cv=none; b=oVkcOEr88+t8TSOmo8IYLTc7FMZpmZZioXhsjOiNU7Z6eHhXL9I+saSLXViQt2T5PxwTHi1o9/8omxySBZ8YIyHxtn92g87ESbnPqUsqoabWxNWrW5B9TiTzt78cu0d02Oxhp30wV8i1rCdoEbZP90iAdV8IL86ONvPTpv+oal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280766; c=relaxed/simple;
	bh=CaY7UHB4Cavc4mqMEywTAthZAqJc1/sEmZ2JH5qknFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAqwumi2Quc99Xb0uMnvCh7DH+3qDbXTqV/J9x7qRdgPCMyMNIZyB/eKQ0bhVYK7tBa6hgrZKzCCdUM1N/yi7aO7nrNFLjaaHCNbJVWSN3swxH6P+WP+UbrxP4eth9ZixQ4rPYqGnM5s/agCbnPa5kbkXIfJUXBSIPn6bhb1uQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YU5NwkdK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YU5NwkdK"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01b8738dso2938188e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Sep 2024 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725280762; x=1725885562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaY7UHB4Cavc4mqMEywTAthZAqJc1/sEmZ2JH5qknFo=;
        b=YU5NwkdKdxc825nRu3XKqrpavnrKfLSDKuPyqoBtJpnU6t2XPvZs+P1ugn7pZnPdBL
         XJV+rlmoJgPapRzVUwuuxDU7lNQOYMAKuRRf2U1hCYQj0zH3Cfpcn3WsqyRXUTyzdpti
         vMqUL4JTbge2IOQuwZgECYSt7e1NORGrQu/1l8WKxLSWulgWeem9t4Dh3cqS7towFWnQ
         zOKLE5yf6NneawpAOTAL/NDfFqIpOO3Cd40W28jId9HFySWAqBP6uH2sEs+zGM6FffLO
         8MWT3QKU4NM2TaH1KGSpvFO7hjIqyyt3ATVaBI00TrtvbgGkvLH78bMtKpF1MiN1ECHx
         0PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725280762; x=1725885562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaY7UHB4Cavc4mqMEywTAthZAqJc1/sEmZ2JH5qknFo=;
        b=qRoY01JmpHwwQ56Ba/B25B59sDKMlKvKyM2CMU4ZkxCDqdUIO0de4loEYdJzeKSvKH
         HrDPzu81YuXfYRQ9wbdIenU1Jm2y2m+OpdjitsWv34QCvrZHOm6YRceuE6Rr+k3F3GXF
         +6wFKSQxX8LuKDYI/F5AcN4sxhCbNd+BaGvJQ9OlV/MJ3gwCccvjGs7DJtzeQZXaGwCg
         yESA6eUzr3IL9wC0Sa/n+IGMCwq1YescWcintg5GAOHObjng0ez7Ji11L7l8lFKjL4OG
         NTXe3BIZi+5VjvZr4mY6r67KznRABPGKakJQlDVyNJqGTMPzAKFxMuJSi7pYFUQWYEuO
         cTLw==
X-Forwarded-Encrypted: i=1; AJvYcCVbqiaIH4l5EuGA2aD4Et/epHXgSG5rcVy6oIYetYDdfa9/4ik9LKl9GeO4GjRUGBaKK2i7wiqXO/CQcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9vYwQ+jlZoraFtmpUyusXGtCYW3VbO7mzYnTcZb4AB6xntJc
	JGioi6pVpfuwMSoTBk+WSFigNRcx1BVhmr3dDkR3+jMvbPVSsLe84uGrVUFQ15uuIXaqzsGVp2+
	QGXZRUiKuLLrUYDT7lbOWWlD7ctq6r/gHA6cuBg==
X-Google-Smtp-Source: AGHT+IHPGAquvt6NrXMvKDP+0Bo8xxFeYiZ8iZqjJ/iDxU17TxwK/wUM0CTUKYZm8BBQv1/cZmm4LgYLP+zevIkbRH0=
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id
 2adb3069b0e04-53546af3fb5mr6665465e87.11.1725280761445; Mon, 02 Sep 2024
 05:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902113320.903147-1-liaochen4@huawei.com> <20240902113320.903147-4-liaochen4@huawei.com>
In-Reply-To: <20240902113320.903147-4-liaochen4@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 14:39:09 +0200
Message-ID: <CACRpkdY_jF-qeayDefTh1pzE3Yjxbkmrnx9nCxDm+V4tsrdatg@mail.gmail.com>
Subject: Re: [PATCH -next 3/3] drm/mcde: Enable module autoloading
To: Liao Chen <liaochen4@huawei.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, daniel@ffwll.ch, thierry.reding@gmail.com, 
	mperttunen@nvidia.com, jonathanh@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 1:41=E2=80=AFPM Liao Chen <liaochen4@huawei.com> wro=
te:

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

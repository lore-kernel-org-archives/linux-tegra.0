Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B4369D56
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584767; cv=none; b=vCKmy6ofWuknQZZbPbVHA2H0j+sD8wBx/175WhbA8HF4NRDaH59RoFHiqYVUcYZmlW0ZuPZZErGzgwsjNH389N1mim/FFhPSJf4EHDchok4JRhx6XaWDkC/y8VBfhN3ltULzYJWSKfUYnBJaEc0bnxFMA4jrYLaZBvB8lhb0Lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584767; c=relaxed/simple;
	bh=QJkM/H1sYCdgW5GrrWH6X/wpv879FHZLFzcik5vvcEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4pVyX67okqnyS/oTJO9RVh2nMMTJ5V378r613nw+syp+yglpdxJ9ALIng9YqN54HZQQNQyLVGzVnG6jlL9bqqMMZOIGBGa/UHVeuQy5sIl8g91I4opXK9po2UD9NCOLuclm6wKHoxwzVya7BF7QNcM8aRR0OMIJt4zDr2n81L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EIVx3+/r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8s65TFq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EIVx3+/r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8s65TFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
	b=EIVx3+/rlDVQHNI4OBcslJp9asyIc5IE5JPv2efzq9cGLOu+aIORrMA/Zbfp64F1ZBxNp+
	iOOJu6WoX2FN97ahEI2fZsRVXAQ38C0ZZbg8qIuM1z5LCOLm+oucBWZwrUBBeM/4BiS7Ah
	cpqzYr9mS9kaafspH7QeEGenBAH9dys=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-ogTUypEMN6O5raSzRRFILA-1; Mon, 24 Aug 2026 11:19:23 -0400
X-MC-Unique: ogTUypEMN6O5raSzRRFILA-1
X-Mimecast-MFC-AGG-ID: ogTUypEMN6O5raSzRRFILA_1787584762
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d7b3adda4so37864741cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584762; x=1788189562; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
        b=M8s65TFqflCSVtP+Vp92flMHsrLi77F8vEHeut0US7yXFqtbk44yA8h4c+ox2GAayn
         tqYy1wTMkwzrFXLOyHqlXNLL0+0FJWTH5t6fd4K8cJCMXotTesKWeCWnFFB0OhYuC2zf
         txe+5K+NOnvK45vta+e5gTVWY+8Nf7QiDBp7dkHLahPQW6gp6aBkGhxoeogz2etrVdqo
         cga1RlXCFV5+yxm4nMLWEplU2HBvLLVyQDDH308GNXj2LLuln8mJ7BQRaljzbClO35DO
         29ToLtfXqHYzjf/xzKXjPug+B+AWiaJQv0/KYXtfV26RBaw09PCCZafWkSd2/1PdpwHd
         /1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584762; x=1788189562;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
        b=d6xVlw2Fq3qQq8SrZiUt7LMr2JloZJ3Us5dqucQ+d0O0dXLICpnqlGYJ6yq+FNphdF
         VRKE/d5WAi04CVdzzu+KPI3ak0p5ZQSqQw3LZhRW3caY0/nYDCE0XuukiPKxYQlKdb77
         G07zZXl389OxRdVRqdeCI27/OnEQ5+tgxZnTD+NofWJyT++6A226aF8WAVauKGEuaJk3
         rdr7lbAqwUGo037SNlYKZynAdYq/8MAmdN51zlt9mXx5zt0ZTa0XcCnhEIaHl6BUFqal
         OgYVL3TED+Cb2XSB2cEANbZFnN+FMbQkr/DZupfx3fwqp6nCj14MrpWR+W1VErNQB7wt
         ymqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Xzl3yCG+iB2Zh2aHoL95/Jcr9MjRvkCmGdxNep9rRTJ6D7H1hQXjHY2Mj2mB7SIMm7/4hkJqhxHDjg==@vger.kernel.org
X-Gm-Message-State: AFuF++nEBBj6T8eN4nPcT4qc+3OtzsK8g7jdmUUmYBoYW2n40NgghEUq
	cCB6rnb3MP8X/Dr0+gBTKb0Oiwl9WU2AX3gU7VNjMiVQLRbZWo+A143Fed8U2rtRAHyz9Zem/pH
	fFIy1BGiOBWPaxsbwEtl2c2ckNsTJjqB8lQQRA4oht1k1s99YLpmekDKJ6+SQtPS97tzLuzSoQH
	s=
X-Gm-Gg: AR+sD10QHbCbOWGBhyJR/wIviKVksD8HFeuw7bQQ1wsIfMwUzUMhlP8V/3zdEh9FPFP
	XHSMuxL2d1eVRuWNual0A6zm2hcDl2nSsk98gcMykM0bKFW3XxHUyUaZ3KEqIeI+nZ752LR0nkz
	mMW5gyJLVMz1crWSY7ZtMQt1QLPUKtq2apx95mL9M9r9lQEsTkEmi63OhkM5NI+e7vZRXsNKFix
	saVN6g2UVMlXLUpc9S9bKZ3Rb7WEsC9EIvJ0W5oneraQ4k/SiGocKJpgwrSzDZ4O91BxpKf0NHU
	8HRV4zkTnCw6LIiflF4Rb8jD319ush0VrKhEMh63z1Lhtm7SqXRc8/CzpQT/BfKLxenqPbSlQw6
	fGt2XhGL5mdOceFgIwZRrMm8xzbLkBMFI0D8=
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250057511cf.25.1787584762583;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250056601cf.25.1787584762022;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aca33esm48989201cf.21.2026.08.24.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:21 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxg-FCFslaM9Ep_@redhat.com>
References: <cover.1787239869.git.geert+renesas@glider.be>
 <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:25AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


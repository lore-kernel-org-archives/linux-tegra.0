Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DA2D0C9B
	for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147541; cv=none; b=paGTtN7Qm1PMEiqvF4AO1JZNGWhok0N/B13XAMJI5HcL5JaRBGy1+yQQqwrCoP4RMVojiK9OF9ZTPpNBn/ZWgyWIclLJRzA9oXtOHsFnGpM1hFyV9GQvfOBFjPbLDx6QT6tmHbw1tjZIvLd1aoSAna5x7UT5Zk9aOEPQFtJVdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147541; c=relaxed/simple;
	bh=nU9T+5BRaB/fG6RWKtMtWKMNEJMLJZh0XG1iyTeeGec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVm63MKbcCJNBvnAFehVbtn7tZydKBam0ZVAg2RxTgTcFPZ15tMITAc0vU5qnx1Vf141L/RjtWGzpCIYgIsEWme7wjtgkSol1c/3cs41FdxqQIlMu31LB4OlEdpTEiiC5OPdWjp8Td9kOYRw4VhUVbYk/L0axBLPo+LzZIrzW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=faarhEay; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="faarhEay"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c8632fcbso4040203f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 26 Nov 2025 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764147538; x=1764752338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=faarhEayto4ghep1tOnl20UpBjexmnHOVnmxXLl3q7YnaBHo57suwzR+jobYILlhbW
         vjvuTt0doFCVqQVYZ99A5aZsxDVGJV/W3xf4plFJjwGJqVCgwQoP28yBdMkXHn0hmITq
         PqrDqdSa8TJz9WvkEhqzkj+McyOXLLBY4smijwK+F88/WAG4o2QjatQbvbgXNIbIKwWl
         1Fn83oIcoE0VqVOmDqsa70d6lYZUlL8G28f7IOg479d1jKCMGclWB2ewE81Q9Zr9s9hI
         wJDqnxLLTzbHekVBc1deRLlTrb2C4Z2obOFiHBYfJ6y0VTW+QzwYjtOn2VMJGGNuy2bO
         9oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147538; x=1764752338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=a4wXzfE4PkVZ335FSSmGlAUtL8odCzsgOcHP60Ls6oQcKQ1+tN7C0RJhEL6M/GbTwz
         X74gn/OcD6R74eqpefFfBvKIlRRkbnt6gGbIZ6wtCMqnurGF6NdW6JGbKWOP+5Y4zTmL
         87vRVNclbK1xPbZR3HhXsA9kDe+vmbnABZb7Xruo0nAUv1KcwF/SqucNDnJ5t9DPoZvi
         cjM0+sRNiFalBHtts4dZawieFP1IKG/d+PFVi5MPJw3zLg6rA/AYcCBo4fUZvO334P5N
         MijAqXQnie+oNU8brK30Z7Oj4OKSbMiETl9yiId1k+t44y8fLxCx3cSmxdT2lGFgmInZ
         U9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUkqDSXWu7m1jaaHL5eN0pTd+6QF2tqa41GhVc0vf1O/+NA2p0Yh70yd3xrKsorYl25mA/Cz7uDfvjuEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FCer60d4MEtMGMs0jqIsrXyvySKIJ0LxJi3YJDq+dofT1kof
	twB+BbYPnxixJGiA2D/eV1xwZeaNPrvw4jQtxWu39YBi+Ber4284tOiK1LQJhMTjx8U=
X-Gm-Gg: ASbGncuiBFSe96rOceWA4VcbAtwKQWrJNkl4LlB/WO65woGLp3FOTpM2ktuNjltuzZR
	5R1B4cf0rG19RDG30royPpY9Fxq2i6BiqOqRVI0HeO/+5Rv5Ar4VbNfvz0bf/ly24FmYpgAoz/d
	AO8vNLS5QDzhpJ8np1SMkoPQNXSVIZf4doUu0Cyemxi8wIK4rItkGp5qX38ypBWTf/Oj1jQueJ6
	KwdwrnRfYRc89T8HcDs2QG3T5Dw55hpQqUnhtbgDtjvBYcRjcjjUMyoemKuXkgot7d7RENCbuu+
	2SWUzlf5pfnT5CtEeQXPYpwMfPH6sw0V1Fsk27EMRZbrY8zMOxN5I4nnDVYaxTDcVLHokdHQk5y
	qy3A38SbLPObJGOZHVn3Ub/PBFWEsoQUNHgp7px+k3CdrtXRyjh0Ev36Iv6BapJPIGkaBPonkc+
	Ndap442QkASrHYD62T
X-Google-Smtp-Source: AGHT+IFv1Ops8n0OeoStz9TaphopQIFsUQ0FZ2Z6R6T+mCfhb8iJ7KwfJE3DEPeRt9VhmuTMP2gI6A==
X-Received: by 2002:a5d:5848:0:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42cc1d0c9d6mr20256329f8f.47.1764147538171;
        Wed, 26 Nov 2025 00:58:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm39223866f8f.37.2025.11.26.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:58:57 -0800 (PST)
Date: Wed, 26 Nov 2025 11:58:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc
 in probe
Message-ID: <aSbBTPXdk2wXQm7R@stanley.mountain>
References: <20251126065242.12186-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126065242.12186-1-dharanitharan725@gmail.com>

On Wed, Nov 26, 2025 at 06:52:42AM +0000, Dharanitharan R wrote:
> Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
> since memory must be freed manually in error paths. Freed via kfree() in
> rpm_disable, as recommended in the file comment (line 1204).
> 

drivers/staging/media/tegra-video/vi.c
  1197  static int tegra_vi_channel_alloc(struct tegra_vi *vi, unsigned int port_num,
  1198                                    struct device_node *node, unsigned int lanes)
  1199  {
  1200          struct tegra_vi_channel *chan;
  1201          unsigned int i;
  1202  
  1203          /*
  1204           * Do not use devm_kzalloc as memory is freed immediately
  1205           * when device instance is unbound but application might still
  1206           * be holding the device node open. Channel memory allocated
  1207           * with kzalloc is freed during video device release callback.
  1208           */
  1209          chan = kzalloc(sizeof(*chan), GFP_KERNEL);
  1210          if (!chan)
  1211                  return -ENOMEM;
  1212  

The comment is specific to "chan".

Your patch introduces a number of memory leaks and it's not
correct.

regards,
dan carpenter


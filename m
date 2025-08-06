Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8B28C033
	for <linux-tegra@vger.kernel.org>; Wed,  6 Aug 2025 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480574; cv=none; b=RafNBwgJk9kQ4hnVVh94QIqxjxj1Ecwj6NGnaVb32MH6RmLodPUtduMwZH4fju6Rc6ouC1TQ2BhZ3fi2vF9KnQFEUaV4LfxrwNwm8F/vQnh8CNLSqrvX+akuYIFC0aljZqj/7c6S+e8W6iRkCON7vs3YTIJ7seJO0A1oNm0B5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480574; c=relaxed/simple;
	bh=dIuMbChax19Ylgozi2/YYp5RJcWPLz4U8pu8z/Y4RNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAEsnQWZnrJihfNhDH0teylNqvTpx9k+mPsJD+74VmQOtNPR7ajjrZfmV18jyTe7ZrI7gocxBxvrcQuFFeszgqHz9MVHx5JiXOHTkLzhEqaCagRSPnj/QYDIukNbnidN4Xvmsj0NOP7pGZJrqqPy0EzKO9ShQktuawznSWnXsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X73u82jk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X73u82jk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso23463005e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 Aug 2025 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754480570; x=1755085370; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgVOaKqfJ1Iikaw7FfQ1AWXCe8QxX1J0n0ZHcaKhcJQ=;
        b=X73u82jk0ycPwPGOSiDMUxpXC9p3qMDmNspROg7ETrxA0iwLe1LGMRHbL9B712jhmA
         uA2AtiTe27xgW58XNmoLFhwDPLbtrEmxrqSQPZuAEC2o6q32egfDv7WOuvH/+mrosN/f
         UdKnBaPmguJGaQCjhhWzXZpRUPGQ4vzQSnLMJwXpklDzUZ7VjY+y94N44yL3vkp9fDzK
         lieEONxhBPpjHoODBw+94VZH3OFGeShMGEVpkP1YJUdW9W6/x+P5I1+suRDC4uPi+P7B
         qkXvFd/l7CYlJ7iHNRsaNqEs6X5T/rvw0JC/OWQ7bA0xtaN26hKGoRr1jVKI6oGPBs0+
         N7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480570; x=1755085370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgVOaKqfJ1Iikaw7FfQ1AWXCe8QxX1J0n0ZHcaKhcJQ=;
        b=Z2n3W1+VC8qJDXUvQZJeYEvoP25V8SjWKrZhklRQXSHR71IKQBw3uETey/xvNNH3cV
         SvP5YmC/ezHYh9gqzLFTidD3MPCht5TQIuba/S01LL0NORPUgRJFWGV8OGLJFBYj+t+u
         Vyc69o8f8qS29e9QhxIu82xjjC31HaC/ER6ruAO4EeWZG9oQKMz5vmwb9PNhCys5G3H9
         fqgjBTmDeYlMUK4y6pxlDfxFQDXg8mB+75NZfLkmple1du4XU5ZdYyg/39hDsqYvTsAQ
         CS596HuUSt0vYoKCDYieDbr2PHlsQMJxcrzAYr1+XOUvjkV7dsuFftnX8lBhd7vhXx0Y
         MyFQ==
X-Gm-Message-State: AOJu0YxwLx3jZhM/Fa2Ljn0G2e/r7Z+1PR86YosKJFLOsm30p8rMzxeC
	wkG8vuloL412uJef23u5gjVMJ64EWlsYIqjWBzqpzUBI1P165ol2kyjQbcTf/PZgDB9pcNYmqa2
	yqU1k
X-Gm-Gg: ASbGncsCk4rgidLVPkUJc1o3duczpOkqLj6TmwQO23zU30/F5i1O1Ab4X3WM8eZ+S8Q
	orAfGLmxjUM1VNu9s4kglI9fcohFrwLBwlr5yBEOi+KQczEsyiBvjHtfgdW1oLJ11+A5SXL/S73
	r5m5XlrNyBGvDJJMazWgx7yHHIPWYH8mPAl5YrwqK1M5foo0s3WGKeJuwc8xWNYpMiPx51urseW
	ziNnKdS6NEocnNhfCabvah+TchiCwtOh1GCAE1bNkova1wzwcQ0l5EmVgLMYffg0MiMdqS4TmoO
	YE3IeTwPXrXlZ2o/eO5NzlkusyZq+rVeoXmoy8R30xPQXtsVFxSkPRVii1gzeU+QzYikT9kqaK2
	wfUImVEgfDqPfjerbQfFlA2GAelU=
X-Google-Smtp-Source: AGHT+IEIvpPRvCnImRsnPnk+REhA0YcEXrHzYAYHNH6pJfP38v3i7JE3rb8d9qf16OmBD6ho/cBxUQ==
X-Received: by 2002:a05:600c:6385:b0:459:e048:af42 with SMTP id 5b1f17b1804b1-459e7986998mr19494615e9.24.1754480570157;
        Wed, 06 Aug 2025 04:42:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b95f4sm22628445f8f.23.2025.08.06.04.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:42:49 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:42:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: [bug report] drm/tegra: Implement job submission part of new UAPI
Message-ID: <aJM_te551jUwnRv7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mikko Perttunen,

Commit 13abe0bb15ce ("drm/tegra: Implement job submission part of new
UAPI") from Jun 10, 2021 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/tegra/submit.c:541 tegra_drm_ioctl_channel_submit()
	warn: save dma_fence_wait_timeout() returns to signed long

drivers/gpu/drm/tegra/submit.c
    509 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
    510                                    struct drm_file *file)
    511 {
    512         struct tegra_drm_file *fpriv = file->driver_priv;
    513         struct drm_tegra_channel_submit *args = data;
    514         struct tegra_drm_submit_data *job_data;
    515         struct drm_syncobj *syncobj = NULL;
    516         struct tegra_drm_context *context;
    517         struct host1x_job *job;
    518         struct gather_bo *bo;
    519         u32 i;
    520         int err;
    521 
    522         mutex_lock(&fpriv->lock);
    523 
    524         context = xa_load(&fpriv->contexts, args->context);
    525         if (!context) {
    526                 mutex_unlock(&fpriv->lock);
    527                 pr_err_ratelimited("%s: %s: invalid channel context '%#x'", __func__,
    528                                    current->comm, args->context);
    529                 return -EINVAL;
    530         }
    531 
    532         if (args->syncobj_in) {
    533                 struct dma_fence *fence;
    534 
    535                 err = drm_syncobj_find_fence(file, args->syncobj_in, 0, 0, &fence);
    536                 if (err) {
    537                         SUBMIT_ERR(context, "invalid syncobj_in '%#x'", args->syncobj_in);
    538                         goto unlock;
    539                 }
    540 
--> 541                 err = dma_fence_wait_timeout(fence, true, msecs_to_jiffies(10000));
    542                 dma_fence_put(fence);
    543                 if (err) {

This checking is wrong.  dma_fence_wait_timeout() returns a non-zero positive
value on success so tt should be something like:

	if (err <= 0) {
		err = err ?: -ETIMEDOUT;

Except dma_fence_wait_timeout() can also return custom error codes so maybe
something more complicated is needed.  This bug seems pretty severe, so it's
strange that it hasn't been detected in testing.


    544                         SUBMIT_ERR(context, "wait for syncobj_in timed out");
    545                         goto unlock;
    546                 }
    547         }
    548 

[ snip ]

    674 
    675         kfree(job_data);
    676 put_bo:
    677         gather_bo_put(&bo->base);
    678 unlock:
    679         if (syncobj)
    680                 drm_syncobj_put(syncobj);
    681 
    682         mutex_unlock(&fpriv->lock);
    683         return err;
    684 }

regards,
dan carpenter

Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63E1B95B
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jan 2025 04:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737518718; cv=none; b=Z33RBUlZVJYYDjjiSriKiAX+uXw/fiqHxOmP7EDnM+zh9FI+BbmNjWdbLMwDVGJlOefA/ngWdeEyHRQVRXk790MK+jTq6T4CvWCKesSwS9r2MXT77XoIvj118kMpzUobt6WjEzvuJyzY2k0tIeu7CAAXVQGAQJRPMtbvVT+FXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737518718; c=relaxed/simple;
	bh=Eii7dxtEK2mE2YSvM/cVfIDbz+PdFzx/oW523fwi0i4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ta+sYUNHUsTYUEjV80FlxnZfYq1yigEo/ANRsyae9hSIKRm6c3jO1/XDRoHZBwV/RtWEz90ARtqmGVuNfkJszOHqXEeNMmvinJXfnX0NuS9BgKJerRtEuHTMfjA1a630RGYAd7VM/CDDGfUlzHE+KpChHFkVF9SktLCZp1qgGZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc1QFtS8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc1QFtS8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540254357c8so6149945e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jan 2025 20:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737518715; x=1738123515; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eii7dxtEK2mE2YSvM/cVfIDbz+PdFzx/oW523fwi0i4=;
        b=Kc1QFtS8PzCxe3fcDgvCd5I2dLNj5W1RujTqncYYrmE87vBm2FtxXcZnuiDzo6omsk
         PmR+io8+0ISqtEEUR3GTMaZpX9GEzqIOV7NDl2BILTZ1MIzWCms3h9w8O6SpLQpst0Ah
         9MSjaHhg7mT8XPuaiuLJXa1KvdlVtcItU2+lcd9hBkSbiXQ+qI8WW22RHkJLYpEeh/EX
         1y9rrFSSz3kJqADV8q7a4XJ/u9XzwWO+bosnRG34cfShnWpwJqN3FZOEp+muFgRVhDre
         bjuLf0m5MZ0+Tq/LXLPFuP+Uvil4zNTAKl3KgoE+XdjvAeGZo/yK60VLooMsliBTY6qd
         3ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737518715; x=1738123515;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eii7dxtEK2mE2YSvM/cVfIDbz+PdFzx/oW523fwi0i4=;
        b=sVIcBJpjMXnxiTpZXwpJSYfvSXvL0gNSPeDrdxvbHi/L01XspqtryuPHjgTI0srbSi
         5IH7DfryFcFhE3ERV1Mw5pHRSbmyVdt0AAQJD611cwecFfMOW1lDAJnmkzGbrkqdl5x+
         uZwsopLHsgKoZlg6ZDTFOmEWqgHhjQVM5bPin3BrkyJWeqwb3XRgaSOBR5P3+VbqZIRQ
         ejicBWhaKbHRP4CGAfC2tvxfuFl6/dPHaL4Ry+8ufUKLNkgQNw1GfQWNOjOJnNluR6f+
         xiqm6TCAEuEn9SCKKIZqbPb27l6icYQGhjChZtA8DTvMhTz7Ew1lv34PqIEsCM/CML9J
         2Aug==
X-Gm-Message-State: AOJu0YzM7SeWUpvIBY2mswWBk6Il5dFDdlwEoknfYMPE9xgUp3mzrsl+
	I3+a70G235TuikVBcBmiPOhE64zB4c+Kwy6iEeX1sMfBrCYsj5Dhd5Za09XGlLbbAGU8J76S3pz
	Rjlcf5iFk+2/lfo3IatC12BBV/wXCJuxWWlU=
X-Gm-Gg: ASbGncsu3OuxwJ0FRAl1MgxYsbr45pTLr27NHid7idQu5Xe5jiev0BRZpdRwUv3wRBs
	gh3mtWY5gsMD8EPs7AK3R4mxIdRUOMvbQbdmy0kLGBaeTpVITktY=
X-Google-Smtp-Source: AGHT+IE62BI9Ht3ZfSQjDdxrMGhOPel7QGioqsv1kCIgEnxHLV7LOxqLcGKtwb0r1Qlmsq2o132POJAiDEOirF+zhZs=
X-Received: by 2002:a2e:b554:0:b0:300:2731:4120 with SMTP id
 38308e7fff4ca-3072ca8b0a7mr54325231fa.15.1737518714569; Tue, 21 Jan 2025
 20:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Jan 2025 22:05:03 -0600
X-Gm-Features: AbW1kvaQwi9lPFpHjYn-X2oTHy1HQpPsdH8U9wNZ1oW3enZEUdOnPmz7_aA7pXI
Message-ID: <CALHNRZ-ocU5WWtLzePvUF=4jD45Xvfp0hHsD9AMRRitmyaQ_qA@mail.gmail.com>
Subject: [BUG] drm/tegra: T186 and T194 don't report a primary plane
To: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A section of drm_hwcomposer [1] fails to find any primary planes on
t186 and t194, while t124 and t210 work as intended. This was observed
on the android common kernel 5.15, 6.1, and 6.6 compiled with clang.
There have been no relevant changes between the stable kernel branches
and the corresponding android forks in regards to tegra-drm.

I traced the issue back to the shared planes creation and reported a
suggested fix for this use case to the tegra-drm tracker on
freedesktop [2], but did not receive any response so I'm opening the
discussion here.

I don't have a non-Android based test case to verify this issue. And
am unsure if this is a general issue or one caused by the compiler
setup required by aosp. Is this functionality verified by the
regression testing setups?

[1] https://gitlab.freedesktop.org/drm-hwcomposer/drm-hwcomposer/-/blob/bf13180ffc69446262af666bb8d3c32869572214/drm/DrmDisplayPipeline.cpp#L74
[2] https://gitlab.freedesktop.org/drm/tegra/-/issues/3

Thanks,
Aaron Kling

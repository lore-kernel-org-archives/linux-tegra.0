Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDA2FC037
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768590405; cv=none; b=hIB3WYbzA1q+7O5dhMC2lQgZuaoYvKVc3J7DbuaWcVY7SMhEYXeQfoNIHSD+sXXTx56Gg2OrJjerP0KADsh+tiRClbRGAXDK1C+KgySeJAyRSvmhUXdo1AIzaDsa6Tjl2caaXnXkaCwrVWn+A6/YOhbeTUsTEEAejfbgVGI1tew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768590405; c=relaxed/simple;
	bh=nnEFCj8D60Q/Pd+jRhT3XAOSYc/qt6y9nDtXhDj9Hoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nmz/jZ2Z+/xT+GToBn52wFAn+0otB/GoBNQO9xDedE80UZt3IE/LZxWlZDI8F6wJ7NEKLenmo64uwDVRKEIF6cqC2ah/vJHC0X+ensjydwHhjkvmAGqnqyOj5sC3xQhiDKcEfF2/vKhvPoFRQlyHGgL9qGA71gVUiFq7WdJzkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg0uFIyd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg0uFIyd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so17667615e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590401; x=1769195201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgyQv7aXTbcxBIKDlhEjQlYxX38fSitJW3AjGTyENGM=;
        b=dg0uFIydHXYC0qIrtQaDLXe6ryJD3R3Ey6h7DwzCq/anPmK7wDHlMPIDsm1lAAWxRg
         zMErEajrqTu4uFJO+3S1ZKI4O0HqOCC7rlAHudnlKd9lkwiQTPyHp8dFeMwUTDBr2QPI
         dMUaU73WTfJXRyV74S0m3PNZxQKYgWmTAlwlDWmT7DP1HfB0jmQy6RQX7wRZzfdRDijk
         ThVTaIgzh8Zv1/jQKUsI8R1Dq9AM30o6i07u9whZimeTsrxqwdwiZvy+dTfZa/pVfpMm
         wBwiYMobvttPWAd03m8IHPxNKa2CJqXznVYuBXecssam5yMxCsNLti/PL+M8aGVon0kZ
         g20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590401; x=1769195201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgyQv7aXTbcxBIKDlhEjQlYxX38fSitJW3AjGTyENGM=;
        b=NzHQcKd/KTX4JaPimgdy+PUppL93PUDgYRXeZKMAgav1roZHcWje3IX8KZtyZw1G41
         mjeD/lp1OgmFBEtBVQkiTYjretSBaS+wSCrA6wh5A172NecSpz8M4W9yiSgFcGNOuoLY
         tx+uZ/F2+TnMbcevqyrCAucyj7gxQwG4SM4oCyXsMUQ6f8xDO0vFITMC6RCzk2+dyAKd
         7FUV0109+wDu7bqJNGgJ+QK4GePls6o3BHZdFWz6C7JeaoQHOHeP3/xm9DG6zZIBbQ4p
         Pe5isaXEzIguerzhk4IvcSZCCrSRON5MmBdZkeYoWQ2LBRviZ2SkyMC/tc9K5WPIz+94
         gfgQ==
X-Gm-Message-State: AOJu0YwWo/1FZZJtuGIKFxZlFuO8bIJCzjiHsFvKL/+ECiUVQc8STNjz
	zxWv48yHw6UrOOK46QhPEYUNdBflEQHZZqi29kF7St8xWM66jQitJCVW
X-Gm-Gg: AY/fxX6k+vbkY8Z13I6KySV4eY6h0pVO9RxCXDA367pCJwiIUEkWRWk+PIsXG+xQ+sm
	OSQrmC2sPNRCBfy/ZYjeZ2Eb8Bd+AyXs/mBS9DVWDXLvwuDKeIGKNNxAnEC/GKphEevzp1HGZRI
	Xx/sy+BQKzr+cEmPo6u0UuaxI4/a6T4MIDGBVw7ZIfNXNM5rVZ8mH4jYnF0SLvhoHQn8uTBOAjl
	eDXvMmOicG8V8GCN4yb551IMCcFvySppfMr8R5G5kHE3X88c0Sx1VwxFv25bJYQsei7gbE+ucmf
	t9oywD8/rTMOBwPbzvQPln47X3sIfHioy+Zp/PXfTC4/iFKQcVC2sMzXo1k81qlQIFtvvv++HGB
	uL7ZrF2Wq4ak4RvLtG9vikKn0G97oAyaOorKyY6CxAHkV7L5wfJh/lOBMlKFs4rKLnSNWaKv1NO
	wRyYPH273keqBZq3XckSjMlaiWO3GOk+iLjKVdFO5FqmgxvbmFRpSlrdk1BjbOEcQvfDddmJnJ7
	c2M9Rk=
X-Received: by 2002:a05:6000:26c8:b0:432:86e1:bd38 with SMTP id ffacd0b85a97d-4356a0773a3mr5064731f8f.39.1768590400554;
        Fri, 16 Jan 2026 11:06:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm6657811f8f.24.2026.01.16.11.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:06:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>,
	Linux PM <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2] clk: tegra: Adjust callbacks in tegra_clock_pm
Date: Fri, 16 Jan 2026 20:06:37 +0100
Message-ID: <176859039010.168755.11485202766941795981.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <5956349.DvuYhMxLoT@rafael.j.wysocki>
References: <5088794.31r3eYUQgx@rafael.j.wysocki> <2d55ebec-1e42-4ddb-b0e2-529d3b2d7b85@nvidia.com> <CAJZ5v0i7Rbk5sWCo2Z1Y4j_ZFW7nCUr18H8i2JCM=aPpfZOQ4w@mail.gmail.com> <5956349.DvuYhMxLoT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 Jan 2026 13:19:47 +0100, Rafael J. Wysocki wrote:
> On Tuesday, January 6, 2026 1:07:15 PM CET Rafael J. Wysocki wrote:
> > Hi Jon,
> >
> > On Tue, Jan 6, 2026 at 11:36 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > >
> > > Hi Rafael,
> > >
> > > On 04/01/2026 11:53, Rafael J. Wysocki wrote:
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > System suspend and resume callbacks run after the core has bumped
> > > > up the runtime PM usage counters of all devices, so these callbacks
> > > > need not worry about runtime PM reference counting.
> > > >
> > > > Accordingly, to eliminate useless overhead related to runtime PM
> > > > usage counter manipulation, set the suspend callback pointer in
> > > > tegra_clock_pm to pm_runtime_resume() and do not set the resume
> > > > callback in it at all.
> > > >
> > > > This will also facilitate a planned change of the pm_runtime_put()
> > > > return type to void in the future.
> > > >
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >
> > > > This patch is requisite for converting pm_runtime_put() into a void
> > > > function.
> > > >
> > > > If you decide to pick it up, please let me know.
> > > >
> > > > Otherwise, an ACK or equivalent will be appreciated, but also the lack
> > > > of specific criticism will be eventually regarded as consent.
> > > >
> > > > ---
> > > >   drivers/clk/tegra/clk-device.c |    2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > --- a/drivers/clk/tegra/clk-device.c
> > > > +++ b/drivers/clk/tegra/clk-device.c
> > > > @@ -175,7 +175,7 @@ unreg_clk:
> > > >    * perspective since voltage is kept at a nominal level during suspend anyways.
> > > >    */
> > > >   static const struct dev_pm_ops tegra_clock_pm = {
> > > > -     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_resume_and_get, pm_runtime_put)
> > > > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_resume, NULL)
> > > >   };
> > > >
> > > >   static const struct of_device_id tegra_clock_match[] = {
> > >
> > >
> > > I gave this a quick test and this is causing a suspend regression on
> > > Tegra20 and Tegra30 that use this driver. Looking at the console log
> > > on Tegra20 I see the following errors ...
> > >
> > >   tegra-clock tegra_clk_sclk: PM: dpm_run_callback(): pm_runtime_resume returns 1
> >
> > Of course, it needs a wrapper.
> 
> [...]

Applied, thanks!

[1/1] clk: tegra: Adjust callbacks in tegra_clock_pm
      commit: 53bf300fd4a73146882889020504e8e87cc86c7d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

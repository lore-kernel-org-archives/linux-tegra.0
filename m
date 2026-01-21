Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DB313E36;
	Wed, 21 Jan 2026 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031763; cv=none; b=LmcbUaz2hyv0jSeBajmO7/CWO+NGPvltqB/n09RXZor14T8vIDarIWk6/VB9NgCsWTOU/uM+3AcBnFVhr/OYw/GOz7DXasUbOqd10bj0xXg9b8s/mwb7Od+AKVwO/8fa3E9za+un7wrCio9QcqJQEmW4JC6A7cGjcH7tyzKkWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031763; c=relaxed/simple;
	bh=0uy9sKEl/IxMx7lbfuGPFXpqZPnWWgZf+n3gsiaHyQI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uxVbLuT0HGU4Z7hhBhQM1ERl22WbWRiWUg0AV+x4BDf92pPUYMBWJbokYaMpSuFMhem4743bWJ171oAOKHaoDKqIG74pwu4EC0GUQttlybqcwEcgHjS3rggbXfjMMaLD9AOWmPm2xh+N4jdU/F465x6+H6uFuVEJpnlQrNHP6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HD84OcSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HD84OcSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4A6C19422;
	Wed, 21 Jan 2026 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769031763;
	bh=0uy9sKEl/IxMx7lbfuGPFXpqZPnWWgZf+n3gsiaHyQI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HD84OcSIdG8CaF7IX5GA6le3QJQQUf27z0LM4qfEJ/UQpmQqEaqAaH9a7hj9Kt5Vx
	 9OjR8q9M3sQ3/dtsWt8rRKfLqZDYjwdeWPy3EnhhKX18cJ1D0gaJxxYUwFEBMK8kQ4
	 uR3Q/lZ2q1siUtVcbBoSrBNE9dGiQ3K2XiMMXQefw1H307kSaolXgONyZ7fc9e8GER
	 PHislMmJv2nCstgC/E4kJM3RZ+K81qClCUH55mrYD+1zL0/48xKMsnUUNq5lXbstO4
	 HRKWCEYMZ7VFN0PnF7ieyQHVK9hQTU+t4xIAgol+E/xT2qH/JIU//FyDVNJu0Vv0sk
	 FQ9XpVNJLr7Ww==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 22:42:39 +0100
Message-Id: <DFULF717AOGG.GY8B9ET26KND@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>, "Mark Brown"
 <broonie@kernel.org>, "Gui-Dong Han" <hanguidong02@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
In-Reply-To: <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>

On Wed Jan 21, 2026 at 9:00 PM CET, Jon Hunter wrote:
> It is odd because it only appears to impact the Tegra194 Jetson Xavier=20
> NX board (tegra194-p3509-0000+p3668-0000.dts).
>
> It appears to boot enough so the test can SSH into the device, but the=20
> kernel log does not show the us getting to the console prompt. It also=20
> appears that a lot of drivers are not bound as expected. I would need to=
=20
> check if those are all modules or not.

The other reports were fixed by [1], but the issue in arm-smmu-qcom shouldn=
't be
related in this case.

I quickyl checked all drivers with "tegra194" in their compatible string, b=
ut
didn't see anything odd.

Can you please try to enable CONFIG_LOCKDEP, CONFIG_PROVE_LOCKING,
CONFIG_DEBUG_MUTEXES and see if you get a lockdep splat using the following
diff?

(You will see a lockdep warning in faux_bus_init(), it's harmless and can b=
e
ignored.)

[1] https://lore.kernel.org/driver-core/20260121141215.29658-1-dakr@kernel.=
org/

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 677320881af1..4741412d7e46 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -190,8 +190,13 @@ static inline int driver_match_device(const struct dev=
ice_driver *drv,
 static inline int driver_match_device_locked(const struct device_driver *d=
rv,
                                             struct device *dev)
 {
-       guard(device)(dev);
-       return driver_match_device(drv, dev);
+       int ret;
+
+       mutex_acquire(&dev->mutex.dep_map, 0, 0, _THIS_IP_);
+       ret =3D driver_match_device(drv, dev);
+       mutex_release(&dev->mutex.dep_map, _THIS_IP_);
+
+       return ret;
 }

 static inline void dev_sync_state(struct device *dev)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 40de2f51a1b1..56c62b3016aa 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2557,6 +2557,8 @@ static void device_release(struct kobject *kobj)

        kfree(dev->dma_range_map);

+       lockdep_unregister_key(&dev->lock_key);
+
        if (dev->release)
                dev->release(dev);
        else if (dev->type && dev->type->release)
@@ -3159,7 +3161,9 @@ void device_initialize(struct device *dev)
        kobject_init(&dev->kobj, &device_ktype);
        INIT_LIST_HEAD(&dev->dma_pools);
        mutex_init(&dev->mutex);
-       lockdep_set_novalidate_class(&dev->mutex);
+       //lockdep_set_novalidate_class(&dev->mutex);
+       lockdep_register_key(&dev->lock_key);
+       lockdep_set_class(&dev->mutex, &dev->lock_key);
        spin_lock_init(&dev->devres_lock);
        INIT_LIST_HEAD(&dev->devres_head);
        device_pm_init(dev);
diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e6..dc898a420bc2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -579,6 +579,7 @@ struct device {
        struct mutex            mutex;  /* mutex to synchronize calls to
                                         * its driver.
                                         */
+       struct lock_class_key lock_key;

        struct dev_links_info   links;
        struct dev_pm_info      power;


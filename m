Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45A32C305
	for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033236; cv=none; b=rPLTnsukvYvXpisMjTyaw1QiZy8TItXeEh38/wiYpEEaA+4ZxIvs1URwiVkos/xmTlPg2djFGfOPWw+aHifsMzk3vFg9SCEtz7uxY5g6R+/m4rgVB4/mX4jSw8hoOZG84nkL2aUc1slDmOZMJMZwPDEIbbHNisu3kfcwdntNS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033236; c=relaxed/simple;
	bh=+21vXwmXJAEwk44gixVVoCMou1vEFFG+9TEW7F2Necs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ccpyD1RJPj/RQhCxAVTLtLm3zrux3cdyiL1rzx4Plp4gAYZzI0ghMDjx/bihTdNkT6VwHlESH5VTr9LcRL+w6544tPRVRItkZx2Byy8nFXK9fv85Wc59XJHf3MiDGkRpsLMW6ck7zSPoIP/v0Y739E5OeNiYP3e4Zt/qoAkHSsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bj/b7F4N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bj/b7F4N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso75462635e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Dec 2025 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767033230; x=1767638030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=bj/b7F4NLg8UioyTWUQrN6BXhaOmo3+p0tT5Zbb8fCkOB/92+0QLGDEBy9cJ3l9BEu
         Nd/qDp1Z5oY1xQeI1RrAhwkjOUrFSyF82AVJNBk3DNhaDs5ywlFfoXO491/JXIU/1zFs
         nU4vMpmcRHN2fnb8CzF4c0ORtDE0E+2jXgfP236Es4i6QX+3ZAYhllcA18U3P0N4kI8G
         O2Bl+NPxfPiMYL45XmWdS/a9Xryo6UFn4bGwicmxlgNT6s0EYYLa8ZZy5/CpTP/+BEWz
         0QVPaW/0GxJVIPSmkz0OhGYaCZA25/o7c9TswMSUBDN7x9eQ9xoOfVpopX1MKP+rvlNr
         8SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033230; x=1767638030;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=r9ws95vkPCh6U9jxallxF+Cq/phZfP8WiGojmDvvxOqfdrLczRsfNAeKItScM+20T9
         pGuVQHRTC/uTMJuqlTxDT15i3Il2sIcnImHZLTuckEK4qyNSmkyHEY/+0AEEMff9e3LK
         ZvUlpIRJG5QrKSAgEFMr2/OKnSZvzkmolz7nq4fXkVSuw3vUFAnhE2alu8GWdDBhFiKu
         97LIwz/tAq5zMnM8/kTAR43b9sj+Kqbnbm5KNywnSnhKlEOg6wzcjxSTz54tO2laFuqr
         2DcIYY0p7R5YUVEl8HW8iwjWvF9m1t+BsmVNwqALganoWKd8crVcmcYAnvGjbCHN2mGJ
         HvQw==
X-Forwarded-Encrypted: i=1; AJvYcCWt89Wo/R7xT4pqqeLtZbnCZxBFgR1ROPeiPJ4k0KdhpvBFE3O2AzAs/FnuzxPgmye2SyOYW6N0wC2zwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRiQBgopnRDJbR3PV9fx9SweXojRk9uU3oM+XSURPLbwDHzK2
	Pd5nfJym9OX3JH76ExhCaU6CN2iqUbtDA81Ju44KqpsGe9Rj2IAAfYYbDfugZug8EzM=
X-Gm-Gg: AY/fxX4oFBpm7upCAsAw0n+7vSlxE9rQwpSh3LUAb7gi9dZzxlCPkQ0RT0WaKRWKVlT
	urr+tqByoi/tN01B8sZWRX/e5YN44jWEKiOT17nOeeQR2W09R7BqSDDOiSEy5zfUWr5Vuokzi96
	jDXOkVvgrVmQkUTDI1VC366LBhVbZx5y8oCNYdaK0/gzq3Bd31D49iV/IZb9P0xTCmxYelz7tVv
	McFZbim5AsQnovYoyifw5y0lmCyv88O/pYQ9rpLoFiK0W2moBNpGwkEtF8ypZBQQMxPlrhv2Wtn
	BQbhBiE9/WI3/v0vSpgDao5oz5r0hd2Vzm5Ulgc86jB4DhJl+v4VkOQZtr3jYCc0mDpvZsTvreW
	ai1idTic59x8FUN1kcadYYB7LIMS0VFXyAYff3HR7e2AeatXFn5qDXgXjReqbXLhghTEkz1DZjM
	3flRwf7goc+4cC3+WN
X-Google-Smtp-Source: AGHT+IEHhrhFf7Jf8dL/0jQocV0GRaiwX1qkdAS5mCHJ5u+kHgrFmfG0sL3CPSPjggNXKCTNOgfCmg==
X-Received: by 2002:a05:600c:3b0e:b0:47b:deb9:fbc with SMTP id 5b1f17b1804b1-47d1955b7f4mr288107955e9.2.1767033229819;
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm562809105e9.12.2025.12.29.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Date: Mon, 29 Dec 2025 21:33:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202512262345.OOsbJ2kr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223094529.7202-2-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20251223-175449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223094529.7202-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251226/202512262345.OOsbJ2kr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512262345.OOsbJ2kr-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tegra-usb.c:857 tegra_usb_phy_power_off() error: uninitialized symbol 'err'.

vim +/err +857 drivers/usb/phy/phy-tegra-usb.c

1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  837  static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  838  {
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  839  	int err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  840  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  841  	if (!phy->powered_on)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  842  		return 0;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  843  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  844  	switch (phy->phy_type) {
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  845  	case USBPHY_INTERFACE_MODE_UTMI:
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  846  		err = utmi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  847  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  848  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  849  	case USBPHY_INTERFACE_MODE_ULPI:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  850  		err = ulpi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  851  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  852  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  853  	default:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  854  		break;

err = -EINVAL?

156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  855  	}
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  856  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06 @857  	if (err)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  858  		return err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  859  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  860  	phy->powered_on = false;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  861  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  862  	return 0;
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  863  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


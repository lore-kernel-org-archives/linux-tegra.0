Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287423770B;
	Wed,  2 Apr 2025 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593830; cv=none; b=pYkyR/VXvkMi/bZB4jgOFh3RjDEH9RpOv25X6A0Z9t8IlzDtGMPJ0VPDFLoKnwR2dZ8+5XW2/x0pEs9barVdT1wRNK9JrOIgnXwvn5td64iIiUOUkduihR3rfWWju9a9iSyg5i6jDgIPi+G1DXpt+S4clBBL9Srbar/mcspFKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593830; c=relaxed/simple;
	bh=+Wbb1xrrmUHxiNgG8JkFaATMz3TAvTDwxYK1zCnVo78=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=rEJnZ3cqFpR+RlMZmcbbdNJn5eT7AsI8PSIEN7YitzwP2O4gG8odAKrE5SOTYQNVzu1P7Pm0DYDYjeB5kAWCFLhmqJq1RczkllkX+BNaKByRoJsGeqBkVxvD6D36qn+gKqkL2pX0YgLDmfIiTGPjX0zaOTQLxabqSVagFEovZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZSNBH2CBpz51SWC;
	Wed,  2 Apr 2025 19:36:55 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 532Baqs5065074;
	Wed, 2 Apr 2025 19:36:52 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:36:56 +0800 (CST)
Date: Wed, 2 Apr 2025 19:36:56 +0800 (CST)
X-Zmail-TransId: 2af967ed215810b-249fc
X-Mailer: Zmail v1.0
Message-ID: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <thierry.reding@gmail.com>, <laurent.pinchart@ideasonboard.com>
Cc: <mperttunen@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <tomi.valkeinen@ideasonboard.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMC8yXSBVc2UgZGV2X2Vycl9wcm9iZSgpIGluIGdwdQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 532Baqs5065074
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2157.004/4ZSNBH2CBpz51SWC

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use dev_err_probe() to simplify the following code
sequence:
  if (err != -EPROBE_DEFER)
      dev_err(dev, ...);
  else
      dev_dbg(dev, ...);
  return err;

Zhang Enpei (2):
  gpu: drm: tegra: dpaux: Use dev_err_probe()
  gpu: drm: xlnx: zynqmp_dp: Use dev_err_probe()

 drivers/gpu/drm/tegra/dpaux.c    | 11 +++--------
 drivers/gpu/drm/xlnx/zynqmp_dp.c |  6 ++----
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.25.1

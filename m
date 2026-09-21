Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE3429817
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032140; cv=none; b=CdM8dc+SmMoYbLb/+kO1paoriXkB4uulmBZWeBaHVFgH4sxVnQECS9vwoQ0woDHmgq7Vj5GWAKtGnDGzzxSIYSMPIGKoovIrYU9gpUyrMKyWCfWdYxCS+3uxXihKCIMQfYUOq47TcOVgt3xKGCzdBZ1Ikv8ARyt0xWvUt/2WaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032140; c=relaxed/simple;
	bh=kAvYqeh9lhIbm8YtKATUVDPt4SSV0dL/01lCzjcwo3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUGevKPkAV4VSUwUkZDmXNyEqWQWTlYjjJDZ8Cv+zUXizXhhE3BIf96kYAmiqu8U515eg3KrjlsGqrI4GgZLPq+/ObtZrFr4FoQBtxtHHHS4OfG1VkX+2BPQ6czgWbHY6gQP+EuffKf/MGRZ7uzeLL2ePkyfbOF3eSCR2dp+l9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyZUYmCF; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyZUYmCF"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a222edc62so379236785a.0
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032138; x=1790636938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81aKjimYrYOGXnfGd1vfh7o17MNAV+GZaQTkl+KjGW8=;
        b=QyZUYmCFqcGdPDyj4LBCoxHGM3l8H92abHSqBj5QZZpXopqZSyK2Q5bFOaguO9b/IO
         amUpJJWphzwIfhp3awJ0SEoCjqA2VbDlYzYpgOKHbPlesrGdT0qY/Jz84vj6s17+ua89
         1pvcqTcZo8KcPzZlN9W8Lll3MUCQd9md+Clz6fqwOISzSx+mRNW0oXxexnynFvql6sC2
         qzFI9M5TvlTf/k5I7pxJDKtj8xhEGw2i9ZuWQ0J2ou2tF06iXVDSsYTYvc+n+ZXCt/+F
         qVmrGJY8P+2Mk/JUgyJ7MOSeF0tn7BiBDUJCXiMgq2YE1awp3nDuFx5EDA2643Rb1U9w
         lR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032138; x=1790636938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81aKjimYrYOGXnfGd1vfh7o17MNAV+GZaQTkl+KjGW8=;
        b=o1AEOayRd9KiyOAwrvq0d5Fs66fw0kQt74Hr5QY/A04BBNXXCtmoPcPIo1TIuv0/H6
         T29chVv9ZtayxPr+xel3D9Keq65dhBD3ZXo5ML6Yz9HhfYOHx8jTUlmFIGUpnceJBfbs
         kChafaKjs+UDMEJiU5WTHWXbCI0tzmui4xSIw8Qfsj4mqtCQ46oduTYHSdiEd5CMbc3z
         Mhv99SQ1qVwAGNMA40ML0ZFNdKKYTaFdXJ3/Vc0N8+R9ckSoYmZaypDQqJtI3ZKbPxkj
         irmLcWEcI5eK4EDfzdSk/KGgdzNtc1fyJFlmiMWhQsdyqj33AJ4KDyO74yr7w7TVgd0s
         4Www==
X-Forwarded-Encrypted: i=1; AKwUvByWq8kyfyV412rYx2z658xtS8gb99SbfsdbywBr7aCWpwptm2DU5maYfzjej6/bXohV6tZvWfGUOc75Gg==@vger.kernel.org
X-Gm-Message-State: AFuF++m6GtreNdJPjdMPNLY228XQEVY0ryxWEHoKQ5FpJMjfmOeMGsmY
	6UTotChtBFMqCauBHx/pRjKZmpuerwSi0aOgtMuiGbho8RF32LQuoiI=
X-Gm-Gg: AYBFou2QFY0QgMfrTzq8lspfsAu2dXt2P+WQ+6v65nc7mpLdSxl3ZhVBKbb93TJUrOP
	MU6YBqlSK5r2fl5CDy5YufPSPSiDrWh1n5gQQRB/lPeSDOTS5IuL3Zo3WHCrwMOS2yR5xfAI0wg
	Nb3OIyFb1FtaIp3A0eK1qB3cZuUCUXcH2a+FZhp6vwN1yteiYfZnAT/1PcSzZn1k8D0QXp6RZJm
	tK8+vLxmqL2sFyEgE9XsyumaGjxJEcCmxhKoXGyMEwaGpnGZHSPBupz5t/KtswqfZguGXX6w/64
	64aBiwDoIuGdcjXLwGiYVtYe32HrpbJdL3MB7JuMscZX4314D1TN5W6aH4EOEcWSmf3kxg6/OXT
	PnM3kTeue9l/xpPyxU7AGqdqMi1AywzTq35LfLZ/CQ8U/CMGZGEr8mGbrrT0z9nTxkDDFha3v8g
	DUVhVqqG/EFtvju2FzzF7b03IQ7gQ2AOU+jwdmZPGimqjUfysisXQmW/u2t6YvIF+55zTZVWIps
	KyKPuX4vvv8fctdzyg/rptWMT/Ac9/68uPpUsFfm15Luo4nxEKvWcp5PNY/6SiiKmL1D2WTMziw
	oyR0NOHfrldzcfI6wNwyCcmeXhOW
X-Received: by 2002:a05:620a:6f0c:b0:939:feaa:949c with SMTP id af79cd13be357-93c15eed484mr268135185a.36.1790032137800;
        Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: gadget: tegra-xudc: Disable reset delayed works
Date: Mon, 21 Sep 2026 19:08:48 -0400
Message-ID: <20260921230849.502492-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921230849.502492-1-mhun512@gmail.com>
References: <20260921230849.502492-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm port-status IRQ stays registered through remove() and can
queue port_reset_war_work and plc_reset_work after
cancel_delayed_work_sync() returns.  remove() never stops the first.

disable_delayed_work_sync() drains both and rejects a later queue.
usb_role_sw_work stays on cancel_work_sync().  The PHY notifier is its
producer and is unregistered before this cancel.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Keep the Fixes tag on one line. (Thierry Reding)
- Disable plc_reset_work too.  The port-status IRQ can requeue it.
  (Thierry Reding)

 drivers/usb/gadget/udc/tegra-xudc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index a0585a1f19f0..dd0a033b4a7f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3932,7 +3932,8 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 						&xudc->vbus_nb);
 	}
 
-	cancel_delayed_work_sync(&xudc->plc_reset_work);
+	disable_delayed_work_sync(&xudc->port_reset_war_work);
+	disable_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
 	usb_del_gadget_udc(&xudc->gadget);
-- 
2.53.0


Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC00204F94;
	Wed,  5 Feb 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777024; cv=none; b=i77IQq2ieURFbGC09B2Mk5YiWM/PS+gJvaSf5ztUTfmkUNOUhdpZ/lr7rtfr3Opbh3+HuDwcrLGPko+xqidkr6USegwb/2mDfqSIQE1OHuXwPmcFnGrxQLE3O6fg0DICw7AGRhVvm8y89fK+75IOnmD/QhARSyJZLvfB5+5f+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777024; c=relaxed/simple;
	bh=V8F6TdsgqBtnFKgf5hPwESPymaXywufQvtZc6vNurlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFfZMBtw61yiT2b2+V4afB5z/EBBCZ7sXMgOEbj5Mmsm7dSE/JyDJ8IB8bWoJbMAGyN3/pxa+w/QIsp7vWYWkfib7lnT9sLfzX6H4F7noD0mSktI/PInXNN8A5F6ssTh5539Rt3+qAqTHIUAUrNei4UU9RwonYTehCkJtOr4lFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LxLypu03; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LxLypu03"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE09444436;
	Wed,  5 Feb 2025 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbIosQlo9K+96iArYQbe2IRA2NSkxyi0YsELJCoNokI=;
	b=LxLypu03DOPSdZ+KIRSms2UpjEoX8JGfg/RS33unASIecWSp3X9iAKU4zgifq0MCa4F/9K
	7dp7PNoHbLZ5hLV4vkQW9bFrnALOjFM7py2zfi/GtMfA2tXKXaLmNy0GgNmnmeapKSoXBv
	8XAP1T2Yx+quF5ZNjK9iuNqaScaCXTMSVpE8UMYh3WMVWCXPt0Q0Mpk8hSL7Oc340wnOuW
	+8hPGJdLrr/P09tz5VNQImdd/er7U5LO6dIkRVyFgeqGEFuDhAO87PkYEVeA4M0HJngy9M
	3VVGcdFne6jPxG+c8oOQhgQRXNTJ7LXBAyRZc1f95i8JX1YifvpXX//wD9nBIQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:54 +0100
Subject: [PATCH v7 9/9] usb: host: cdns3: forward lost power information to
 xhci
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-9-13658a271c3c@bootlin.com>
References: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
In-Reply-To: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrdelvdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhon
 hdrohhrghdprhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

cdns3-plat can know if power was lost across system-wide suspend.
Forward that information:

 - Grab the lost_power bool from cdns_role_driver::resume(). Store it
   into the power_lost field in struct xhci_plat_priv.

 - xhci-plat will call xhci_resume() with that value (ORed to whether we
   are in a hibernation restore).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/host.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 7ba760ee62e3310e9c678d269d7675c9cb952ec6..f0df114c2b53bcb2a1fbeb1e582e0cbd69451d97 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -138,6 +138,16 @@ static void cdns_host_exit(struct cdns *cdns)
 	cdns_drd_host_off(cdns);
 }
 
+static int cdns_host_resume(struct cdns *cdns, bool power_lost)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	priv->power_lost = power_lost;
+
+	return 0;
+}
+
 int cdns_host_init(struct cdns *cdns)
 {
 	struct cdns_role_driver *rdrv;
@@ -148,6 +158,7 @@ int cdns_host_init(struct cdns *cdns)
 
 	rdrv->start	= __cdns_host_init;
 	rdrv->stop	= cdns_host_exit;
+	rdrv->resume	= cdns_host_resume;
 	rdrv->state	= CDNS_ROLE_STATE_INACTIVE;
 	rdrv->name	= "host";
 

-- 
2.48.1


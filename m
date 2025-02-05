Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B601FCCE2;
	Wed,  5 Feb 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777021; cv=none; b=eCso1gkZGIZ8rZHZz/MgkwOxUlsKnU9OmymeBy9UY381JNLrRomlRxPZTRJfm+JVVmhZBlXKCe7LrekuLtd0RFyhg9zA3wm4MsGiiOXtepCZbCuDUSsoocN+AfewKw0gWaaHHXil1nsFcwfUk3P2Jgd1vquTpTB1fccWySVJ+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777021; c=relaxed/simple;
	bh=Vp+s5STg/eBTsVW9sbCsI6/iQysISIMLy09nfVcx9Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mM5uauDXqNEJ80axFpk19OJKBivKOLdXmDazx1xhbdrFH0asx1/26aM5jWgTCtTHf53m5DsdY7BCdHhuNA+CjcDJnnvoy/9E9S5gPtUw+SHay6CUc4MAhf90bs6tA/4ZZoeb05hOpa0+fPwA8VrzedlPSm4LdtgjBd/vygF6Ico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cR8mdZiB; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cR8mdZiB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B794442C;
	Wed,  5 Feb 2025 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SwNVcGJTgjvSX/GUhdtWl6uItAObpat1KGBENkGTYyY=;
	b=cR8mdZiBOBDL8Z9/JVjU3O6BBRcwb03dKVzsKrMBA5ND2/6uCBq8PNj+vt6GOKcRatSvFu
	cLO9ufYafAQ98nHFHY+UMm5N+XJ2Dhi/o9hoGT8icqFLVNMl+ulTQYQmDzzRyvzxLTZ7lC
	ionnZqu1Zg5U+Gk4lGUCYuARKYKpGDDsrn2hLu5DuTQ0SyHDZh+SYITvE8WpHkGW055BH2
	yx/eVt68WmvZ1Xz/wz2e4P7WkiytfeYRJqWP0wy+iSnuFkr+h6vkOgEIFU3RM/YIyHrUKP
	XmjlaN9VApvhXsEtPxCpejoHaHo8SZjLzNL0D3c2sw9Ccu/S5fXLewNI32AxoA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:48 +0100
Subject: [PATCH v7 3/9] usb: cdns3: rename hibernated argument of
 role->resume() to lost_power
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-3-13658a271c3c@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrdelvdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhon
 hdrohhrghdprhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

The cdns_role_driver->resume() callback takes a second boolean argument
named `hibernated` in its implementations. This is mistaken; the only
potential caller is:

int cdns_resume(struct cdns *cdns)
{
	/* ... */

	if (cdns->roles[cdns->role]->resume)
		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));

	return 0;
}

The argument can be true in cases outside of return from hibernation.
Reflect the true meaning by renaming both arguments to `lost_power`.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 4 ++--
 drivers/usb/cdns3/cdnsp-gadget.c | 2 +-
 drivers/usb/cdns3/core.h         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba726cef258e7438d642f31d6567dfe..694aa14577390b6e9a98ce8c4685ac8f56e43ad4 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3468,7 +3468,7 @@ __must_hold(&cdns->lock)
 	return 0;
 }
 
-static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
+static int cdns3_gadget_resume(struct cdns *cdns, bool lost_power)
 {
 	struct cdns3_device *priv_dev = cdns->gadget_dev;
 
@@ -3476,7 +3476,7 @@ static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
 		return 0;
 
 	cdns3_gadget_config(priv_dev);
-	if (hibernated)
+	if (lost_power)
 		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
 
 	return 0;
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 97edf767ecee9067e3db66c2373d4b1a7a2e29de..87f310841735092b6209ba6cbb9b56afa963e84c 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1974,7 +1974,7 @@ static int cdnsp_gadget_suspend(struct cdns *cdns, bool do_wakeup)
 	return 0;
 }
 
-static int cdnsp_gadget_resume(struct cdns *cdns, bool hibernated)
+static int cdnsp_gadget_resume(struct cdns *cdns, bool lost_power)
 {
 	struct cdnsp_device *pdev = cdns->gadget_dev;
 	enum usb_device_speed max_speed;
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 57d47348dc193b1060f4543c2ef22905f464293b..921cccf1ca9db27a66b06c7c7873b13537c74b05 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -30,7 +30,7 @@ struct cdns_role_driver {
 	int (*start)(struct cdns *cdns);
 	void (*stop)(struct cdns *cdns);
 	int (*suspend)(struct cdns *cdns, bool do_wakeup);
-	int (*resume)(struct cdns *cdns, bool hibernated);
+	int (*resume)(struct cdns *cdns, bool lost_power);
 	const char *name;
 #define CDNS_ROLE_STATE_INACTIVE	0
 #define CDNS_ROLE_STATE_ACTIVE		1

-- 
2.48.1


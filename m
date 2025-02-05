Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA5204F66;
	Wed,  5 Feb 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777024; cv=none; b=k6Mz2+VGD9ClfnIYYXkWaAA0NuguG/f46gQVt7WRVNuyOURlm2KZ5n3wGqQVOw0YtX6DGEEZrVUZzTFUHJUflXaBlqHYzB2EihYLdMwULy/Fif9hKcpn6CG7Kn7ckG9mnAorzUXsAGUDN/0MndcDJpN9KMEVEJNuLyi2BteucRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777024; c=relaxed/simple;
	bh=aZakQoZXAhFe7CMLavL6gM2yiTLegTEEPy3dWGGQ8j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZfb/Tnn2mQk02E71dQV660wKHw3GtBOM4Kiyx6tqNQo2cvSpKc5PqpXiY7+Gzt2v7eJwDRS7ExRo5g8XAVNnEZBEObURHhU7D1iQsGKBq5oXw+edXI7AjmrpEYK1tAQ3PraZZrL3CU5IicdGqc1sUt4B7n/6K7/ZncDTRWD/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E2eZftjh; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E2eZftjh"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C4444434;
	Wed,  5 Feb 2025 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xa4w4yiK4Wol0r4srxzFKFrOoMuptZYzIGRg6T1LNC0=;
	b=E2eZftjhfi6MTaDKTJLDX/IatARsOEsl2WSNENAdG+URdYEujK1jYVotTWS/YKHoSaA7Go
	s8nBVB3ARuf9dKhceFo6juz5r3ATtGkKDQGRaJ/RYYqVQRj/eZa/ZGXHhNSlopGi8VoZHi
	UEJON2hpCF4ZDjzsXLt2ANlYDP4QDMQiqo0v369GpFmbUNrNhHd+G14N/O8x6xTpyGkVl2
	6eFgKf08K8QvmcztvASYVUEuIyuuDpLm0rj8nkM3iEgWn2FOIUKIoJW9g9Es759pkVAiV4
	ZDRqfm/mb/IA8vhAYWSN46jQ7wOsa9lhO8svWZ2Mz3eTX/PrYKgtUWVm5iDZBQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:53 +0100
Subject: [PATCH v7 8/9] usb: host: xhci-plat: allow upper layers to signal
 power loss
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-8-13658a271c3c@bootlin.com>
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

Now that xhci_resume() exposes a power_lost boolean argument, expose
that to all xhci-plat implementations. They are free to set it from
wherever they want:
 - Their own resume() callback.
 - The xhci_plat_priv::resume_quirk() callback.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 drivers/usb/host/xhci-plat.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 7c2d7c4e601188ab721fd22c338456ca8100240b..3155e3a842da9a979f29e5cad18a3b18d70cfdab 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -482,6 +482,7 @@ static int xhci_plat_suspend(struct device *dev)
 static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
@@ -501,7 +502,7 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
-	ret = xhci_resume(xhci, power_lost, false);
+	ret = xhci_resume(xhci, power_lost || priv->power_lost, false);
 	if (ret)
 		goto disable_clks;
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 6475130eac4b38061ea038ad14b00a48f269d4e0..fe4f95e690fa69a60ea8c7671cda41634ab86e80 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct usb_hcd;
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
+	bool power_lost;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);

-- 
2.48.1


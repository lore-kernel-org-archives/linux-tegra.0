Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931741741D4
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750443; cv=none; b=SkgtBSeqBJSs3Yp+K3zx6WEklUT8GBW6g1H1ZQnLPn0cPuNqfYcEOP1Nh/rZ8RqVJkpGYSzebgBI3NuFbkFtaJr0u7C1cVLNH8SnNHfy4CY42QnKoXszzV8QRrj/noLpTjP2cHv4/JU86OD6yf2LeSYVnmp2WrjZFfeuvxBsE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750443; c=relaxed/simple;
	bh=Mr5FjaOgXQrzsjuJQ+4UFZauI2YyRX/0dCS+xJPRDiI=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=OK6iOQSc0XWRm8o0k+8XMeFlLVLfAslyT/iLDqYFhAjiZ8L47eo9JNXC2nHFAIthvVbHC/HjuTIZc3vNXwB8AFI7kq9dbuP8DiG/ZdQeHJbcvphG1wHrxGt/qOKhCO+emPDAzurMCgwYE6SkenxCmThAVWp9FHrtobBMshSYiHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+O9FxV8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+O9FxV8"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e59dc7df64so7436217b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750441; x=1730355241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=l+O9FxV8zMyJLtiECjyP6uxQWt+z7Nh6pOzPxwoTy8TsQ03yElJJbJEDsG7X+fc0Hs
         xy6vdkz4D9T4FDkX35/oZorIHOCxHE+TjfGMmAo1Z1p2E10gftpnjinn5ugwFGJKk/8I
         SBggeJTTd8zvE9c0l0HiBbDuZ6zaGBT8Q0C+Q1j7VTHRxtsE383CG9JRO9b9oKiLYEA+
         Kr6WqBGJglU5SxMwE2G/yD8qA/q5hw7j51c3SU62dvGh7R2W6mUApmAWoal2Za7EB+ve
         ytm+q88bMY+9g7fDguAX/z/KGEX5HPLGoBg5+V3zKFb+Crl5ByyspT+02b17GBarf1EJ
         8wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750441; x=1730355241;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=C5SyhugxeGJU/Uw1IUhpA9pRsm9F5SakJ5NtXn2FWhbWXYIqEMErM6w70yl5UsQAyz
         1HYh8pNOhExh0M6Lt6S2cU+3428o1rnao3GA8E1O70WfZhHEM/ytxs5yA88DuOZVHogD
         n8CAuvHlc5E36uhe+kgLQAnm75HnLcfeYdI2wP+iOzwrNifBJaZAc2AFV6N8ktaAv0ds
         TyXEVyp0wGAeIn2BPJjZ+W3bu99N0WrTWQfLOZJPKR2ZMZ4/Q/GTJuCWh6Fg7UPE4ow2
         wurNviSqr8NNFJ4UG1RlHAzl0cfxxxARUcd9agID0gZ0Eq7A2t6bnFL6DKukfSrhmvKE
         0F+g==
X-Forwarded-Encrypted: i=1; AJvYcCVbEkADF6YLjRZ8V1uAD9jAumpR23LnTf0o2c9eNkcDqyODeVX19hKn8admEz7mlKdIQFLB20AotOfsAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUyo5I5X+ScebwMoZ23oe1I8Z51BYBvFxEl3xeWacc+OUNvSr
	9+y+xaL/AJ+McSGI6to847EXkouVh5PXYcQGtQKoB8YpG5lh9PaXxU4fdYk5y/IDbUkMJgeNH3u
	hhgstFsLUDyaQ8Q==
X-Google-Smtp-Source: AGHT+IEvWKI797qzaVIyJQytUKUTuDrxqDTilc69F1bH77+J3k5wYMBvLRY6cYuzVgsPwwCo2eftygSjpmQuXoI=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:9c06:b0:6e3:c4cb:689b with SMTP
 id 00721157ae682-6e866350bbfmr483267b3.4.1729750440665; Wed, 23 Oct 2024
 23:14:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:43 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-3-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..0a2096085971 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port =
*port,
=20
 	device_initialize(&port->dev);
 	port->dev.type =3D &tegra_xusb_port_type;
-	port->dev.of_node =3D of_node_get(np);
+	device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
 	port->dev.parent =3D padctl->dev;
=20
 	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
--=20
2.47.0.105.g07ac214952-goog


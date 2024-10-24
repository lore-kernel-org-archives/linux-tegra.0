Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6C175D47
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750438; cv=none; b=XI7fgP8n2SqHzw6dtjWzZSdUTAvZSaZRB9E2PlJeJgp562z69zwYA1ItEBruHvu0UR1MSvYplsNp7dRXmhg4VhGi8B+wN//UIG7gHawJxzG/dzOYCUgWrOMMTVa8uav24iP5MIUQwdEvkloyfgJnUKARVKxojmkr17Tl/CZJebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750438; c=relaxed/simple;
	bh=l8D/9i6mXjdrnGYXKluLekzKk5HyhssFtVUnJ+7Jyfw=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=gb9HzNFQ4kgBxiWgFyO1+ecubwGJj6DlNsYNubi3euC3EDgyhn63BrDSvencDxCW/W6tvmfi2vGfx/UTs6i7QdVbxFvNa6OJGOvdy+TjnauCM0QPR6TU0uek83At3yYd8s2+SLDQdg7MtAzZRTkbWxeQHDqJfS/NXI2UTn5JdMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VpDNcNux; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VpDNcNux"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e32b43e053so8801497b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750436; x=1730355236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULy+zyN1BivKyLwzuPRCl/8UJCnpTGDPYrNtb9eDcL4=;
        b=VpDNcNuxDW34hq19vrx2nfDDXyLZw9bizU2zwZj38NQDPHK0zGHXvmBriTeVxkvWaO
         fzs2G2jqEm4VPeKGYqTPHToGn5Orrfbt+fjiBfIceWHkKoIi8PCaEHHhYlbq+WyHaUcz
         ahvuRJ2IQUH/HCNoMve6hne17gbkYkhbQZrq/X6XZL6cWy7NOnieBzKWjOkkm+an13wx
         0PkV9LDNsi2zWwHYpRu/fd/5lfbUKQPl998X6S4W18P4jVrKp+W6Li6G4tUXwkOBCzEx
         56+tTE0pPKKOGucPFiAYV7o7LowWGajA3KrfQujnV8Lp1ddFY7dQrappplH9BngQnF4G
         LISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750436; x=1730355236;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ULy+zyN1BivKyLwzuPRCl/8UJCnpTGDPYrNtb9eDcL4=;
        b=KcXuL4p9fh31Y+HqO2A1SMI0Z6tVjvoT/nPOky6lHCeC3z3acIwfoTwy08yiYOJa6z
         joxScFczT//biWgDhJwBwcS0yVqYS8FU6mU1p0aGNKIK1209CYola2/nSiX0VX5PgZeh
         4mPfJTbUxHv/jD5Jgkqm22i5TvE9l+KWO7ZWI0aCmOQROqdov7Yc+824vLNdibSZuQlO
         9cBbqd++76ZdezxOFTtvmCtZPGGm3jQNoSgDWsaUcp2EQxOWbIwaIcNtpwOQAzo+m8ce
         Q2YQ/WwFrDQaRLycOjbn4ZAqd8PHIrlffcYOV/usH6+srNCytufrHh8cdtwDEGAIaHuP
         HzJA==
X-Forwarded-Encrypted: i=1; AJvYcCU9rQg0MZwWulmoxpnpCTfOfe4TP3/oCNaVhvOGCMOX4Y/9FStoj1BzNWS9XeF7H43njQfwvdoOO9SFzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAO4Id01ZNvFkWuH2PCxVugAVGlQ4vvjfwZ9Z68SIx3kSjgWKt
	fII8wagTvAFzufsRybmQV9/KhUH6UAocb8vyD8zEhnhK7zhKAKVhSt/hCP2yNuyoUmmHQx33Il9
	5PV2if9opcdihAA==
X-Google-Smtp-Source: AGHT+IHCEMkQ2RfyYdNtjaLmn7Q1IV6vv3d2IoDuURVXiH0KtdFNDJTv0BNk9TxANKxuJUTxCoodn7NIA1qQz7g=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:6811:b0:6e3:19d7:382a with SMTP
 id 00721157ae682-6e85813d7f5mr589267b3.1.1729750435897; Wed, 23 Oct 2024
 23:13:55 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:42 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
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

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with =
backlight-lcd0

Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/dis=
play/drm_dp_aux_bus.c
index d810529ebfb6..ec7eac6b595f 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent =3D aux->dev;
 	aux_ep->dev.bus =3D &dp_aux_bus_type;
 	aux_ep->dev.type =3D &dp_aux_device_type_type;
-	aux_ep->dev.of_node =3D of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
=20
 	ret =3D device_register(&aux_ep->dev);
--=20
2.47.0.105.g07ac214952-goog


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605EB4E0B6B;
	Tue, 22 Sep 2026 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060362; cv=none; b=Xag3rMw2qeHxxTDkglWQfWfbA41J9E7Iw9W2HNyQxJG62ZjRJx+2s+mhxq/pJRTQ6TNvrUJ3DgyTkJITOZZmqKRtuojcDW8qiENHv/Dq9t952rS3SOxUH+70x3dh9NxGNjlqsb+gR4slsOb/JU/vJilfDLIb6uYeCmXoNJn00MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060362; c=relaxed/simple;
	bh=Cx//D7w3RAOQSZX3CrDuftWy3uxcc6ddNxOSYpCWbfI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=rCdzPfF+Hh6PlmaDOizV6zNCHHcpg5J39loCXbuasuEx/WEQbLC9F/9rZz7YeR443wgbI3BGPcUfg1aRghRiGv0Yz+QIq0DHAykuHLnW47Ao9FmDEZj6oyuLpYOJcBYOc+LLh5Iv+kqqCioKvFQbzSAvZ8EppnC9Jvo5NUQv4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwVYOoQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwVYOoQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F9C1F000FF;
	Tue, 22 Sep 2026 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060357;
	bh=SxGgdlKXdQehed4Mw0SfXW0axCt+1uRQORUzvBkN0Rc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=RwVYOoQfhi9TwqQbw5KayRana+hvfi21GombJmNp6vJqoWCJhdtfGdezAQ9dJwgTB
	 +4IHqXlgTbon0FxFqaIqX5WLujsN7u64cnDGQAfMLkdfokQje93zHp7vQ08UB4cQIf
	 5Z7uc0y7l8KC4oQliasYNUZ9yGvrVEE2ZCH3DLLljQGilqLLBmIOIaj0+/sl+08wA9
	 yNeJDm223TxhLpB4AyFZOBHFmctbpgM/pOwmx+KbZBYJ7Q7oEFHjirJhzVpe1/B+bb
	 2eN+YhW/o8i3A490N29lfp6xXaqchOcW1ZSdbjhLStHgesNM3J3hoeFDvCVmHBJFXD
	 LKjJkON0g+8Sw==
Message-ID: <525095932cd9563fea70b43823c9db88@kernel.org>
Date: Tue, 22 Sep 2026 06:59:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 09/19] drm/bridge: tc358767: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-9-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-9-83afb4f1a707@bootlin.com>
Cc: asahi@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus
 Walleij" <linusw@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Wed, 16 Sep 2026 15:45:33 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

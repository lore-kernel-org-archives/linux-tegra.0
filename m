Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967674;
	b=fQHgrCh9RWy1eY5gxYcMHKdsuhOuZNr9dkf7JYLH2UOoJ2lAfjsaDz4UxC1A++/kfOVe
	 KTTkHrWV6wR+/mMqIFDdq9G8gWUOih2UHiTPo8ITeKrKT8G0Vp9XxZq0e7In9hh7WqKL/
	 slP+arh1AtG84wR4ezAJJHgf3oD0PWBsSzYpiOvixqga/4oEVx1CTPVQVxmntBK/84GBf
	 pJm7axc6HT3F+ZK/SPqf+Uy4WmQ7NQ1tqWQKQII+x/Ex6y18brILheG9B7tBb/KApg/FT
	 CmFKkt5pWHfoM6PV4n6VTardH+kSoBYVDM+gGuydSAbY++hXRYX6khLJmAIysr8EijA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967674;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NxIutNCBNsn1ITw9XP2DiDCjd84cBME5/PN/6c/dFrM=;
	b=5BoNBDW3gsVRj0C9ZXgq4PKytEPXk74hLttCJ8CH3CKnKvVJPeycYDYffrchz4Du3gaS
	 olznQ48Cw48rWNPUYd3rivtEp+HkzHg22UtcrxH+NdY6fbT43zT2NlPl/NWi4kT0AjUbO
	 Ul2WQv9issEVEZLRp8DXnaL8s178OOC/OUO7KopDAZAwzqIj1E17AeQ8L2OHKrFD6iF45
	 WonJvnJ2zjVvlnbgIFQ7NUTiY+x3Vha51m0yoGr2n/89aqib0y7rEHKz0bMOtzwkT45yr
	 +1nTsADbWh0atF/3SZ2KNU2GrhYa+L+YbIRg3dPAF5v5BnRBTsRslhRb/K6tdzlVvKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnt6koi5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FD606A31D;
	Sun, 25 Oct 2026 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnt6koi5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967674;
	b=JbXYNNQ/mh8UpgQaye3cTpfBDkXWXtL50uaa/1g1H+xbDXcV2S7TnJIWvirLFV+kUJgI
	 ts/FagWAblP7DV/DDC7EWorwqqeLhmrCxy1j3HswBpIX9dmFTZIeOqy4chfzpoy/4XukU
	 Jo7o9v8j4R3TUR0VMsoEIx4FHe5+tyngAnOJKqfGRcd5syvTHN9LxZDgC0kWq3CHFcnnH
	 V44xYTIGPI3yf7B2Tplasos0qFbAcIlBkIM6WEodeEGDc5rP8hMP9xp0x+0ETLf0SVCLP
	 uWCoBWCPDvSj/4XNoDMXsloSS3pYxvF6fpU4BgEGAm38N4f/W8QYVChIXxzLSqDwg7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967674;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NxIutNCBNsn1ITw9XP2DiDCjd84cBME5/PN/6c/dFrM=;
	b=SxAz14uklwb/Ydwcf6Le8D4l1gIO7y4Bv0cKm2sE6+nP77U8A4LhxKun6jQ2nIkjHZS2
	 CPgjBNYaI8S1VEmjngCcnE9PFaIwewIsLyVzrCMwue/FhNbFQ5NGMkQrk+xvYthu89Hcr
	 KRMptPKWizJF9XddAgEYADlwY8Y67EUCAub+6nzIjrJYUsN4WXhRTlkJo54hV1r8ft0bB
	 BzFinb9M5IFpu5cg6rq0gqMJS+faRglXdK9tYAY4PHEqsFUERZcKtymTtFLm/YvG+8XrL
	 yoj9UGDxD5rX9maRFvERLKvnXId6wJDFNV6B04OWHzf9YJrW0Xy9296kNeadGhyQFtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BA091F01825;
	Sun, 25 Oct 2026 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967674;
	bh=NxIutNCBNsn1ITw9XP2DiDCjd84cBME5/PN/6c/dFrM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cnt6koi50W9gEHybIIJZuY8D628bgyNgYhNE3KcCKfkkmTFrQ7yealz6dZlV/qtBc
	 /2ZLV4UYebEpLYXEFcZ9GtiZy53pwCl1SzPxq6Cu17OvHD5/yUnZzRhYy3loJhPHuf
	 4FFvDFXMc84I6sbEAoXx8jHVVbLosTi0f9bUtErCO3pLn+vYWF8R4mEExRw2DHUN0h
	 rjwYjB14b5AeeHy13KDukedALHFlqlN4iz0zvVGCGf0O9frnDZqrZpWI7v6Bl0VHV2
	 eRvlVa2ufoe3tUVfIXkCjpmyCFoym3yI2+n5myjnpOQmeNv0MUluYhGaOEg0sXyLOj
	 ZiTbCx3JQtBbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7409944AEA;
	Sun, 25 Oct 2026 22:34:32 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] drm/tegra: Support YVU formats
Date: Sun, 25 Oct 2026 17:34:28 -0500
Message-Id: <20261025-tegra-drm-yvu420-v4-0-30b3bb0d0752@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAyA4VchOzvTbkOGJ9/DeBjbgCUCZsNFQ
 nh3ByeixuPftF9nEqx3NpBzNhNvowtu6FOIQ0Z0q/rGUmdSEwbshACSjrbxihrf0Sk+BQOKpqo
 KFGBzoUg6e3hbu9dGXm+pWxfGwU/bh4jr9A8WkQI1GrUQXAPU/NJ0yt2PeujIikW2A/AXwBKQI
 5OyROCqEp8A3wFp/xvgCShqLJXkolKl3APLsrwBBeCqZDIBAAA=
X-Change-ID: 20261008-tegra-drm-yvu420-1dbb7140e54a
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792967672; l=2128;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ilqcffhru43nXGSWBduPO0jtANCxR7RAgDglJEEAKNo=;
 b=Oy9FfeM3IQVzNcWnlSZvuWSffvGe0eSkfXzn1LFrxyqa70g8MAm04jiHAD5TNGUH54pfUnvaU
 aNLPACdL4FeDAIHBcdskrHm1On5iGyOGywkpo3u8w7rUpN3GdfIwE+e
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This is not directly supported by the display controller hardware.
However, this can be handled efficiently on tegradc by just passing the
chroma planes to the hardware backwards and reporting it as the yuv
equivalent. Nvdisplay has a hardware flag to handle the swap in
hardware.

YVU420 is required by AOSP for software decoded video playback among
other things. An attempt was made to handle this in gralloc by swapping
the chroma planes there, but it wasn't working. This kernel
implementation is working and is more generic anyways. This has been
verified on a SHIELD TV 2019 Pro for the tegradc path and a Jetson TX2
NX for the nvdisplay path.

---
Changes in v4:
- Drop yvu422 from the nvdisplay path. Yuv422 is not supported and will
  be removed separately
- Link to v3: https://lore.kernel.org/r/20261020-tegra-drm-yvu420-v3-0-7f19a834ba98@gmail.com

Changes in v3:
- In patch 1, use the SWAP_UV window group flag instead of manually
  swapping for nvdisplay
- In patch 2, support the chroma swapped variants of the other yuv types
- Link to v2: https://lore.kernel.org/r/20261018-tegra-drm-yvu420-v2-0-512889103ab4@gmail.com

Changes in v2:
- In patch 1, simplify pre-nvdisplay path to a swap of the window base
  address
- In patch 1, address sashiko report about failure to copy the new
  struct entry in duplicate_state
- In patch 2, address sashiko report that yvu420 was missing from
  tegra20_overlays when the targets already support yuv420.
- Link to v1: https://lore.kernel.org/r/20261008-tegra-drm-yvu420-v1-0-dc1c443c00f3@gmail.com

---
Aaron Kling (2):
      drm/tegra: Support swapping chroma planes
      drm/tegra: Support YVU formats

 drivers/gpu/drm/tegra/dc.c    | 13 ++++++++++++-
 drivers/gpu/drm/tegra/hub.c   |  8 ++++++--
 drivers/gpu/drm/tegra/plane.c | 29 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/plane.h |  3 ++-
 4 files changed, 48 insertions(+), 5 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261008-tegra-drm-yvu420-1dbb7140e54a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



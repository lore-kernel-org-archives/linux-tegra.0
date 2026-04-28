Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA993BBA0B
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406851; cv=none; b=GiUEZwr3Smc8kisZ0rlp2qNSN9FCD0Z5SeDPaDB2gB7uwrhkWlbBbm54s9oMnaTd8U9YJ2J6iXlCc+MBsHlefooMes3ovQyt/7YnTpitxAUSQHSAXBikiWZhFm+VzJAugUzBUVYj7TTv0wdUn/F21MqBBCOLFwXxQVFvg2GvwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406851; c=relaxed/simple;
	bh=ksXQeqM5axRgUsGjCWqfJTytSjsUbB4ll76rBVY/214=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcMZ2qONL+mJl1qA8I2pqwQG/PWipQX2+/uyu4sFGxY1m6WFuZzvAwLzRIjN7MAv5Fhp3Dh2YVXp4QFvovH3xn7pQs+d7YK9GwGbn3Rk5qmafbtZt27QK0h1dzkp/CAnCAHlSc1KGAzFsHvqLqRHpA3CguZBT1dGbBv3y6Fpw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gCWlP4++; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gCWlP4++"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12ddbe104ccso2053646c88.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406848; x=1778011648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=gCWlP4++xcNr9+Gf+fqTnVbbgA8YOADh3IFpBiDZBsSn5havxoaKvL9GdHxwLKLxkb
         zFVvECzbbn/CyuqATemdznWR14f6NLOH3Ym9iV/MhYVW/qYWL/D+PmltI62KSjKNKldh
         sTwvpsTDTXXhYlZiGxNnSpDxvoDln+d4GWE/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406848; x=1778011648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=Pf0l2MLbyWbJ9ZRoFWzmN/BUlth1+ORSEGn16d5S0XrtQUwYUCsBAvGa1SdFaBndZ7
         Z9r5V0HMOeGnnlu0Mup13Y4Ux+s+2GCDRmFehYdO/ttvw3m7K6+kRv6j9MQjWncXtM4y
         oeUqrETLBO9uEEepbkwa8kzvJPKbJXKxw1+tuG+u1ZrImw5i0NWIQt4WrnnsCZLH/zNn
         rL62rXqOytYUcFrXSzSkk5vnWC3M8hgGyNRWXF2PdLwqOc8/qisQUzpFE72+0j1NwnbF
         W1aPK8jJlNMLkuvTe2MwwtnLRVf13Spu88a/ifS+/vKq7WT3/kSyBBBZmRyx4qNFYxR6
         J8SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3EOJ5fUEQsgn8KBAgztf+WWCqO9pENfOL43oxUgpQXhFM3AVrYAwjUKcJIZtn1zgKdF5meufTs0GH0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSAWDogkH9BbnxQyUTVWkKXc385fWVWojwJ4m9j6Uf2jmE6oSr
	wrl7K4F5IlZpkxExJeg3joktrh6PXTtnlBnz0LGF+wGmdAhzeIoU/5TSkkARZ2kNaw==
X-Gm-Gg: AeBDietrxB9m0vYcFOErpXDkRC2airbIULEoqtCcgy7THW9Wpmf12VYjzzHdMT0v4Pz
	LBA4fnE4EEUcI1UAdn24Q8r6lf+gVBrbBD/lnZMsJ/gT1/BsAj0mnSJpUdXono/HMivaM2NQ1/e
	QfMRH2VOHpp9qaQ7Z+qIEGXFFmqJIrpr6dtunTT7yZ+myKjiLmyhdxVsov7PAepdAUzte9v8GpP
	td6JWHjWsqiH9qp7O9GUknwUME/5BRd8gWylRwkUxySxhkwqMpYzMSl4alPPHL5Wkr2YBn1rh+0
	E6F1x3s66+wKwqDPy2iPXYGTsMTh2sWDjEAO5IgcFn2amgZQ3gCyXugCXRxA2ojeqc8cIGU6mY7
	9Wb75sIoeJul5Pw5MK2ASJhjHNnCkl44sOruTAxxnrIrynyYW52hkMxaV4lf87GMRHXT8OqJCtf
	Bv2zMcCe2J2IdgqV9gC5r8u2GJrw11/OUUXzboZ1ledWd5e1oxr+4yRqsPVSW/XcaETSrCUKpc
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:d84d with SMTP id a92af1059eb24-12dde3fdd97mr1431757c88.38.1777406848179;
        Tue, 28 Apr 2026 13:07:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd93abadsm2784062c88.6.2026.04.28.13.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Tue, 28 Apr 2026 13:06:52 -0700
Message-ID: <20260428200712.2660635-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

  ## From a RK3399 Gru/Kevin Chromebook:
  # find /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware/coreboot
  /sys/firmware/devicetree/base/firmware/coreboot/ram-code
  /sys/firmware/devicetree/base/firmware/coreboot/compatible
  /sys/firmware/devicetree/base/firmware/coreboot/board-id
  /sys/firmware/devicetree/base/firmware/coreboot/reg
  /sys/firmware/devicetree/base/firmware/coreboot/name
  /sys/firmware/devicetree/base/firmware/chromeos
  /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
  /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
  /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
  /sys/firmware/devicetree/base/firmware/chromeos/compatible
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
  /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
  /sys/firmware/devicetree/base/firmware/chromeos/name
  /sys/firmware/devicetree/base/firmware/ranges
  /sys/firmware/devicetree/base/firmware/name

The /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

This series adds appropriate #{address,size}-cells to the device trees
used on Arm Chromebooks to work around the problem.

Note that Google provides bootloader updates for some devices that add
{address,size}-cells [1], but these are only delivered via Google OS
updates. Not all users receive Google software updates, and even if they
do, not all devices still receive bootloader updates from Google.

This problem was first noticed in OpenWrt, where some Chromium-based
routers ran into the same issue:

https://github.com/openwrt/openwrt/issues/21243

Relevant OpenWrt fixes: https://github.com/openwrt/openwrt/pull/22951

There is also discussion at [2].

I've currently only tested:
1) the aforementioned OpenWrt routers (with non-upstream DTS/DTB)
2) RK3399 Gru/Kevin Chromebook (patch 1)
3) Qualcomm SC7280 Herobrine (patch 7)

I assume the others should follow the same pattern. I don't know if I've
covered every relevant Depthcharge-using device, but I've made a good
attempt to identify them all.

I reviewed Depthcharge code history and found that this problematic
bootloader behavior dates back to at least 2014, with the Tegra/Nyan
device. Older devices may have similar DTB structures, but I'm not sure
if they have the same address-cells problems. In any case, these changes
shouldn't hurt even if a device was not affected.

Brian

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

[2] [regression] of: mis-parsing Depthcharge's /firmware
    https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/


Brian Norris (7):
  arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
    /firmware

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi           | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts         | 5 +++++
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi         | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi          | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi       | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi       | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts        | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts         | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi        | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi          | 5 +++++
 18 files changed, 90 insertions(+)

-- 
2.54.0.545.g6539524ca2-goog


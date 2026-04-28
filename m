Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102AD3D47BA
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406853; cv=none; b=Bd1z0xCNiX0vCSAx/B0uS97tMNVuYN2m3kpYxzVs3jS8RHFo4iZ2Cw1vHS5CHejwkGk8CRhRPV0cwe/i4FIee8kyH1nPYsay9wCpku5o+NJcqDbPnQnYYBxwEFfjdt0kqCBqI8yUu5qIjSTerAdxUvRqgbUENtZdh5xrZcsXfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406853; c=relaxed/simple;
	bh=xlJmeP+PJelIrVWVbvw6zF4EvPRmj3ee8OfUipPJo0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc/1a0FfowAZP11g0GucrmYX4MjkRl+/2zuR2e3dp2f6Livb7b5PbXi/1yuXo/1G8DETtF/n/CCcv4Nk6YjEum2aC6Il5e7ShiRuQXnvmqx9pEAQLnn5ez8/oZZ/fKRi/PNrPYcbJY/+C0lWY9VLC/hpGnwsHGW4rQct+am5beI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hYGSZM89; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hYGSZM89"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d9916deb14so20717608eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406851; x=1778011651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=hYGSZM897QKQ5m+LAhH+lO8SS8phly+jGg8Ckq7yAM4gpBYqZprOmOi+vB/G0NglCG
         sGYCaSwiZKRJxJtfzqU50x/OCyuMNMmVuFBqXF3yfnpcLwLCqSJ6sYvPAEen+OiSuybQ
         ywMtsaehpdFVYctkpSpR4gNQJFeZtxTGQbtVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406851; x=1778011651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=VqWf5VKEJonqXC1QLYIfcGrjpJRaaDW3q5ngVYI80gkhuO6sltRM3w0loIZqvyPfUo
         m29YKuHnDNNsC+G/6KtgMcWcHQSLnAyd9UvnPRN6lE3IWWD8ZnS5805iCCijSzI5jtXB
         w0+Au9REGb9hGcPjfnqWoO+VpQZ4cpoQK/49QgrFe38c3Cv8kkMallVcDYtoRz+Pp8iC
         IUq7l+AGc3gQJnocqdg79ND1pDPMTZFxoefzHorAp3pncCvxiotN+SX+VT5aHSCDBiNW
         23Xr8kObDDCBCNJKqWNhs7D1p/tHFR1ea/j03/+RGNPCtgVsOdXcBicvHqJ53uagDTh+
         wlvw==
X-Forwarded-Encrypted: i=1; AFNElJ8BDZb4DRnvkPkVlD7xCBmZU82uqmHNifRAnPKuyun4G+abrRhlIThpl1wZ+qKXOMs9F9XPwm0SR5prFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlNUJQiqWHnMonsHkiQfn6oSgcH2q2P2xPCVYM992bpwy+PqC
	1Tw/acdiQfqRfNubJJ2nLX9vccidVxyJqXYRSIR8G53gi7aWTS7xoevzhYeG7Xmj52xcHl64EJi
	aeo0=
X-Gm-Gg: AeBDietANEjpg2+foP6pNI6rITkusXhZvm37KvtLusuKPgomfDKol2MHKpbUWhBv2Rd
	uWHk8J/trQGnu0kbctzZeLXyR3X6FlKEXTd2LTSzyy5haTjeO8e2nZPgvXTxexXkc0ivLMwdVQK
	c+3DSN6NSzFajILi7WaDqSW546LQWdsrQ9Q+EE0esuWX0lMO7FM3K9oqVrnboUpgIhVCaYkJs8W
	Nk1ZJcwQ2cdLGTh4BGvgpxuw1FSMUW4Ps59wT6E0t9DKsu42x7rvDdu2PZJEwF9aAnvVWV67ScH
	R9vKvFUr9M2Yl+RCYxpJ1RSUzojp53gIGgE9bbPzSO2yJsPA1JtmkiCvSVwl9GMAgnOCFcR9J+I
	oYPiK68Ue9odIWxyqLQeU/XTuJ5HfWn7omgX8RR/9YIR7QjiGCnDESO8LpxAn7zMfiKP1Ukgy7J
	6h2S96SaM1F8VZvOHFG0STW4KJX2N+leOP5oh2PRAR3PqYh9ERvnYsxhnVcW4U0MQPXtzPvW/a
X-Received: by 2002:a05:7300:fd08:b0:2ed:e17:d50b with SMTP id 5a478bee46e88-2ed0e17d6eemr1499097eec.30.1777406851181;
        Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10650esm2873589eec.22.2026.04.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:30 -0700 (PDT)
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
Subject: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:53 -0700
Message-ID: <20260428200712.2660635-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
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

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 7eca1da78cff..2f9e39671efc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * Power Tree
 	 *
-- 
2.54.0.545.g6539524ca2-goog


From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 06/12] soc/tegra: Add Tegra186 support
Date: Fri, 19 Aug 2016 19:32:27 +0200
Message-ID: <20160819173233.13260-7-thierry.reding@gmail.com>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819173233.13260-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra186 has a combination of Denver and Cortex-A57 CPU cores and
GPUs with Pascal architecture on it. It features with ADSP with
Cortex-A9 CPU for audio processing, hardware video encoder/decoder with
multi-format support, ISP for image capture processing and BPMP for the
power managements.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 03089ad2fc65..88a71dfd466c 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -61,6 +61,20 @@ config ARCH_TEGRA_132_SOC
 	  but contains an NVIDIA Denver CPU complex in place of
 	  Tegra124's "4+1" Cortex-A15 CPU complex.
 
+config ARCH_TEGRA_186_SOC
+	bool "NVIDIA Tegra186 SoC"
+	select MAILBOX
+	select TEGRA_BPMP
+	select TEGRA_HSP_MBOX
+	select TEGRA_IVC
+	help
+	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 has a
+	  combination of Denver and Cortex-A57 CPU cores and GPUs with Pascal
+	  architecture on it. It features with ADSP with Cortex-A9 CPU for
+	  audio processing, hardware video encoder/decoder with multi-format
+	  support, ISP for image capture processing and BPMP for the power
+	  managements.
+
 config ARCH_TEGRA_210_SOC
 	bool "NVIDIA Tegra210 SoC"
 	select PINCTRL_TEGRA210
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

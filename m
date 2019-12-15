From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] brcmfmac: Keep OOB wake-interrupt disabled when it shouldn't be enabled
Date: Sun, 15 Dec 2019 21:42:24 +0300
Message-ID: <20191215184224.11827-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra SoCs do not like when OOB wake is enabled and WiFi interface
is in DOWN state during suspend. This results in a CPU hang on programming
OOB wake-up state of the GPIO controller during of system's suspend.

The solution is trivial: don't enable wake for the OOB interrupt when it
should be disabled.

This fixes hang on Tegra20 (Acer A500) and Tegra30 (Nexus 7) devices which
are using BCM4329 and BCM4330 WiFi chips respectively.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c  | 10 +++++-----
 .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.h    |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 96fd8e2bf773..b5088379b595 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -119,7 +119,7 @@ int brcmf_sdiod_intr_register(struct brcmf_sdio_dev *sdiodev)
 			brcmf_err("enable_irq_wake failed %d\n", ret);
 			return ret;
 		}
-		sdiodev->irq_wake = true;
+		disable_irq_wake(pdata->oob_irq_nr);
 
 		sdio_claim_host(sdiodev->func1);
 
@@ -178,10 +178,6 @@ void brcmf_sdiod_intr_unregister(struct brcmf_sdio_dev *sdiodev)
 		sdio_release_host(sdiodev->func1);
 
 		sdiodev->oob_irq_requested = false;
-		if (sdiodev->irq_wake) {
-			disable_irq_wake(pdata->oob_irq_nr);
-			sdiodev->irq_wake = false;
-		}
 		free_irq(pdata->oob_irq_nr, &sdiodev->func1->dev);
 		sdiodev->irq_en = false;
 		sdiodev->oob_irq_requested = false;
@@ -1167,6 +1163,10 @@ static int brcmf_ops_sdio_resume(struct device *dev)
 		if (ret)
 			brcmf_err("Failed to probe device on resume\n");
 	} else {
+		if (sdiodev->wowl_enabled &&
+		    sdiodev->settings->bus.sdio.oob_irq_supported)
+			disable_irq_wake(sdiodev->settings->bus.sdio.oob_irq_nr);
+
 		brcmf_sdiod_freezer_off(sdiodev);
 	}
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.h
index 0bd47c119dae..163fd664780a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.h
@@ -178,7 +178,6 @@ struct brcmf_sdio_dev {
 	bool sd_irq_requested;
 	bool irq_en;			/* irq enable flags */
 	spinlock_t irq_en_lock;
-	bool irq_wake;			/* irq wake enable flags */
 	bool sg_support;
 	uint max_request_size;
 	ushort max_segment_count;
-- 
2.24.0

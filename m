From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 4/7] ACPI: button: Use input_device_enabled() helper
Date: Mon,  8 Jun 2020 13:22:08 +0200
Message-ID: <20200608112211.12125-5-andrzej.p@collabora.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608112211.12125-1-andrzej.p@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Barry
List-Id: linux-tegra@vger.kernel.org

A new helper is available, so use it.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/acpi/button.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
index ff7ab291f678..4deb2b48d03c 100644
--- a/drivers/acpi/button.c
+++ b/drivers/acpi/button.c
@@ -411,7 +411,7 @@ static void acpi_button_notify(struct acpi_device *device, u32 event)
 		input = button->input;
 		if (button->type == ACPI_BUTTON_TYPE_LID) {
 			mutex_lock(&button->input->mutex);
-			users = button->input->users;
+			users = input_device_enabled(button->input);
 			mutex_unlock(&button->input->mutex);
 			if (users)
 				acpi_lid_update_state(device, true);
@@ -460,7 +460,7 @@ static int acpi_button_resume(struct device *dev)
 
 	button->suspended = false;
 	mutex_lock(&input->mutex);
-	if (button->type == ACPI_BUTTON_TYPE_LID && input->users) {
+	if (button->type == ACPI_BUTTON_TYPE_LID && input_device_enabled(input)) {
 		button->last_state = !!acpi_lid_evaluate_state(device);
 		button->last_time = ktime_get();
 		acpi_lid_initialize_state(device);
-- 
2.17.1

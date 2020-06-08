From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 3/7] ACPI: button: Access input device's users under appropriate mutex
Date: Mon,  8 Jun 2020 13:22:07 +0200
Message-ID: <20200608112211.12125-4-andrzej.p@collabora.com>
References: <2336e15d-ff4b-bbb6-c701-dbf3aa110fcd@redhat.com>
 <20200608112211.12125-1-andrzej.p@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200608112211.12125-1-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Barry
List-Id: linux-tegra@vger.kernel.org

Inspecting input device's 'users' member should be done under device's
mutex, so add appropriate invocations.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/acpi/button.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
index 78cfc70cb320..ff7ab291f678 100644
--- a/drivers/acpi/button.c
+++ b/drivers/acpi/button.c
@@ -456,13 +456,16 @@ static int acpi_button_resume(struct device *dev)
 {
 	struct acpi_device *device = to_acpi_device(dev);
 	struct acpi_button *button = acpi_driver_data(device);
+	struct input_dev *input = button->input;
 
 	button->suspended = false;
-	if (button->type == ACPI_BUTTON_TYPE_LID && button->input->users) {
+	mutex_lock(&input->mutex);
+	if (button->type == ACPI_BUTTON_TYPE_LID && input->users) {
 		button->last_state = !!acpi_lid_evaluate_state(device);
 		button->last_time = ktime_get();
 		acpi_lid_initialize_state(device);
 	}
+	mutex_unlock(&input->mutex);
 	return 0;
 }
 #endif
-- 
2.17.1

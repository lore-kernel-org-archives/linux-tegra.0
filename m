From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v3 3/7] ACPI: button: Access input device's users under
 appropriate mutex
Date: Fri,  5 Jun 2020 19:33:31 +0200
Message-ID: <20200605173335.13753-4-andrzej.p@collabora.com>
References: <20200604072853.GP89269@dtor-ws>
 <20200605173335.13753-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200605173335.13753-1-andrzej.p@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel@collabora.com, Nick Dyer <nick@shmanahar.org>, Laxman Dewangan <ldewangan@nvidia.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Hutterer <peter.hutterer@redhat.com>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Len Brown <lenb@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Barry Song <baohua@kernel.org>, Ferruh Yigit <fery@cypress.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Andrzej Pietrasiewicz <andrzej.p@collabora.c>
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

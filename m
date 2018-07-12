From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: RFC: tegra2/tegra3 automotive part changes
Date: Thu, 12 Jul 2018 14:36:08 +0100
Message-ID: <3916c0ea-964e-42ab-8bfd-8e8edc5110ee@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra <linux-tegra@vger.kernel.org>, Device Tree list <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Preston <thomas.preston@codethink.co.uk>, Terry Hu <kejia.hu@codethink.co.uk>, jorgesanjuan <jorge.sanjuan@codethink.co.uk>, Beth White <beth.white@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

Hello, we are looking at up-streaming some of the work we have
done on the tegra2 and tegra3 automotive devices. The automotive
grade devices are close the commercial parts so we would like to
discuss the core changes before submitting.

The changes are mostly with things like the clock setup and a
few peripheral quirks (IIRC these are mostly MMC).

We are proposing to change the device-tree properties for the root
node and any other affected devices from "nvidia,tegraXX" to a new
"nvidia,tegraXXa". We would welcome discussion on whether to update
all the devices at the start

An example of tegra30a.dtsi:

#include "tegra30.dtsi"

/ {
         compatible = "nvidia,tegra30a";

         clock@60006000 {
                 compatible = "nvidia,tegra30a-car";
         };
}

We don't think the changes are big enough to warrant their own
Kconfig/defconfig updates.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

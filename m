From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 0/3] Add DT Binding for Power-Supply supplied-nodes property
Date: Fri, 15 Feb 2013 18:36:53 -0500
Message-ID: <1360971416-30717-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series is an attempt to define a common way for devicetree
initialized power_supplies to define their list of supplicants
in a common manner.

Instead of relying on custom properties which contain is list of
strings, use the much more direct method of phandles to reference
the supplicants and define a common function which can retrieve them
automatically.

Rhyland Klein (3):
  power_supply: Define Binding for supplied-nodes
  power: power_supply: Add core support for supplied_nodes
  power: power_supply: add support for getting supplied-nodes from dt

 .../bindings/power_supply/power_supply.txt         |   17 ++++
 drivers/power/power_supply_core.c                  |   82 +++++++++++++++++++-
 include/linux/power_supply.h                       |   10 +++
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt

-- 
1.7.9.5

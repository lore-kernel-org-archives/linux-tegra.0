From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: tegra: add basic support for Trusted Foundations
Date: Thu, 13 Jun 2013 18:12:22 +0900
Message-ID: <1371114745-24710-1-git-send-email-acourbot@nvidia.com>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

New revision of the initial patch, fixed according to the many suggestions
received. (thanks!)

Changes since v1:
- Split patch into logical chunks as suggested by Tomasz
- Simplified smc function according to comments from Russel and David
- Use proper "Trusted Foundations" naming for firmware instead of "SecureOS"
- Very simple firmware infrastructure in mach-tegra to support the use of other
  firmwares
- Presence of secure monitor is signaled through a DT node instead of a "chosen"
  property
- Complain if support for a declared secure monitor is not compiled in

Alexandre Courbot (3):
  ARM: tegra: basic support for Trusted Foundations
  ARM: tegra: split setting of CPU reset handler
  ARM: tegra: set CPU reset handler with firmware op

 Documentation/devicetree/bindings/arm/tegra.txt    | 11 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/configs/tegra_defconfig                   |  1 +
 arch/arm/mach-tegra/Kconfig                        | 14 ++++++
 arch/arm/mach-tegra/Makefile                       |  3 ++
 arch/arm/mach-tegra/common.c                       |  2 +
 arch/arm/mach-tegra/firmware.c                     | 40 +++++++++++++++++
 arch/arm/mach-tegra/firmware.h                     | 19 ++++++++
 arch/arm/mach-tegra/reset.c                        | 40 ++++++++++++-----
 arch/arm/mach-tegra/trusted_foundations.c          | 51 ++++++++++++++++++++++
 10 files changed, 171 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/mach-tegra/firmware.c
 create mode 100644 arch/arm/mach-tegra/firmware.h
 create mode 100644 arch/arm/mach-tegra/trusted_foundations.c

-- 
1.8.3

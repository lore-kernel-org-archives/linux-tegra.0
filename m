From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 0/2] ARM: Tegra: Device Tree: Audio
Date: Fri, 27 May 2011 13:56:58 -0700
Message-ID: <20110527205444.21000.90209.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch series is continuing work to get board specific devices initialized
from device tree nodes rather than using the current static platform_device
registration.

This patch series is for comments only. It is not intended to be submitted as a
patch at this time. I am looking for comments on the overall approach.

This series is based upon an earlier RFC series I submitted around May 11th
beginning with, "[RFC 0/3] ARM: Tegra: Device Tree: i2c & wm8903".
I haven't yet addressed the replies to that earlier series, but I intend to.

I am also aware that some of these files have changed since I've started on
this work. I haven't yet rebased to the latest.

---

John Bonesio (2):
      ARM:Tegra: Device Tree Support: Initialize the audio card from the device tree.
      ARM:Tegra: Device Tree Support: Initialize audio card gpio's from the device tree.


 arch/arm/boot/dts/tegra-harmony.dts |   10 ++++++++
 arch/arm/mach-tegra/board-dt.c      |    3 ++
 sound/soc/codecs/wm8903.c           |    5 ++++
 sound/soc/tegra/harmony.c           |   46 ++++++++++++++++++++++++++++++++---
 4 files changed, 60 insertions(+), 4 deletions(-)

-- 
- John

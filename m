From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v11 0/5] NVIDIA ARM SMMU Implementation
Date: Sat, 18 Jul 2020 12:34:52 -0700
Message-ID: <20200718193457.30046-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Changes in v11:
Addressed Rob comment on DT binding patch to set min/maxItems of reg proper=
ty in else part.
Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/will/linu=
x.git/log/?h=3Dfor-joerg/arm-smmu/updates.

Changes in v10:
Perform SMMU base ioremap before calling implementation init.
Check for Global faults across both ARM MMU-500s during global interrupt.
Check for context faults across all contexts of both ARM MMU-500s during co=
ntext fault interrupt.
Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
https://lkml.org/lkml/2020/7/8/57

v9 - https://lkml.org/lkml/2020/6/30/1282
v8 - https://lkml.org/lkml/2020/6/29/2385
v7 - https://lkml.org/lkml/2020/6/28/347
v6 - https://lkml.org/lkml/2020/6/4/1018
v5 - https://lkml.org/lkml/2020/5/21/1114
v4 - https://lkml.org/lkml/2019/10/30/1054
v3 - https://lkml.org/lkml/2019/10/18/1601
v2 - https://lkml.org/lkml/2019/9/2/980
v1 - https://lkml.org/lkml/2019/8/29/1588


Krishna Reddy (5):
  iommu/arm-smmu: move TLB timeout and spin count macros
  iommu/arm-smmu: ioremap smmu mmio region before implementation init
  iommu/arm-smmu: add NVIDIA implementation for ARM MMU-500 usage
  dt-bindings: arm-smmu: add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  25 +-
 MAINTAINERS                                   |   2 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm-smmu-impl.c                 |   3 +
 drivers/iommu/arm-smmu-nvidia.c               | 278 ++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  29 +-
 drivers/iommu/arm-smmu.h                      |   6 +
 7 files changed, 334 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c


base-commit: 49fbb25030265c660de732513f18275d88ff99d3
--=20
2.26.2

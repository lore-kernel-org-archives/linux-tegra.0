From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [TEGRA194_CPUFREQ PATCH v6 0/3] Add cpufreq driver for Tegra194
Date: Wed, 15 Jul 2020 19:01:22 +0530
Message-ID: <1594819885-31016-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Viresh & Rob,

Have made the changes as per feedback.
Please review/ack and consider this patch set for merging in 5.9.

Thank you,
Sumit
---

The patch series adds cpufreq driver for Tegra194 SOC.

v5[5] -> v6
- Add new schema file for 'nvidia,tegra194-ccplex'[Rob].
- Minor changes suggested in cpufreq driver[Viresh].

v4[4] -> v5
- Don't call destroy_workqueue() if alloc_workqueue() fails[Viresh]
- Move CONFIG_ARM_TEGRA194_CPUFREQ enabling to soc/tegra/Kconfig[Viresh]
- Add dependency of 'nvidia,bpmp' on 'compatible' in yaml file[Michal]
- Fix typo in description causing dt_binding_check bot failure[Rob]

v3[3] -> v4
- Open code LOOP_FOR_EACH_CPU_OF_CLUSTER macro[Viresh]
- Delete unused funciton map_freq_to_ndiv[Viresh, kernel test bot]
- Remove flush_workqueue from free_resources[Viresh]

v2[2] -> v3
- Set same policy for all cpus in a cluster[Viresh].
- Add compatible string for CPU Complex under cpus node[Thierry].
- Add reference to bpmp node under cpus node[Thierry].
- Bind cpufreq driver to CPU Complex compatible string[Thierry].
- Remove patch to get bpmp data as now using cpus node to get that[Thierry].

v1[1] -> v2:
- Remove cpufreq_lock mutex from tegra194_cpufreq_set_target [Viresh].
- Remove CPUFREQ_ASYNC_NOTIFICATION flag [Viresh].
- Remove redundant _begin|end() call from tegra194_cpufreq_set_target.
- Rename opp_table to freq_table [Viresh].


Sumit Gupta (3):
  dt-bindings: arm: Add NVIDIA Tegra194 CPU Complex binding
  arm64: tegra: Add t194 ccplex compatible and bpmp property
  cpufreq: Add Tegra194 cpufreq driver

 .../bindings/arm/nvidia,tegra194-ccplex.yaml       |  69 ++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   2 +
 drivers/cpufreq/Kconfig.arm                        |   7 +
 drivers/cpufreq/Makefile                           |   1 +
 drivers/cpufreq/tegra194-cpufreq.c                 | 397 +++++++++++++++++++++
 5 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
 create mode 100644 drivers/cpufreq/tegra194-cpufreq.c

[1] https://marc.info/?t=157539452300001&r=1&w=2
[2] https://marc.info/?l=linux-tegra&m=158602857106213&w=2
[3] https://marc.info/?l=linux-pm&m=159283376010084&w=2
[4] https://marc.info/?l=linux-tegra&m=159318640622917&w=2
[5] https://marc.info/?l=linux-tegra&m=159465409805593&w=2 
-- 
2.7.4

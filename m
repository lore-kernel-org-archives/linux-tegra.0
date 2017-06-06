From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] firmware: tegra: Add VIC firmware
Date: Tue, 6 Jun 2017 14:50:38 +0300
Message-ID: <1496749838-26674-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iguadarrama-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add firmware files for the VIC falcon controller for Tegra124,
Tegra210 and Tegra186.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 WHENCE                          |  10 ++++++++++
 nvidia/tegra124/vic03_ucode.bin | Bin 0 -> 16128 bytes
 nvidia/tegra186/vic04_ucode.bin | Bin 0 -> 19200 bytes
 nvidia/tegra210/vic04_ucode.bin | Bin 0 -> 16640 bytes
 4 files changed, 10 insertions(+)
 create mode 100644 nvidia/tegra124/vic03_ucode.bin
 create mode 100644 nvidia/tegra186/vic04_ucode.bin
 create mode 100644 nvidia/tegra210/vic04_ucode.bin

diff --git a/WHENCE b/WHENCE
index 2d17e2ecaa88..45d212b76060 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3586,3 +3586,13 @@ File: wil6210.brd
 Version: 4.1.0.55
 
 Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+
+--------------------------------------------------------------------------
+
+Driver: tegra-vic -- NVIDIA Tegra VIC driver
+
+File: nvidia/tegra124/vic03_ucode.bin
+File: nvidia/tegra210/vic04_ucode.bin
+File: nvidia/tegra186/vic04_ucode.bin
+
+Licence: Redistributable. See LICENCE.nvidia for details
diff --git a/nvidia/tegra124/vic03_ucode.bin b/nvidia/tegra124/vic03_ucode.bin
new file mode 100644
index 0000000000000000000000000000000000000000..bccefbdac85aa4a4a346eafec067302218b9a76a
GIT binary patch
literal 16128
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
Y@&{I`Y{<Pv$9Ayl<_n+l|H*#;2~={v{Qv*}

literal 0
HcmV?d00001

diff --git a/nvidia/tegra186/vic04_ucode.bin b/nvidia/tegra186/vic04_ucode.bin
new file mode 100644
index 0000000000000000000000000000000000000000..b56957e8d5e70d2a1b5395b87e6371ac6744f38e
GIT binary patch
literal 19200
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
M=8IR?U&z1z1tKZ$z5oCK

literal 0
HcmV?d00001

diff --git a/nvidia/tegra210/vic04_ucode.bin b/nvidia/tegra210/vic04_ucode.bin
new file mode 100644
index 0000000000000000000000000000000000000000..3bb804228e699c056467c6d85791dae0d998a0e9
GIT binary patch
literal 16640
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
Jw~o*C`#*VI<~RTV

literal 0
HcmV?d00001

-- 
2.1.4

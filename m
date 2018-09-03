From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] usb: xhci: tegra: Firmware header is little endian
Date: Mon,  3 Sep 2018 12:18:08 +0200
Message-ID: <20180903101808.31559-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The XUSB firmware header is in little endian byte order, so make the
fields __le32 and __le16 instead of u32 and u16 to avoid warnings from
sparse when the fields are used with the endian-aware __le32_to_cpu()
and __le16_to_cpu() accessors, respectively.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 4b463e5202a4..4ee510a51d64 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -107,35 +107,35 @@
 #define IMEM_BLOCK_SIZE				256
 
 struct tegra_xusb_fw_header {
-	u32 boot_loadaddr_in_imem;
-	u32 boot_codedfi_offset;
-	u32 boot_codetag;
-	u32 boot_codesize;
-	u32 phys_memaddr;
-	u16 reqphys_memsize;
-	u16 alloc_phys_memsize;
-	u32 rodata_img_offset;
-	u32 rodata_section_start;
-	u32 rodata_section_end;
-	u32 main_fnaddr;
-	u32 fwimg_cksum;
-	u32 fwimg_created_time;
-	u32 imem_resident_start;
-	u32 imem_resident_end;
-	u32 idirect_start;
-	u32 idirect_end;
-	u32 l2_imem_start;
-	u32 l2_imem_end;
-	u32 version_id;
+	__le32 boot_loadaddr_in_imem;
+	__le32 boot_codedfi_offset;
+	__le32 boot_codetag;
+	__le32 boot_codesize;
+	__le32 phys_memaddr;
+	__le16 reqphys_memsize;
+	__le16 alloc_phys_memsize;
+	__le32 rodata_img_offset;
+	__le32 rodata_section_start;
+	__le32 rodata_section_end;
+	__le32 main_fnaddr;
+	__le32 fwimg_cksum;
+	__le32 fwimg_created_time;
+	__le32 imem_resident_start;
+	__le32 imem_resident_end;
+	__le32 idirect_start;
+	__le32 idirect_end;
+	__le32 l2_imem_start;
+	__le32 l2_imem_end;
+	__le32 version_id;
 	u8 init_ddirect;
 	u8 reserved[3];
-	u32 phys_addr_log_buffer;
-	u32 total_log_entries;
-	u32 dequeue_ptr;
-	u32 dummy_var[2];
-	u32 fwimg_len;
+	__le32 phys_addr_log_buffer;
+	__le32 total_log_entries;
+	__le32 dequeue_ptr;
+	__le32 dummy_var[2];
+	__le32 fwimg_len;
 	u8 magic[8];
-	u32 ss_low_power_entry_timeout;
+	__le32 ss_low_power_entry_timeout;
 	u8 num_hsic_port;
 	u8 padding[139]; /* Pad to 256 bytes */
 };
-- 
2.18.0

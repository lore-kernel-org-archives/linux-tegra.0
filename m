From: =?UTF-8?q?Arto=20Meril=C3=A4inen?= <amerilainen@nvidia.com>
Subject: [RFC,libdrm 2/3] tegra: Add 2d library
Date: Thu, 13 Dec 2012 16:01:07 +0200
Message-ID: <1355407268-32381-3-git-send-email-amerilainen@nvidia.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: thierry.reding@avionic-design.de, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: fhart@nvidia.com, tbergstrom@nvidia.com
List-Id: linux-tegra@vger.kernel.org

From: Francis Hart <fhart@nvidia.com>

This patch introduces a simple 2d library on top of stream library.

Signed-off-by: Francis Hart <fhart@nvidia.com>
---
 tegra/2d/hw_gr2d.h           | 2614 ++++++++++++++++++++++++++++++++++++++++++
 tegra/2d/tegra_2d_api.c      |  235 ++++
 tegra/2d/tegra_2d_color.c    |  412 +++++++
 tegra/2d/tegra_2d_color.h    |   51 +
 tegra/2d/tegra_2d_context.c  |  140 +++
 tegra/2d/tegra_2d_context.h  |   67 ++
 tegra/2d/tegra_2d_copy.c     |  209 ++++
 tegra/2d/tegra_2d_copy.h     |   38 +
 tegra/2d/tegra_2d_fill.c     |  136 +++
 tegra/2d/tegra_2d_fill.h     |   36 +
 tegra/2d/tegra_2d_frcopy.c   |  274 +++++
 tegra/2d/tegra_2d_frcopy.h   |   85 ++
 tegra/2d/tegra_2d_g2copy.c   |  272 +++++
 tegra/2d/tegra_2d_g2copy.h   |   88 ++
 tegra/2d/tegra_2d_g2fill.c   |  192 ++++
 tegra/2d/tegra_2d_g2fill.h   |   80 ++
 tegra/2d/tegra_2d_reg_g2sb.h |   89 ++
 tegra/2d/tegra_2d_reg_host.h |  119 ++
 tegra/2d/tegra_2d_sbcopy.c   |  388 +++++++
 tegra/2d/tegra_2d_sbcopy.h   |   94 ++
 tegra/2d/tegra_2d_surface.c  |  280 +++++
 tegra/2d/tegra_2d_surface.h  |   57 +
 tegra/2d/tegra_2d_util.c     |  145 +++
 tegra/2d/tegra_2d_util.h     |   89 ++
 tegra/Makefile.am            |   13 +-
 tegra/tegra_2d.h             |  223 ++++
 26 files changed, 6425 insertions(+), 1 deletion(-)
 create mode 100644 tegra/2d/hw_gr2d.h
 create mode 100644 tegra/2d/tegra_2d_api.c
 create mode 100644 tegra/2d/tegra_2d_color.c
 create mode 100644 tegra/2d/tegra_2d_color.h
 create mode 100644 tegra/2d/tegra_2d_context.c
 create mode 100644 tegra/2d/tegra_2d_context.h
 create mode 100644 tegra/2d/tegra_2d_copy.c
 create mode 100644 tegra/2d/tegra_2d_copy.h
 create mode 100644 tegra/2d/tegra_2d_fill.c
 create mode 100644 tegra/2d/tegra_2d_fill.h
 create mode 100644 tegra/2d/tegra_2d_frcopy.c
 create mode 100644 tegra/2d/tegra_2d_frcopy.h
 create mode 100644 tegra/2d/tegra_2d_g2copy.c
 create mode 100644 tegra/2d/tegra_2d_g2copy.h
 create mode 100644 tegra/2d/tegra_2d_g2fill.c
 create mode 100644 tegra/2d/tegra_2d_g2fill.h
 create mode 100644 tegra/2d/tegra_2d_reg_g2sb.h
 create mode 100644 tegra/2d/tegra_2d_reg_host.h
 create mode 100644 tegra/2d/tegra_2d_sbcopy.c
 create mode 100644 tegra/2d/tegra_2d_sbcopy.h
 create mode 100644 tegra/2d/tegra_2d_surface.c
 create mode 100644 tegra/2d/tegra_2d_surface.h
 create mode 100644 tegra/2d/tegra_2d_util.c
 create mode 100644 tegra/2d/tegra_2d_util.h
 create mode 100644 tegra/tegra_2d.h

diff --git a/tegra/2d/hw_gr2d.h b/tegra/2d/hw_gr2d.h
new file mode 100644
index 0000000..4c48feb
--- /dev/null
+++ b/tegra/2d/hw_gr2d.h
@@ -0,0 +1,2614 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(uint32_t v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(uint32_t r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef __hw_gr2d_h__
+#define __hw_gr2d_h__
+
+static inline uint32_t gr2d_trigger_r(void)
+{
+	return 0x9;
+}
+static inline uint32_t gr2d_trigger_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_trigger_trigger_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_trigger_trigger_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_trigger_trigger_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_trigger_trigger_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_cmdsel_r(void)
+{
+	return 0xc;
+}
+static inline uint32_t gr2d_cmdsel_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_f(uint32_t v)
+{
+	return (v & 0x1) << 0;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_m(void)
+{
+	return 0x1 << 0;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_v(uint32_t r)
+{
+	return (r >> 0) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_g2_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_cmdsel_sbor2d_sb_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_f(uint32_t v)
+{
+	return (v & 0x1) << 4;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_m(void)
+{
+	return 0x1 << 4;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_v(uint32_t r)
+{
+	return (r >> 4) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_cmdsel_cbenable_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_vitrigger_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_vitrigger_f(uint32_t v)
+{
+	return (v & 0x1) << 5;
+}
+static inline uint32_t gr2d_cmdsel_vitrigger_m(void)
+{
+	return 0x1 << 5;
+}
+static inline uint32_t gr2d_cmdsel_vitrigger_v(uint32_t r)
+{
+	return (r >> 5) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_hosttrigger_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_hosttrigger_f(uint32_t v)
+{
+	return (v & 0x1) << 6;
+}
+static inline uint32_t gr2d_cmdsel_hosttrigger_m(void)
+{
+	return 0x1 << 6;
+}
+static inline uint32_t gr2d_cmdsel_hosttrigger_v(uint32_t r)
+{
+	return (r >> 6) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_cbsbdisable_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_cbsbdisable_f(uint32_t v)
+{
+	return (v & 0x1) << 7;
+}
+static inline uint32_t gr2d_cmdsel_cbsbdisable_m(void)
+{
+	return 0x1 << 7;
+}
+static inline uint32_t gr2d_cmdsel_cbsbdisable_v(uint32_t r)
+{
+	return (r >> 7) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_g2output_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_cmdsel_g2output_f(uint32_t v)
+{
+	return (v & 0x3) << 8;
+}
+static inline uint32_t gr2d_cmdsel_g2output_m(void)
+{
+	return 0x3 << 8;
+}
+static inline uint32_t gr2d_cmdsel_g2output_v(uint32_t r)
+{
+	return (r >> 8) & 0x3;
+}
+static inline uint32_t gr2d_cmdsel_g2output_memory_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_cmdsel_g2output_epp_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_g2output_reserved2_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_cmdsel_g2output_reserved3_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_f(uint32_t v)
+{
+	return (v & 0x1) << 10;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_m(void)
+{
+	return 0x1 << 10;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_v(uint32_t r)
+{
+	return (r >> 10) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_cmdsel_clip_source_top_bottom_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_frame_start_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_frame_start_f(uint32_t v)
+{
+	return (v & 0x1) << 14;
+}
+static inline uint32_t gr2d_cmdsel_frame_start_m(void)
+{
+	return 0x1 << 14;
+}
+static inline uint32_t gr2d_cmdsel_frame_start_v(uint32_t r)
+{
+	return (r >> 14) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_frame_end_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_frame_end_f(uint32_t v)
+{
+	return (v & 0x1) << 15;
+}
+static inline uint32_t gr2d_cmdsel_frame_end_m(void)
+{
+	return 0x1 << 15;
+}
+static inline uint32_t gr2d_cmdsel_frame_end_v(uint32_t r)
+{
+	return (r >> 15) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_buffer_index_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_cmdsel_buffer_index_f(uint32_t v)
+{
+	return (v & 0xff) << 16;
+}
+static inline uint32_t gr2d_cmdsel_buffer_index_m(void)
+{
+	return 0xff << 16;
+}
+static inline uint32_t gr2d_cmdsel_buffer_index_v(uint32_t r)
+{
+	return (r >> 16) & 0xff;
+}
+static inline uint32_t gr2d_cmdsel_linken_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_linken_f(uint32_t v)
+{
+	return (v & 0x1) << 24;
+}
+static inline uint32_t gr2d_cmdsel_linken_m(void)
+{
+	return 0x1 << 24;
+}
+static inline uint32_t gr2d_cmdsel_linken_v(uint32_t r)
+{
+	return (r >> 24) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_linkval_s(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_cmdsel_linkval_f(uint32_t v)
+{
+	return (v & 0x7) << 25;
+}
+static inline uint32_t gr2d_cmdsel_linkval_m(void)
+{
+	return 0x7 << 25;
+}
+static inline uint32_t gr2d_cmdsel_linkval_v(uint32_t r)
+{
+	return (r >> 25) & 0x7;
+}
+static inline uint32_t gr2d_cmdsel_priority_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_cmdsel_priority_f(uint32_t v)
+{
+	return (v & 0x1) << 28;
+}
+static inline uint32_t gr2d_cmdsel_priority_m(void)
+{
+	return 0x1 << 28;
+}
+static inline uint32_t gr2d_cmdsel_priority_v(uint32_t r)
+{
+	return (r >> 28) & 0x1;
+}
+static inline uint32_t gr2d_cmdsel_priority_low_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_cmdsel_priority_high_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_vdda_r(void)
+{
+	return 0x11;
+}
+static inline uint32_t gr2d_vdda_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_vdda_vdstep_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_vdda_vdstep_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_vdda_vdstep_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_vdda_vdstep_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_vddaini_r(void)
+{
+	return 0x12;
+}
+static inline uint32_t gr2d_vddaini_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_vddaini_vdtini_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_vddaini_vdtini_f(uint32_t v)
+{
+	return (v & 0xff) << 0;
+}
+static inline uint32_t gr2d_vddaini_vdtini_m(void)
+{
+	return 0xff << 0;
+}
+static inline uint32_t gr2d_vddaini_vdtini_v(uint32_t r)
+{
+	return (r >> 0) & 0xff;
+}
+static inline uint32_t gr2d_vddaini_vdbini_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_vddaini_vdbini_f(uint32_t v)
+{
+	return (v & 0xff) << 8;
+}
+static inline uint32_t gr2d_vddaini_vdbini_m(void)
+{
+	return 0xff << 8;
+}
+static inline uint32_t gr2d_vddaini_vdbini_v(uint32_t r)
+{
+	return (r >> 8) & 0xff;
+}
+static inline uint32_t gr2d_hdda_r(void)
+{
+	return 0x13;
+}
+static inline uint32_t gr2d_hdda_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_hdda_hdstep_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_hdda_hdstep_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_hdda_hdstep_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_hdda_hdstep_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_hddainils_r(void)
+{
+	return 0x14;
+}
+static inline uint32_t gr2d_hddainils_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_hddainils_hdini_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_hddainils_hdini_f(uint32_t v)
+{
+	return (v & 0xff) << 0;
+}
+static inline uint32_t gr2d_hddainils_hdini_m(void)
+{
+	return 0xff << 0;
+}
+static inline uint32_t gr2d_hddainils_hdini_v(uint32_t r)
+{
+	return (r >> 0) & 0xff;
+}
+static inline uint32_t gr2d_cscfirst_r(void)
+{
+	return 0x15;
+}
+static inline uint32_t gr2d_cscfirst_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_cscfirst_cub_s(void)
+{
+	return 10;
+}
+static inline uint32_t gr2d_cscfirst_cub_f(uint32_t v)
+{
+	return (v & 0x3ff) << 0;
+}
+static inline uint32_t gr2d_cscfirst_cub_m(void)
+{
+	return 0x3ff << 0;
+}
+static inline uint32_t gr2d_cscfirst_cub_v(uint32_t r)
+{
+	return (r >> 0) & 0x3ff;
+}
+static inline uint32_t gr2d_cscfirst_cvr_s(void)
+{
+	return 10;
+}
+static inline uint32_t gr2d_cscfirst_cvr_f(uint32_t v)
+{
+	return (v & 0x3ff) << 12;
+}
+static inline uint32_t gr2d_cscfirst_cvr_m(void)
+{
+	return 0x3ff << 12;
+}
+static inline uint32_t gr2d_cscfirst_cvr_v(uint32_t r)
+{
+	return (r >> 12) & 0x3ff;
+}
+static inline uint32_t gr2d_cscfirst_yos_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_cscfirst_yos_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t gr2d_cscfirst_yos_m(void)
+{
+	return 0xff << 24;
+}
+static inline uint32_t gr2d_cscfirst_yos_v(uint32_t r)
+{
+	return (r >> 24) & 0xff;
+}
+static inline uint32_t gr2d_cscsecond_r(void)
+{
+	return 0x16;
+}
+static inline uint32_t gr2d_cscsecond_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_cscsecond_cug_s(void)
+{
+	return 9;
+}
+static inline uint32_t gr2d_cscsecond_cug_f(uint32_t v)
+{
+	return (v & 0x1ff) << 0;
+}
+static inline uint32_t gr2d_cscsecond_cug_m(void)
+{
+	return 0x1ff << 0;
+}
+static inline uint32_t gr2d_cscsecond_cug_v(uint32_t r)
+{
+	return (r >> 0) & 0x1ff;
+}
+static inline uint32_t gr2d_cscsecond_cur_s(void)
+{
+	return 10;
+}
+static inline uint32_t gr2d_cscsecond_cur_f(uint32_t v)
+{
+	return (v & 0x3ff) << 12;
+}
+static inline uint32_t gr2d_cscsecond_cur_m(void)
+{
+	return 0x3ff << 12;
+}
+static inline uint32_t gr2d_cscsecond_cur_v(uint32_t r)
+{
+	return (r >> 12) & 0x3ff;
+}
+static inline uint32_t gr2d_cscsecond_cyx_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_cscsecond_cyx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t gr2d_cscsecond_cyx_m(void)
+{
+	return 0xff << 24;
+}
+static inline uint32_t gr2d_cscsecond_cyx_v(uint32_t r)
+{
+	return (r >> 24) & 0xff;
+}
+static inline uint32_t gr2d_cscthird_r(void)
+{
+	return 0x17;
+}
+static inline uint32_t gr2d_cscthird_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_cscthird_cvg_s(void)
+{
+	return 9;
+}
+static inline uint32_t gr2d_cscthird_cvg_f(uint32_t v)
+{
+	return (v & 0x1ff) << 0;
+}
+static inline uint32_t gr2d_cscthird_cvg_m(void)
+{
+	return 0x1ff << 0;
+}
+static inline uint32_t gr2d_cscthird_cvg_v(uint32_t r)
+{
+	return (r >> 0) & 0x1ff;
+}
+static inline uint32_t gr2d_cscthird_cvb_s(void)
+{
+	return 10;
+}
+static inline uint32_t gr2d_cscthird_cvb_f(uint32_t v)
+{
+	return (v & 0x3ff) << 16;
+}
+static inline uint32_t gr2d_cscthird_cvb_m(void)
+{
+	return 0x3ff << 16;
+}
+static inline uint32_t gr2d_cscthird_cvb_v(uint32_t r)
+{
+	return (r >> 16) & 0x3ff;
+}
+static inline uint32_t gr2d_uba_r(void)
+{
+	return 0x1a;
+}
+static inline uint32_t gr2d_uba_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_uba_su1sa_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_uba_su1sa_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_uba_su1sa_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_uba_su1sa_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_vba_r(void)
+{
+	return 0x1b;
+}
+static inline uint32_t gr2d_vba_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_vba_sv1sa_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_vba_sv1sa_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_vba_sv1sa_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_vba_sv1sa_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_sbformat_r(void)
+{
+	return 0x1c;
+}
+static inline uint32_t gr2d_sbformat_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_sbformat_sifmt_s(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_sbformat_sifmt_f(uint32_t v)
+{
+	return (v & 0x1f) << 0;
+}
+static inline uint32_t gr2d_sbformat_sifmt_m(void)
+{
+	return 0x1f << 0;
+}
+static inline uint32_t gr2d_sbformat_sifmt_v(uint32_t r)
+{
+	return (r >> 0) & 0x1f;
+}
+static inline uint32_t gr2d_sbformat_sifmt_u8y8v8y8_ob_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_sbformat_sifmt_y8u8y8v8_ob_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_sbformat_sifmt_y8v8y8u8_ob_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_sbformat_sifmt_v8y8u8y8_ob_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_sbformat_sifmt_u8y8v8y8_tc_v(void)
+{
+	return 4;
+}
+static inline uint32_t gr2d_sbformat_sifmt_y8u8y8v8_tc_v(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_sbformat_sifmt_y8v8y8u8_tc_v(void)
+{
+	return 6;
+}
+static inline uint32_t gr2d_sbformat_sifmt_v8y8u8y8_tc_v(void)
+{
+	return 7;
+}
+static inline uint32_t gr2d_sbformat_sifmt_b5g6r5_v(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_sbformat_sifmt_b5g6r5bs_v(void)
+{
+	return 12;
+}
+static inline uint32_t gr2d_sbformat_sifmt_r8g8b8a8_v(void)
+{
+	return 14;
+}
+static inline uint32_t gr2d_sbformat_sifmt_b8g8r8a8_v(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_sbformat_difmt_s(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_sbformat_difmt_f(uint32_t v)
+{
+	return (v & 0x1f) << 8;
+}
+static inline uint32_t gr2d_sbformat_difmt_m(void)
+{
+	return 0x1f << 8;
+}
+static inline uint32_t gr2d_sbformat_difmt_v(uint32_t r)
+{
+	return (r >> 8) & 0x1f;
+}
+static inline uint32_t gr2d_sbformat_difmt_u8y8v8y8_ob_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_sbformat_difmt_y8u8y8v8_ob_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_sbformat_difmt_y8v8y8u8_ob_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_sbformat_difmt_v8y8u8y8_ob_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_sbformat_difmt_u8y8v8y8_tc_v(void)
+{
+	return 4;
+}
+static inline uint32_t gr2d_sbformat_difmt_y8u8y8v8_tc_v(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_sbformat_difmt_y8v8y8u8_tc_v(void)
+{
+	return 6;
+}
+static inline uint32_t gr2d_sbformat_difmt_v8y8u8y8_tc_v(void)
+{
+	return 7;
+}
+static inline uint32_t gr2d_sbformat_difmt_b5g6r5_v(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_sbformat_difmt_b5g6r5bs_v(void)
+{
+	return 12;
+}
+static inline uint32_t gr2d_sbformat_difmt_r8g8b8a8_v(void)
+{
+	return 14;
+}
+static inline uint32_t gr2d_sbformat_difmt_b8g8r8a8_v(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_controlsb_r(void)
+{
+	return 0x1d;
+}
+static inline uint32_t gr2d_controlsb_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_controlsb_imode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_imode_f(uint32_t v)
+{
+	return (v & 0x1) << 5;
+}
+static inline uint32_t gr2d_controlsb_imode_m(void)
+{
+	return 0x1 << 5;
+}
+static inline uint32_t gr2d_controlsb_imode_v(uint32_t r)
+{
+	return (r >> 5) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_imode_multiplex_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_imode_planar_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_enavf_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_enavf_f(uint32_t v)
+{
+	return (v & 0x1) << 6;
+}
+static inline uint32_t gr2d_controlsb_enavf_m(void)
+{
+	return 0x1 << 6;
+}
+static inline uint32_t gr2d_controlsb_enavf_v(uint32_t r)
+{
+	return (r >> 6) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_enavf_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_enavf_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_enahf_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_enahf_f(uint32_t v)
+{
+	return (v & 0x1) << 7;
+}
+static inline uint32_t gr2d_controlsb_enahf_m(void)
+{
+	return 0x1 << 7;
+}
+static inline uint32_t gr2d_controlsb_enahf_v(uint32_t r)
+{
+	return (r >> 7) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_enahf_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_enahf_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_uvst_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsb_uvst_f(uint32_t v)
+{
+	return (v & 0x3) << 8;
+}
+static inline uint32_t gr2d_controlsb_uvst_m(void)
+{
+	return 0x3 << 8;
+}
+static inline uint32_t gr2d_controlsb_uvst_v(uint32_t r)
+{
+	return (r >> 8) & 0x3;
+}
+static inline uint32_t gr2d_controlsb_uvst_uvs2x_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_uvst_uvs1x_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_uvst_uvs4x_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsb_uvst_uvs_g2uvstride_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsb_vftype_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsb_vftype_f(uint32_t v)
+{
+	return (v & 0x3) << 16;
+}
+static inline uint32_t gr2d_controlsb_vftype_m(void)
+{
+	return 0x3 << 16;
+}
+static inline uint32_t gr2d_controlsb_vftype_v(uint32_t r)
+{
+	return (r >> 16) & 0x3;
+}
+static inline uint32_t gr2d_controlsb_vftype_interp_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_vftype_avg25_interp75_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_vftype_avg50_interp50_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsb_vftype_avg_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsb_vfen_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_vfen_f(uint32_t v)
+{
+	return (v & 0x1) << 18;
+}
+static inline uint32_t gr2d_controlsb_vfen_m(void)
+{
+	return 0x1 << 18;
+}
+static inline uint32_t gr2d_controlsb_vfen_v(uint32_t r)
+{
+	return (r >> 18) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_vfen_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_vfen_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_discsc_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_discsc_f(uint32_t v)
+{
+	return (v & 0x1) << 19;
+}
+static inline uint32_t gr2d_controlsb_discsc_m(void)
+{
+	return 0x1 << 19;
+}
+static inline uint32_t gr2d_controlsb_discsc_v(uint32_t r)
+{
+	return (r >> 19) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_discsc_enable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_discsc_disable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_hftype_s(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsb_hftype_f(uint32_t v)
+{
+	return (v & 0x7) << 20;
+}
+static inline uint32_t gr2d_controlsb_hftype_m(void)
+{
+	return 0x7 << 20;
+}
+static inline uint32_t gr2d_controlsb_hftype_v(uint32_t r)
+{
+	return (r >> 20) & 0x7;
+}
+static inline uint32_t gr2d_controlsb_hftype_interp_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf1_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf2_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf3_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf4_v(void)
+{
+	return 4;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf5_v(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_controlsb_hftype_lpf6_v(void)
+{
+	return 6;
+}
+static inline uint32_t gr2d_controlsb_hftype_disable_v(void)
+{
+	return 7;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_f(uint32_t v)
+{
+	return (v & 0x1) << 23;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_m(void)
+{
+	return 0x1 << 23;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_v(uint32_t r)
+{
+	return (r >> 23) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_rangeredfrm_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_sitype_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_sitype_f(uint32_t v)
+{
+	return (v & 0x1) << 24;
+}
+static inline uint32_t gr2d_controlsb_sitype_m(void)
+{
+	return 0x1 << 24;
+}
+static inline uint32_t gr2d_controlsb_sitype_v(uint32_t r)
+{
+	return (r >> 24) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_sbsel_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_sbsel_f(uint32_t v)
+{
+	return (v & 0x1) << 25;
+}
+static inline uint32_t gr2d_controlsb_sbsel_m(void)
+{
+	return 0x1 << 25;
+}
+static inline uint32_t gr2d_controlsb_sbsel_v(uint32_t r)
+{
+	return (r >> 25) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_sbsel_src_a_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_sbsel_src_b_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_dbsel_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_dbsel_f(uint32_t v)
+{
+	return (v & 0x1) << 26;
+}
+static inline uint32_t gr2d_controlsb_dbsel_m(void)
+{
+	return 0x1 << 26;
+}
+static inline uint32_t gr2d_controlsb_dbsel_v(uint32_t r)
+{
+	return (r >> 26) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_dbsel_dst_a_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_dbsel_dst_b_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_keyen_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_keyen_f(uint32_t v)
+{
+	return (v & 0x1) << 27;
+}
+static inline uint32_t gr2d_controlsb_keyen_m(void)
+{
+	return 0x1 << 27;
+}
+static inline uint32_t gr2d_controlsb_keyen_v(uint32_t r)
+{
+	return (r >> 27) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_keyen_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_keyen_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_kpol_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_kpol_f(uint32_t v)
+{
+	return (v & 0x1) << 28;
+}
+static inline uint32_t gr2d_controlsb_kpol_m(void)
+{
+	return 0x1 << 28;
+}
+static inline uint32_t gr2d_controlsb_kpol_v(uint32_t r)
+{
+	return (r >> 28) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_kpol_within_bounds_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_kpol_outside_bounds_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_endith_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsb_endith_f(uint32_t v)
+{
+	return (v & 0x1) << 30;
+}
+static inline uint32_t gr2d_controlsb_endith_m(void)
+{
+	return 0x1 << 30;
+}
+static inline uint32_t gr2d_controlsb_endith_v(uint32_t r)
+{
+	return (r >> 30) & 0x1;
+}
+static inline uint32_t gr2d_controlsb_endith_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsb_endith_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_r(void)
+{
+	return 0x1e;
+}
+static inline uint32_t gr2d_controlsecond_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_f(uint32_t v)
+{
+	return (v & 0x1) << 1;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_m(void)
+{
+	return 0x1 << 1;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_v(uint32_t r)
+{
+	return (r >> 1) & 0x1;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_bitswap_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_f(uint32_t v)
+{
+	return (v & 0x1) << 2;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_m(void)
+{
+	return 0x1 << 2;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_v(uint32_t r)
+{
+	return (r >> 2) & 0x1;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_bebswap_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_f(uint32_t v)
+{
+	return (v & 0x1) << 3;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_m(void)
+{
+	return 0x1 << 3;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_v(uint32_t r)
+{
+	return (r >> 3) & 0x1;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_bewswap_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_alptype_s(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_controlsecond_alptype_f(uint32_t v)
+{
+	return (v & 0x1f) << 4;
+}
+static inline uint32_t gr2d_controlsecond_alptype_m(void)
+{
+	return 0x1f << 4;
+}
+static inline uint32_t gr2d_controlsecond_alptype_v(uint32_t r)
+{
+	return (r >> 4) & 0x1f;
+}
+static inline uint32_t gr2d_controlsecond_alptype_fix_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pl1bpp_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pl2bpp_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pl4bpp_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pl8bpp_v(void)
+{
+	return 4;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pl44bpp_v(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls1bpp_v(void)
+{
+	return 6;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls4bppal_v(void)
+{
+	return 7;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls4bpp_v(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls8bpp_v(void)
+{
+	return 9;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls8bx_v(void)
+{
+	return 10;
+}
+static inline uint32_t gr2d_controlsecond_alptype_pls1bppal_v(void)
+{
+	return 11;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_f(uint32_t v)
+{
+	return (v & 0x1) << 9;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_m(void)
+{
+	return 0x1 << 9;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_v(uint32_t r)
+{
+	return (r >> 9) & 0x1;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_alpsrcordst_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_clipc_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsecond_clipc_f(uint32_t v)
+{
+	return (v & 0x3) << 21;
+}
+static inline uint32_t gr2d_controlsecond_clipc_m(void)
+{
+	return 0x3 << 21;
+}
+static inline uint32_t gr2d_controlsecond_clipc_v(uint32_t r)
+{
+	return (r >> 21) & 0x3;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_f(uint32_t v)
+{
+	return (v & 0x3) << 24;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_m(void)
+{
+	return 0x3 << 24;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_v(uint32_t r)
+{
+	return (r >> 24) & 0x3;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_src_dst_copy_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_square_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsecond_fr_mode_blank_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_s(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_f(uint32_t v)
+{
+	return (v & 0x7) << 26;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_m(void)
+{
+	return 0x7 << 26;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_v(uint32_t r)
+{
+	return (r >> 26) & 0x7;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_flip_x_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_flip_y_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_trans_lr_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_trans_rl_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_rot_90_v(void)
+{
+	return 4;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_rot_180_v(void)
+{
+	return 5;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_rot_270_v(void)
+{
+	return 6;
+}
+static inline uint32_t gr2d_controlsecond_fr_type_identity_v(void)
+{
+	return 7;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_f(uint32_t v)
+{
+	return (v & 0x1) << 29;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_m(void)
+{
+	return 0x1 << 29;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_v(uint32_t r)
+{
+	return (r >> 29) & 0x1;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlsecond_fr_readwait_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_r(void)
+{
+	return 0x1f;
+}
+static inline uint32_t gr2d_controlmain_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_controlmain_cmdt_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_cmdt_f(uint32_t v)
+{
+	return (v & 0x3) << 0;
+}
+static inline uint32_t gr2d_controlmain_cmdt_m(void)
+{
+	return 0x3 << 0;
+}
+static inline uint32_t gr2d_controlmain_cmdt_v(uint32_t r)
+{
+	return (r >> 0) & 0x3;
+}
+static inline uint32_t gr2d_controlmain_cmdt_bitblt_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_cmdt_linedraw_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_cmdt_vcaa_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_cmdt_reserved1_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlmain_turbofill_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_turbofill_f(uint32_t v)
+{
+	return (v & 0x1) << 2;
+}
+static inline uint32_t gr2d_controlmain_turbofill_m(void)
+{
+	return 0x1 << 2;
+}
+static inline uint32_t gr2d_controlmain_turbofill_v(uint32_t r)
+{
+	return (r >> 2) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_test0bit_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_test0bit_f(uint32_t v)
+{
+	return (v & 0x1) << 3;
+}
+static inline uint32_t gr2d_controlmain_test0bit_m(void)
+{
+	return 0x1 << 3;
+}
+static inline uint32_t gr2d_controlmain_test0bit_v(uint32_t r)
+{
+	return (r >> 3) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_test0bit_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_test0bit_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_faden_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_faden_f(uint32_t v)
+{
+	return (v & 0x1) << 4;
+}
+static inline uint32_t gr2d_controlmain_faden_m(void)
+{
+	return 0x1 << 4;
+}
+static inline uint32_t gr2d_controlmain_faden_v(uint32_t r)
+{
+	return (r >> 4) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_faden_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_faden_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_alpen_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_alpen_f(uint32_t v)
+{
+	return (v & 0x1) << 5;
+}
+static inline uint32_t gr2d_controlmain_alpen_m(void)
+{
+	return 0x1 << 5;
+}
+static inline uint32_t gr2d_controlmain_alpen_v(uint32_t r)
+{
+	return (r >> 5) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srcsld_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcsld_f(uint32_t v)
+{
+	return (v & 0x1) << 6;
+}
+static inline uint32_t gr2d_controlmain_srcsld_m(void)
+{
+	return 0x1 << 6;
+}
+static inline uint32_t gr2d_controlmain_srcsld_v(uint32_t r)
+{
+	return (r >> 6) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srcsld_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_srcsld_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patsld_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patsld_f(uint32_t v)
+{
+	return (v & 0x1) << 7;
+}
+static inline uint32_t gr2d_controlmain_patsld_m(void)
+{
+	return 0x1 << 7;
+}
+static inline uint32_t gr2d_controlmain_patsld_v(uint32_t r)
+{
+	return (r >> 7) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_patsld_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_patsld_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patfl_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patfl_f(uint32_t v)
+{
+	return (v & 0x1) << 8;
+}
+static inline uint32_t gr2d_controlmain_patfl_m(void)
+{
+	return 0x1 << 8;
+}
+static inline uint32_t gr2d_controlmain_patfl_v(uint32_t r)
+{
+	return (r >> 8) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_patfl_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_patfl_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_xdir_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_xdir_f(uint32_t v)
+{
+	return (v & 0x1) << 9;
+}
+static inline uint32_t gr2d_controlmain_xdir_m(void)
+{
+	return 0x1 << 9;
+}
+static inline uint32_t gr2d_controlmain_xdir_v(uint32_t r)
+{
+	return (r >> 9) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_ydir_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_ydir_f(uint32_t v)
+{
+	return (v & 0x1) << 10;
+}
+static inline uint32_t gr2d_controlmain_ydir_m(void)
+{
+	return 0x1 << 10;
+}
+static inline uint32_t gr2d_controlmain_ydir_v(uint32_t r)
+{
+	return (r >> 10) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_xytdw_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_xytdw_f(uint32_t v)
+{
+	return (v & 0x1) << 11;
+}
+static inline uint32_t gr2d_controlmain_xytdw_m(void)
+{
+	return 0x1 << 11;
+}
+static inline uint32_t gr2d_controlmain_xytdw_v(uint32_t r)
+{
+	return (r >> 11) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srcpack_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcpack_f(uint32_t v)
+{
+	return (v & 0x1) << 12;
+}
+static inline uint32_t gr2d_controlmain_srcpack_m(void)
+{
+	return 0x1 << 12;
+}
+static inline uint32_t gr2d_controlmain_srcpack_v(uint32_t r)
+{
+	return (r >> 12) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srcpack_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_srcpack_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patpack_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patpack_f(uint32_t v)
+{
+	return (v & 0x1) << 13;
+}
+static inline uint32_t gr2d_controlmain_patpack_m(void)
+{
+	return 0x1 << 13;
+}
+static inline uint32_t gr2d_controlmain_patpack_v(uint32_t r)
+{
+	return (r >> 13) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_patpack_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_patpack_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_yflip_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_yflip_f(uint32_t v)
+{
+	return (v & 0x1) << 14;
+}
+static inline uint32_t gr2d_controlmain_yflip_m(void)
+{
+	return 0x1 << 14;
+}
+static inline uint32_t gr2d_controlmain_yflip_v(uint32_t r)
+{
+	return (r >> 14) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_yflip_dsiable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_yflip_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcsel_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcsel_f(uint32_t v)
+{
+	return (v & 0x1) << 15;
+}
+static inline uint32_t gr2d_controlmain_srcsel_m(void)
+{
+	return 0x1 << 15;
+}
+static inline uint32_t gr2d_controlmain_srcsel_v(uint32_t r)
+{
+	return (r >> 15) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srcsel_screen_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_srcsel_memory_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_dstcd_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_dstcd_f(uint32_t v)
+{
+	return (v & 0x3) << 16;
+}
+static inline uint32_t gr2d_controlmain_dstcd_m(void)
+{
+	return 0x3 << 16;
+}
+static inline uint32_t gr2d_controlmain_dstcd_v(uint32_t r)
+{
+	return (r >> 16) & 0x3;
+}
+static inline uint32_t gr2d_controlmain_dstcd_bpp8_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_dstcd_bpp16_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_dstcd_bpp32_v(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_dstcd_reserved3_v(void)
+{
+	return 3;
+}
+static inline uint32_t gr2d_controlmain_dstt_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_dstt_f(uint32_t v)
+{
+	return (v & 0x3) << 18;
+}
+static inline uint32_t gr2d_controlmain_dstt_m(void)
+{
+	return 0x3 << 18;
+}
+static inline uint32_t gr2d_controlmain_dstt_v(uint32_t r)
+{
+	return (r >> 18) & 0x3;
+}
+static inline uint32_t gr2d_controlmain_srccd_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srccd_f(uint32_t v)
+{
+	return (v & 0x1) << 20;
+}
+static inline uint32_t gr2d_controlmain_srccd_m(void)
+{
+	return 0x1 << 20;
+}
+static inline uint32_t gr2d_controlmain_srccd_v(uint32_t r)
+{
+	return (r >> 20) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_hlmono_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_hlmono_f(uint32_t v)
+{
+	return (v & 0x1) << 21;
+}
+static inline uint32_t gr2d_controlmain_hlmono_m(void)
+{
+	return 0x1 << 21;
+}
+static inline uint32_t gr2d_controlmain_hlmono_v(uint32_t r)
+{
+	return (r >> 21) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_srct_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_srct_f(uint32_t v)
+{
+	return (v & 0x3) << 22;
+}
+static inline uint32_t gr2d_controlmain_srct_m(void)
+{
+	return 0x3 << 22;
+}
+static inline uint32_t gr2d_controlmain_srct_v(uint32_t r)
+{
+	return (r >> 22) & 0x3;
+}
+static inline uint32_t gr2d_controlmain_srcbas_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcbas_f(uint32_t v)
+{
+	return (v & 0x1) << 24;
+}
+static inline uint32_t gr2d_controlmain_srcbas_m(void)
+{
+	return 0x1 << 24;
+}
+static inline uint32_t gr2d_controlmain_srcbas_v(uint32_t r)
+{
+	return (r >> 24) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_gcsw_s(void)
+{
+	return 2;
+}
+static inline uint32_t gr2d_controlmain_gcsw_f(uint32_t v)
+{
+	return (v & 0x3) << 25;
+}
+static inline uint32_t gr2d_controlmain_gcsw_m(void)
+{
+	return 0x3 << 25;
+}
+static inline uint32_t gr2d_controlmain_gcsw_v(uint32_t r)
+{
+	return (r >> 25) & 0x3;
+}
+static inline uint32_t gr2d_controlmain_srcdir_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcdir_f(uint32_t v)
+{
+	return (v & 0x1) << 27;
+}
+static inline uint32_t gr2d_controlmain_srcdir_m(void)
+{
+	return 0x1 << 27;
+}
+static inline uint32_t gr2d_controlmain_srcdir_v(uint32_t r)
+{
+	return (r >> 27) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_dstdir_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_dstdir_f(uint32_t v)
+{
+	return (v & 0x1) << 28;
+}
+static inline uint32_t gr2d_controlmain_dstdir_m(void)
+{
+	return 0x1 << 28;
+}
+static inline uint32_t gr2d_controlmain_dstdir_v(uint32_t r)
+{
+	return (r >> 28) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_patsel_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_patsel_f(uint32_t v)
+{
+	return (v & 0x1) << 30;
+}
+static inline uint32_t gr2d_controlmain_patsel_m(void)
+{
+	return 0x1 << 30;
+}
+static inline uint32_t gr2d_controlmain_patsel_v(uint32_t r)
+{
+	return (r >> 30) & 0x1;
+}
+static inline uint32_t gr2d_controlmain_patsel_screen_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_patsel_memory_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_ropfade_r(void)
+{
+	return 0x20;
+}
+static inline uint32_t gr2d_ropfade_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_ropfade_rop_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_ropfade_rop_f(uint32_t v)
+{
+	return (v & 0xff) << 0;
+}
+static inline uint32_t gr2d_ropfade_rop_m(void)
+{
+	return 0xff << 0;
+}
+static inline uint32_t gr2d_ropfade_rop_v(uint32_t r)
+{
+	return (r >> 0) & 0xff;
+}
+static inline uint32_t gr2d_ropfade_fadcoe_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_ropfade_fadcoe_f(uint32_t v)
+{
+	return (v & 0xff) << 16;
+}
+static inline uint32_t gr2d_ropfade_fadcoe_m(void)
+{
+	return 0xff << 16;
+}
+static inline uint32_t gr2d_ropfade_fadcoe_v(uint32_t r)
+{
+	return (r >> 16) & 0xff;
+}
+static inline uint32_t gr2d_ropfade_fadoff_s(void)
+{
+	return 8;
+}
+static inline uint32_t gr2d_ropfade_fadoff_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t gr2d_ropfade_fadoff_m(void)
+{
+	return 0xff << 24;
+}
+static inline uint32_t gr2d_ropfade_fadoff_v(uint32_t r)
+{
+	return (r >> 24) & 0xff;
+}
+static inline uint32_t gr2d_dstba_r(void)
+{
+	return 0x2b;
+}
+static inline uint32_t gr2d_dstba_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_dstba_dstba_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_dstba_dstba_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_dstba_dstba_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_dstba_dstba_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_dstst_r(void)
+{
+	return 0x2e;
+}
+static inline uint32_t gr2d_dstst_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_dstst_dsts_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_dstst_dsts_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_dstst_dsts_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_dstst_dsts_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_srcba_r(void)
+{
+	return 0x31;
+}
+static inline uint32_t gr2d_srcba_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcba_srcba_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_srcba_srcba_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_srcba_srcba_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_srcba_srcba_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_srcst_r(void)
+{
+	return 0x33;
+}
+static inline uint32_t gr2d_srcst_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcst_srcs_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_srcst_srcs_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_srcst_srcs_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_srcst_srcs_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_srcfgc_r(void)
+{
+	return 0x35;
+}
+static inline uint32_t gr2d_srcfgc_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcfgc_srcfgc_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_srcfgc_srcfgc_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_srcfgc_srcfgc_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_srcfgc_srcfgc_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_srcsize_r(void)
+{
+	return 0x37;
+}
+static inline uint32_t gr2d_srcsize_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcsize_srcwidth_s(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_srcsize_srcwidth_f(uint32_t v)
+{
+	return (v & 0x7fff) << 0;
+}
+static inline uint32_t gr2d_srcsize_srcwidth_m(void)
+{
+	return 0x7fff << 0;
+}
+static inline uint32_t gr2d_srcsize_srcwidth_v(uint32_t r)
+{
+	return (r >> 0) & 0x7fff;
+}
+static inline uint32_t gr2d_srcsize_srcheight_s(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_srcsize_srcheight_f(uint32_t v)
+{
+	return (v & 0x7fff) << 16;
+}
+static inline uint32_t gr2d_srcsize_srcheight_m(void)
+{
+	return 0x7fff << 16;
+}
+static inline uint32_t gr2d_srcsize_srcheight_v(uint32_t r)
+{
+	return (r >> 16) & 0x7fff;
+}
+static inline uint32_t gr2d_dstsize_r(void)
+{
+	return 0x38;
+}
+static inline uint32_t gr2d_dstsize_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_dstsize_dstwidth_s(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_dstsize_dstwidth_f(uint32_t v)
+{
+	return (v & 0x7fff) << 0;
+}
+static inline uint32_t gr2d_dstsize_dstwidth_m(void)
+{
+	return 0x7fff << 0;
+}
+static inline uint32_t gr2d_dstsize_dstwidth_v(uint32_t r)
+{
+	return (r >> 0) & 0x7fff;
+}
+static inline uint32_t gr2d_dstsize_dstheight_s(void)
+{
+	return 15;
+}
+static inline uint32_t gr2d_dstsize_dstheight_f(uint32_t v)
+{
+	return (v & 0x7fff) << 16;
+}
+static inline uint32_t gr2d_dstsize_dstheight_m(void)
+{
+	return 0x7fff << 16;
+}
+static inline uint32_t gr2d_dstsize_dstheight_v(uint32_t r)
+{
+	return (r >> 16) & 0x7fff;
+}
+static inline uint32_t gr2d_srcps_r(void)
+{
+	return 0x39;
+}
+static inline uint32_t gr2d_srcps_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcps_srcx_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_srcps_srcx_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_srcps_srcx_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_srcps_srcx_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_srcps_srcy_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_srcps_srcy_f(uint32_t v)
+{
+	return (v & 0xffff) << 16;
+}
+static inline uint32_t gr2d_srcps_srcy_m(void)
+{
+	return 0xffff << 16;
+}
+static inline uint32_t gr2d_srcps_srcy_v(uint32_t r)
+{
+	return (r >> 16) & 0xffff;
+}
+static inline uint32_t gr2d_dstps_r(void)
+{
+	return 0x3a;
+}
+static inline uint32_t gr2d_dstps_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_dstps_dstx_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_dstps_dstx_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_dstps_dstx_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_dstps_dstx_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_dstps_dsty_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_dstps_dsty_f(uint32_t v)
+{
+	return (v & 0xffff) << 16;
+}
+static inline uint32_t gr2d_dstps_dsty_m(void)
+{
+	return 0xffff << 16;
+}
+static inline uint32_t gr2d_dstps_dsty_v(uint32_t r)
+{
+	return (r >> 16) & 0xffff;
+}
+static inline uint32_t gr2d_uvstride_r(void)
+{
+	return 0x44;
+}
+static inline uint32_t gr2d_uvstride_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_uvstride_uvstride_s(void)
+{
+	return 16;
+}
+static inline uint32_t gr2d_uvstride_uvstride_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t gr2d_uvstride_uvstride_m(void)
+{
+	return 0xffff << 0;
+}
+static inline uint32_t gr2d_uvstride_uvstride_v(uint32_t r)
+{
+	return (r >> 0) & 0xffff;
+}
+static inline uint32_t gr2d_tilemode_r(void)
+{
+	return 0x46;
+}
+static inline uint32_t gr2d_tilemode_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 0;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_m(void)
+{
+	return 0x1 << 0;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_v(uint32_t r)
+{
+	return (r >> 0) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_src_y_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 4;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_m(void)
+{
+	return 0x1 << 4;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_v(uint32_t r)
+{
+	return (r >> 4) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_src_uv_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 8;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_m(void)
+{
+	return 0x1 << 8;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_v(uint32_t r)
+{
+	return (r >> 8) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_pat_y_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 12;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_m(void)
+{
+	return 0x1 << 12;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_v(uint32_t r)
+{
+	return (r >> 12) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_pat_uv_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 16;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_m(void)
+{
+	return 0x1 << 16;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_v(uint32_t r)
+{
+	return (r >> 16) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_dst_rd_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_s(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_f(uint32_t v)
+{
+	return (v & 0x1) << 20;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_m(void)
+{
+	return 0x1 << 20;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_v(uint32_t r)
+{
+	return (r >> 20) & 0x1;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_linear_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_tilemode_dst_wr_tile_mode_tiled_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_r(void)
+{
+	return 0x48;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_src_addr_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_src_addr_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_src_addr_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_srcba_sb_surfbase_src_addr_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_r(void)
+{
+	return 0x49;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_dst_addr_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_dst_addr_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_dst_addr_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_dstba_sb_surfbase_dst_addr_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_r(void)
+{
+	return 0x4b;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_v_addr_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_v_addr_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_v_addr_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_vba_sb_surfbase_v_addr_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_r(void)
+{
+	return 0x4c;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_reset_val_v(void)
+{
+	return 0x0;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_u_addr_s(void)
+{
+	return 32;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_u_addr_f(uint32_t v)
+{
+	return (v & 0xffffffff) << 0;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_u_addr_m(void)
+{
+	return 0xffffffff << 0;
+}
+static inline uint32_t gr2d_uba_sb_surfbase_u_addr_v(uint32_t r)
+{
+	return (r >> 0) & 0xffffffff;
+}
+
+#endif /* __hw_gr2d_h__ */
diff --git a/tegra/2d/tegra_2d_api.c b/tegra/2d/tegra_2d_api.c
new file mode 100644
index 0000000..a4b5101
--- /dev/null
+++ b/tegra/2d/tegra_2d_api.c
@@ -0,0 +1,235 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include "tegra_2d.h"
+#include "tegra_2d_context.h"
+#include "tegra_2d_copy.h"
+#include "tegra_2d_fill.h"
+#include "tegra_2d_color.h"
+#include "tegra_2d_surface.h"
+#include "tegra_2d_util.h"
+
+#define ENTER() \
+    if (ctx->log_enable) LOG("> %s\n", __func__)
+
+#define RETURN(x) \
+    if (ctx->log_enable) \
+        LOG("- %s: %s\n", __func__, result_to_str((enum tegra_2d_result) x)); \
+    return x
+
+#define RETURN_VOID() \
+    if (ctx->log_enable) \
+        LOG("- %s\n", __func__); \
+    return
+
+struct tegra_2d_context *
+tegra_2d_open(int fd)
+{
+    struct tegra_2d_ictx *ictx;
+
+    ictx = open2d(fd);
+
+    return (struct tegra_2d_context *) ictx;
+}
+
+void
+tegra_2d_close(struct tegra_2d_context *ctx)
+{
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return;
+
+    ENTER();
+
+    close2d(ictx);
+}
+
+int
+tegra_2d_begin(struct tegra_2d_context *ctx,
+               const struct tegra_fence *fence)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = begin2d(ictx, fence);
+
+    RETURN(result);
+}
+
+int
+tegra_2d_end(struct tegra_2d_context *ctx,
+             struct tegra_fence *fence)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = end2d(ictx, fence);
+
+    RETURN(result);
+}
+
+int
+tegra_2d_fill(struct tegra_2d_context *ctx,
+              const struct tegra_2d_surface *dst,
+              const struct tegra_2d_surface_color *color,
+              const struct tegra_2d_rect *dst_rect)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = fill2d(ictx, dst, color, dst_rect);
+
+    RETURN(result);
+}
+
+int
+tegra_2d_copy(struct tegra_2d_context *ctx,
+              const struct tegra_2d_surface *dst,
+              const struct tegra_2d_surface *src,
+              const struct tegra_2d_rect *dst_rect,
+              const struct tegra_2d_rect *src_rect,
+              enum tegra_2d_transform transform)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = copy2d(ictx, dst, src, dst_rect, src_rect, transform);
+
+    RETURN(result);
+}
+
+int
+tegra_2d_compute_requirements(const struct tegra_2d_plane *plane,
+                              uint32_t *num_bytes,
+                              uint32_t *alignment,
+                              uint32_t *pitch)
+{
+    int result;
+
+    result = compute_requirements(plane, num_bytes, alignment, pitch);
+
+    return result;
+}
+
+int
+tegra_2d_allocate_surface(struct tegra_2d_context *ctx,
+                          struct tegra_2d_surface *surface)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = allocate_surface(ictx, surface);
+
+    RETURN(result);
+}
+
+void
+tegra_2d_free_surface(struct tegra_2d_context *ctx,
+                      struct tegra_2d_surface *surface)
+{
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return;
+
+    ENTER();
+
+    free_surface(ictx, surface);
+
+    RETURN_VOID();
+}
+
+int
+tegra_2d_dump_surface(struct tegra_2d_context *ctx,
+                      const struct tegra_2d_surface *surface,
+                      const char *filename)
+{
+    int result;
+    struct tegra_2d_ictx *ictx = (struct tegra_2d_ictx *) ctx;
+
+    if (ctx == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    ENTER();
+
+    result = dump_surface(ictx, surface, filename);
+
+    RETURN(result);
+}
+
+void
+tegra_2d_color_convert(struct tegra_2d_surface_color *dst,
+                       const struct tegra_2d_surface_color *src)
+{
+    color_convert(dst, src);
+}
+
+void
+tegra_2d_color_to_rgba(const struct tegra_2d_surface_color *src,
+                       uint32_t *r,
+                       uint32_t *g,
+                       uint32_t *b,
+                       uint32_t *a)
+{
+    color_to_rgba(src, r, g, b, a);
+}
+
+void
+tegra_2d_color_from_rgba(struct tegra_2d_surface_color *dst,
+                         uint32_t r,
+                         uint32_t g,
+                         uint32_t b,
+                         uint32_t a)
+{
+    color_from_rgba(dst, r, g, b, a);
+}
diff --git a/tegra/2d/tegra_2d_color.c b/tegra/2d/tegra_2d_color.c
new file mode 100644
index 0000000..089c5c2
--- /dev/null
+++ b/tegra/2d/tegra_2d_color.c
@@ -0,0 +1,412 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include "tegra_2d.h"
+#include "tegra_2d_color.h"
+#include "tegra_2d_util.h"
+
+void
+color_convert(struct tegra_2d_surface_color *dst,
+              const struct tegra_2d_surface_color *src)
+{
+    int i;
+    uint32_t r, g, b, a;
+
+    ASSERT(dst);
+    ASSERT(src);
+
+    if (src->num_planes != dst->num_planes)
+        goto convert;
+
+    for (i=0; i<src->num_planes; ++i)
+    {
+        if (src->planes[i].format != dst->planes[i].format)
+            goto convert;
+
+        dst->planes[i].value = src->planes[i].value;
+    }
+
+    return;
+
+convert:
+    color_to_rgba(src, &r, &g, &b, &a);
+    color_from_rgba(dst, r, g, b, a);
+}
+
+static void
+rgb_to_yuv(uint32_t *y, uint32_t *u, uint32_t *v,
+           uint32_t r, uint32_t g, uint32_t b)
+{
+    int32_t yt, ut, vt;
+    yt = ((66 * r + 129 * g + 25 * b + 128) >> 8) + 16;
+    ut = ((-38 * (int32_t)r - 74 * (int32_t)g + 112 * (int32_t)b + 128) >> 8) + 128;
+    vt = ((112 * (int32_t)r - 94 * (int32_t)g - 18 * (int32_t)b + 128) >> 8) + 128;
+    *y = CLAMP(yt, 0, 255);
+    *u = CLAMP(ut, 0, 255);
+    *v = CLAMP(vt, 0, 255);
+}
+
+static void
+yuv_to_rgb(uint32_t *r, uint32_t *g, uint32_t *b,
+           uint32_t y, uint32_t u, uint32_t v)
+{
+    int32_t c = y - 16;
+    int32_t d = u - 128;
+    int32_t e = v - 128;
+    *r = CLAMP((298*c + 409*e + 128) >> 8, 0, 255);
+    *g = CLAMP(((298*c - 100*d - 208*e + 128) >> 8), 0, 255);
+    *b = CLAMP(((298*c + 516*d + 128) >> 8), 0, 255);
+}
+
+static void
+get_components(const struct tegra_2d_surface_color *src,
+               uint32_t *x,
+               uint32_t *y,
+               uint32_t *z,
+               uint32_t *w)
+{
+    int i;
+
+    for (i=0; i<src->num_planes; ++i)
+    {
+        uint32_t value = src->planes[i].value;
+
+        switch (src->planes[i].format)
+        {
+            case TEGRA_2D_FORMAT_A8R8G8B8:
+                *w = (value >> 24) & 0xff;
+                *x = (value >> 16) & 0xff;
+                *y = (value >>  8) & 0xff;
+                *z = (value >>  0) & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_A8B8G8R8:
+                *w = (value >> 24) & 0xff;
+                *z = (value >> 16) & 0xff;
+                *y = (value >>  8) & 0xff;
+                *x = (value >>  0) & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_R8G8B8A8:
+                *x = (value >> 24) & 0xff;
+                *y = (value >> 16) & 0xff;
+                *z = (value >>  8) & 0xff;
+                *w = (value >>  0) & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_B8G8R8A8:
+                *z = (value >> 24) & 0xff;
+                *y = (value >> 16) & 0xff;
+                *x = (value >>  8) & 0xff;
+                *w = (value >>  0) & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_A4R4G4B4:
+                *w = ((value >> 12) & 0x0f) << 4;
+                *x = ((value >>  8) & 0x0f) << 4;
+                *y = ((value >>  4) & 0x0f) << 4;
+                *z = ((value >>  0) & 0x0f) << 4;
+                break;
+
+            case TEGRA_2D_FORMAT_R4G4B4A4:
+                *x = ((value >> 12) & 0x0f) << 4;
+                *y = ((value >>  8) & 0x0f) << 4;
+                *z = ((value >>  4) & 0x0f) << 4;
+                *w = ((value >>  0) & 0x0f) << 4;
+                break;
+
+            case TEGRA_2D_FORMAT_R5G6B5:
+                *x = ((value >> 11) & 0x1f) << 3;
+                *y = ((value >>  5) & 0x3f) << 2;
+                *z = ((value >>  0) & 0x1f) << 3;
+                break;
+
+            case TEGRA_2D_FORMAT_A1R5G5B5:
+                *w = ((value >> 11) & 0x1f) << 3;
+                *x = ((value >>  6) & 0x1f) << 3;
+                *y = ((value >>  1) & 0x1f) << 3;
+                *z = ((value >>  0) & 0x01) << 7;
+                break;
+
+            case TEGRA_2D_FORMAT_Y8:
+                *x = value & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_U8:
+                *y = value & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_V8:
+                *z = value & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_U8_V8:
+                *y = ((uint8_t *) &value)[0];
+                *z = ((uint8_t *) &value)[1];
+                break;
+
+            case TEGRA_2D_FORMAT_V8_U8:
+                *z = ((uint8_t *) &value)[0];
+                *y = ((uint8_t *) &value)[1];
+                break;
+
+            case TEGRA_2D_FORMAT_UYVY:
+                *y = ((uint8_t *) &value)[0];
+                *x = ((uint8_t *) &value)[1];
+                *z = ((uint8_t *) &value)[2];
+                break;
+
+            case TEGRA_2D_FORMAT_VYUY:
+                *z = ((uint8_t *) &value)[0];
+                *x = ((uint8_t *) &value)[1];
+                *y = ((uint8_t *) &value)[2];
+                break;
+
+            case TEGRA_2D_FORMAT_YUYV:
+                *x = ((uint8_t *) &value)[0];
+                *y = ((uint8_t *) &value)[1];
+                *z = ((uint8_t *) &value)[3];
+                break;
+
+            case TEGRA_2D_FORMAT_YVYU:
+                *x = ((uint8_t *) &value)[0];
+                *z = ((uint8_t *) &value)[1];
+                *y = ((uint8_t *) &value)[3];
+                break;
+
+            default:
+                ASSERT(0);
+        }
+    }
+}
+
+static void
+set_components(struct tegra_2d_surface_color *dst,
+               uint32_t x,
+               uint32_t y,
+               uint32_t z,
+               uint32_t w)
+{
+    int i;
+
+    for (i=0; i<dst->num_planes; ++i)
+    {
+        uint32_t value;
+
+        switch (dst->planes[i].format)
+        {
+            case TEGRA_2D_FORMAT_A8R8G8B8:
+                value  = (w & 0xff) << 24;
+                value |= (x & 0xff) << 16;
+                value |= (y & 0xff) <<  8;
+                value |= (z & 0xff) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_A8B8G8R8:
+                value  = (w & 0xff) << 24;
+                value |= (z & 0xff) << 16;
+                value |= (y & 0xff) <<  8;
+                value |= (x & 0xff) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_R8G8B8A8:
+                value  = (x & 0xff) << 24;
+                value |= (y & 0xff) << 16;
+                value |= (z & 0xff) <<  8;
+                value |= (w & 0xff) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_B8G8R8A8:
+                value  = (z & 0xff) << 24;
+                value |= (y & 0xff) << 16;
+                value |= (x & 0xff) <<  8;
+                value |= (w & 0xff) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_A4R4G4B4:
+                value  = ((w >> 4) & 0x0f) << 12;
+                value |= ((x >> 4) & 0x0f) <<  8;
+                value |= ((y >> 4) & 0x0f) <<  4;
+                value |= ((z >> 4) & 0x0f) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_R4G4B4A4:
+                value  = ((x >> 4) & 0x0f) << 12;
+                value |= ((y >> 4) & 0x0f) <<  8;
+                value |= ((z >> 4) & 0x0f) <<  4;
+                value |= ((w >> 4) & 0x0f) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_R5G6B5:
+                value  = ((x >> 3) & 0x1f) << 11;
+                value |= ((y >> 2) & 0x3f) <<  5;
+                value |= ((z >> 3) & 0x1f) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_A1R5G5B5:
+                value  = ((w >> 3) & 0x1f) << 11;
+                value |= ((x >> 3) & 0x1f) <<  6;
+                value |= ((y >> 3) & 0x1f) <<  1;
+                value |= ((z >> 7) & 0x01) <<  0;
+                break;
+
+            case TEGRA_2D_FORMAT_Y8:
+                value = x & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_U8:
+                value = y & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_V8:
+                value = z & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_U8_V8:
+                ((uint8_t *) &value)[0] = y & 0xff;
+                ((uint8_t *) &value)[1] = z & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_V8_U8:
+                ((uint8_t *) &value)[0] = z & 0xff;
+                ((uint8_t *) &value)[1] = y & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_UYVY:
+                ((uint8_t *) &value)[0] = y & 0xff;
+                ((uint8_t *) &value)[1] = x & 0xff;
+                ((uint8_t *) &value)[2] = z & 0xff;
+                ((uint8_t *) &value)[3] = x & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_VYUY:
+                ((uint8_t *) &value)[0] = z & 0xff;
+                ((uint8_t *) &value)[1] = x & 0xff;
+                ((uint8_t *) &value)[2] = y & 0xff;
+                ((uint8_t *) &value)[3] = x & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_YUYV:
+                ((uint8_t *) &value)[0] = x & 0xff;
+                ((uint8_t *) &value)[1] = y & 0xff;
+                ((uint8_t *) &value)[2] = x & 0xff;
+                ((uint8_t *) &value)[3] = z & 0xff;
+                break;
+
+            case TEGRA_2D_FORMAT_YVYU:
+                ((uint8_t *) &value)[0] = x & 0xff;
+                ((uint8_t *) &value)[1] = z & 0xff;
+                ((uint8_t *) &value)[2] = x & 0xff;
+                ((uint8_t *) &value)[3] = y & 0xff;
+                break;
+
+            default:
+                ASSERT(0);
+        }
+
+        dst->planes[i].value = value;
+    }
+}
+
+void
+color_to_rgba(const struct tegra_2d_surface_color *src,
+              uint32_t *r,
+              uint32_t *g,
+              uint32_t *b,
+              uint32_t *a)
+{
+    ASSERT(src);
+    ASSERT(r && g && b && a);
+
+    if (TEGRA_2D_FORMAT_IS_YUV(src->planes[0].format))
+    {
+        uint32_t y, u, v;
+        y = 0;
+        u = 0;
+        v = 0;
+
+        get_components(src, &y, &u, &v, NULL);
+        yuv_to_rgb(r, g, b, y, u, v);
+        *a = 255;
+    }
+    else
+    {
+        get_components(src, r, g, b, a);
+    }
+}
+
+void
+color_from_rgba(struct tegra_2d_surface_color *dst,
+                uint32_t r,
+                uint32_t g,
+                uint32_t b,
+                uint32_t a)
+{
+    ASSERT(dst);
+
+    if (TEGRA_2D_FORMAT_IS_YUV(dst->planes[0].format))
+    {
+        uint32_t y, u, v;
+
+        rgb_to_yuv(&y, &u, &v, r, g, b);
+        set_components(dst, y, u, v, 255);
+    }
+    else
+    {
+        set_components(dst, r, g, b, a);
+    }
+}
+
+const char *
+format_to_str(enum tegra_2d_format format)
+{
+    switch (format)
+    {
+        #define CASE(f) case TEGRA_2D_FORMAT_##f: return #f
+            CASE(A8R8G8B8);
+            CASE(A8B8G8R8);
+            CASE(R8G8B8A8);
+            CASE(B8G8R8A8);
+            CASE(A4R4G4B4);
+            CASE(R4G4B4A4);
+            CASE(R5G6B5);
+            CASE(A1R5G5B5);
+            CASE(Y8);
+            CASE(U8);
+            CASE(V8);
+            CASE(U8_V8);
+            CASE(V8_U8);
+            CASE(UYVY);
+            CASE(VYUY);
+            CASE(YUYV);
+            CASE(YVYU);
+        #undef CASE
+
+        default:
+            return "unknown";
+    }
+}
diff --git a/tegra/2d/tegra_2d_color.h b/tegra/2d/tegra_2d_color.h
new file mode 100644
index 0000000..aceef6a
--- /dev/null
+++ b/tegra/2d/tegra_2d_color.h
@@ -0,0 +1,51 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_COLOR_H
+#define TEGRA_2D_COLOR_H
+
+void
+color_convert(struct tegra_2d_surface_color *dst,
+              const struct tegra_2d_surface_color *src);
+
+void
+color_to_rgba(const struct tegra_2d_surface_color *src,
+              uint32_t *r,
+              uint32_t *g,
+              uint32_t *b,
+              uint32_t *a);
+
+void
+color_from_rgba(struct tegra_2d_surface_color *dst,
+                uint32_t r,
+                uint32_t g,
+                uint32_t b,
+                uint32_t a);
+
+const char *
+format_to_str(enum tegra_2d_format format);
+
+#endif // TEGRA_2D_COLOR_H
diff --git a/tegra/2d/tegra_2d_context.c b/tegra/2d/tegra_2d_context.c
new file mode 100644
index 0000000..d03d7d5
--- /dev/null
+++ b/tegra/2d/tegra_2d_context.c
@@ -0,0 +1,140 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include "tegra_2d.h"
+#include "tegra_2d_context.h"
+#include "tegra_2d_util.h"
+
+struct tegra_2d_ictx *
+open2d(int fd)
+{
+    int i;
+    struct tegra_2d_ictx *ctx;
+
+    ctx = malloc(sizeof(struct tegra_2d_ictx));
+    if (ctx == NULL)
+        return NULL;
+
+    ctx->base.log_enable = 0;
+    ctx->base.dump_enable = 0;
+    ctx->base.dump_counter = 0;
+    ctx->base.dump_prefix[0] = 0;
+    ctx->device = NULL;
+    ctx->channel = NULL;
+    ctx->stream = NULL;
+    tegra_fence_clear(&ctx->pre_fence);
+    tegra_fence_clear(&ctx->post_fence);
+
+    ctx->device = tegra_device_create(fd);
+    if (ctx->device == NULL)
+        goto fail;
+
+    ctx->channel = tegra_channel_open(ctx->device, TEGRADRM_MODULEID_2D);
+    if (ctx->channel == NULL)
+        goto fail;
+
+    ctx->stream = tegra_stream_create(ctx->channel);
+    if (ctx->stream == NULL)
+        goto fail;
+
+    for (i=0; i<TEGRA_2D_MAX_PLANES; ++i)
+    {
+        g2fill_init(&ctx->g2fill[i]);
+        g2copy_init(&ctx->g2copy[i]);
+        frcopy_init(&ctx->frcopy[i]);
+    }
+
+    sbcopy_init(&ctx->sbcopy);
+
+    return ctx;
+
+fail:
+    close2d(ctx);
+    return NULL;
+}
+
+void
+close2d(struct tegra_2d_ictx *ctx)
+{
+    ASSERT(ctx);
+
+    tegra_stream_destroy(ctx->stream);
+    tegra_channel_close(ctx->channel);
+    tegra_device_destroy(ctx->device);
+
+    free(ctx);
+}
+
+int
+begin2d(struct tegra_2d_ictx *ctx,
+        const struct tegra_fence *fence)
+{
+    ASSERT(ctx);
+
+    if (fence != NULL)
+        tegra_fence_copy(&ctx->pre_fence, fence);
+    else
+        tegra_fence_clear(&ctx->pre_fence);
+
+    return TEGRA_2D_OK;
+}
+
+int
+flush2d(struct tegra_2d_ictx *ctx)
+{
+    int result;
+
+    ASSERT(ctx);
+
+    result = tegra_stream_flush(ctx->stream, &ctx->post_fence);
+
+    if (result != 0)
+        return TEGRA_2D_STREAM_FAILURE;
+
+    return TEGRA_2D_OK;
+}
+
+int
+end2d(struct tegra_2d_ictx *ctx,
+      struct tegra_fence *fence)
+{
+    int result;
+
+    ASSERT(ctx);
+
+    result = flush2d(ctx);
+
+    if (result != 0)
+        return result;
+
+    if (fence != NULL)
+        tegra_fence_copy(fence, &ctx->post_fence);
+    else
+        tegra_fence_wait(ctx->channel, &ctx->post_fence);
+
+    return TEGRA_2D_OK;
+}
diff --git a/tegra/2d/tegra_2d_context.h b/tegra/2d/tegra_2d_context.h
new file mode 100644
index 0000000..703f23b
--- /dev/null
+++ b/tegra/2d/tegra_2d_context.h
@@ -0,0 +1,67 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_CONTEXT_H
+#define TEGRA_2D_CONTEXT_H
+
+#include "tegra_drmif.h"
+#include "tegra_2d_g2fill.h"
+#include "tegra_2d_g2copy.h"
+#include "tegra_2d_frcopy.h"
+#include "tegra_2d_sbcopy.h"
+
+struct tegra_2d_ictx
+{
+    struct tegra_2d_context  base;
+    struct tegra_device     *device;
+    struct tegra_channel    *channel;
+    struct tegra_stream     *stream;
+    struct tegra_fence       pre_fence;
+    struct tegra_fence       post_fence;
+    struct tegra_2d_g2fill   g2fill[TEGRA_2D_MAX_PLANES];
+    struct tegra_2d_g2copy   g2copy[TEGRA_2D_MAX_PLANES];
+    struct tegra_2d_frcopy   frcopy[TEGRA_2D_MAX_PLANES];
+    struct tegra_2d_sbcopy   sbcopy;
+};
+
+struct tegra_2d_ictx *
+open2d(int fd);
+
+void
+close2d(struct tegra_2d_ictx *ctx);
+
+int
+begin2d(struct tegra_2d_ictx *ctx,
+        const struct tegra_fence *fence);
+
+int
+flush2d(struct tegra_2d_ictx *ctx);
+
+int
+end2d(struct tegra_2d_ictx *ctx,
+      struct tegra_fence *fence);
+
+#endif // TEGRA_2D_CONTEXT_H
diff --git a/tegra/2d/tegra_2d_copy.c b/tegra/2d/tegra_2d_copy.c
new file mode 100644
index 0000000..a659b5b
--- /dev/null
+++ b/tegra/2d/tegra_2d_copy.c
@@ -0,0 +1,209 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include "tegra_2d.h"
+#include "tegra_2d_context.h"
+#include "tegra_2d_copy.h"
+#include "tegra_2d_surface.h"
+#include "tegra_2d_util.h"
+#include "tegra_2d_g2copy.h"
+#include "tegra_2d_frcopy.h"
+#include "tegra_2d_sbcopy.h"
+
+static int
+copy_area(struct tegra_2d_ictx *ctx,
+          const struct tegra_2d_surface_area *dst_area,
+          const struct tegra_2d_surface_area *src_area,
+          enum tegra_2d_transform transform)
+{
+    int i;
+    int result = -1;
+    uint32_t num_words = 0;
+    uint32_t num_relocs = 0;
+
+    ASSERT(dst_area->surface->num_planes == src_area->surface->num_planes);
+
+    ctx->sbcopy.is_valid = 0;
+
+    for (i=0; i<dst_area->surface->num_planes; ++i)
+    {
+        result = frcopy_set(&ctx->frcopy[i],
+                            &dst_area->planes[i],
+                            &src_area->planes[i],
+                            transform);
+        if (result == TEGRA_2D_OK)
+        {
+            num_words += frcopy_num_words(&ctx->frcopy[i]);
+            num_relocs += frcopy_num_relocs(&ctx->frcopy[i]);
+            continue;
+        }
+
+        result = g2copy_set(&ctx->g2copy[i],
+                            &dst_area->planes[i],
+                            &src_area->planes[i],
+                            transform);
+        if (result == TEGRA_2D_OK)
+        {
+            num_words += g2copy_num_words(&ctx->g2copy[i]);
+            num_relocs += g2copy_num_relocs(&ctx->g2copy[i]);
+            continue;
+        }
+
+        break;
+    }
+
+    if (result != TEGRA_2D_OK)
+    {
+        result = sbcopy_set(&ctx->sbcopy,
+                            dst_area,
+                            src_area,
+                            transform);
+        if (result != TEGRA_2D_OK)
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+
+        num_words = sbcopy_num_words(&ctx->sbcopy);
+        num_relocs = sbcopy_num_relocs(&ctx->sbcopy);
+    }
+
+    if (ctx->base.log_enable)
+    {
+        if (ctx->sbcopy.is_valid)
+        {
+            sbcopy_dump(&ctx->sbcopy);
+        }
+        else
+        {
+            for (i=0; i<dst_area->surface->num_planes; ++i)
+            {
+                if (ctx->frcopy[i].is_valid)
+                    frcopy_dump(&ctx->frcopy[i]);
+                else
+                    g2copy_dump(&ctx->g2copy[i]);
+            }
+        }
+    }
+
+    result = tegra_stream_begin(ctx->stream,
+                                num_words,
+                                &ctx->pre_fence,
+                                tegra_fence_is_valid(&ctx->pre_fence) ?
+                                    1 : 0,
+                                0,
+                                num_relocs,
+                                0);
+    if (result != 0)
+        return TEGRA_2D_STREAM_FAILURE;
+
+    if (ctx->sbcopy.is_valid)
+    {
+        sbcopy_dispatch(&ctx->sbcopy, ctx->stream);
+    }
+    else
+    {
+        for (i=0; i<dst_area->surface->num_planes; ++i)
+        {
+            if (ctx->frcopy[i].is_valid)
+                frcopy_dispatch(&ctx->frcopy[i], ctx->stream);
+            else
+                g2copy_dispatch(&ctx->g2copy[i], ctx->stream);
+        }
+    }
+
+    tegra_stream_end(ctx->stream);
+
+    return TEGRA_2D_OK;
+}
+
+int
+copy2d(struct tegra_2d_ictx *ctx,
+       const struct tegra_2d_surface *dst,
+       const struct tegra_2d_surface *src,
+       const struct tegra_2d_rect *dst_rect,
+       const struct tegra_2d_rect *src_rect,
+       enum tegra_2d_transform transform)
+{
+    int result;
+    struct tegra_2d_rect vdst_rect;
+    struct tegra_2d_rect vsrc_rect;
+    struct tegra_2d_surface_area dst_area;
+    struct tegra_2d_surface_area src_area;
+
+    ASSERT(ctx);
+
+    if (dst == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    if (src == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    if (dst_rect == NULL)
+    {
+        vdst_rect.left   = 0;
+        vdst_rect.top    = 0;
+        vdst_rect.right  = dst->planes[0].width;
+        vdst_rect.bottom = dst->planes[0].height;
+    }
+    else
+    {
+        result = validate_rect(dst, dst_rect);
+        if (result != TEGRA_2D_OK)
+            return result;
+
+        vdst_rect = *dst_rect;
+    }
+
+    if (src_rect == NULL)
+    {
+        vsrc_rect.left   = 0;
+        vsrc_rect.top    = 0;
+        vsrc_rect.right  = src->planes[0].width;
+        vsrc_rect.bottom = src->planes[0].height;
+    }
+    else
+    {
+        result = validate_rect(src, src_rect);
+        if (result != TEGRA_2D_OK)
+            return result;
+
+        vsrc_rect = *src_rect;
+    }
+
+    compute_surface_area(&dst_area, dst, &vdst_rect);
+    compute_surface_area(&src_area, src, &vsrc_rect);
+
+    if (ctx->base.dump_enable)
+        dump_src(ctx, src);
+
+    result = copy_area(ctx, &dst_area, &src_area, transform);
+    if (result != TEGRA_2D_OK)
+        return result;
+
+    if (ctx->base.dump_enable)
+        dump_dst(ctx, dst);
+
+    return TEGRA_2D_OK;
+}
diff --git a/tegra/2d/tegra_2d_copy.h b/tegra/2d/tegra_2d_copy.h
new file mode 100644
index 0000000..b307245
--- /dev/null
+++ b/tegra/2d/tegra_2d_copy.h
@@ -0,0 +1,38 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_COPY_H
+#define TEGRA_2D_COPY_H
+
+int
+copy2d(struct tegra_2d_ictx *ctx,
+       const struct tegra_2d_surface *dst,
+       const struct tegra_2d_surface *src,
+       const struct tegra_2d_rect *dst_rect,
+       const struct tegra_2d_rect *src_rect,
+       enum tegra_2d_transform transform);
+
+#endif // TEGRA_2D_COPY_H
diff --git a/tegra/2d/tegra_2d_fill.c b/tegra/2d/tegra_2d_fill.c
new file mode 100644
index 0000000..8186b56
--- /dev/null
+++ b/tegra/2d/tegra_2d_fill.c
@@ -0,0 +1,136 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include "tegra_2d.h"
+#include "tegra_2d_context.h"
+#include "tegra_2d_fill.h"
+#include "tegra_2d_color.h"
+#include "tegra_2d_surface.h"
+#include "tegra_2d_util.h"
+
+static int
+fill_area(struct tegra_2d_ictx *ctx,
+          const struct tegra_2d_surface_area *dst_area,
+          const struct tegra_2d_surface_color *color)
+{
+    int i;
+    int result;
+    uint32_t num_words = 0;
+    uint32_t num_relocs = 0;
+
+    for (i=0; i<dst_area->surface->num_planes; ++i)
+    {
+        ASSERT(dst_area->planes[i].plane->format == color->planes[i].format);
+
+        result = g2fill_set(&ctx->g2fill[i],
+                            &dst_area->planes[i],
+                            &color->planes[i]);
+        if (result != TEGRA_2D_OK)
+            return result;
+
+        num_words += g2fill_num_words(&ctx->g2fill[i]);
+        num_relocs += g2fill_num_relocs(&ctx->g2fill[i]);
+    }
+
+    if (ctx->base.log_enable)
+    {
+        for (i=0; i<dst_area->surface->num_planes; ++i)
+            g2fill_dump(&ctx->g2fill[i]);
+    }
+
+    result = tegra_stream_begin(ctx->stream,
+                                num_words,
+                                &ctx->pre_fence,
+                                tegra_fence_is_valid(&ctx->pre_fence) ?
+                                    1 : 0,
+                                0,
+                                num_relocs,
+                                0);
+    if (result != 0)
+        return TEGRA_2D_STREAM_FAILURE;
+
+    for (i=0; i<dst_area->surface->num_planes; ++i)
+        g2fill_dispatch(&ctx->g2fill[i], ctx->stream);
+
+    tegra_stream_end(ctx->stream);
+
+    return TEGRA_2D_OK;
+}
+
+int
+fill2d(struct tegra_2d_ictx *ctx,
+       const struct tegra_2d_surface *dst,
+       const struct tegra_2d_surface_color *color,
+       const struct tegra_2d_rect *dst_rect)
+{
+    int i;
+    int result;
+    struct tegra_2d_rect vdst_rect;
+    struct tegra_2d_surface_color vcolor;
+    struct tegra_2d_surface_area dst_area;
+
+    ASSERT(ctx);
+
+    if (dst == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    if (color == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    if (dst_rect == NULL)
+    {
+        vdst_rect.left   = 0;
+        vdst_rect.top    = 0;
+        vdst_rect.right  = dst->planes[0].width;
+        vdst_rect.bottom = dst->planes[0].height;
+    }
+    else
+    {
+        result = validate_rect(dst, dst_rect);
+        if (result != TEGRA_2D_OK)
+            return result;
+
+        vdst_rect = *dst_rect;
+    }
+
+    vcolor.num_planes = dst->num_planes;
+    for (i=0; i<vcolor.num_planes; ++i)
+        vcolor.planes[i].format = dst->planes[i].format;
+
+    color_convert(&vcolor, color);
+
+    compute_surface_area(&dst_area, dst, &vdst_rect);
+
+    result = fill_area(ctx, &dst_area, &vcolor);
+    if (result != TEGRA_2D_OK)
+        return result;
+
+    if (ctx->base.dump_enable)
+        dump_dst(ctx, dst);
+
+    return TEGRA_2D_OK;
+}
diff --git a/tegra/2d/tegra_2d_fill.h b/tegra/2d/tegra_2d_fill.h
new file mode 100644
index 0000000..1d52baa
--- /dev/null
+++ b/tegra/2d/tegra_2d_fill.h
@@ -0,0 +1,36 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_FILL_H
+#define TEGRA_2D_FILL_H
+
+int
+fill2d(struct tegra_2d_ictx *ctx,
+       const struct tegra_2d_surface *dst,
+       const struct tegra_2d_surface_color *color,
+       const struct tegra_2d_rect *dst_rect);
+
+#endif // TEGRA_2D_FILL_H
diff --git a/tegra/2d/tegra_2d_frcopy.c b/tegra/2d/tegra_2d_frcopy.c
new file mode 100644
index 0000000..991d29d
--- /dev/null
+++ b/tegra/2d/tegra_2d_frcopy.c
@@ -0,0 +1,274 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include "tegra_drmif.h"
+#include "class_ids.h"
+#include "tegra_2d_frcopy.h"
+#include "tegra_2d_reg_g2sb.h"
+#include "tegra_2d_reg_host.h"
+
+uint32_t
+frcopy_num_words(const struct tegra_2d_frcopy *hw)
+{
+    return 1 + sizeof(hw->block) / sizeof(uint32_t);
+}
+
+uint32_t
+frcopy_num_relocs(const struct tegra_2d_frcopy *hw)
+{
+    return 2;
+}
+
+void
+frcopy_init(struct tegra_2d_frcopy *hw)
+{
+    ASSERT(hw);
+
+    hw->is_valid = 0;
+
+    GR2D_RESET(trigger);
+    GR2D_RESET(cmdsel);
+    GR2D_RESET(controlsecond);
+    GR2D_RESET(controlmain);
+    GR2D_RESET(tilemode);
+    GR2D_RESET(dstba);
+    GR2D_RESET(dstst);
+    GR2D_RESET(srcba);
+    GR2D_RESET(srcst);
+    GR2D_RESET(srcsize);
+
+    OPCODE_MASK2(op1,
+                 trigger,
+                 cmdsel);
+    OPCODE_MASK2(op2,
+                 controlsecond,
+                 controlmain);
+    OPCODE_NONINCR(op3, tilemode, 1);
+    OPCODE_MASK5(op4,
+                 dstba,
+                 dstst,
+                 srcba,
+                 srcst,
+                 srcsize);
+
+    GR2D_VAL(trigger, trigger, gr2d_srcsize_r());
+    GR2D_DEF(cmdsel, sbor2d, g2);
+    GR2D_DEF(controlsecond, fr_mode, src_dst_copy);
+    GR2D_DEF(controlsecond, fr_readwait, enable);
+    GR2D_DEF(controlmain, cmdt, bitblt);
+}
+
+static uint32_t
+compute_offset(const struct tegra_2d_plane *plane,
+               uint32_t xpos,
+               uint32_t ypos)
+{
+    uint32_t offset;
+    uint32_t bytes_per_pixel = TEGRA_2D_FORMAT_BYTES(plane->format);
+    uint32_t pixels_per_line = plane->pitch / bytes_per_pixel;
+
+    if (plane->layout == TEGRA_2D_LAYOUT_LINEAR)
+    {
+        offset  = ypos * plane->pitch;
+        offset += xpos * bytes_per_pixel;
+    }
+    else
+    {
+        uint32_t xb = xpos * bytes_per_pixel;
+        offset  = 16 * pixels_per_line * (ypos / 16);
+        offset += 256 * (xb / 16);
+        offset += 16 * (ypos % 16);
+        offset += xb % 16;
+    }
+
+    return plane->mem_offset + offset;
+}
+
+int
+frcopy_set(struct tegra_2d_frcopy *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_area *src,
+           enum tegra_2d_transform transform)
+{
+    uint32_t block_size;
+    uint32_t align_mask;
+    uint32_t dst_xpos = dst->xpos;
+    uint32_t dst_ypos = dst->ypos;
+    uint32_t src_xpos = src->xpos;
+    uint32_t src_ypos = src->ypos;
+    uint32_t src_width = src->width;
+    uint32_t src_height = src->height;
+
+    ASSERT(hw);
+
+    hw->is_valid = 0;
+
+    if (dst->plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    if (src->plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    if (src_width > 4096 || src_height > 4096)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (src->plane->format != dst->plane->format)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (!equal_size_area(src, dst, transform))
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    hw->dst_handle = dst->plane->mem_handle;
+    hw->dst_offset = compute_offset(dst->plane, dst_xpos, dst_ypos);
+    hw->src_handle = src->plane->mem_handle;
+    hw->src_offset = compute_offset(src->plane, src_xpos, src_ypos);
+
+    switch (transform)
+    {
+        #define CASE(transform, v) \
+        case TEGRA_2D_TRANSFORM_##transform:     \
+            GR2D_DEF(controlsecond, fr_type, v); \
+            break
+        CASE(IDENTITY,      identity);
+        CASE(ROT_90,        rot_90);
+        CASE(ROT_180,       rot_180);
+        CASE(ROT_270,       rot_270);
+        CASE(FLIP_X,        flip_x);
+        CASE(FLIP_Y,        flip_y);
+        CASE(TRANSPOSE,     trans_lr);
+        CASE(INV_TRANSPOSE, trans_rl);
+        #undef CASE
+        default:
+            ASSERT(0);
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    switch (TEGRA_2D_FORMAT_BITS(dst->plane->format))
+    {
+        #define CASE(v) \
+        case v:                                   \
+            GR2D_DEF(controlmain, dstcd, bpp##v); \
+            block_size = 128 / v;                 \
+            break
+        CASE(8);
+        CASE(16);
+        CASE(32);
+        #undef CASE
+        default:
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    align_mask = block_size - 1;
+    #define CHECK_ALIGNMENT(v) ((((uint32_t) v) & align_mask) != 0)
+    if (CHECK_ALIGNMENT(src_width)  ||
+        CHECK_ALIGNMENT(src_height) ||
+        CHECK_ALIGNMENT(src_xpos)   ||
+        CHECK_ALIGNMENT(src_ypos)   ||
+        CHECK_ALIGNMENT(dst_xpos)   ||
+        CHECK_ALIGNMENT(dst_ypos))
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+    #undef CHECK_ALIGNMENT
+
+    GR2D_DEF(controlmain, srccd, same);
+
+    if (dst->plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, dst_wr_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, dst_wr_tile_mode, linear);
+
+    if (src->plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, src_y_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, src_y_tile_mode, linear);
+
+    GR2D_VAL(dstst, dsts, dst->plane->pitch);
+    GR2D_VAL(srcst, srcs, src->plane->pitch);
+    GR2D_VAL(srcsize, srcwidth, src_width - 1);
+    GR2D_VAL(srcsize, srcheight, src_height - 1);
+
+    hw->is_valid = 1;
+    return TEGRA_2D_OK;
+}
+
+void
+frcopy_dispatch(const struct tegra_2d_frcopy *hw,
+                struct tegra_stream *stream)
+{
+    ASSERT(hw);
+    ASSERT(hw->is_valid);
+    ASSERT(stream);
+
+    tegra_stream_push_setclass(stream, NV_GRAPHICS_2D_CLASS_ID);
+
+    tegra_stream_push_words(stream,
+                            &hw->block,
+                            sizeof(hw->block) / sizeof(uint32_t),
+                            2,
+                            tegra_reloc(&hw->block.dstba,
+                                        hw->dst_handle,
+                                        hw->dst_offset),
+                            tegra_reloc(&hw->block.srcba,
+                                        hw->src_handle,
+                                        hw->src_offset));
+}
+
+void
+frcopy_dump(const struct tegra_2d_frcopy *hw)
+{
+    char buffer[1024];
+    int offset = 0;
+    int space = ARRAY_SIZE(buffer);
+
+    ASSERT(hw);
+
+    offset = snprintf(buffer, space, "G2 Copy:\n");
+
+    #define PRINT(reg) \
+        offset += snprintf(buffer + offset,        \
+                           MAX(0, space - offset), \
+                           "%18s: 0x%08x\n",       \
+                           #reg,                   \
+                           hw->block.reg)
+
+    PRINT(op1);
+    PRINT(trigger);
+    PRINT(cmdsel);
+    PRINT(op2);
+    PRINT(controlsecond);
+    PRINT(controlmain);
+    PRINT(op3);
+    PRINT(tilemode);
+    PRINT(op4);
+    PRINT(dstba);
+    PRINT(dstst);
+    PRINT(srcba);
+    PRINT(srcst);
+    PRINT(srcsize);
+
+    #undef PRINT
+
+    LOG("%s", buffer);
+}
diff --git a/tegra/2d/tegra_2d_frcopy.h b/tegra/2d/tegra_2d_frcopy.h
new file mode 100644
index 0000000..f0ca115
--- /dev/null
+++ b/tegra/2d/tegra_2d_frcopy.h
@@ -0,0 +1,85 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_FRCOPY_H
+#define TEGRA_2D_FRCOPY_H
+
+#include <stdint.h>
+#include "tegra_2d.h"
+#include "tegra_2d_util.h"
+
+struct tegra_2d_frcopy
+{
+    struct tegra_2d_frcopy_block
+    {
+        uint32_t op1;
+        uint32_t trigger;
+        uint32_t cmdsel;
+
+        uint32_t op2;
+        uint32_t controlsecond;
+        uint32_t controlmain;
+
+        uint32_t op3;
+        uint32_t tilemode;
+
+        uint32_t op4;
+        uint32_t dstba;
+        uint32_t dstst;
+        uint32_t srcba;
+        uint32_t srcst;
+        uint32_t srcsize;
+    } block;
+    int is_valid;
+    struct tegra_bo *dst_handle;
+    struct tegra_bo *src_handle;
+    int dst_offset;
+    int src_offset;
+};
+
+uint32_t
+frcopy_num_words(const struct tegra_2d_frcopy *hw);
+
+uint32_t
+frcopy_num_relocs(const struct tegra_2d_frcopy *hw);
+
+void
+frcopy_init(struct tegra_2d_frcopy *hw);
+
+int
+frcopy_set(struct tegra_2d_frcopy *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_area *src,
+           enum tegra_2d_transform transform);
+
+void
+frcopy_dispatch(const struct tegra_2d_frcopy *hw,
+                struct tegra_stream *stream);
+
+void
+frcopy_dump(const struct tegra_2d_frcopy *hw);
+
+#endif // TEGRA_2D_FRCOPY_H
diff --git a/tegra/2d/tegra_2d_g2copy.c b/tegra/2d/tegra_2d_g2copy.c
new file mode 100644
index 0000000..9dccf25
--- /dev/null
+++ b/tegra/2d/tegra_2d_g2copy.c
@@ -0,0 +1,272 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include "tegra_drmif.h"
+#include "class_ids.h"
+#include "tegra_2d_g2copy.h"
+#include "tegra_2d_reg_g2sb.h"
+#include "tegra_2d_reg_host.h"
+
+uint32_t
+g2copy_num_words(const struct tegra_2d_g2copy *hw)
+{
+    return 1 + sizeof(hw->block) / sizeof(uint32_t);
+}
+
+uint32_t
+g2copy_num_relocs(const struct tegra_2d_g2copy *hw)
+{
+    return 2;
+}
+
+void
+g2copy_init(struct tegra_2d_g2copy *hw)
+{
+    ASSERT(hw);
+
+    hw->is_valid = 0;
+
+    GR2D_RESET(trigger);
+    GR2D_RESET(cmdsel);
+    GR2D_RESET(controlsecond);
+    GR2D_RESET(controlmain);
+    GR2D_RESET(ropfade);
+    GR2D_RESET(tilemode);
+    GR2D_RESET(dstba);
+    GR2D_RESET(dstst);
+    GR2D_RESET(srcba);
+    GR2D_RESET(srcst);
+    GR2D_RESET(dstsize);
+    GR2D_RESET(srcps);
+    GR2D_RESET(dstps);
+
+    OPCODE_MASK2(op1,
+                 trigger,
+                 cmdsel);
+    OPCODE_MASK3(op2,
+                 controlsecond,
+                 controlmain,
+                 ropfade);
+    OPCODE_NONINCR(op3, tilemode, 1);
+    OPCODE_MASK7(op4,
+                 dstba,
+                 dstst,
+                 srcba,
+                 srcst,
+                 dstsize,
+                 srcps,
+                 dstps);
+
+    GR2D_VAL(trigger, trigger, gr2d_dstps_r());
+    GR2D_DEF(cmdsel, sbor2d, g2);
+    GR2D_DEF(controlmain, cmdt, bitblt);
+    GR2D_VAL(ropfade, rop, 0xCC);
+}
+
+int
+g2copy_set(struct tegra_2d_g2copy *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_area *src,
+           enum tegra_2d_transform transform)
+{
+    int transpose;
+    int flip_x;
+    int flip_y;
+    uint32_t max_width;
+    uint32_t dst_xpos = dst->xpos;
+    uint32_t dst_ypos = dst->ypos;
+    uint32_t dst_width = dst->width;
+    uint32_t dst_height = dst->height;
+    uint32_t src_xpos = src->xpos;
+    uint32_t src_ypos = src->ypos;
+
+    ASSERT(hw);
+    ASSERT(dst);
+    ASSERT(src);
+
+    hw->is_valid = 0;
+
+    if (dst->plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    if (src->plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    if (src->plane->format != dst->plane->format)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (!equal_size_area(src, dst, transform))
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    hw->dst_handle = dst->plane->mem_handle;
+    hw->dst_offset = dst->plane->mem_offset;
+    hw->src_handle = src->plane->mem_handle;
+    hw->src_offset = src->plane->mem_offset;
+
+    switch (transform)
+    {
+        #define CASE(transform, t, fx, fy) \
+        case TEGRA_2D_TRANSFORM_##transform: \
+            transpose = t;                  \
+            flip_x = fx;                    \
+            flip_y = fy;                    \
+            break
+        CASE(IDENTITY,      0, 0, 0);
+        CASE(ROT_90,        1, 0, 1);
+        CASE(ROT_180,       0, 1, 1);
+        CASE(ROT_270,       1, 1, 0);
+        CASE(FLIP_X,        0, 1, 0);
+        CASE(FLIP_Y,        0, 0, 1);
+        CASE(TRANSPOSE,     1, 0, 0);
+        CASE(INV_TRANSPOSE, 1, 1, 1);
+        #undef CASE
+        default:
+            ASSERT(0);
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    if (flip_x)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (transpose)
+        GR2D_DEF(controlmain, xytdw, enable);
+    else
+        GR2D_DEF(controlmain, xytdw, disable);
+
+    switch (TEGRA_2D_FORMAT_BITS(dst->plane->format))
+    {
+        #define CASE(v, max) \
+        case v:                                   \
+            GR2D_DEF(controlmain, dstcd, bpp##v); \
+            max_width = max;                      \
+            break
+        CASE(8,  32760);
+        CASE(16, 16384);
+        CASE(32, 8192);
+        #undef CASE
+        default:
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    if (dst_width > max_width)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    GR2D_DEF(controlmain, srccd, same);
+
+    if (dst->plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, dst_wr_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, dst_wr_tile_mode, linear);
+
+    if (src->plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, src_y_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, src_y_tile_mode, linear);
+
+    GR2D_VAL(dstst, dsts, dst->plane->pitch);
+    GR2D_VAL(srcst, srcs, src->plane->pitch);
+    GR2D_VAL(dstsize, dstwidth, dst_width);
+    GR2D_VAL(dstsize, dstheight, dst_height);
+    GR2D_VAL(srcps, srcx, src_xpos);
+    GR2D_VAL(srcps, srcy, src_ypos);
+    GR2D_VAL(dstps, dstx, dst_xpos);
+    if (flip_y)
+    {
+        GR2D_DEF(controlmain, yflip, enable);
+        GR2D_VAL(dstps, dsty, dst_ypos + dst_height - 1);
+    }
+    else
+    {
+        GR2D_DEF(controlmain, yflip, disable);
+        GR2D_VAL(dstps, dsty, dst_ypos);
+    }
+
+    hw->is_valid = 1;
+    return TEGRA_2D_OK;
+}
+
+void
+g2copy_dispatch(const struct tegra_2d_g2copy *hw,
+                struct tegra_stream *stream)
+{
+    ASSERT(hw);
+    ASSERT(hw->is_valid);
+    ASSERT(stream);
+
+    tegra_stream_push_setclass(stream, NV_GRAPHICS_2D_CLASS_ID);
+
+    tegra_stream_push_words(stream,
+                            &hw->block,
+                            sizeof(hw->block) / sizeof(uint32_t),
+                            2,
+                            tegra_reloc(&hw->block.dstba,
+                                        hw->dst_handle,
+                                        hw->dst_offset),
+                            tegra_reloc(&hw->block.srcba,
+                                        hw->src_handle,
+                                        hw->src_offset));
+}
+
+void
+g2copy_dump(const struct tegra_2d_g2copy *hw)
+{
+    char buffer[1024];
+    int offset = 0;
+    int space = ARRAY_SIZE(buffer);
+
+    ASSERT(hw);
+
+    offset = snprintf(buffer, space, "G2 Copy:\n");
+
+    #define PRINT(reg) \
+        offset += snprintf(buffer + offset,        \
+                           MAX(0, space - offset), \
+                           "%18s: 0x%08x\n",       \
+                           #reg,                   \
+                           hw->block.reg)
+
+    PRINT(op1);
+    PRINT(trigger);
+    PRINT(cmdsel);
+    PRINT(op2);
+    PRINT(controlsecond);
+    PRINT(controlmain);
+    PRINT(ropfade);
+    PRINT(op3);
+    PRINT(tilemode);
+    PRINT(op4);
+    PRINT(dstba);
+    PRINT(dstst);
+    PRINT(srcba);
+    PRINT(srcst);
+    PRINT(dstsize);
+    PRINT(srcps);
+    PRINT(dstps);
+
+    #undef PRINT
+
+    LOG("%s", buffer);
+}
diff --git a/tegra/2d/tegra_2d_g2copy.h b/tegra/2d/tegra_2d_g2copy.h
new file mode 100644
index 0000000..22f79bc
--- /dev/null
+++ b/tegra/2d/tegra_2d_g2copy.h
@@ -0,0 +1,88 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_G2COPY_H
+#define TEGRA_2D_G2COPY_H
+
+#include <stdint.h>
+#include "tegra_2d.h"
+#include "tegra_2d_util.h"
+
+struct tegra_2d_g2copy
+{
+    struct tegra_2d_g2copy_block
+    {
+        uint32_t op1;
+        uint32_t trigger;
+        uint32_t cmdsel;
+
+        uint32_t op2;
+        uint32_t controlsecond;
+        uint32_t controlmain;
+        uint32_t ropfade;
+
+        uint32_t op3;
+        uint32_t tilemode;
+
+        uint32_t op4;
+        uint32_t dstba;
+        uint32_t dstst;
+        uint32_t srcba;
+        uint32_t srcst;
+        uint32_t dstsize;
+        uint32_t srcps;
+        uint32_t dstps;
+    } block;
+    int is_valid;
+    struct tegra_bo *dst_handle;
+    struct tegra_bo *src_handle;
+    int dst_offset;
+    int src_offset;
+};
+
+uint32_t
+g2copy_num_words(const struct tegra_2d_g2copy *hw);
+
+uint32_t
+g2copy_num_relocs(const struct tegra_2d_g2copy *hw);
+
+void
+g2copy_init(struct tegra_2d_g2copy *hw);
+
+int
+g2copy_set(struct tegra_2d_g2copy *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_area *src,
+           enum tegra_2d_transform transform);
+
+void
+g2copy_dispatch(const struct tegra_2d_g2copy *hw,
+                struct tegra_stream *stream);
+
+void
+g2copy_dump(const struct tegra_2d_g2copy *hw);
+
+#endif // TEGRA_2D_G2COPY_H
diff --git a/tegra/2d/tegra_2d_g2fill.c b/tegra/2d/tegra_2d_g2fill.c
new file mode 100644
index 0000000..91987c0
--- /dev/null
+++ b/tegra/2d/tegra_2d_g2fill.c
@@ -0,0 +1,192 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include "tegra_drmif.h"
+#include "class_ids.h"
+#include "tegra_2d_g2fill.h"
+#include "tegra_2d_reg_g2sb.h"
+#include "tegra_2d_reg_host.h"
+
+uint32_t
+g2fill_num_words(const struct tegra_2d_g2fill *hw)
+{
+    return 1 + (sizeof(hw->block) / sizeof(uint32_t));
+}
+
+uint32_t
+g2fill_num_relocs(const struct tegra_2d_g2fill *hw)
+{
+    return 1;
+}
+
+void
+g2fill_init(struct tegra_2d_g2fill *hw)
+{
+    ASSERT(hw);
+
+    hw->is_valid = 0;
+
+    GR2D_RESET(trigger);
+    GR2D_RESET(cmdsel);
+    GR2D_RESET(controlsecond);
+    GR2D_RESET(controlmain);
+    GR2D_RESET(ropfade);
+    GR2D_RESET(dstba);
+    GR2D_RESET(dstst);
+    GR2D_RESET(srcfgc);
+    GR2D_RESET(dstsize);
+    GR2D_RESET(dstps);
+
+    OPCODE_MASK2(op1,
+                 trigger,
+                 cmdsel);
+    OPCODE_MASK3(op2,
+                 controlsecond,
+                 controlmain,
+                 ropfade);
+    OPCODE_MASK5(op3,
+                 dstba,
+                 dstst,
+                 srcfgc,
+                 dstsize,
+                 dstps);
+
+    GR2D_VAL(trigger, trigger, gr2d_dstps_r());
+    GR2D_DEF(cmdsel, sbor2d, g2);
+    GR2D_DEF(controlmain, cmdt, bitblt);
+    GR2D_DEF(controlmain, turbofill, enable);
+    GR2D_DEF(controlmain, srcsld, enable);
+    GR2D_VAL(ropfade, rop, 0xCC);
+}
+
+int
+g2fill_set(struct tegra_2d_g2fill *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_color *color)
+{
+    int max_width;
+    uint32_t dst_xpos = dst->xpos;
+    uint32_t dst_ypos = dst->ypos;
+    uint32_t dst_width = dst->width;
+    uint32_t dst_height = dst->height;
+
+    ASSERT(hw);
+    ASSERT(dst);
+    ASSERT(color);
+
+    hw->is_valid = 0;
+
+    if (dst->plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    hw->dst_handle = dst->plane->mem_handle;
+    hw->dst_offset = dst->plane->mem_offset;
+
+    switch (TEGRA_2D_FORMAT_BITS(dst->plane->format))
+    {
+        #define CASE(v, max) \
+        case v:                                   \
+            GR2D_DEF(controlmain, dstcd, bpp##v); \
+            max_width = max;                      \
+            break
+        CASE(8,  32760);
+        CASE(16, 16384);
+        CASE(32, 8192);
+        #undef CASE
+        default:
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    if (dst->width > max_width)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    GR2D_DEF(controlmain, srccd, same);
+    GR2D_VAL(dstst, dsts, dst->plane->pitch);
+    GR2D_VAL(srcfgc, srcfgc, color->value);
+    GR2D_VAL(dstsize, dstwidth, dst_width);
+    GR2D_VAL(dstsize, dstheight, dst_height);
+    GR2D_VAL(dstps, dstx, dst_xpos);
+    GR2D_VAL(dstps, dsty, dst_ypos);
+
+    hw->is_valid = 1;
+    return TEGRA_2D_OK;
+}
+
+void
+g2fill_dispatch(const struct tegra_2d_g2fill *hw,
+                struct tegra_stream *stream)
+{
+    ASSERT(hw);
+    ASSERT(hw->is_valid);
+    ASSERT(stream);
+
+    tegra_stream_push_setclass(stream, NV_GRAPHICS_2D_CLASS_ID);
+
+    tegra_stream_push_words(stream,
+                            &hw->block,
+                            sizeof(hw->block) / sizeof(uint32_t),
+                            1,
+                            tegra_reloc(&hw->block.dstba,
+                                        hw->dst_handle,
+                                        hw->dst_offset));
+}
+
+void
+g2fill_dump(const struct tegra_2d_g2fill *hw)
+{
+    char buffer[1024];
+    int offset = 0;
+    int space = ARRAY_SIZE(buffer);
+
+    ASSERT(hw);
+
+    offset = snprintf(buffer, space, "G2 Fill:\n");
+
+    #define PRINT(reg) \
+        offset += snprintf(buffer + offset,        \
+                           MAX(0, space - offset), \
+                           "%18s: 0x%08x\n",       \
+                           #reg,                   \
+                           hw->block.reg)
+
+    PRINT(op1);
+    PRINT(trigger);
+    PRINT(cmdsel);
+    PRINT(op2);
+    PRINT(controlsecond);
+    PRINT(controlmain);
+    PRINT(ropfade);
+    PRINT(op3);
+    PRINT(dstba);
+    PRINT(dstst);
+    PRINT(srcfgc);
+    PRINT(dstsize);
+    PRINT(dstps);
+
+    #undef PRINT
+
+    LOG("%s", buffer);
+}
diff --git a/tegra/2d/tegra_2d_g2fill.h b/tegra/2d/tegra_2d_g2fill.h
new file mode 100644
index 0000000..e0715bd
--- /dev/null
+++ b/tegra/2d/tegra_2d_g2fill.h
@@ -0,0 +1,80 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_G2FILL_H
+#define TEGRA_2D_G2FILL_H
+
+#include <stdint.h>
+#include "tegra_2d.h"
+#include "tegra_2d_util.h"
+
+struct tegra_2d_g2fill
+{
+    struct tegra_2d_g2fill_block
+    {
+        uint32_t op1;
+        uint32_t trigger;
+        uint32_t cmdsel;
+
+        uint32_t op2;
+        uint32_t controlsecond;
+        uint32_t controlmain;
+        uint32_t ropfade;
+
+        uint32_t op3;
+        uint32_t dstba;
+        uint32_t dstst;
+        uint32_t srcfgc;
+        uint32_t dstsize;
+        uint32_t dstps;
+    } block;
+    int is_valid;
+    struct tegra_bo *dst_handle;
+    int dst_offset;
+};
+
+uint32_t
+g2fill_num_words(const struct tegra_2d_g2fill *hw);
+
+uint32_t
+g2fill_num_relocs(const struct tegra_2d_g2fill *hw);
+
+void
+g2fill_init(struct tegra_2d_g2fill *hw);
+
+int
+g2fill_set(struct tegra_2d_g2fill *hw,
+           const struct tegra_2d_plane_area *dst,
+           const struct tegra_2d_plane_color *color);
+
+void
+g2fill_dispatch(const struct tegra_2d_g2fill *hw,
+                struct tegra_stream *stream);
+
+void
+g2fill_dump(const struct tegra_2d_g2fill *hw);
+
+#endif // TEGRA_2D_G2FILL_H
diff --git a/tegra/2d/tegra_2d_reg_g2sb.h b/tegra/2d/tegra_2d_reg_g2sb.h
new file mode 100644
index 0000000..cbe09b0
--- /dev/null
+++ b/tegra/2d/tegra_2d_reg_g2sb.h
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_REG_G2SB_H
+#define TEGRA_2D_REG_G2SB_H
+
+#include <stdint.h>
+#include "hw_gr2d.h"
+
+#define GR2D_RESET(reg) \
+    hw->block.reg = gr2d_##reg##_reset_val_v()
+
+#define GR2D_VAL(reg, field, value) \
+    hw->block.reg = (hw->block.reg & ~gr2d_##reg##_##field##_m()) \
+                  | gr2d_##reg##_##field##_f((value))
+
+#define GR2D_DEF(reg, field, def) \
+    hw->block.reg = (hw->block.reg & ~gr2d_##reg##_##field##_m()) \
+                  | gr2d_##reg##_##field##_f(gr2d_##reg##_##field##_##def##_v())
+
+static inline uint32_t gr2d_controlmain_yflip_disable_v(void)
+{
+    return gr2d_controlmain_yflip_dsiable_v();
+}
+static inline uint32_t gr2d_controlmain_turbofill_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_turbofill_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srccd_mono_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_srccd_same_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_xytdw_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_xytdw_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_srcdir_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_srcdir_enable_v(void)
+{
+	return 1;
+}
+static inline uint32_t gr2d_controlmain_dstdir_disable_v(void)
+{
+	return 0;
+}
+static inline uint32_t gr2d_controlmain_dstdir_enable_v(void)
+{
+	return 1;
+}
+
+#endif // TEGRA_2D_REG_G2SB_H
diff --git a/tegra/2d/tegra_2d_reg_host.h b/tegra/2d/tegra_2d_reg_host.h
new file mode 100644
index 0000000..228d9bb
--- /dev/null
+++ b/tegra/2d/tegra_2d_reg_host.h
@@ -0,0 +1,119 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_REG_HOST_H
+#define TEGRA_2D_REG_HOST_H
+
+#include <stdint.h>
+#include "host1x01_hardware.h"
+#include "hw_gr2d.h"
+#include "tegra_2d_util.h"
+
+#define ADDR(reg) gr2d_##reg##_r()
+
+#define OPCODE_INCR(word, reg, count) \
+    hw->block.op = nvhost_opcode_nonincr(ADDR(reg), count)
+
+#define OPCODE_NONINCR(op, reg, count) \
+    hw->block.op = nvhost_opcode_nonincr(ADDR(reg), count)
+
+#define OPCODE_MASK(op, addr, mask) \
+    CT_ASSERT((mask) <= 0xffff);          \
+    hw->block.op = nvhost_opcode_mask(addr, mask)
+
+#define OPCODE_MASK2(op, reg0, reg1) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                \
+    CT_ASSERT(ADDR(reg1) - ADDR(reg0) < 16);           \
+    OPCODE_MASK(op, ADDR(reg0),                        \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)))
+
+#define OPCODE_MASK3(op, reg0, reg1, reg2) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                \
+    CT_ASSERT(ADDR(reg1) < ADDR(reg2));                \
+    CT_ASSERT(ADDR(reg2) - ADDR(reg0) < 16);           \
+    OPCODE_MASK(op, ADDR(reg0),                        \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg2)))
+
+#define OPCODE_MASK4(op, reg0, reg1, reg2, reg3) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                \
+    CT_ASSERT(ADDR(reg1) < ADDR(reg2));                \
+    CT_ASSERT(ADDR(reg2) < ADDR(reg3));                \
+    CT_ASSERT(ADDR(reg3) - ADDR(reg0) < 16);           \
+    OPCODE_MASK(op, ADDR(reg0),                        \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg2)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg3)))
+
+#define OPCODE_MASK5(op, reg0, reg1, reg2, reg3, reg4) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                \
+    CT_ASSERT(ADDR(reg1) < ADDR(reg2));                \
+    CT_ASSERT(ADDR(reg2) < ADDR(reg3));                \
+    CT_ASSERT(ADDR(reg3) < ADDR(reg4));                \
+    CT_ASSERT(ADDR(reg4) - ADDR(reg0) < 16);           \
+    OPCODE_MASK(op, ADDR(reg0),                        \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg2)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg3)) | \
+                nvhost_mask2(ADDR(reg0), ADDR(reg4)))
+
+#define OPCODE_MASK6(op, reg0, reg1, reg2, reg3, reg4, reg5) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                      \
+    CT_ASSERT(ADDR(reg1) < ADDR(reg2));                      \
+    CT_ASSERT(ADDR(reg2) < ADDR(reg3));                      \
+    CT_ASSERT(ADDR(reg3) < ADDR(reg4));                      \
+    CT_ASSERT(ADDR(reg4) < ADDR(reg5));                      \
+    CT_ASSERT(ADDR(reg5) - ADDR(reg0) < 16);                 \
+    OPCODE_MASK(op, ADDR(reg0),                              \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) |       \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)) |       \
+                nvhost_mask2(ADDR(reg0), ADDR(reg2)) |       \
+                nvhost_mask2(ADDR(reg0), ADDR(reg3)) |       \
+                nvhost_mask2(ADDR(reg0), ADDR(reg4)) |       \
+                nvhost_mask2(ADDR(reg0), ADDR(reg5)))
+
+#define OPCODE_MASK7(op, reg0, reg1, reg2, reg3, reg4, reg5, reg6) \
+    CT_ASSERT(ADDR(reg0) < ADDR(reg1));                            \
+    CT_ASSERT(ADDR(reg1) < ADDR(reg2));                            \
+    CT_ASSERT(ADDR(reg2) < ADDR(reg3));                            \
+    CT_ASSERT(ADDR(reg3) < ADDR(reg4));                            \
+    CT_ASSERT(ADDR(reg4) < ADDR(reg5));                            \
+    CT_ASSERT(ADDR(reg5) < ADDR(reg6));                            \
+    CT_ASSERT(ADDR(reg6) - ADDR(reg0) < 16);                       \
+    OPCODE_MASK(op, ADDR(reg0),                                    \
+                nvhost_mask2(ADDR(reg0), ADDR(reg0)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg1)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg2)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg3)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg4)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg5)) |             \
+                nvhost_mask2(ADDR(reg0), ADDR(reg6)))
+
+#endif // TEGRA_2D_REG_HOST_H
diff --git a/tegra/2d/tegra_2d_sbcopy.c b/tegra/2d/tegra_2d_sbcopy.c
new file mode 100644
index 0000000..9b858ff
--- /dev/null
+++ b/tegra/2d/tegra_2d_sbcopy.c
@@ -0,0 +1,388 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include "tegra_drmif.h"
+#include "class_ids.h"
+#include "tegra_2d_sbcopy.h"
+#include "tegra_2d_reg_g2sb.h"
+#include "tegra_2d_reg_host.h"
+
+uint32_t
+sbcopy_num_words(const struct tegra_2d_sbcopy *hw)
+{
+    return 1 + sizeof(hw->block) / sizeof(uint32_t);
+}
+
+uint32_t
+sbcopy_num_relocs(const struct tegra_2d_sbcopy *hw)
+{
+    return 4;
+}
+
+void
+sbcopy_init(struct tegra_2d_sbcopy *hw)
+{
+    ASSERT(hw);
+
+    hw->is_valid = 0;
+
+    GR2D_RESET(trigger);
+    GR2D_RESET(cmdsel);
+    GR2D_RESET(vdda);
+    GR2D_RESET(vddaini);
+    GR2D_RESET(hdda);
+    GR2D_RESET(hddainils);
+    GR2D_RESET(sbformat);
+    GR2D_RESET(controlsb);
+    GR2D_RESET(controlsecond);
+    GR2D_RESET(controlmain);
+    GR2D_RESET(dstba);
+    GR2D_RESET(tilemode);
+    GR2D_RESET(srcba_sb_surfbase);
+    GR2D_RESET(dstba_sb_surfbase);
+    GR2D_RESET(dstst);
+    GR2D_RESET(srcba);
+    GR2D_RESET(srcst);
+    GR2D_RESET(srcsize);
+    GR2D_RESET(dstsize);
+
+    OPCODE_MASK6(op1,
+                 trigger,
+                 cmdsel,
+                 vdda,
+                 vddaini,
+                 hdda,
+                 hddainils);
+    OPCODE_MASK5(op2,
+                 sbformat,
+                 controlsb,
+                 controlsecond,
+                 controlmain,
+                 dstba);
+    OPCODE_MASK3(op3,
+                 tilemode,
+                 srcba_sb_surfbase,
+                 dstba_sb_surfbase);
+    OPCODE_MASK5(op4,
+                 dstst,
+                 srcba,
+                 srcst,
+                 srcsize,
+                 dstsize);
+
+    GR2D_VAL(trigger, trigger, gr2d_dstsize_r());
+    GR2D_DEF(cmdsel, sbor2d, sb);
+    GR2D_DEF(controlmain, cmdt, bitblt);
+    GR2D_DEF(controlmain, srcdir, enable);
+    GR2D_DEF(controlmain, dstdir, enable);
+}
+
+int
+sbcopy_set(struct tegra_2d_sbcopy *hw,
+           const struct tegra_2d_surface_area *dst,
+           const struct tegra_2d_surface_area *src,
+           enum tegra_2d_transform transform)
+{
+    int transpose;
+    int flip_x;
+    int flip_y;
+    float inv_scale_x;
+    float inv_scale_y;
+    uint32_t dst_xpos = dst->planes[0].xpos;
+    uint32_t dst_ypos = dst->planes[0].ypos;
+    uint32_t dst_width = dst->planes[0].width;
+    uint32_t dst_height = dst->planes[0].height;
+    uint32_t src_xpos = src->planes[0].xpos;
+    uint32_t src_ypos = src->planes[0].ypos;
+    uint32_t src_width = src->planes[0].width;
+    uint32_t src_height = src->planes[0].height;
+
+    ASSERT(hw);
+    ASSERT(dst);
+    ASSERT(src);
+
+    hw->is_valid = 0;
+
+    if (dst->surface->num_planes > 1)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (src->surface->num_planes > 1)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    if (dst->planes[0].plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    if (src->planes[0].plane->mem_handle == NULL)
+        return TEGRA_2D_INVALID_BUFFER;
+
+    hw->dst_handle = dst->planes[0].plane->mem_handle;
+    hw->dst_offset = dst->planes[0].plane->mem_offset +
+                     (TEGRA_2D_FORMAT_BYTES(dst->planes[0].plane->format) *
+                      dst_xpos) +
+                     (dst->planes[0].plane->pitch * dst_ypos);
+    hw->src_handle = src->planes[0].plane->mem_handle;
+    hw->src_offset = src->planes[0].plane->mem_offset +
+                     (TEGRA_2D_FORMAT_BYTES(src->planes[0].plane->format) *
+                      src_xpos) +
+                     (src->planes[0].plane->pitch * src_ypos);
+
+    switch (transform)
+    {
+        #define CASE(transform, t, fx, fy) \
+        case TEGRA_2D_TRANSFORM_##transform: \
+            transpose = t;                   \
+            flip_x = fx;                     \
+            flip_y = fy;                     \
+            break
+        CASE(IDENTITY,      0, 0, 0);
+        CASE(ROT_90,        1, 0, 1);
+        CASE(ROT_180,       0, 1, 1);
+        CASE(ROT_270,       1, 1, 0);
+        CASE(FLIP_X,        0, 1, 0);
+        CASE(FLIP_Y,        0, 0, 1);
+        CASE(TRANSPOSE,     1, 0, 0);
+        CASE(INV_TRANSPOSE, 1, 1, 1);
+        #undef CASE
+        default:
+            ASSERT(0);
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    if (flip_x)
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+
+    #define FMT(sf, df) \
+        (TEGRA_2D_FORMAT_ID(sf) | (TEGRA_2D_FORMAT_ID(df) << 16))
+
+    switch (FMT(src->planes[0].plane->format, dst->planes[0].plane->format))
+    {
+        #define CASE(sf, df, sif, dif) \
+            case FMT(TEGRA_2D_FORMAT_##sf, TEGRA_2D_FORMAT_##df): \
+                GR2D_DEF(sbformat, sifmt, sif); \
+                GR2D_DEF(sbformat, difmt, dif); \
+                break
+        CASE(R5G6B5,   R5G6B5,   b5g6r5,   b5g6r5);
+        CASE(R5G6B5,   A1R5G5B5, b5g6r5,   b5g6r5bs);
+        CASE(R5G6B5,   A8B8G8R8, b5g6r5,   r8g8b8a8);
+        CASE(R5G6B5,   A8R8G8B8, b5g6r5,   b8g8r8a8);
+        CASE(A1R5G5B5, R5G6B5,   b5g6r5bs, b5g6r5);
+        CASE(A1R5G5B5, A1R5G5B5, b5g6r5bs, b5g6r5bs);
+        CASE(A1R5G5B5, A8B8G8R8, b5g6r5bs, r8g8b8a8);
+        CASE(A1R5G5B5, A8R8G8B8, b5g6r5bs, b8g8r8a8);
+        CASE(A8B8G8R8, R5G6B5,   r8g8b8a8, b5g6r5);
+        CASE(A8B8G8R8, A1R5G5B5, r8g8b8a8, b5g6r5bs);
+        CASE(A8B8G8R8, A8B8G8R8, r8g8b8a8, r8g8b8a8);
+        CASE(A8B8G8R8, A8R8G8B8, r8g8b8a8, b8g8r8a8);
+        CASE(A8R8G8B8, R5G6B5,   b8g8r8a8, b5g6r5);
+        CASE(A8R8G8B8, A1R5G5B5, b8g8r8a8, b5g6r5bs);
+        CASE(A8R8G8B8, A8B8G8R8, b8g8r8a8, r8g8b8a8);
+        CASE(A8R8G8B8, A8R8G8B8, b8g8r8a8, b8g8r8a8);
+        #undef CASE
+        default:
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    if (transpose)
+    {
+        GR2D_DEF(controlmain, xytdw, enable);
+        inv_scale_x = ((float) src->planes[0].width - 1) /
+                      (dst->planes[0].height - 1);
+        inv_scale_y = ((float) src->planes[0].height - 1) /
+                      (dst->planes[0].width - 1);
+    }
+    else
+    {
+        GR2D_DEF(controlmain, xytdw, disable);
+        inv_scale_x = ((float) src->planes[0].width - 1) /
+                      (dst->planes[0].width - 1);
+        inv_scale_y = ((float) src->planes[0].height - 1) /
+                      (dst->planes[0].height - 1);
+    }
+
+    #define CHECK_SCALE(inv) \
+    if (inv > 64.0f || inv < 1.0f/4096.0f) \
+        return TEGRA_2D_UNSUPPORTED_BLIT;
+    CHECK_SCALE(inv_scale_x);
+    CHECK_SCALE(inv_scale_y);
+    #undef CHECK_SCALE
+
+    GR2D_DEF(controlsb, discsc, disable);
+
+    if (inv_scale_x == 1.0f)
+        GR2D_DEF(controlsb, hftype, disable);
+    else if (inv_scale_x < 1.0f)
+        GR2D_DEF(controlsb, hftype, interp);
+    else if (inv_scale_x < 1.3f)
+        GR2D_DEF(controlsb, hftype, lpf1);
+    else if (inv_scale_x < 2.0f)
+        GR2D_DEF(controlsb, hftype, lpf3);
+    else
+        GR2D_DEF(controlsb, hftype, lpf6);
+
+    if (inv_scale_y == 1.0f)
+    {
+        GR2D_DEF(controlsb, vfen, disable);
+    }
+    else
+    {
+        GR2D_DEF(controlsb, vfen, enable);
+
+        if (inv_scale_y < 1.0f)
+            GR2D_DEF(controlsb, vftype, interp);
+        else if (inv_scale_y < 1.3f)
+            GR2D_DEF(controlsb, vftype, avg25_interp75);
+        else if (inv_scale_y < 2.0f)
+            GR2D_DEF(controlsb, vftype, avg50_interp50);
+        else
+            GR2D_DEF(controlsb, vftype, avg);
+    }
+
+    if (flip_y)
+    {
+        GR2D_DEF(controlmain, yflip, enable);
+        hw->dst_offset += dst->planes[0].plane->pitch *
+                          (dst->planes[0].height - 1);
+    }
+    else
+    {
+        GR2D_DEF(controlmain, yflip, disable);
+    }
+
+    switch (TEGRA_2D_FORMAT_BITS(dst->planes[0].plane->format))
+    {
+        #define CASE(v) \
+        case v:                                   \
+            GR2D_DEF(controlmain, dstcd, bpp##v); \
+            break
+        CASE(8);
+        CASE(16);
+        CASE(32);
+        #undef CASE
+        default:
+            return TEGRA_2D_UNSUPPORTED_BLIT;
+    }
+
+    GR2D_VAL(vdda, vdstep, FLOAT_TO_FIXED_6_12(inv_scale_y));
+    GR2D_VAL(vddaini, vdtini, FLOAT_TO_FIXED_0_8(src->planes[0].ypos));
+    GR2D_VAL(hdda, hdstep, FLOAT_TO_FIXED_6_12(inv_scale_x));
+    GR2D_VAL(hddainils, hdini, FLOAT_TO_FIXED_0_8(src->planes[0].xpos));
+
+
+    if (dst->planes[0].plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, dst_wr_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, dst_wr_tile_mode, linear);
+
+    if (src->planes[0].plane->layout == TEGRA_2D_LAYOUT_TILED)
+        GR2D_DEF(tilemode, src_y_tile_mode, tiled);
+    else
+        GR2D_DEF(tilemode, src_y_tile_mode, linear);
+
+    GR2D_VAL(dstst, dsts, dst->planes[0].plane->pitch);
+    GR2D_VAL(srcst, srcs, src->planes[0].plane->pitch);
+    GR2D_VAL(srcsize, srcwidth, src_width);
+    GR2D_VAL(srcsize, srcheight, src_height - 1);
+    GR2D_VAL(dstsize, dstwidth, dst_width);
+    GR2D_VAL(dstsize, dstheight, dst_height - 1);
+
+    hw->is_valid = 1;
+    return TEGRA_2D_OK;
+}
+
+void
+sbcopy_dispatch(const struct tegra_2d_sbcopy *hw,
+                struct tegra_stream *stream)
+{
+    ASSERT(hw);
+    ASSERT(hw->is_valid);
+    ASSERT(stream);
+
+    tegra_stream_push_setclass(stream, NV_GRAPHICS_2D_SB_CLASS_ID);
+
+    tegra_stream_push_words(stream,
+                            &hw->block,
+                            sizeof(hw->block) / sizeof(uint32_t),
+                            4,
+                            tegra_reloc(&hw->block.dstba,
+                                        hw->dst_handle,
+                                        hw->dst_offset),
+                            tegra_reloc(&hw->block.srcba_sb_surfbase,
+                                        hw->src_handle,
+                                        hw->src_offset),
+                            tegra_reloc(&hw->block.dstba_sb_surfbase,
+                                        hw->dst_handle,
+                                        hw->dst_offset),
+                            tegra_reloc(&hw->block.srcba,
+                                        hw->src_handle,
+                                        hw->src_offset));
+}
+
+void
+sbcopy_dump(const struct tegra_2d_sbcopy *hw)
+{
+    char buffer[1024];
+    int offset = 0;
+    int space = ARRAY_SIZE(buffer);
+
+    ASSERT(hw);
+
+    offset = snprintf(buffer, space, "G2 Copy:\n");
+
+    #define PRINT(reg) \
+        offset += snprintf(buffer + offset,        \
+                           MAX(0, space - offset), \
+                           "%18s: 0x%08x\n",       \
+                           #reg,                   \
+                           hw->block.reg)
+
+    PRINT(op1);
+    PRINT(trigger);
+    PRINT(cmdsel);
+    PRINT(vdda);
+    PRINT(vddaini);
+    PRINT(hdda);
+    PRINT(hddainils);
+    PRINT(op2);
+    PRINT(sbformat);
+    PRINT(controlsb);
+    PRINT(controlsecond);
+    PRINT(controlmain);
+    PRINT(dstba);
+    PRINT(op3);
+    PRINT(tilemode);
+    PRINT(srcba_sb_surfbase);
+    PRINT(dstba_sb_surfbase);
+    PRINT(op4);
+    PRINT(dstst);
+    PRINT(srcba);
+    PRINT(srcst);
+    PRINT(srcsize);
+    PRINT(dstsize);
+
+    #undef PRINT
+
+    LOG("%s", buffer);
+}
diff --git a/tegra/2d/tegra_2d_sbcopy.h b/tegra/2d/tegra_2d_sbcopy.h
new file mode 100644
index 0000000..38abad2
--- /dev/null
+++ b/tegra/2d/tegra_2d_sbcopy.h
@@ -0,0 +1,94 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_SBCOPY_H
+#define TEGRA_2D_SBCOPY_H
+
+#include <stdint.h>
+#include "tegra_2d.h"
+#include "tegra_2d_util.h"
+
+struct tegra_2d_sbcopy
+{
+    struct tegra_2d_sbcopy_block
+    {
+        uint32_t op1;
+        uint32_t trigger;
+        uint32_t cmdsel;
+        uint32_t vdda;
+        uint32_t vddaini;
+        uint32_t hdda;
+        uint32_t hddainils;
+
+        uint32_t op2;
+        uint32_t sbformat;
+        uint32_t controlsb;
+        uint32_t controlsecond;
+        uint32_t controlmain;
+        uint32_t dstba;
+
+        uint32_t op3;
+        uint32_t tilemode;
+        uint32_t srcba_sb_surfbase;
+        uint32_t dstba_sb_surfbase;
+
+        uint32_t op4;
+        uint32_t dstst;
+        uint32_t srcba;
+        uint32_t srcst;
+        uint32_t srcsize;
+        uint32_t dstsize;
+    } block;
+    int is_valid;
+    struct tegra_bo *dst_handle;
+    struct tegra_bo *src_handle;
+    int dst_offset;
+    int src_offset;
+};
+
+uint32_t
+sbcopy_num_words(const struct tegra_2d_sbcopy *hw);
+
+uint32_t
+sbcopy_num_relocs(const struct tegra_2d_sbcopy *hw);
+
+void
+sbcopy_init(struct tegra_2d_sbcopy *hw);
+
+int
+sbcopy_set(struct tegra_2d_sbcopy *hw,
+           const struct tegra_2d_surface_area *dst,
+           const struct tegra_2d_surface_area *src,
+           enum tegra_2d_transform transform);
+
+void
+sbcopy_dispatch(const struct tegra_2d_sbcopy *hw,
+                struct tegra_stream *stream);
+
+void
+sbcopy_dump(const struct tegra_2d_sbcopy *hw);
+
+#endif // TEGRA_2D_SBCOPY_H
diff --git a/tegra/2d/tegra_2d_surface.c b/tegra/2d/tegra_2d_surface.c
new file mode 100644
index 0000000..5d64adc
--- /dev/null
+++ b/tegra/2d/tegra_2d_surface.c
@@ -0,0 +1,280 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include "tegra_2d.h"
+#include "tegra_2d_context.h"
+#include "tegra_2d_surface.h"
+#include "tegra_2d_color.h"
+#include "tegra_2d_util.h"
+
+int
+compute_requirements(const struct tegra_2d_plane *plane,
+                     uint32_t *num_bytes,
+                     uint32_t *alignment,
+                     uint32_t *pitch)
+{
+    uint32_t num_lines;
+    uint32_t bytes_per_line;
+    uint32_t bytes_per_pixel;
+
+    if (plane == NULL ||
+        num_bytes == NULL ||
+        alignment == NULL ||
+        pitch == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    num_lines = plane->height + 1;
+    bytes_per_pixel = TEGRA_2D_FORMAT_BYTES(plane->format);
+
+    if (plane->layout == TEGRA_2D_LAYOUT_LINEAR)
+    {
+        *alignment = 16;
+        bytes_per_line = ROUND_UP(plane->width * bytes_per_pixel, 32);
+    }
+    else
+    {
+        *alignment = 256;
+        bytes_per_line = ROUND_UP(plane->width * bytes_per_pixel, 64);
+    }
+
+    *pitch = bytes_per_line;
+    *num_bytes = (num_lines * bytes_per_line) + bytes_per_pixel;
+
+    return TEGRA_2D_OK;
+}
+
+int
+allocate_surface(struct tegra_2d_ictx *ctx,
+                 struct tegra_2d_surface *surface)
+{
+    int i;
+    int result;
+    uint32_t num_bytes = 0;
+    uint32_t alignment = 1;
+    struct tegra_bo *mem_handle;
+
+    ASSERT(ctx);
+
+    if (surface == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    for (i=0; i<surface->num_planes; ++i)
+    {
+        uint32_t nb, a, p;
+        struct tegra_2d_plane *plane = &surface->planes[i];
+
+        result = compute_requirements(plane, &nb, &a, &p);
+        if (result != TEGRA_2D_OK)
+            return result;
+
+        num_bytes = ROUND_UP(num_bytes, a);
+
+        plane->pitch = p;
+        plane->mem_handle = NULL;
+        plane->mem_offset = num_bytes;
+
+        num_bytes += nb;
+        alignment = MAX(alignment, a);
+    }
+
+    mem_handle = tegra_bo_allocate(ctx->device,
+                                   num_bytes,
+                                   alignment);
+    if (mem_handle == NULL)
+        return TEGRA_2D_MEMORY_FAILURE;
+
+    for (i=0; i<surface->num_planes; ++i)
+        surface->planes[i].mem_handle = mem_handle;
+
+    return TEGRA_2D_OK;
+}
+
+void
+free_surface(struct tegra_2d_ictx *ctx,
+             struct tegra_2d_surface *surface)
+{
+    int i;
+
+    ASSERT(ctx);
+
+    if (surface == NULL)
+        return;
+
+    tegra_bo_free(surface->planes[0].mem_handle);
+
+    for (i=0; i<surface->num_planes; ++i)
+        surface->planes[i].mem_handle = NULL;
+}
+
+int
+dump_surface(struct tegra_2d_ictx *ctx,
+             const struct tegra_2d_surface *surface,
+             const char *filename)
+{
+    int i;
+    int result;
+    FILE *fp;
+
+    ASSERT(ctx);
+
+    if (surface == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    if (filename == NULL)
+        return TEGRA_2D_INVALID_PARAMETER;
+
+    LOG("Dumping: %s\n", filename);
+
+    fp = fopen(filename, "wb");
+    if (fp == NULL)
+        return TEGRA_2D_FILE_FAILURE;
+
+    result = TEGRA_2D_OK;
+
+    for (i=0; i<surface->num_planes; ++i)
+    {
+        void *ptr;
+        uint8_t *src;
+        uint32_t bytes_per_pixel;
+        uint32_t bytes_per_line;
+        uint32_t num_lines;
+        const struct tegra_2d_plane *plane = &surface->planes[i];
+
+        if (plane->mem_handle == NULL)
+        {
+            result = TEGRA_2D_INVALID_BUFFER;
+            goto exit;
+        }
+
+        bytes_per_pixel = TEGRA_2D_FORMAT_BYTES(plane->format);
+        bytes_per_line = plane->width * bytes_per_pixel;
+        num_lines = plane->height;
+
+        ptr = tegra_bo_map(plane->mem_handle);
+        if (ptr == NULL)
+        {
+            result = TEGRA_2D_MEMORY_FAILURE;
+            goto exit;
+        }
+
+        src = ((uint8_t *) ptr) + plane->mem_offset;
+
+        while (num_lines > 0)
+        {
+            fwrite(src, 1, bytes_per_line, fp);
+            src += plane->pitch;
+            --num_lines;
+        }
+
+        tegra_bo_unmap(plane->mem_handle);
+    }
+
+exit:
+    fclose(fp);
+    return result;
+}
+
+static void
+compute_dump_name(char *buffer,
+                  size_t buffer_size,
+                  const struct tegra_2d_surface *surface,
+                  const char *label,
+                  const char *prefix,
+                  int counter)
+{
+    int i;
+    int offset = 0;
+    int space = buffer_size;
+
+    offset += snprintf(buffer + offset,
+                       MAX(0, space - offset),
+                       "%stegra_2d_%d_%s_",
+                       prefix,
+                       counter,
+                       label);
+
+    for (i=0; i<surface->num_planes; ++i)
+    {
+        offset += snprintf(buffer + offset,
+                           MAX(0, space - offset),
+                           "%s%dx%dx%s",
+                           i == 0 ? "" : "-",
+                           surface->planes[i].width,
+                           surface->planes[i].height,
+                           format_to_str(surface->planes[i].format));
+    }
+
+    offset += snprintf(buffer + offset,
+                       MAX(0, space - offset),
+                       ".raw");
+}
+
+void
+dump_src(struct tegra_2d_ictx *ctx,
+         const struct tegra_2d_surface *src)
+{
+    char filename[FILENAME_MAX];
+
+    ASSERT(ctx);
+    ASSERT(src);
+
+    compute_dump_name(filename,
+                      ARRAY_SIZE(filename),
+                      src,
+                      "src",
+                      ctx->base.dump_prefix,
+                      ctx->base.dump_counter);
+
+    tegra_fence_wait(ctx->channel, &ctx->pre_fence);
+
+    dump_surface(ctx, src, filename);
+}
+
+void
+dump_dst(struct tegra_2d_ictx *ctx,
+         const struct tegra_2d_surface *dst)
+{
+    char filename[FILENAME_MAX];
+
+    ASSERT(ctx);
+    ASSERT(dst);
+
+    compute_dump_name(filename,
+                      ARRAY_SIZE(filename),
+                      dst,
+                      "dst",
+                      ctx->base.dump_prefix,
+                      ctx->base.dump_counter);
+
+    flush2d(ctx);
+    tegra_fence_wait(ctx->channel, &ctx->post_fence);
+
+    dump_surface(ctx, dst, filename);
+
+    ++ctx->base.dump_counter;
+}
diff --git a/tegra/2d/tegra_2d_surface.h b/tegra/2d/tegra_2d_surface.h
new file mode 100644
index 0000000..8e3dc1e
--- /dev/null
+++ b/tegra/2d/tegra_2d_surface.h
@@ -0,0 +1,57 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_SURFACE_H
+#define TEGRA_2D_SURFACE_H
+
+int
+compute_requirements(const struct tegra_2d_plane *plane,
+                     uint32_t *num_bytes,
+                     uint32_t *alignment,
+                     uint32_t *pitch);
+
+int
+allocate_surface(struct tegra_2d_ictx *ctx,
+                 struct tegra_2d_surface *surface);
+
+void
+free_surface(struct tegra_2d_ictx *ctx,
+             struct tegra_2d_surface *surface);
+
+int
+dump_surface(struct tegra_2d_ictx *ctx,
+             const struct tegra_2d_surface *surface,
+             const char *filename);
+
+void
+dump_src(struct tegra_2d_ictx *ctx,
+         const struct tegra_2d_surface *src);
+
+void
+dump_dst(struct tegra_2d_ictx *ctx,
+         const struct tegra_2d_surface *dst);
+
+#endif // TEGRA_2D_SURFACE_H
diff --git a/tegra/2d/tegra_2d_util.c b/tegra/2d/tegra_2d_util.c
new file mode 100644
index 0000000..ea2e407
--- /dev/null
+++ b/tegra/2d/tegra_2d_util.c
@@ -0,0 +1,145 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include "tegra_2d.h"
+#include "tegra_2d_util.h"
+
+void
+compute_surface_area(struct tegra_2d_surface_area *area,
+                     const struct tegra_2d_surface *surface,
+                     const struct tegra_2d_rect *rect)
+{
+    int i;
+    float xpos;
+    float ypos;
+    float width;
+    float height;
+
+    ASSERT(area);
+    ASSERT(surface);
+    ASSERT(rect);
+
+    area->surface = surface;
+
+    xpos   = rect->left;
+    ypos   = rect->top;
+    width  = RECT_WIDTH(*rect);
+    height = RECT_HEIGHT(*rect);
+
+    for (i=0; i<surface->num_planes; ++i)
+    {
+        const struct tegra_2d_plane *p = &surface->planes[i];
+        struct tegra_2d_plane_area *pa = &area->planes[i];
+
+        pa->plane = p;
+        pa->xpos   = (xpos * p->width) / surface->planes[0].width;
+        pa->ypos   = (ypos * p->height) / surface->planes[0].height;
+        pa->width  = (width * p->width) / surface->planes[0].width;
+        pa->height = (height * p->height) / surface->planes[0].height;
+    }
+}
+
+int
+validate_rect(const struct tegra_2d_surface *surface,
+              const struct tegra_2d_rect *rect)
+{
+    if (rect->left < 0 ||
+        rect->left >= rect->right ||
+        rect->top < 0 ||
+        rect->top >= rect->bottom ||
+        rect->right > surface->planes[0].width ||
+        rect->bottom > surface->planes[0].height)
+        return TEGRA_2D_INVALID_RECT;
+
+    return TEGRA_2D_OK;
+}
+
+int
+transform_swaps_xy(enum tegra_2d_transform transform)
+{
+    switch (transform)
+    {
+        case TEGRA_2D_TRANSFORM_ROT_90:
+        case TEGRA_2D_TRANSFORM_ROT_270:
+        case TEGRA_2D_TRANSFORM_TRANSPOSE:
+        case TEGRA_2D_TRANSFORM_INV_TRANSPOSE:
+            return 1;
+        default:
+        case TEGRA_2D_TRANSFORM_IDENTITY:
+        case TEGRA_2D_TRANSFORM_ROT_180:
+        case TEGRA_2D_TRANSFORM_FLIP_X:
+        case TEGRA_2D_TRANSFORM_FLIP_Y:
+            return 0;
+    }
+}
+
+int
+equal_size_area(const struct tegra_2d_plane_area *a,
+                const struct tegra_2d_plane_area *b,
+                enum tegra_2d_transform transform)
+{
+    #define CHECK(fa, fb) \
+        if (fabs(fa - fb) >= 0.001f) \
+            return 0
+
+    if (transform_swaps_xy(transform))
+    {
+        CHECK(a->width, b->height);
+        CHECK(a->height, b->width);
+    }
+    else
+    {
+        CHECK(a->width, b->width);
+        CHECK(b->height, b->height);
+    }
+
+    #undef CHECK
+
+    return 1;
+}
+
+const char *
+result_to_str(enum tegra_2d_result result)
+{
+    switch (result)
+    {
+        #define CASE(r) case TEGRA_2D_##r: return #r
+            CASE(OK);
+            CASE(INVALID_PARAMETER);
+            CASE(INVALID_RECT);
+            CASE(INVALID_BUFFER);
+            CASE(UNSUPPORTED_BLIT);
+            CASE(MEMORY_FAILURE);
+            CASE(STREAM_FAILURE);
+            CASE(CHANNEL_FAILURE);
+            CASE(DEVICE_FAILURE);
+            CASE(FILE_FAILURE);
+        #undef CASE
+
+        default:
+            return "unknown result";
+    }
+}
diff --git a/tegra/2d/tegra_2d_util.h b/tegra/2d/tegra_2d_util.h
new file mode 100644
index 0000000..70bd25a
--- /dev/null
+++ b/tegra/2d/tegra_2d_util.h
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_UTIL_H
+#define TEGRA_2D_UTIL_H
+
+#include <assert.h>
+#include <stdio.h>
+#include <math.h>
+
+#define ASSERT assert
+#define CT_ASSERT(x) ((void) sizeof(char[1 - 2*!(x)]))
+
+#define MIN(a, b) (a < b ? a : b)
+#define MAX(a, b) (a > b ? a : b)
+
+#define CLAMP(x, l, h) (((x) < (l)) ? (l) : ((x) > (h) ? (h) : (x)))
+
+#define ROUND_UP(v, a) (v + (a - 1)) & ~(a - 1)
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+#define RECT_WIDTH(r)  ((r).right - (r).left)
+#define RECT_HEIGHT(r) ((r).bottom - (r).top)
+
+#define FLOAT_TO_FIXED_6_12(fp) (((int32_t) (fp * 4096.0f + 0.5f)) & ((1<<18)-1))
+#define FLOAT_TO_FIXED_0_8(fp) (((int32_t) (fp * 256.0f + 0.5f)) & ((1<<8)-1))
+
+#define LOG(...) printf("[TEGRA_2D] " __VA_ARGS__)
+
+struct tegra_2d_plane_area
+{
+    const struct tegra_2d_plane *plane;
+    float xpos;
+    float ypos;
+    float width;
+    float height;
+};
+
+struct tegra_2d_surface_area
+{
+    const struct tegra_2d_surface *surface;
+    struct tegra_2d_plane_area     planes[TEGRA_2D_MAX_PLANES];
+};
+
+void
+compute_surface_area(struct tegra_2d_surface_area *area,
+                     const struct tegra_2d_surface *surface,
+                     const struct tegra_2d_rect *rect);
+
+int
+validate_rect(const struct tegra_2d_surface *surface,
+              const struct tegra_2d_rect *rect);
+
+int
+equal_size_area(const struct tegra_2d_plane_area *a,
+                const struct tegra_2d_plane_area *b,
+                enum tegra_2d_transform transform);
+
+int
+transform_swaps_xy(enum tegra_2d_transform transform);
+
+const char *
+result_to_str(enum tegra_2d_result result);
+
+#endif // TEGRA_2D_UTIL_H
diff --git a/tegra/Makefile.am b/tegra/Makefile.am
index 72675e5..34a49d5 100644
--- a/tegra/Makefile.am
+++ b/tegra/Makefile.am
@@ -11,7 +11,18 @@ libdrm_tegra_la_LDFLAGS = -version-number 1:0:0 -no-undefined
 libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
 
 libdrm_tegra_la_SOURCES = \
-	tegra_drm.c
+	tegra_drm.c \
+	2d/tegra_2d_api.c \
+	2d/tegra_2d_color.c \
+	2d/tegra_2d_context.c \
+	2d/tegra_2d_copy.c \
+	2d/tegra_2d_fill.c \
+	2d/tegra_2d_frcopy.c \
+	2d/tegra_2d_g2copy.c \
+	2d/tegra_2d_g2fill.c \
+	2d/tegra_2d_sbcopy.c \
+	2d/tegra_2d_surface.c \
+	2d/tegra_2d_util.c
 
 libdrm_tegracommonincludedir = ${includedir}/tegra
 libdrm_tegracommoninclude_HEADERS = \
diff --git a/tegra/tegra_2d.h b/tegra/tegra_2d.h
new file mode 100644
index 0000000..a6d2f2f
--- /dev/null
+++ b/tegra/tegra_2d.h
@@ -0,0 +1,223 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#ifndef TEGRA_2D_H
+#define TEGRA_2D_H
+
+#include <stdint.h>
+#include <stdio.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+struct tegra_fence;
+
+struct tegra_2d_context
+{
+    int  log_enable;
+    int  dump_enable;
+    int  dump_counter;
+    char dump_prefix[FILENAME_MAX];
+};
+
+struct tegra_2d_rect
+{
+    float left;
+    float top;
+    float right;
+    float bottom;
+};
+
+enum tegra_2d_layout
+{
+    TEGRA_2D_LAYOUT_LINEAR,
+    TEGRA_2D_LAYOUT_TILED,
+};
+
+#define TEGRA_2D_FORMAT(id, yuv, bpp) \
+    ((id << 16) | (yuv << 8) | (bpp))
+
+#define TEGRA_2D_FORMAT_BITS(f) \
+    ((f) & 0xff)
+
+#define TEGRA_2D_FORMAT_BYTES(f) \
+    (TEGRA_2D_FORMAT_BITS(f) >> 3)
+
+#define TEGRA_2D_FORMAT_IS_YUV(f) \
+    (((f) >> 8) & 0xff)
+
+#define TEGRA_2D_FORMAT_ID(f) \
+    (((f) >> 16) & 0xff)
+
+enum tegra_2d_format
+{
+    TEGRA_2D_FORMAT_A8R8G8B8 = TEGRA_2D_FORMAT( 1, 0, 32),
+    TEGRA_2D_FORMAT_A8B8G8R8 = TEGRA_2D_FORMAT( 2, 0, 32),
+    TEGRA_2D_FORMAT_R8G8B8A8 = TEGRA_2D_FORMAT( 3, 0, 32),
+    TEGRA_2D_FORMAT_B8G8R8A8 = TEGRA_2D_FORMAT( 4, 0, 32),
+    TEGRA_2D_FORMAT_A4R4G4B4 = TEGRA_2D_FORMAT( 5, 0, 16),
+    TEGRA_2D_FORMAT_R4G4B4A4 = TEGRA_2D_FORMAT( 6, 0, 16),
+    TEGRA_2D_FORMAT_R5G6B5   = TEGRA_2D_FORMAT( 7, 0, 16),
+    TEGRA_2D_FORMAT_A1R5G5B5 = TEGRA_2D_FORMAT( 8, 0, 16),
+    TEGRA_2D_FORMAT_Y8       = TEGRA_2D_FORMAT( 9, 1,  8),
+    TEGRA_2D_FORMAT_U8       = TEGRA_2D_FORMAT(10, 1,  8),
+    TEGRA_2D_FORMAT_V8       = TEGRA_2D_FORMAT(11, 1,  8),
+    TEGRA_2D_FORMAT_U8_V8    = TEGRA_2D_FORMAT(12, 1, 16),
+    TEGRA_2D_FORMAT_V8_U8    = TEGRA_2D_FORMAT(13, 1, 16),
+    TEGRA_2D_FORMAT_UYVY     = TEGRA_2D_FORMAT(14, 1, 32),
+    TEGRA_2D_FORMAT_VYUY     = TEGRA_2D_FORMAT(15, 1, 32),
+    TEGRA_2D_FORMAT_YUYV     = TEGRA_2D_FORMAT(16, 1, 32),
+    TEGRA_2D_FORMAT_YVYU     = TEGRA_2D_FORMAT(17, 1, 32),
+};
+
+enum tegra_2d_transform
+{
+    TEGRA_2D_TRANSFORM_IDENTITY,
+    TEGRA_2D_TRANSFORM_ROT_90,
+    TEGRA_2D_TRANSFORM_ROT_180,
+    TEGRA_2D_TRANSFORM_ROT_270,
+    TEGRA_2D_TRANSFORM_FLIP_X,
+    TEGRA_2D_TRANSFORM_FLIP_Y,
+    TEGRA_2D_TRANSFORM_TRANSPOSE,
+    TEGRA_2D_TRANSFORM_INV_TRANSPOSE
+};
+
+enum tegra_2d_result
+{
+    TEGRA_2D_OK,
+    TEGRA_2D_INVALID_PARAMETER,
+    TEGRA_2D_INVALID_RECT,
+    TEGRA_2D_INVALID_BUFFER,
+    TEGRA_2D_UNSUPPORTED_BLIT,
+    TEGRA_2D_MEMORY_FAILURE,
+    TEGRA_2D_STREAM_FAILURE,
+    TEGRA_2D_CHANNEL_FAILURE,
+    TEGRA_2D_DEVICE_FAILURE,
+    TEGRA_2D_FILE_FAILURE
+};
+
+struct tegra_2d_plane
+{
+    int                   width;
+    int                   height;
+    int                   pitch;
+    enum tegra_2d_format  format;
+    enum tegra_2d_layout  layout;
+    struct tegra_bo      *mem_handle;
+    uint32_t              mem_offset;
+};
+
+struct tegra_2d_plane_color
+{
+    uint32_t             value;
+    enum tegra_2d_format format;
+};
+
+#define TEGRA_2D_MAX_PLANES 3
+
+struct tegra_2d_surface
+{
+    int                   num_planes;
+    struct tegra_2d_plane planes[TEGRA_2D_MAX_PLANES];
+};
+
+struct tegra_2d_surface_color
+{
+    int                         num_planes;
+    struct tegra_2d_plane_color planes[TEGRA_2D_MAX_PLANES];
+};
+
+struct tegra_2d_context *
+tegra_2d_open(int fd);
+
+void
+tegra_2d_close(struct tegra_2d_context *ctx);
+
+int
+tegra_2d_begin(struct tegra_2d_context *ctx,
+               const struct tegra_fence *fence);
+
+int
+tegra_2d_end(struct tegra_2d_context *ctx,
+             struct tegra_fence *fence);
+
+int
+tegra_2d_fill(struct tegra_2d_context *ctx,
+              const struct tegra_2d_surface *dst,
+              const struct tegra_2d_surface_color *color,
+              const struct tegra_2d_rect *dst_rect);
+
+int
+tegra_2d_copy(struct tegra_2d_context *ctx,
+              const struct tegra_2d_surface *dst,
+              const struct tegra_2d_surface *src,
+              const struct tegra_2d_rect *dst_rect,
+              const struct tegra_2d_rect *src_rect,
+              enum tegra_2d_transform transform);
+
+int
+tegra_2d_compute_requirements(const struct tegra_2d_plane *plane,
+                              uint32_t *num_bytes,
+                              uint32_t *alignment,
+                              uint32_t *pitch);
+
+int
+tegra_2d_allocate_surface(struct tegra_2d_context *ctx,
+                          struct tegra_2d_surface *surface);
+
+void
+tegra_2d_free_surface(struct tegra_2d_context *ctx,
+                      struct tegra_2d_surface *surface);
+
+int
+tegra_2d_dump_surface(struct tegra_2d_context *ctx,
+                      const struct tegra_2d_surface *surface,
+                      const char *filename);
+
+void
+tegra_2d_color_convert(struct tegra_2d_surface_color *dst,
+                       const struct tegra_2d_surface_color *src);
+
+void
+tegra_2d_color_to_rgba(const struct tegra_2d_surface_color *src,
+                       uint32_t *r,
+                       uint32_t *g,
+                       uint32_t *b,
+                       uint32_t *a);
+
+void
+tegra_2d_color_from_rgba(struct tegra_2d_surface_color *dst,
+                         uint32_t r,
+                         uint32_t g,
+                         uint32_t b,
+                         uint32_t a);
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif // TEGRA_2D_H
-- 
1.7.9.5
